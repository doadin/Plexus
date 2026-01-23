--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local floor = floor
local format = format
local tinsert = tinsert
local strmatch = strmatch
local strtrim = strtrim

local C_Map = C_Map
local CreateFrame = CreateFrame
local GameTooltip = GameTooltip
local GetInstanceInfo = GetInstanceInfo
local GetTime = GetTime
local InCombatLockdown = InCombatLockdown
local IsAltKeyDown = IsAltKeyDown
local SlashCmdList = SlashCmdList
local UIParent = UIParent

local PlexusFrame
local PlexusRoster = Plexus:GetModule("PlexusRoster")
local Media = LibStub:GetLibrary("LibSharedMedia-3.0")

local PlexusLayout = Plexus:NewModule("PlexusLayout", "AceBucket-3.0", "AceTimer-3.0")
PlexusLayout.LayoutList = {}

local pairs, select, tonumber, tostring = pairs, select, tonumber, tostring

local partyHandle

-- Mythic Raid IDs
-- http://wow.gamepedia.com/API_GetDifficultyInfo
local mythicIDS = {
    [16] = true, -- 20-player Mythic
}

------------------------------------------------------------------------

CONFIGMODE_CALLBACKS = CONFIGMODE_CALLBACKS or {} --luacheck: ignore
CONFIGMODE_CALLBACKS["Plexus"] = function(action) --luacheck: ignore
    if action == "ON" then
        PlexusLayout.config_mode = true
    elseif action == "OFF" then
        PlexusLayout.config_mode = nil
    end
    PlexusLayout:UpdateTabVisibility()
end

------------------------------------------------------------------------

PlexusLayout.prototype = {}

function PlexusLayout.prototype:Reset()
    self:Hide()

    self:SetAttribute("showPlayer", true)
    self:SetAttribute("showSolo", true)
    self:SetAttribute("showParty", true)
    self:SetAttribute("showRaid", true)

    self:SetAttribute("columnSpacing", nil)
    self:SetAttribute("groupBy", nil)
    self:SetAttribute("groupFilter", nil)
    self:SetAttribute("groupingOrder", nil)
    self:SetAttribute("maxColumns", nil)
    self:SetAttribute("nameList", nil)
    self:SetAttribute("roleFilter", nil)
    self:SetAttribute("sortDir", nil)
    self:SetAttribute("sortMethod", "INDEX")
    self:SetAttribute("startingIndex", nil)
    self:SetAttribute("strictFiltering", nil)
    self:SetAttribute("xOffset", nil)
    self:SetAttribute("yOffset", nil)

    self:SetAttributeByProxy("columnAnchorPoint", nil)
    self:SetAttributeByProxy("point", nil)
    self:SetAttributeByProxy("unitsPerColumn", nil)

    self:SetAttribute("plexusGroupSpacing", nil) -- custom

    self:SetAttribute("initialConfigFunction", PlexusLayout:GetInitialConfigSnippet())
end

function PlexusLayout.prototype:SetAttributeByProxy(name, value)
    if name == "point" or name == "columnAnchorPoint" or name == "unitsPerColumn" then
        PlexusLayout:Debug("SetAttributeByProxy", self:GetName(), name, tostring(value))
        local count = 1
        local frame = self:GetAttribute("child" .. count)
        while frame do
            -- PlexusLayout:Debug("ClearAllPoints", frame:GetName())
            frame:ClearAllPoints()
            count = count + 1
            frame = self:GetAttribute("child" .. count)
        end
    end
    self:SetAttribute(name, value)
end

-- nil or false for vertical
function PlexusLayout.prototype:SetOrientation(horizontal)
    local p = PlexusLayout.db.profile
    local groupAnchor = p.groupAnchor
    local padding = p.unitSpacing

    local xOffset, yOffset, point

    if horizontal then
        if groupAnchor == "TOPLEFT" or groupAnchor == "BOTTOMLEFT" then
            xOffset = padding
            yOffset = 0
            point = "LEFT"
        else
            xOffset = -padding
            yOffset = 0
            point = "RIGHT"
        end
    else
        if groupAnchor == "TOPLEFT" or groupAnchor == "TOPRIGHT" then
            xOffset = 0
            yOffset = -padding
            point = "TOP"
        else
            xOffset = 0
            yOffset = padding
            point = "BOTTOM"
        end
    end

    self:SetAttributeByProxy("point", point)
    self:SetAttribute("xOffset", xOffset)
    self:SetAttribute("yOffset", yOffset)
end

-- return the number of visible units belonging to the GroupHeader
function PlexusLayout.prototype:GetVisibleUnitCount()
    local count = 0
    while self:GetAttribute("child" .. count) do
        count = count + 1
    end
    return count
end

function PlexusLayout.prototype:initialConfigFunction(...) --luacheck: ignore 212
    PlexusFrame:RegisterFrame(self[#self])
end

------------------------------------------------------------------------

local initialConfigSnippet = [[
   RegisterUnitWatch(self)
   self:SetAttribute("*type1", "target")
   self:SetAttribute("useparent-toggleForVehicle", true)
   self:SetAttribute("useparent-allowVehicleTarget", true)
   self:SetAttribute("useparent-unitsuffix", true)

   local header = self:GetParent()
   if header:GetAttribute("unitsuffix") == "pet" then
      self:SetAttribute("useOwnerUnit", true)
      self:SetAttribute("unitsuffix", "pet")
   end

   local click = header:GetFrameRef("clickcast_header")
   if click then
      click:SetAttribute("clickcast_button", self)
      click:RunAttribute("clickcast_register")
   end

   header:CallMethod("initialConfigFunction")

]]

function PlexusLayout:GetInitialConfigSnippet() --luacheck: ignore 212
    return initialConfigSnippet .. PlexusFrame:GetInitialConfigSnippet()
end

function PlexusLayout:SetInitialConfigSnippet()
    for i = 1, #self.layoutGroups do
        self.layoutGroups[i]:SetAttribute("initialConfigFunction", PlexusLayout:GetInitialConfigSnippet())
    end
    for i = 1, #self.layoutPetGroups do
        self.layoutGroups[i]:SetAttribute("initialConfigFunction", PlexusLayout:GetInitialConfigSnippet())
    end
end

------------------------------------------------------------------------

local NUM_HEADERS = 0

function PlexusLayout:CreateHeader(isPetGroup)
    --self:Debug("CreateHeader")
    NUM_HEADERS = NUM_HEADERS + 1

    local header = CreateFrame("Frame", "PlexusLayoutHeader" .. NUM_HEADERS, PlexusLayoutFrame, (isPetGroup and "SecureGroupPetHeaderTemplate" or "SecureGroupHeaderTemplate"))

    for k, v in pairs(self.prototype) do
        header[k] = v
    end

    if Clique then
        header:SetAttribute("template", "ClickCastUnitTemplate,SecureUnitButtonTemplate")
        SecureHandlerSetFrameRef(header, "clickcast_header", Clique.header)
    else
        header:SetAttribute("template", "SecureUnitButtonTemplate")
    end

    -- Fix for bug on the Blizz end when using SecureActionButtonTemplate with SecureGroupPetHeaderTemplate
    -- http://forums.wowace.com/showpost.php?p=307869&postcount=3216
    if isPetGroup then
        header:SetAttribute("useOwnerUnit", true)
        header:SetAttribute("unitsuffix", "pet")
    end

    header:SetAttribute("initialConfigFunction", PlexusLayout:GetInitialConfigSnippet())

    header:Reset()

    return header
end

function PlexusLayout:ExtraUnitsChanged(message, unitid, show)
    self:Debug("UpdateUnit message: ", message, unitid)
    --if unit ~= "focus" then return end
    --if not self.FocusFrame then return end
    if not self[unitid .. "Frame"] then return end

    local frame = self[unitid .. "Frame"]

    if show then
        -- Reinitialize now that the unit is real
        if not InCombatLockdown() then
            frame:Reset()
            --frame:Show()
        end
        --if frame.UpdateAllIndicators then
        --    frame:UpdateAllIndicators()
        --end
    else
        -- No focus → hide or ghost
        if not InCombatLockdown() then
            --frame:Hide()
        end
    end
    --local PlexusStatus = Plexus:GetModule("PlexusStatus")
    --PlexusStatus:RemoveFromCache(message, frame.unit)
    --PlexusStatus:RemoveFromCache(message, frame.unitGUID)
    --if frame.indicators then
    --    for _, indicator in pairs(frame.indicators) do
    --        if indicator.Clear then
    --            indicator:Clear()
    --        elseif indicator.Reset then
    --            indicator:Reset()
    --        end
    --    end
    --end
    --frame:ResetAllIndicators()
    --if frame.UpdateAllIndicators then
    --    frame:UpdateAllIndicators()
    --end
    --PlexusFrame:UpdateIndicators(frame)
end

function PlexusLayout:CreateFocusFrame(unitid)
    local frame = CreateFrame(
        "Button",
        "Plexus"..unitid.."Frame",
        PlexusLayoutFrame,
        "SecureUnitButtonTemplate,BackdropTemplate"
    )

    frame:SetAttribute("unit", unitid)

    for k, v in pairs(self.prototype) do
        frame[k] = v
    end

    if frame.Initialize then
        frame:Initialize()
    end

    PlexusFrame:RegisterFrame(frame)
    frame:SetPoint("TOPLEFT", PlexusLayoutFrame, "TOPRIGHT", 0, 0)
    frame:SetSize(PlexusFrame.db.profile.frameWidth, PlexusFrame.db.profile.frameHeight)
    frame:SetFrameStrata("HIGH")
    frame:SetFrameLevel(PlexusLayoutFrame:GetFrameLevel() + 1)
    frame:Hide()
    if not UnitWatchRegistered(frame) then
		RegisterUnitWatch(frame)
	end

    self[unitid .. "Frame"] = frame
    return frame
end




------------------------------------------------------------------------

PlexusLayout.defaultDB = {
    layouts = {
        solo  = "ByGroup",
        party = "ByGroup",
        raid  = "ByRole",
        arena = "ByGroup",
        bg    = "ByGroup",
    },

    lock = false,
    horizontal = false,
    showPetsFirst = false,
    focus = false,
    boss = false,
    arena = false,
    showOffline = false,
    showWrongZone = "MYTHIC",

    layoutPadding = 10,
    unitSpacing = 1,
    scale = 1,

    backgroundColor = { r = 0.1, g = 0.1, b = 0.1, a = 0.65 },
    backgroundTexture = "Blizzard Tooltip",
    borderColor = { r = 0.5, g = 0.5, b = 0.5, a = 1 },
    borderTexture = "Blizzard Tooltip",
    borderSize = 16,
    borderInset = 4,

    anchor = "TOPLEFT",
    groupAnchor = "TOPLEFT",
    hideTab = false,

    PosX = 500,
    PosY = -400,
}

------------------------------------------------------------------------

PlexusLayout.options = {
    name = L["Layout"],
    disabled = InCombatLockdown,
    order = 1,
    type = "group",
    get = function(info)
        local k = info[#info]
        local v = PlexusLayout.db.profile[k]
        if type(v) == "table" and v.r and v.g and v.b then
            return v.r, v.g, v.b, v.a
        else
            return v
        end
    end,
    set = function(info, v)
        local k = info[#info]
        PlexusLayout.db.profile[k] = v
    end,
    args = {
        lock = {
            name = L["Frame lock"],
            desc = L["Locks/unlocks the plexus for movement."],
            order = 2,
            width = "double",
            type = "toggle",
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.lock = v
                PlexusLayout:UpdateTabVisibility()
            end,
        },
        tab = {
            name = L["Show tab"],
            desc = L["Show a tab for dragging when Plexus is unlocked."],
            order = 4,
            width = "double",
            type = "toggle",
            get = function()
                return not PlexusLayout.db.profile.hideTab
            end,
            set = function(info, show) --luacheck: ignore 212
                PlexusLayout.db.profile.hideTab = not show
                PlexusLayout:UpdateTabVisibility()
            end,
        },
        clickThrough = {
            name = L["Click through background"],
            desc = L["Allow mouse clicks to pass through the background when Plexus is locked."],
            order = 6,
            width = "double",
            type = "toggle",
            get = function()
                return PlexusLayout.db.profile.clickThrough
            end,
            set = function(info, value) --luacheck: ignore 212
                PlexusLayout.db.profile.clickThrough = value
                PlexusLayout:UpdateTabVisibility()
            end,
        },
        horizontal = {
            name = L["Horizontal groups"],
            desc = L["Switch between horizontal/vertical groups."],
            order = 8,
            width = "double",
            type = "toggle",
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.horizontal = v
                PlexusLayout:ReloadLayout()
            end,
        },
        showPetsFirst = {
            name = L["Show Pets First(Requires Reload)"],
            desc = L["Add Pets First to Layouts."],
            order = 9,
            width = "double",
            type = "toggle",
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.showPetsFirst = v
                PlexusLayout:GetModule("PlexusLayoutManager"):UpdateLayouts()
                PlexusLayout:ReloadLayout()
            end,
        },
        focus = {
            name = L["Show Focus Frame(Requires Reload)"],
            desc = L[""],
            order = 10,
            width = "double",
            type = "toggle",
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.focus = v
                if not PlexusLayout.focusFrame then
                    PlexusLayout:CreateFocusFrame("focus")
                end
            end,
        },
        boss = {
            name = L["Show Boss Frames(Requires Reload)"],
            desc = L[""],
            order = 11,
            width = "double",
            type = "toggle",
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.boss = v
                --if PlexusLayout.db.profile.boss then
                --    for i = 1, 10 do
                --        local unit = "boss" .. i
                --        local key = unit .. "Frame"
                --        if not "Plexus"..key then
                --            PlexusLayout:CreateBossFrame(unit)
                --        end
                --    end
                --end
            end,
        },
        arena = {
            name = L["Show Arena Frames(Requires Reload)"],
            desc = L[""],
            order = 12,
            width = "double",
            type = "toggle",
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.arena = v
                --if PlexusLayout.db.profile.arena then
                --    for i = 1, 5 do
                --        local unit = "arena" .. i
                --        local key = unit .. "Frame"
                --        if not "Plexus"..key then
                --            PlexusLayout:CreateBossFrame(unit)
                --        end
                --    end
                --end
            end,
        },
        --splitGroups = {
        --    name = COMPACT_UNIT_FRAME_PROFILE_KEEPGROUPSTOGETHER, -- L["Keep Groups Together"]
        --    desc = L["Layouts added by plugins might not support this option."], -- TODO
        --    order = 10,
        --    width = "double",
        --    type = "toggle",
        --    set = function(info, v) --luacheck: ignore 212
        --        PlexusLayout.db.profile.splitGroups = v
        --        PlexusLayout:GetModule("PlexusLayoutManager"):UpdateLayouts()
        --    end,
        --},
        layouts = {
            name = L["Layouts"],
            order = 18,
            type = "group",
            dialogInline = true,
            get = function(t)
                return PlexusLayout.db.profile.layouts[t[#t]]
            end,
            set = function(t, v)
                PlexusLayout.db.profile.layouts[t[#t]] = v
                PlexusLayout:ReloadLayout()
            end,
            args = {
                solo = {
                    name = L["Solo Layout"],
                    order = 2,
                    width = "double",
                    type = "select",
                    values = PlexusLayout.LayoutList,
                },
                party = {
                    name = L["Party Layout"],
                    order = 4,
                    width = "double",
                    type = "select",
                    values = PlexusLayout.LayoutList,
                },
                raid = {
                    name = L["Raid Layout"],
                    order = 6,
                    width = "double",
                    type = "select",
                    values = PlexusLayout.LayoutList,
                },
                arena = {
                    name = L["Arena Layout"],
                    order = 10,
                    width = "double",
                    type = "select",
                    values = PlexusLayout.LayoutList,
                },
                bg = {
                    name = L["Battleground Layout"],
                    order = 12,
                    width = "double",
                    type = "select",
                    values = PlexusLayout.LayoutList,
                },
            },
        },
        background = {
            name = L["Layout Background"],
            order = 20,
            type = "group",
            dialogInline = true,
            args = {
                backgroundColor = {
                    name = L["Background color"],
                    order = 21,
                    width = "double",
                    type = "color", hasAlpha = true,
                    set = function(info, r, g, b, a) --luacheck: ignore 212
                        local color = PlexusLayout.db.profile.backgroundColor
                        color.r, color.g, color.b, color.a = r, g, b, a
                        PlexusLayout:UpdateColor()
                    end,
                },
                borderColor = {
                    name = L["Border color"],
                    order = 22,
                    width = "double",
                    type = "color", hasAlpha = true,
                    set = function(info, r, g, b, a) --luacheck: ignore 212
                        local color = PlexusLayout.db.profile.borderColor
                        color.r, color.g, color.b, color.a = r, g, b, a
                        PlexusLayout:UpdateColor()
                    end,
                },
                backgroundTexture = {
                    name = L["                Background Texture"],
                    order = 23,
                    width = "double",
                    type = "select",
                    dialogControl = "LSM30_Background",
                    values = Media:HashTable("background"),
                    set = function(info, v) --luacheck: ignore 212
                        PlexusLayout.db.profile.backgroundTexture = v
                        PlexusLayout:UpdateColor()
                    end,
                },
                borderTexture = {
                    name = L["                Border Texture"],
                    order = 24,
                    width = "double",
                    type = "select",
                    dialogControl = "LSM30_Border",
                    values = Media:HashTable("border"),
                    set = function(info, v) --luacheck: ignore 212
                        PlexusLayout.db.profile.borderTexture = v
                        PlexusLayout:UpdateColor()
                    end,
                },
                borderSize = {
                    name = L["Border Size"],
                    order = 25,
                    width = "double",
                    type = "range", min = 1, max = 64, step = 1,
                    set = function(info, v) --luacheck: ignore 212
                        PlexusLayout.db.profile.borderSize = v
                        PlexusLayout:UpdateColor()
                    end,
                },
                borderInset = {
                    name = L["Border Inset"],
                    order = 26,
                    width = "double",
                    type = "range", min = 0, max = 32, step = 1,
                    set = function(info, v) --luacheck: ignore 212
                        PlexusLayout.db.profile.borderInset = v
                        PlexusLayout:UpdateColor()
                    end,
                }
            }
        },
        anchor = {
            name = L["Layout Anchor"],
            desc = L["Sets where Plexus is anchored relative to the screen."],
            order = 30,
            width = "double",
            type = "select",
            values = {
                CENTER      = L["Center"],
                TOP         = L["Top"],
                BOTTOM      = L["Bottom"],
                LEFT        = L["Left"],
                RIGHT       = L["Right"],
                TOPLEFT     = L["Top Left"],
                TOPRIGHT    = L["Top Right"],
                BOTTOMLEFT  = L["Bottom Left"],
                BOTTOMRIGHT = L["Bottom Right"],
            },
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.anchor = v
                PlexusLayout:SavePosition()
                PlexusLayout:RestorePosition()
            end,
        },
        groupAnchor = {
            name = L["Group Anchor"],
            desc = L["Sets where groups are anchored relative to the layout frame."],
            order = 32,
            width = "double",
            type = "select",
            values = {
                TOPLEFT     = L["Top Left"],
                TOPRIGHT    = L["Top Right"],
                BOTTOMLEFT  = L["Bottom Left"],
                BOTTOMRIGHT = L["Bottom Right"],
            },
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.groupAnchor = v
                PlexusLayout:ReloadLayout()
            end,
        },
        unitSpacing = {
            name = L["Unit Spacing"],
            desc = L["Adjust the spacing between the individual unit frames."],
            order = 34,
            width = "double",
            type = "range", max = 20, min = 0, step = 1,
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.unitSpacing = v
                PlexusLayout:ReloadLayout()
            end,
        },
        layoutPadding = {
            name = L["Layout Padding"],
            desc = L["Adjust the extra spacing inside the layout frame, around the unit frames."],
            order = 36,
            width = "double",
            type = "range", min = 0, max = 25, step = 1,
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.layoutPadding = v
                PlexusLayout:ReloadLayout()
            end,
        },
        scale = {
            name = L["Scale"],
            order = 38,
            width = "double",
            type = "range", min = 0.5, max = 2.0, step = 0.05, isPercent = true,
            set = function(info, v) --luacheck: ignore 212
                PlexusLayout.db.profile.scale = v
                PlexusLayout:Scale()
            end,
        },
        reset = {
            name = L["Reset Position"],
            order = -1,
            width = "double",
            type = "execute",
            func = function() PlexusLayout:ResetPosition() end,
        },
        groupOptions = {
            name = L["ByGroup Layout Options"],
            order = 20,
            type = "group",
            dialogInline = true,
            args = {
                showOffline = {
                    name = L["Show Offline"],
                    desc = L["Show groups with all players offline."],
                    order = 12,
                    width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusLayout.db.profile.showOffline = v
                        PlexusLayout:GetModule("PlexusLayoutManager"):UpdateLayouts()
                    end,
                },
                showWrongZone = {
                    name = L["Wrong Zone"],
                    desc = L["Show groups with all players in wrong zone."],
                    order = 12,
                    width = "double",
                    type = "select",
                    values = {
                        ALL      = L["Show all groups"],
                        HIDE     = L["Always hide wrong zone groups"],
                        RAIDINST = L["Hide when in raid instance"],
                        MYTHIC   = L["Hide when in mythic raid instance"],
                    },
                    set = function(info, v) --luacheck: ignore 212
                        PlexusLayout.db.profile.showWrongZone = v
                        PlexusLayout:GetModule("PlexusLayoutManager"):UpdateLayouts()
                    end,
                },
            }
        },
    },
}

------------------------------------------------------------------------

PlexusLayout.layoutSettings = {}

function PlexusLayout:PostInitialize()
    --self:Debug("PostInitialize")
    PlexusFrame = Plexus:GetModule("PlexusFrame")

    self.layoutGroups = {}
    self.layoutPetGroups = {}

    if not self.frame then
        self:CreateFrames()
    end
end

local OrderedUnits = {}
function PlexusLayout:PostEnable()
    --self:Debug("PostEnable")
    self:Debug("OnEnable")

    self:UpdateTabVisibility()

    self.forceRaid = true
    self:ScheduleTimer(self.CombatFix, 1, self)

    self:LoadLayout(self.db.profile.layout or self.db.profile.layouts["raid"])
    -- position and scale frame
    self:RestorePosition()
    self:Scale()
    -- Create focus frame once
    if self.db.profile.focus then
        if not self["focusFrame"] then
            self.FocusFrame = self:CreateFocusFrame("focus")
            table.insert(OrderedUnits, "focus")
        end
    end
    if self.db.profile.boss then
        for i = 1, 10 do
            local unit = "boss" .. i
            local key = unit .. "Frame"
            if not self[key] then
                self[key] = self:CreateFocusFrame(unit)
                table.insert(OrderedUnits, "boss"..i)
            end
        end
    end
    if self.db.profile.arena then
        for i = 1, 5 do
            local unit = "arena" .. i
            local key = unit .. "Frame"
            if not self[key] then
                self[key] = self:CreateFocusFrame(unit)
                table.insert(OrderedUnits, "arena"..i)
            end
        end
    end
    local previous = nil
    for _, unitid in ipairs(OrderedUnits) do
        local frame = self[unitid .. "Frame"]
        if frame then
            frame:ClearAllPoints()
            if not previous then
                -- First frame anchors to PlexusLayoutFrame
                frame:SetPoint("TOPLEFT", PlexusLayoutFrame, "TOPRIGHT", 0, 0)
            else
                -- Subsequent frames anchor to the previous frame
                frame:SetPoint("TOPLEFT", previous, "BOTTOMLEFT", 0, -4)
            end
            previous = frame
        end
    end

    if self.db.profile.focus or self.db.profile.boss or self.db.profile.arena then
        self:RegisterMessage("Plexus_ExtraUnitsChanged", "ExtraUnitsChanged")
    end

    self:RegisterMessage("Plexus_ReloadLayout", "PartyTypeChanged")
    self:RegisterMessage("Plexus_PartyTransition", "PartyTypeChanged")

    self:RegisterBucketMessage("Plexus_UpdateLayoutSize", 1, "PartyMembersChanged")
    self:RegisterMessage("Plexus_RosterUpdated", "PartyMembersChanged")
    self:RegisterBucketEvent("GROUP_ROSTER_UPDATE", 1, "PartyMembersChanged")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZoneCheck")

    self:RegisterMessage("Plexus_EnteringCombat", "EnteringCombat")
    self:RegisterMessage("Plexus_LeavingCombat", "LeavingCombat")
    if not Plexus:IsClassicWow() then
        self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
        self:RegisterEvent("UNIT_TARGETABLE_CHANGED")
    end
end

function PlexusLayout:PostDisable()
    --self:Debug("PostDisable")
    self.frame:Hide()
end

function PlexusLayout:PostReset()
    --self:Debug("PostReset")
    self:ReloadLayout()
    -- position and scale frame
    self:RestorePosition()
    self:Scale()
    self:UpdateTabVisibility()
end

------------------------------------------------------------------------

local reloadLayoutQueued
local updateSizeQueued

function PlexusLayout:EnteringCombat()
    -- Do not perform layout update checks in combat
    if partyHandle then
        partyHandle = self:CancelTimer(partyHandle) -- returns nil
    end

    --self:Debug("EnteringOrLeavingCombat")
    if reloadLayoutQueued then return self:PartyTypeChanged() end
    if updateSizeQueued then return self:PartyMembersChanged("EnteringCombat") end
end

function PlexusLayout:LeavingCombat()
    --self:Debug("EnteringOrLeavingCombat")
    -- When out of combat, check if the number of groups changed every 10 seconds
    -- Basing this off events is not working, as it seems to take a variable amount of time for the new player
    -- to show online
    if not partyHandle then
        partyHandle = self:ScheduleRepeatingTimer("Plexus_CheckPartyMembersUpdate", 10)
    end

    if reloadLayoutQueued then return self:PartyTypeChanged() end

    -- If we know the party size changed, definitely do an update
    if updateSizeQueued then return self:PartyMembersChanged("EnteringCombat") end

    -- Otherwise, check to see if the layout needs updating
    self:Plexus_CheckPartyMembersUpdate()
end

function PlexusLayout:CombatFix()
    --self:Debug("CombatFix")
    self:Debug("CombatFix")
    self.forceRaid = false
    return self:ReloadLayout()
end

-- Maw
function PlexusLayout:ZONE_CHANGED_NEW_AREA()
	if C_Map.GetBestMapForUnit("player")==1543 then
		self.Maw = true
	end
end

function PlexusLayout:UNIT_TARGETABLE_CHANGED(_,unit)
	if unit=="player" and self.Maw then
		self.Maw = nil
		self:ReloadLayout()
	end
end

function PlexusLayout:Plexus_CheckPartyMembersUpdate()
    local update_size

    if InCombatLockdown() then
        return
    end

    update_size = PlexusLayout:GetModule("PlexusLayoutManager"):UpdateLayouts()
    if update_size then
        self:PartyMembersChanged("Plexus_CheckPartyMembersUpdate")
    end
end

function PlexusLayout:PartyMembersChanged(event)
    self:Debug("PartyMembersChanged")
    if InCombatLockdown() then
        updateSizeQueued = true
    else
        if type(event) == "table" then
            for _,v in pairs(event) do
                self:Debug("PartyMembersChanged Bucket Counts: ", v)
            end
        end
        self:UpdateSize(event)
        updateSizeQueued = false
    end
end

function PlexusLayout:ShowWrongZone()
    local showWrongZone = false
    local _, instType, diffIndex = GetInstanceInfo()

    -- Show groups in wrong zone
    if self.db.profile.showWrongZone == "ALL" then
        -- Always show groups in wrong zone
        showWrongZone = true
    elseif self.db.profile.showWrongZone == "MYTHIC" and not mythicIDS[diffIndex] then
        -- Show groups in wrong zone when not in Mythic raid instance
        showWrongZone = true
    elseif self.db.profile.showWrongZone == "RAIDINST" and instType ~= "raid" then
        -- Show groups in wrong zone when not in raid instance
        showWrongZone = true
    end

    return showWrongZone
end

-- If we only show groups that are in the correct zone, then
-- update which groups are shown when the player changes zones
function PlexusLayout:ZoneCheck()
    self:Debug("ZoneCheck")
    if (self:ShowWrongZone()) then
        return
    elseif InCombatLockdown() then
        updateSizeQueued = true
    else
        self:UpdateSize()
        updateSizeQueued = false
    end
end

function PlexusLayout:PartyTypeChanged()
    --self:Debug("PartyTypeChanged")
    self:Debug("PartyTypeChanged")

    if InCombatLockdown() then
        reloadLayoutQueued = true
    else
        self:ReloadLayout()
        reloadLayoutQueued = false
        updateSizeQueued = false
    end
end

------------------------------------------------------------------------

function PlexusLayout:StartMoveFrame()
    --self:Debug("StartMoveFrame")
    if self.config_mode or not self.db.profile.lock then
        self.frame:StartMoving()
        self.frame.isMoving = true
    end
end

function PlexusLayout:StopMoveFrame()
    --self:Debug("StopMoveFrame")
    if self.frame.isMoving then
        self.frame:StopMovingOrSizing()
        self:SavePosition()
        self.frame.isMoving = false
        if not InCombatLockdown() then
            self:RestorePosition()
        end
    end
end

function PlexusLayout:UpdateTabVisibility()
    local settings = self.db.profile
    --print("UpdateTabVisibility", not settings.hideTab)

    if not InCombatLockdown() then
        if settings.lock and settings.clickThrough and not self.config_mode then
            self.frame:EnableMouse(false)
        else
            self.frame:EnableMouse(true)
        end
    end

    if settings.hideTab or (not self.config_mode and settings.lock) then
        self.frame.tab:Hide()
    else
        self.frame.tab:Show()
    end
end

local function PlexusLayout_OnMouseDown(frame, button)
    if button == "LeftButton" then
        if IsAltKeyDown() and frame == PlexusLayoutFrame.tab then
            PlexusLayout.db.profile.hideTab = true
            PlexusLayout:UpdateTabVisibility()
        else
            PlexusLayout:StartMoveFrame()
        end
    elseif button == "RightButton" and frame == PlexusLayoutFrame.tab and not InCombatLockdown() then
        Plexus:ToggleOptions()
    end
end

local function PlexusLayout_OnMouseUp()
    PlexusLayout:StopMoveFrame()
end

local function PlexusLayout_OnEnter(frame)
    local tip = GameTooltip
    tip:SetOwner(frame, "ANCHOR_LEFT")
    tip:SetText(L["Drag this tab to move Plexus."])
    tip:AddLine(L["Lock Plexus to hide this tab."])
    tip:AddLine(L["Alt-Click to permanantly hide this tab."])
    tip:AddLine(L["Right-Click for more options."])
    tip:Show()
end

local function PlexusLayout_OnLeave()
    GameTooltip:Hide()
end

function PlexusLayout:CreateFrames()
    --self:Debug("CreateFrames")
    -- create pet battle hider
    local hider = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
    hider:SetAllPoints()
    RegisterStateDriver(hider, "visibility", "[petbattle] hide; show")

    -- create main frame to hold all our gui elements
    local f = CreateFrame("Frame", "PlexusLayoutFrame", hider)
    f:SetPoint("CENTER")
    f:SetMovable(true)
    f:SetClampedToScreen(true)
    f:SetScript("OnMouseDown", PlexusLayout_OnMouseDown)
    f:SetScript("OnMouseUp", PlexusLayout_OnMouseUp)
    f:SetScript("OnHide", PlexusLayout_OnMouseUp)

    -- create backdrop
    f.backdrop = CreateFrame("Frame", nil, f, BackdropTemplateMixin and "BackdropTemplate") --luacheck: ignore
    f.backdrop:SetPoint("BOTTOMLEFT", -4, -4)
    f.backdrop:SetPoint("TOPRIGHT", 4, 4)
    f.backdrop:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tile = false, tileSize = 16,
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16,
        insets = {left = 4, right = 4, top = 4, bottom = 4},
    })

    f:SetFrameLevel(f.backdrop:GetFrameLevel() + 2)

    -- create drag handle
    f.tab = CreateFrame("Frame", nil, f, BackdropTemplateMixin and "BackdropTemplate") --luacheck: ignore
    f.tab:SetWidth(48)
    f.tab:SetHeight(28)
    f.tab:EnableMouse(true)
    f.tab:RegisterForDrag("LeftButton")
    f.tab:SetPoint("BOTTOMLEFT", f.backdrop, "TOPLEFT", 2, -3)
    f.tab:SetScript("OnMouseDown", PlexusLayout_OnMouseDown)
    f.tab:SetScript("OnMouseUp", PlexusLayout_OnMouseUp)
    f.tab:SetScript("OnEnter", PlexusLayout_OnEnter)
    f.tab:SetScript("OnLeave", PlexusLayout_OnLeave)

    -- Tab Background
    f.tabBgLeft = f.tab:CreateTexture(nil, "BACKGROUND")
    f.tabBgLeft:SetTexture("Interface\\ChatFrame\\ChatFrameTab")
    f.tabBgLeft:SetTexCoord(0, 0.25, 0, 1)
    f.tabBgLeft:SetPoint("TOPLEFT", 0, 5)
    f.tabBgLeft:SetPoint("BOTTOMLEFT", 0, 0)
    f.tabBgLeft:SetWidth(16)
    f.tabBgLeft:SetAlpha(0.9)

    f.tabBgRight = f.tab:CreateTexture(nil, "BACKGROUND")
    f.tabBgRight:SetTexture("Interface\\ChatFrame\\ChatFrameTab")
    f.tabBgRight:SetTexCoord(0.75, 1, 0, 1)
    f.tabBgRight:SetPoint("TOPRIGHT", 0, 5)
    f.tabBgRight:SetPoint("BOTTOMRIGHT", 0, 0)
    f.tabBgRight:SetWidth(16)
    f.tabBgRight:SetAlpha(0.9)

    f.tabBgMiddle = f.tab:CreateTexture(nil, "BACKGROUND")
    f.tabBgMiddle:SetTexture("Interface\\ChatFrame\\ChatFrameTab")
    f.tabBgMiddle:SetTexCoord(0.25, 0.75, 0, 1)
    f.tabBgMiddle:SetPoint("BOTTOMLEFT", f.tabBgLeft, "BOTTOMRIGHT", 0, 0)
    f.tabBgMiddle:SetPoint("BOTTOMRIGHT", f.tabBgRight, "BOTTOMLEFT", 0, 0)
    f.tabBgMiddle:SetPoint("TOP", f.tab, "TOP", 0, 5)

    -- Tab Label
    f.tabText = f.tab:CreateFontString(nil, "BACKGROUND", "GameFontNormalSmall")
    f.tabText:SetText("Plexus")
    f.tabText:SetPoint("LEFT", 0, -3)
    f.tabText:SetPoint("RIGHT", 0, -3)

    self.frame = f
end

local function getRelativePoint(point, horizontal)
    if point == "TOPLEFT" then
        if horizontal then
            return "BOTTOMLEFT", 1, -1
        else
            return "TOPRIGHT", 1, -1
        end
    elseif point == "TOPRIGHT" then
        if horizontal then
            return "BOTTOMRIGHT", -1, -1
        else
            return "TOPLEFT", -1, -1
        end
    elseif point == "BOTTOMLEFT" then
        if horizontal then
            return  "TOPLEFT", 1, 1
        else
            return "BOTTOMRIGHT", 1, 1
        end
    elseif point == "BOTTOMRIGHT" then
        if horizontal then
            return "TOPRIGHT", -1, 1
        else
            return "BOTTOMLEFT", -1, 1
        end
    end
end

local previousGroup
function PlexusLayout:PlaceGroup(layoutGroup, groupNumber)
    --self:Debug("PlaceGroup", groupNumber)
    --local frame = layoutGroup.frame

    local settings = self.db.profile
    local horizontal = settings.horizontal
    local padding = settings.unitSpacing
    local spacing = settings.layoutPadding
    local groupAnchor = settings.groupAnchor

    local relPoint, xMult, yMult = getRelativePoint(groupAnchor, horizontal)

    layoutGroup:ClearAllPoints()
    layoutGroup:SetParent(self.frame)
    if groupNumber == 1 then
        layoutGroup:SetPoint(groupAnchor, self.frame, groupAnchor, spacing * xMult, spacing * yMult)
    else
        local xPlus, yPlus = 0, 0
        if horizontal then
            xMult = 0
            xPlus = tonumber(layoutGroup:GetAttribute("plexusGroupSpacing")) or 0
        else
            yMult = 0
            yPlus = tonumber(layoutGroup:GetAttribute("plexusGroupSpacing")) or 0
        end
        layoutGroup:SetPoint(groupAnchor, previousGroup, relPoint, (padding * xMult) + xPlus, (padding * yMult) + yPlus)
    end

    self:Debug("Placing group", groupNumber, layoutGroup:GetName(), groupNumber == 1 and self.frame:GetName() or groupAnchor, previousGroup and previousGroup:GetName(), relPoint)

    previousGroup = layoutGroup
end

function PlexusLayout:AddLayout(name, layout)
    --self:Debug("AddLayout", layoutName)
    self.layoutSettings[name] = layout
    self.LayoutList[name] = layout.name or name -- for options
end

function PlexusLayout:ReloadLayout(event)
    local party_type = PlexusRoster:GetPartyState()
    self:Debug("ReloadLayout", event, party_type)
    self:LoadLayout(self.db.profile.layouts[party_type])
end

local function getColumnAnchorPoint(point, horizontal)
    if not horizontal then
        if point == "TOPLEFT" or point == "BOTTOMLEFT" then
            return "LEFT"
        elseif point == "TOPRIGHT" or point == "BOTTOMRIGHT" then
            return "RIGHT"
        end
    else
        if point == "TOPLEFT" or point == "TOPRIGHT" then
            return "TOP"
        elseif point == "BOTTOMLEFT" or point == "BOTTOMRIGHT" then
            return "BOTTOM"
        end
    end
    return point
end

function PlexusLayout:LoadLayout(layoutName)
    local p = self.db.profile
    local layout = self.layoutSettings[layoutName]
    self.db.profile.layout = layoutName
    if InCombatLockdown() then
        reloadLayoutQueued = true
        return
    end
    self:Debug("LoadLayout", layoutName)

    -- layout not ready yet
    if type(layout) ~= "table" then
        -- Silently fall back to the default layout
        -- https://wow.curseforge.com/addons/plexus/tickets/835
        layoutName = self.defaultDB.layouts[PlexusRoster:GetPartyState()]
        layout = self.layoutSettings[layoutName]
        self.db.profile.layout = layoutName
        self:Debug("Layout not found, using default instead:", layoutName)
    end

    local groupsNeeded, petGroupsNeeded = 0, 0
    local groupsAvailable, petGroupsAvailable = #self.layoutGroups, #self.layoutPetGroups

    for i = 1, #layout do
        if not layout[i].isPetGroup then
            groupsNeeded = groupsNeeded + 1
        elseif layout[i].isPetGroup then
            petGroupsNeeded = petGroupsNeeded + 1
        end
    end

    -- create groups as needed
    while groupsNeeded > groupsAvailable do
        tinsert(self.layoutGroups, self:CreateHeader(false))
        groupsAvailable = groupsAvailable + 1
    end
    while petGroupsNeeded > petGroupsAvailable do
        tinsert(self.layoutPetGroups, self:CreateHeader(true))
        petGroupsAvailable = petGroupsAvailable + 1
    end

    -- hide unused groups
    for i = groupsNeeded + 1, groupsAvailable, 1 do
        self.layoutGroups[i]:Reset(true)
    end
    for i = petGroupsNeeded + 1, petGroupsAvailable, 1 do
        self.layoutPetGroups[i]:Reset(true)
    end

    -- self:Debug("groupsNeeded ", groupsNeeded, "petGroupsNeeded ", petGroupsNeeded)

    -- quit if layout has no groups (eg. None)
    if groupsNeeded == 0 then
        self:Debug("No groups found in layout")
        self:UpdateDisplay()
        return
    end

    local defaults = layout.defaults
    local groupSpacing = tonumber(layout.groupSpacing)
    local iGroup, iPetGroup = 1, 1
    -- configure groups
    for i = 1, #layout do
        local l = layout[i]

        local layoutGroup
        if not l.isPetGroup then
            layoutGroup = self.layoutGroups[iGroup]
            iGroup = iGroup + 1
        else
            layoutGroup = self.layoutPetGroups[iPetGroup]
            iPetGroup = iPetGroup + 1
        end

        layoutGroup:Reset()

        if groupSpacing then
            layoutGroup:SetAttribute("plexusGroupSpacing", groupSpacing)
        end

        -- apply defaults
        if defaults then
            for attr, value in pairs(defaults) do
                if attr == "unitsPerColumn" then
                    layoutGroup:SetAttributeByProxy("unitsPerColumn", value)
                    layoutGroup:SetAttributeByProxy("columnAnchorPoint", getColumnAnchorPoint(p.groupAnchor, p.horizontal))
                    layoutGroup:SetAttribute("columnSpacing", p.unitSpacing)
                elseif attr == "useOwnerUnit" then
                    -- related to fix for using SecureActionButtonTemplate, see PlexusLayout:CreateHeader()
                    if value == true then
                        layoutGroup:SetAttribute("unitsuffix", nil)
                    end
                else
                    layoutGroup:SetAttributeByProxy(attr, value)
                end
            end
        end

        -- apply settings
        for attr, value in pairs(l) do
            if attr == "unitsPerColumn" then
                layoutGroup:SetAttributeByProxy("unitsPerColumn", value)
                layoutGroup:SetAttributeByProxy("columnAnchorPoint", getColumnAnchorPoint(p.groupAnchor, p.horizontal))
                layoutGroup:SetAttribute("columnSpacing", p.unitSpacing)
            elseif attr == "useOwnerUnit" then
                -- related to fix for using SecureActionButtonTemplate, see PlexusLayout:CreateHeader()
                if value == true then
                    layoutGroup:SetAttribute("unitsuffix", nil)
                end
            elseif attr ~= "isPetGroup" then
                layoutGroup:SetAttributeByProxy(attr, value)
            end
        end

        -- deals with the blizz bug that prevents initializing unit frames in combat
        self:ForceFramesCreation(layoutGroup)

        -- place groups
        layoutGroup:SetOrientation(p.horizontal)
        self:PlaceGroup(layoutGroup, i)
        layoutGroup:Show()
    end

    self:UpdateDisplay()
end

function PlexusLayout:ForceFramesCreation(layoutGroup)
    -- should be called when each group in a layout is initialized
    -- http://forums.wowace.com/showpost.php?p=307503&postcount=3163
    local maxColumns = layoutGroup:GetAttribute("maxColumns") or 1
    local unitsPerColumn = layoutGroup:GetAttribute("unitsPerColumn") or 5
    local startingIndex = layoutGroup:GetAttribute("startingIndex")
    local maxUnits = maxColumns * unitsPerColumn
    self:Debug("maxColumns", maxColumns, "unitsPerColumn", unitsPerColumn, "startingIndex", startingIndex, "maxUnits", maxUnits)
    if not layoutGroup.UnitFramesCreated or layoutGroup.UnitFramesCreated < maxUnits then
        layoutGroup.UnitFramesCreated = maxUnits
        layoutGroup:Show()
        layoutGroup:SetAttribute("startingIndex", -maxUnits + 1)
        layoutGroup:SetAttribute("startingIndex", startingIndex)
    end
end

function PlexusLayout:UpdateDisplay()
    --self:Debug("UpdateDisplay")
    self:UpdateColor()
    self:UpdateVisibility()
    self:UpdateSize("UpdateDisplay")
end

function PlexusLayout:UpdateVisibility()
    --self:Debug("UpdateVisibility")
    if self.db.profile.layouts[(PlexusRoster:GetPartyState())] == "None" then
        self.frame.backdrop:Hide()
    else
        self.frame.backdrop:Show()
    end
end

function PlexusLayout:UpdateSize(event)
    self:Debug("UpdateSize")
    self:Debug("UpdateSize", GetTime(), event)
    local p = self.db.profile
    local x, y

    local groupCount, curWidth, curHeight, maxWidth, maxHeight = -1, 0, 0, 0, 0

    local unitSpacing, layoutPadding = p.unitSpacing, p.layoutPadding * 2

    -- Update layouts with new size
    PlexusLayout:GetModule("PlexusLayoutManager"):UpdateLayouts()

    for i = 1, #self.layoutGroups do
        local layoutGroup = self.layoutGroups[i]
        if layoutGroup:IsVisible() then
            groupCount = groupCount + 1
            local width, height = layoutGroup:GetWidth(), layoutGroup:GetHeight()
            curWidth = curWidth + width + unitSpacing
            curHeight = curHeight + height + unitSpacing
            if maxWidth < width then maxWidth = width end
            if maxHeight < height then maxHeight = height end
        end
    end

    for i = 1, #self.layoutPetGroups do
        local layoutGroup = self.layoutPetGroups[i]
        if layoutGroup:IsVisible() then
            groupCount = groupCount + 1
            local width, height = layoutGroup:GetWidth(), layoutGroup:GetHeight()
            curWidth = curWidth + width + unitSpacing
            curHeight = curHeight + height + unitSpacing
            if maxWidth < width then maxWidth = width end
            if maxHeight < height then maxHeight = height end
        end
    end

    if p.horizontal then
        x = maxWidth + layoutPadding
        y = curHeight + layoutPadding
    else
        x = curWidth + layoutPadding
        y = maxHeight + layoutPadding
    end

    self.frame:SetSize(x, y)
    self.frame:SetClampRectInsets(p.layoutPadding, -p.layoutPadding, -p.layoutPadding, p.layoutPadding)
end

function PlexusLayout:UpdateColor()
    --self:Debug("UpdateColor")
    local settings = self.db.profile

    local backdrop = self.frame.backdrop:GetBackdrop()
    if backdrop then
        backdrop.bgFile = Media:Fetch(Media.MediaType.BACKGROUND, settings.backgroundTexture)
        backdrop.edgeFile = Media:Fetch(Media.MediaType.BORDER, settings.borderTexture)
        backdrop.edgeSize = settings.borderSize
        backdrop.insets.left = settings.borderInset
        backdrop.insets.right = settings.borderInset
        backdrop.insets.top =  settings.borderInset
        backdrop.insets.bottom = settings.borderInset
        self.frame.backdrop:SetBackdrop(backdrop)

        self.frame.backdrop:SetBackdropBorderColor(settings.borderColor.r, settings.borderColor.g, settings.borderColor.b, settings.borderColor.a)
        self.frame.backdrop:SetBackdropColor(settings.backgroundColor.r, settings.backgroundColor.g, settings.backgroundColor.b, settings.backgroundColor.a)
    end
end

function PlexusLayout:SavePosition()
    self:Debug("SavePosition")
    local f = self.frame
    local s = f:GetEffectiveScale()
    local uiScale = UIParent:GetEffectiveScale()
    local anchor = self.db.profile.anchor

    local x, y, relativePoint

    relativePoint = anchor

    if f:GetLeft() == nil then
        self:Debug("WTF, GetLeft is nil")
        return
    end

    if anchor == "CENTER" then
        x = (f:GetLeft() + f:GetWidth() / 2) * s - UIParent:GetWidth() / 2 * uiScale
        y = (f:GetTop() - f:GetHeight() / 2) * s - UIParent:GetHeight() / 2 * uiScale
    elseif anchor == "TOP" then
        x = (f:GetLeft() + f:GetWidth() / 2) * s - UIParent:GetWidth() / 2 * uiScale
        y = f:GetTop() * s - UIParent:GetHeight() * uiScale
    elseif anchor == "LEFT" then
        x = f:GetLeft() * s
        y = (f:GetTop() - f:GetHeight() / 2) * s - UIParent:GetHeight() / 2 * uiScale
    elseif anchor == "RIGHT" then
        x = f:GetRight() * s - UIParent:GetWidth() * uiScale
        y = (f:GetTop() - f:GetHeight() / 2) * s - UIParent:GetHeight() / 2 * uiScale
    elseif anchor == "BOTTOM" then
        x = (f:GetLeft() + f:GetWidth() / 2) * s - UIParent:GetWidth() / 2 * uiScale
        y = f:GetBottom() * s
    elseif anchor == "TOPLEFT" then
        x = f:GetLeft() * s
        y = f:GetTop() * s - UIParent:GetHeight() * uiScale
    elseif anchor == "TOPRIGHT" then
        x = f:GetRight() * s - UIParent:GetWidth() * uiScale
        y = f:GetTop() * s - UIParent:GetHeight() * uiScale
    elseif anchor == "BOTTOMLEFT" then
        x = f:GetLeft() * s
        y = f:GetBottom() * s
    elseif anchor == "BOTTOMRIGHT" then
        x = f:GetRight() * s - UIParent:GetWidth() * uiScale
        y = f:GetBottom() * s
    end

    if x and y and s then
        x, y = floor(x + 0.5), floor(y + 0.5)
        self.db.profile.PosX = x
        self.db.profile.PosY = y
        --self.db.profile.anchor = point
        self.db.profile.anchorRel = relativePoint
        self:Debug("Saved position", anchor, x, y)
    end
end

function PlexusLayout:ResetPosition()
    self:Debug("ResetPosition")
    local uiScale = UIParent:GetEffectiveScale()

    self.db.profile.PosX = UIParent:GetWidth() / 2 * uiScale + 0.5
    self.db.profile.PosY = -UIParent:GetHeight() / 2 * uiScale + 0.5
    self.db.profile.anchor = "TOPLEFT"

    self:RestorePosition()
    self:SavePosition()
end

function PlexusLayout:RestorePosition()
    self:Debug("RestorePosition")
    local f = self.frame
    local s = f:GetEffectiveScale()
    local x = self.db.profile.PosX
    local y = self.db.profile.PosY
    local point = self.db.profile.anchor
    self:Debug("Loaded position", point, x, y)
    x, y = floor(x / s + 0.5), floor(y / s + 0.5)
    f:ClearAllPoints()
    f:SetPoint(point, UIParent, point, x, y)
    self:Debug("Restored position", point, x, y)
end

function PlexusLayout:Scale()
    --self:Debug("Scale")
    self:SavePosition()
    self.frame:SetScale(self.db.profile.scale)
    self:RestorePosition()
end

------------------------------------------------------------------------

local function findVisibleUnitFrame(f)
    if f:IsVisible() and f:GetAttribute("unit") then
        return f
    end

    for i = 1, select("#", f:GetChildren()) do
        local child = select(i, f:GetChildren())
        local good = findVisibleUnitFrame(child)

        if good then
            return good
        end
    end
end

function PlexusLayout:FakeSize(width, height)
    self:Debug("FakeSize", width, height)
    local p = self.db.profile

    local f = findVisibleUnitFrame(self.frame)

    if not f then
        self:Debug("No suitable frame found.")
        return
    else
        self:Debug(format("Using %s", f:GetName()))
    end

    local frameWidth = f:GetWidth()
    local frameHeight = f:GetHeight()

    local x = frameWidth * width + (width - 1) * p.unitSpacing + p.layoutPadding * 2
    local y = frameHeight * height + (height - 1) * p.unitSpacing + p.layoutPadding * 2

    self.frame:SetWidth(x)
    self.frame:SetHeight(y)
end

SLASH_PLEXUSLAYOUT1 = "/plexuslayout" --luacheck: ignore 111

SlashCmdList.PLEXUSLAYOUT = function(cmd)
    local width, height = strmatch(strtrim(cmd), "^(%d+) ?(%d*)$")
    width, height = tonumber(width), tonumber(height)

    if not width then return end
    if not height then height = width end

    --PlexusLayout:Debug("/plexuslayout", width, height)
    PlexusLayout:FakeSize(width, height)
end
