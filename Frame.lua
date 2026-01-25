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

local format, gsub, pairs, type = format, gsub, pairs, type

local C_UnitAuras = C_UnitAuras
local CreateFrame = CreateFrame
local InCombatLockdown = InCombatLockdown
local GetTime = GetTime
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local UnitInRange = UnitInRange
local UnitIsDeadOrGhost = UnitIsDeadOrGhost
local UnitIsUnit = UnitIsUnit
local UnitName = UnitName

local PlexusStatus, PlexusStatusRange

local Media = LibStub:GetLibrary("LibSharedMedia-3.0")
Media:Register("statusbar", "Gradient", "Interface\\Addons\\Plexus\\Media\\gradient32x32")

local PlexusFrame = Plexus:NewModule("PlexusFrame", "AceBucket-3.0", "AceTimer-3.0")
local PlexusLayout = Plexus:GetModule("PlexusLayout")
PlexusFrame.indicators = {}
PlexusFrame.prototype = {}

------------------------------------------------------------------------

local defaultOrder = {
    border = 1,
    bar = 2,
    barcolor = 3,
    healingBar = 4,
    text = 5,
    text2 = 6,
    text3 = 7,
    icon = 9,
    frameAlpha = 10,
}

local defaultNew = function() return {} end
local defaultReset = function() end

function PlexusFrame:RegisterIndicator(id, name, newFunc, resetFunc, setFunc, clearFunc)
    assert(type(id) == "string", "PlexusFrame:RegisterIndicator - id must be a string")
    assert(not self.indicators[id], "PlexusFrame:RegisterIndicator - id must be unique")
    assert(type(setFunc) == "function", "PlexusFrame:RegisterIndicator - setFunc must be a function")
    assert(type(clearFunc) == "function", "PlexusFrame:RegisterIndicator - clearFunc must be a function")

    self.indicators[id] = {
        id = id,
        name = type(name) == "string" and name or id,
        New = type(newFunc) == "function" and newFunc or defaultNew,
        Reset = type(resetFunc) == "function" and resetFunc or defaultReset,
        SetStatus = setFunc,
        Clear = clearFunc,
    }

    if not self.registeredFrames then return end -- not initialized yet

    for _, frame in pairs(self.registeredFrames) do
        frame:AddIndicator(id)
        frame:ResetIndicator(id)
        self:UpdateIndicators(frame)
    end
end

function PlexusFrame.prototype:AddIndicator(id)
    local prototype = PlexusFrame.indicators[id]
    local indicator = prototype.New(self)
    if not indicator then
        return PlexusFrame:Debug("AddIndicator: creation failed for id", id, type(prototype), type(prototype.New))
    end
    indicator.__id = id
    indicator.__owner = self
    indicator.Reset = prototype.Reset
    indicator.SetStatus = prototype.SetStatus
    indicator.Clear = prototype.Clear
    self.indicators[id] = indicator
end

function PlexusFrame.prototype:ResetIndicator(id)
    local indicator = self.indicators[id]
    if indicator then
        indicator:Reset()
    else
        PlexusFrame:Debug("ResetIndicator:", id, "does not exist")
    end
end

function PlexusFrame.prototype:ResetAllIndicators()
    -- Reset default indicators first:
    for id, indicator in pairs(self.indicators) do
        if defaultOrder[id] then
            indicator:Reset()
        end
    end
    -- Then custom ones:
    for id, indicator in pairs(self.indicators) do
        if not defaultOrder[id] then
            indicator:Reset()
        end
    end
end

------------------------------------------------------------------------

local initialConfigSnippet = [[
   self:SetWidth(%d)
   self:SetHeight(%d)
   self:SetAttribute("initial-width", %d)
   self:SetAttribute("initial-height", %d)
   local attr = self:GetAttribute("*type2")
   if attr == "togglemenu" or attr == nil then
      self:SetAttribute("*type2", %s)
   end
]]

function PlexusFrame:GetInitialConfigSnippet()
    return format(initialConfigSnippet,
        self.db.profile.frameWidth, self.db.profile.frameHeight,
        self.db.profile.frameWidth, self.db.profile.frameHeight,
        self.db.profile.rightClickMenu and '"togglemenu"' or 'nil'
    )
end

function PlexusFrame:InitializeFrame(frame)
    self:Debug("InitializeFrame", frame:GetName())

    for k, v in pairs(self.prototype) do
        frame[k] = v
    end

    frame:ClearNormalTexture()
    frame:ClearHighlightTexture()

    if Clique then
        local direction
        if Clique.db and Clique.db.char and Clique.db.char.downclick then
            direction = Clique.db.char.downclick and "AnyDown"
        elseif Clique.db and Clique.db.char and not Clique.db.char.downclick then
            direction = "AnyUp"
        else
            direction = "AnyUp"
        end
        if not direction then direction = "AnyUp" end
        frame:RegisterForClicks(direction)
    else
        local direction = PlexusFrame.db.profile.clickUPDOWN and PlexusFrame.db.profile.clickUPDOWN or "AnyUp"
        frame:RegisterForClicks(direction)
    end

    frame:HookScript("OnEnter", frame.OnEnter)
    frame:HookScript("OnLeave", frame.OnLeave)
    frame:HookScript("OnShow",  frame.OnShow)
    frame:HookScript("OnAttributeChanged", frame.OnAttributeChanged)

    frame.indicators = {}
    for id in pairs(self.indicators) do
        frame:AddIndicator(id)
    end
    frame:ResetAllIndicators()

    return frame
end

------------------------------------------------------------------------

-- shows the default unit tooltip
function PlexusFrame.prototype:OnEnter()
    local unit = self.unit
    local showTooltip = PlexusFrame.db.profile.showTooltip
    if unit and UnitExists(unit) and (showTooltip == "Always" or (showTooltip == "OOC" and (not InCombatLockdown() or UnitIsDeadOrGhost(unit)))) then
        UnitFrame_OnEnter(self)
    end
end

function PlexusFrame.prototype:OnLeave()
    UnitFrame_OnLeave(self)
end

function PlexusFrame.prototype:OnShow() --luacheck: ignore 212
    PlexusFrame:SendMessage("UpdateFrameUnits")
    PlexusFrame:SendMessage("Plexus_UpdateLayoutSize")
end

function PlexusFrame.prototype:OnAttributeChanged(name, value)
    if name == "unit" then
        return PlexusFrame:SendMessage("UpdateFrameUnits")
    elseif self:CanChangeAttribute() then
        if name == "type1" then
            if not value or value == "" then
                self:SetAttribute("type1", "target")
            end
        elseif name == "*type2" then
            local wantmenu = PlexusFrame.db.profile.rightClickMenu
            --print(self.unit, "OnAttributeChanged", name, value, wantmenu)
            if wantmenu and (not value or value == "") then
                self:SetAttribute("*type2", "togglemenu")
            elseif value == "togglemenu" and not wantmenu then
                self:SetAttribute("*type2", nil)
            end
        end
    end
end

------------------------------------------------------------------------

local COLOR_WHITE = { r = 1, g = 1, b = 1, a = 1 }
local COORDS_FULL = { left = 0, right = 1, top = 0, bottom = 1 }

function PlexusFrame.prototype:SetIndicator(id, color, text, value, maxValue, texture, start, duration, count, texCoords, expirationTime)

    if not color then
        color = COLOR_WHITE
    end
    if value and not maxValue then
        maxValue = 100
    end
    if texture and not texCoords then
        texCoords = COORDS_FULL
    end

    local indicator = self.indicators[id]
    if indicator then
        indicator:SetStatus(color, text, value, maxValue, texture, texCoords, count, start, duration, expirationTime)
    else
        PlexusFrame:Debug("SetIndicator:", id, "does not exist")
    end
end

function PlexusFrame.prototype:ClearIndicator(id)
    local indicator = self.indicators[id]
    if indicator then
        indicator:Clear()
    else
        PlexusFrame:Debug("ClearIndicator:", id, "does not exist")
    end

    --[[ TODO: Why does this exist?
    elseif indicator == "frameAlpha" then
        for i = 1, 4 do
            local corner = "corner" .. i
            if self[corner] then
                self[corner]:SetAlpha(1)
            end
        end
    ]]
end

------------------------------------------------------------------------

PlexusFrame.defaultDB = {
    frameWidth = 36,
    frameHeight = 36,
    borderSize = 1,
    showTooltip = "OOC",
    rightClickMenu = true,
    clickUPDOWN = "AnyUp",
    orientation = "VERTICAL",
    textorientation = "VERTICAL",
    throttleUpdates = false,
    texture = "Gradient",
    enableBarColor = false,
    invertBarColor = false,
    invertTextColor = false,
    healingBar_intensity = 0.5,
    healingBar_useStatusColor = false,
    iconSize = 16,
    centerIconSize = 16,
    iconBorderSize = 1,
    spacingSize = 1,
    marginSize = 1,
    stackOffsetX = 4,
    stackOffsety = -2,
    enableIconCooldown = true,
    showIconCountDownText = false,
    enableIconStackText = true,
    iconStackFontSize = 3,
    iconCoolDownFontSize = 3,
    font = "Friz Quadrata TT",
    fontSize = 12,
    fontOutline = "NONE",
    fontShadow = true,
    textlength = 4,
    cornerSize = 6,
    cornerBorderSize = 1,
    cornerBorderColor = { r = 0, g = 0, b = 0, a = 1 },
    enableCorner2 = true,
    enableCorner34 = true,
    enableCornerBarSeparation = true,
    enableText2 = false,
    enableText3 = false,
    enableExtraText2 = false,
    enableExtraText34 = false,
    enableTextTop = false,
    enableTextTopLeft = false,
    enableTextTopRight = false,
    enableTextBottom = false,
    enableTextBottomLeft = false,
    enableTextBottomRight = false,
    enableIcon2 = true,
    enableIcon34 = true,
    enableIconBarSeparation = true,
    enableIconBackgroundColor = false,
    iconBackgroundAlpha = 0.8,
    ExtraBarSize = 0.1,
    ExtraBarSide = "Bottom",
    ExtraBarBorderSize = 1,
    ExtraBarInvertColor = false,
    ExtraBarTrackDuration = true,
    ExtraBarDurationUpdateRate = 1.0,
    enableExtraBar = true,
    statusmap = {
        text = {
            alert_death = true,
            alert_feignDeath = true,
            alert_heals = true,
            alert_offline = true,
            debuff_Ghost = true,
            unit_healthDeficit = true,
            unit_name = true,
        },
        text2 = {
            alert_death = true,
            alert_feignDeath = true,
            alert_offline = true,
            debuff_Ghost = true,
        },
        border = {
            alert_aggro = true,
            alert_lowHealth = true,
            alert_lowMana = true,
            player_target = true,
        },
        corner4 = { -- Top Left
            leader = true,
            assistant = true,
            master_looter = true,
        },
        corner3 = { -- Top Right
            role = true,
        },
        corner1 = { -- Bottom Left
            alert_aggro = true,
        },
        corner2 = { -- Bottom Right
            dispel_curse = true,
            dispel_disease = true,
            dispel_magic = true,
            dispel_poison = true,
        },
        frameAlpha = {
            alert_death = true,
            alert_offline = true,
            alert_range = true,
        },
        bar = {
            alert_death = true,
            alert_offline = true,
            debuff_Ghost = true,
            unit_health = true,
        },
        barcolor = {
            alert_death = true,
            alert_offline = true,
            debuff_Ghost = true,
            unit_health = true,
        },
        healingBar = {
            alert_heals = true,
            alert_absorbs = true,
        },
        icon = {
            raid_icon = true,
            ready_check = true,
        },
        ei_bar_barone = {
            unit_resource = true,
        },
    },
    enablePrivateAura = true,
    enablePrivateAuraCountdownFrame = false,
    enablePrivateAuraCountdownNumbers = false,
    PrivateAuraWidth = 10,
    PrivateAuraHeight = 10,
    PrivateAuraOffsetX = 0,
    PrivateAuraOffsetY = 0,
}

------------------------------------------------------------------------

local reloadHandle

function PlexusFrame:Plexus_ReloadLayout()
    if reloadHandle then
        reloadHandle = self:CancelTimer(reloadHandle) -- returns nil
    end
    self:SendMessage("Plexus_ReloadLayout")
end

PlexusFrame.options = {
    name = L["Frame"],
    desc = L["Options for PlexusFrame."],
    order = 2,
    type = "group",
    childGroups = "tab",
    disabled = InCombatLockdown,
    get = function(info)
        local k = info[#info]
        return PlexusFrame.db.profile[k]
    end,
    set = function(info, v)
        local k = info[#info]
        PlexusFrame.db.profile[k] = v
        PlexusFrame:UpdateAllFrames()
    end,
    args = {
        general = {
            name = L["General"],
            order = 1,
            type = "group",
            args = {
                frameWidth = {
                    name = L["Frame Width"],
                    desc = L["Adjust the width of each unit's frame."],
                    order = 1, width = "double",
                    type = "range", min = 10, max = 250, step = 1,
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.frameWidth = v
                        PlexusFrame:ResizeAllFrames()
                        PlexusLayout:ReloadLayout()
                    end,
                },
                frameHeight = {
                    name = L["Frame Height"],
                    desc = L["Adjust the height of each unit's frame."],
                    order = 2, width = "double",
                    type = "range", min = 10, max = 250, step = 1,
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.frameHeight = v
                        PlexusFrame:ResizeAllFrames()
                        PlexusLayout:ReloadLayout()
                    end,
                },
                borderSize = {
                    name = L["Border Size"],
                    desc = L["Adjust the size of the border indicators."],
                    order = 3, width = "double",
                    type = "range", min = 1, max = 9, step = 1,
                },
                showTooltip = {
                    name = L["Show Tooltip"],
                    desc = L["Show unit tooltip.  Choose 'Always', 'Never', or 'OOC'."],
                    order = 5, width = "double",
                    type = "select",
                    values = { Always = L["Always"], Never = L["Never"], OOC = L["OOC"] },
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.showTooltip = v
                    end,
                },
                rightClickMenu = {
                    name = L["Enable right-click menu"],
                    desc = L["Show the standard unit menu when right-clicking on a frame."],
                    order = 6, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.rightClickMenu = v
                        for _, frame in pairs(PlexusFrame.registeredFrames) do
                            local attrib = frame:GetAttribute("*type2") or ""
                            if attrib == "togglemenu" and not v then
                                frame:SetAttribute("*type2", nil)
                            elseif v and attrib == "" then
                                frame:SetAttribute("*type2", "togglemenu")
                            end
                        end
                    end,
                },
                clickUPDOWN = {
                    name = L["Register frame clicks to happen on (Requires Reloading UI)"],
                    desc = L["When clicking a bind will trigger on up or down."],
                    order = 7, width = "double",
                    type = "select",
                    values = {
                        AnyUp = "AnyUp",
                        AnyDown = "AnyDown"
                    },
                },
                orientation = {
                    name = L["Orientation of Frame"],
                    desc = L["Set frame orientation."],
                    order = 8, width = "double",
                    type = "select",
                    values = {
                        VERTICAL = L["Vertical"],
                        HORIZONTAL = L["Horizontal"]
                    },
                },
                throttleUpdates = {
                    name = L["Throttle Updates"],
                    desc = L["Throttle updates on group changes. This option may cause delays in updating frames, so you should only enable it if you're experiencing temporary freezes or lockups when people join or leave your group."],
                    type = "toggle",
                    order = 9, width = "double",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.throttleUpdates = v
                        if v then
                            PlexusFrame:UnregisterMessage("UpdateFrameUnits")
                            PlexusFrame.bucket_UpdateFrameUnits = PlexusFrame:RegisterBucketMessage("UpdateFrameUnits", 0.3)
                        else
                            PlexusFrame:UnregisterBucket(PlexusFrame.bucket_UpdateFrameUnits, true)
                            PlexusFrame:RegisterMessage("UpdateFrameUnits")
                            PlexusFrame.bucket_UpdateFrameUnits = nil
                        end
                        PlexusFrame:UpdateFrameUnits()
                    end,
                },
            },
        },
        bar = {
            name = L["Bar Options"],
            desc = L["Options related to bar indicators."],
            order = 2,
            type = "group",
            args = {
                texture = {
                    name = L["Frame Texture"],
                    desc = L["Adjust the texture of each unit's frame."],
                    order = 1, width = "double",
                    type = "select",
                    values = Media:HashTable("statusbar"),
                    dialogControl = "LSM30_Statusbar",
                },
                healingBar_intensity = {
                    name = L["Healing Bar Opacity"],
                    desc = L["Sets the opacity of the healing bar."],
                    order = 2, width = "double",
                    type = "range", min = 0, max = 1, step = 0.01, bigStep = 0.05,
                },
                enableBarColor = {
                    name = format(L["Enable %s indicator"], L["Health Bar Color"]),
                    desc = format(L["Toggle the %s indicator."], L["Health Bar Color"]),
                    order = 3, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableBarColor = v
                        PlexusFrame:UpdateOptionsMenu()
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                invertBarColor = {
                    name = L["Invert Health Bar Color"],
                    desc = L["Swap foreground/background colors on bars."],
                    order = 4, width = "double",
                    type = "toggle",
                },
                invertTextColor = {
                    name = L["Invert Text Color"],
                    desc = L["Darken the text color to match the inverted bar."],
                    order = 5, width = "double",
                    type = "toggle",
                    disabled = function()
                        return not PlexusFrame.db.profile.invertBarColor
                    end,
                },
                healingBar_useStatusColor = {
                    name = L["Healing Bar Uses Status Color"],
                    desc = L["Make the healing bar use the status color instead of the health bar color."],
                    order = 6, width = "double",
                    type = "toggle",
                },
            },
        },
        icon = {
            name = L["Icon Options"],
            desc = L["Options related to icon indicators."],
            order = 3,
            type = "group",
            args = {
                centerIconSize = {
                    name = L["Center Icon Size"],
                    desc = L["Adjust the size of the center icons."],
                    order = 1, width = "double",
                    type = "range", min = 5, max = 50, step = 1,
                },
                iconSize = {
                    name = L["Extra Icons Size"],
                    desc = L["Adjust the size of the extra icons."],
                    order = 2, width = "double",
                    type = "range", min = 5, max = 50, step = 1,
                },
                iconBorderSize = {
                    name = L["Icon Border Size"],
                    desc = L["Adjust the size of icon borders."],
                    order = 3, width = "double",
                    type = "range", min = 0, max = 9, step = 1,
                },
                spacingSize = {
                    name = L["Icon Spacing Size"],
                    desc = L["Adjust the size of icon spacing."],
                    order = 4, width = "double",
                    type = "range", min = 0, max = 9, step = 1,
                },
                marginSize = {
                    name = L["Icon margin Size"],
                    desc = L["Adjust the size of icon margins."],
                    order = 5, width = "double",
                    type = "range", min = 0, max = 9, step = 1,
                    hidden = true,
                },
                enableIconCooldown = {
                    name = format(L["Enable %s"], L["Icon Cooldown Frame"]),
                    desc = L["Toggle icons cooldown frame."],
                    order = 6, width = "double",
                    type = "toggle",
                },
                IconHeader = {
                    name = "",
                    order = 7, width = "double",
                    type = "header",
                },
                showIconCountDownText = {
                    name = format(L["Enable %s"], L["Icon Cooldown Text"]),
                    desc = L["Toggle icons cooldown text."],
                    order = 8, width = "double",
                    type = "toggle",
                },
                iconCoolDownFontSize = {
                    name = L["Icon Cool Down Text Size"],
                    desc = L["Icon Cool Down Text Size"],
                    order = 9, width = "double",
                    type = "range", min = 0, max = 20, step = 1,
                    disabled = function()
                        return not PlexusFrame.db.profile.showIconCountDownText
                    end,
                },
                IconHeader0 = {
                    name = "",
                    order = 10, width = "double",
                    type = "header",
                },
                enableIconStackText = {
                    name = format(L["Enable %s"], L["Icon Stack Text"]),
                    desc = L["Toggle icon stack count text."],
                    order = 11, width = "double",
                    type = "toggle",
                },
                iconStackFontSize = {
                    name = L["Icon Stack Text Size"],
                    desc = L["Icon Stack Text Size"],
                    order = 12, width = "double",
                    type = "range", min = 0, max = 20, step = 1,
                    disabled = function()
                        return not PlexusFrame.db.profile.enableIconStackText
                    end,
                },
                IconHeader1 = {
                    name = "",
                    order = 13, width = "double",
                    type = "header",
                },
                enableIcon2 = {
                    name = "Enable Extra Icon xx 2 Indicators Requires ReloadUI",
                    desc = "Enable Extra Icon xx 2 Indicators",
                    order = 14, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableIcon2 = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableIcon34 = {
                    name = "Enable Extra Icon xx 3/4 Indicators Requires ReloadUI",
                    desc = "Enable Extra Icon xx 3/4 Indicators Requires ReloadUI",
                    order = 15, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableIcon34 = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                IconHeader2 = {
                    name = "",
                    order = 16, width = "double",
                    type = "header",
                },
                enableIconBarSeparation = {
                    name = "Enable Separation of Icons and Extra Bar Requires ReloadUI",
                    desc = "Enable Separation of Icon indicators away from Extra Bar Requires ReloadUI",
                    order = 17, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableIconBarSeparation = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                IconHeader3 = {
                    name = "",
                    order = 18, width = "double",
                    type = "header",
                },
                IconTestModeEnable = {
                    name = "Icon Indicators Test Mode Enable",
                    order = 19,
                    width = "double",
                    type = "execute",
                    func = function()
                        local texture = "Interface\\Icons\\Spell_Holy_GuardianSpirit"
                        local start = GetTime()
                        local duration = 30
                        local count = 2
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for _, frame in pairs(PlexusFrameTest.registeredFrames) do
                            for k in pairs(frame.indicators) do
                                if string.find(k, "ei_icon") then
                                    frame:SetIndicator(k, nil, nil, nil, nil, texture, start, duration, count)
                                end
                            end
                            frame:SetIndicator("icon", nil, nil, nil, nil, texture, start, duration, count)
                        end
                    end,
                },
                IconTestModeDisable = {
                    name = "Icon Indicators Test Mode Disable",
                    order = 20,
                    width = "double",
                    type = "execute",
                    func = function()
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for _, frame in pairs(PlexusFrameTest.registeredFrames) do
                            for k in pairs(frame.indicators) do
                                if string.find(k, "ei_icon") then
                                    frame:ClearIndicator(k)
                                end
                            end
                            frame:ClearIndicator("icon")
                        end
                    end,
                },
                iconbackground = {
                    name = L["Icon Background"],
                    desc = L["Options related to icon indicators."],
                    order = 21,
                    type = "group", inline = true,
                    args = {
                        enableIconBackgroundColor = {
                            name = "Enable",
                            desc = "Enable Showing Background Colors from Status Behinde the icon.",
                            order = 1, width = "double",
                            type = "toggle",
                            set = function(info, v) --luacheck: ignore 212
                                PlexusFrame.db.profile.enableIconBackgroundColor = v
                                PlexusFrame:UpdateAllFrames()
                                PlexusFrame:UpdateOptionsMenu()
                            end,
                        },
                        iconBackgroundAlpha = {
                            name = L["Icon Alpha"],
                            desc = L["Adjust how much the icon shows over background."],
                            order = 2, width = "double",
                            disabled = function()
                                return not PlexusFrame.db.profile.enableIconBackgroundColor
                            end,
                            type = "range", min = 0, max = 1, step = 0.1,
                        },
                    },
                },
            },
        },
        text = {
            name = L["Text Options"],
            desc = L["Options related to text indicators."],
            order = 4,
            type = "group",
            args = {
                font = {
                    name = L["Font"],
                    desc = L["Adjust the font settings"],
                    order = 1, width = "double",
                    type = "select",
                    values = Media:HashTable("font"),
                    dialogControl = "LSM30_Font",
                },
                textorientation = {
                    name = L["Orientation of Text"],
                    desc = L["Set frame text orientation."],
                    order = 2, width = "double",
                    type = "select",
                    values = {
                        VERTICAL = L["Vertical"],
                        HORIZONTAL = L["Horizontal"]
                    },
                },
                fontOutline = {
                    name = L["Font Outline"],
                    desc = L["Adjust the font outline."],
                    order = 3, width = "double",
                    type = "select",
                    values = {
                        NONE = L["None"],
                        OUTLINE = L["Thin"],
                        THICKOUTLINE = L["Thick"] ,
                    },
                },
                TextHeader1 = {
                    name = "",
                    order = 4, width = "double",
                    type = "header",
                },
                fontSize = {
                    name = L["Font Size"],
                    desc = L["Adjust the font size."],
                    order = 5, width = "double",
                    type = "range", min = 6, max = 24, step = 1,
                },
                textlength = {
                    name = L["Center Text Length"],
                    desc = L["Number of characters to show on Center Text indicator."],
                    order = 6, width = "double",
                    type = "range", min = 1, max = 12, step = 1,
                },
                fontShadow = {
                    name = L["Font Shadow"],
                    desc = L["Toggle the font drop shadow effect."],
                    order = 7, width = "double",
                    type = "toggle",
                },
                TextHeader2 = {
                    name = "",
                    order = 8, width = "double",
                    type = "header",
                },
                enableText2 = {
                    name = format(L["Enable %s indicator"], L["Center Text 2"]) .. " Requires ReloadUI",
                    desc = format(L["Toggle the %s indicator."], L["Center Text 2"]),
                    order = 9, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableText2 = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableText3 = {
                    name = format(L["Enable %s indicator"], L["Center Text 3"]) .. " Requires ReloadUI",
                    desc = format(L["Toggle the %s indicator."], L["Center Text 3"]),
                    order = 10, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableText3 = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableTextTop = {
                    name = "Enable Top Text Requires ReloadUI",
                    desc = "Enable Top Text Requires ReloadUI",
                    order = 11, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableTextTop = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableTextTopLeft = {
                    name = "Enable Top Left Text Requires ReloadUI",
                    desc = "Enable Top Left Text Requires ReloadUI",
                    order = 12, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableTextTopLeft = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableTextTopRight = {
                    name = "Enable Top Right Text Requires ReloadUI",
                    desc = "Enable Top Right Text Requires ReloadUI",
                    order = 13, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableTextTopRight = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableTextBottom = {
                    name = "Enable Bottom Text Requires ReloadUI",
                    desc = "Enable Bottom Text Requires ReloadUI",
                    order = 14, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableTextBottom = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableTextBottomLeft = {
                    name = "Enable Bottom Left Text Requires ReloadUI",
                    desc = "Enable Bottom Left Text Requires ReloadUI",
                    order = 15, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableTextBottomLeft = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableTextBottomRight = {
                    name = "Enable Bottom Right Text Requires ReloadUI",
                    desc = "Enable Bottom Right Text Requires ReloadUI",
                    order = 16, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableTextBottomRight = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableExtraText2 = {
                    name = "Enable Extra Text xx 2 Indicators Requires ReloadUI",
                    desc = "Enable Extra Text xx 2 Indicators Requires ReloadUI",
                    order = 17, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableExtraText2 = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableExtraText34 = {
                    name = "Enable Extra Text xx 3/4 Indicators Requires ReloadUI",
                    desc = "Enable Extra Text xx 3/4 Indicators Requires ReloadUI",
                    order = 18, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableExtraText34 = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                TextHeader3 = {
                    name = "",
                    order = 19, width = "double",
                    type = "header",
                },
                TextTestModeEnable = {
                    name = "Text Indicators Test Mode Enable",
                    order = 20,
                    width = "double",
                    type = "execute",
                    func = function()
                        local text = "Test"
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for _, frame in pairs(PlexusFrameTest.registeredFrames) do
                            for k in pairs(frame.indicators) do
                                if string.find(k, "ei_text") then
                                    frame:SetIndicator(k, nil, text)
                                end
                            end
                        end
                    end,
                },
                TextTestModeDisable = {
                    name = "Text Indicators Test Mode Disable",
                    order = 21,
                    width = "double",
                    type = "execute",
                    func = function()
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for _, frame in pairs(PlexusFrameTest.registeredFrames) do
                            for k in pairs(frame.indicators) do
                                if string.find(k, "ei_text") then
                                    frame:ClearIndicator(k)
                                end
                            end
                        end
                    end,
                },
            },
        },
        corner = {
            name = L["Corner Indicator Options"],
            desc = L["Options related to corner indicators."],
            order = 5,
            type = "group",
            args = {
                cornerSize = {
                    name = L["Size"],
                    desc = L["Adjust the size of the corner indicators."],
                    order = 1, width = "double",
                    type = "range", min = 1, max = 20, step = 1,
                },
                cornerBorderSize = {
                    name = "Border Size",
                    desc = "Adjust the size of the border on corner indicators.",
                    order = 2, width = "double",
                    disabled = true,
                    hidden = true,
                    type = "range", min = 0, max = 9, step = 1,
                },
                cornerBorderColor = {
                    name = L["Corner Border color"],
                    order = 3,
                    width = "double",
                    type = "color", hasAlpha = true,
                    get = function(info) --luacheck: ignore 212
                        local v = PlexusFrame.db.profile.cornerBorderColor
                        if type(v) == "table" and v.r and v.g and v.b then
                            return v.r, v.g, v.b, v.a
                        else
                            return v
                        end
                    end,
                    set = function(info, r, g, b, a) --luacheck: ignore 212
                        local color = PlexusFrame.db.profile.cornerBorderColor
                        color.r, color.g, color.b, color.a = r, g, b, a
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                CornerHeader1 = {
                    name = "",
                    order = 4, width = "double",
                    type = "header",
                },
                enableCorner2 = {
                    name = "Enable Extra Icon xx 2 Indicators Requires ReloadUI",
                    desc = "Enable Extra Icon xx 2 Indicators Requires ReloadUI",
                    order = 5, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableCorner2 = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableCorner34 = {
                    name = "Enable Extra Icon xx 3/4 Indicators Requires ReloadUI",
                    desc = "Enable Extra Icon xx 3/4 Indicators Requires ReloadUI",
                    order = 6, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableCorner34 = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                enableCornerBarSeparation = {
                    name = "Enable Separation of Corner and Extra Bar Requires ReloadUI",
                    desc = "Enable Separation of Corner indicators away from Extra Bar Requires ReloadUI",
                    order = 7, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableCornerBarSeparation = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                CornerHeader2 = {
                    name = "",
                    order = 8, width = "double",
                    type = "header",
                },
                CornerTestModeEnable = {
                    name = "Corner Indicators Test Mode Enable",
                    order = 9,
                    width = "double",
                    type = "execute",
                    func = function()
                        local color = { r = 0, g = 1, b = 0, a = 1 }
                        local start = GetTime()
                        local duration = 30
                        local count = 2
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for _, frame in pairs(PlexusFrameTest.registeredFrames) do
                            frame:SetIndicator("corner3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("topleft2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("topleft3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("corner4", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("topright2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("topright3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("corner1", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("bottomleft2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("bottomleft3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("corner2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("bottomright2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("bottomright3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Top", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Top2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Top3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Top4", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Bottom", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Bottom2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Bottom3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Bottom4", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Left", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Left2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Left3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Left4", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Right", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Right2", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Right3", color, nil, nil, nil, nil, start, duration, count)
                            frame:SetIndicator("Right4", color, nil, nil, nil, nil, start, duration, count)
                        end
                    end,
                },
                CornerTestModeDisable = {
                    name = "Corner Indicators Test Mode Disable",
                    order = 10,
                    width = "double",
                    type = "execute",
                    func = function()
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for _, frame in pairs(PlexusFrameTest.registeredFrames) do
                            frame:ClearIndicator("corner3")
                            frame:ClearIndicator("topleft2")
                            frame:ClearIndicator("topleft3")
                            frame:ClearIndicator("corner4")
                            frame:ClearIndicator("topright2")
                            frame:ClearIndicator("topright3")
                            frame:ClearIndicator("corner1")
                            frame:ClearIndicator("bottomleft2")
                            frame:ClearIndicator("bottomleft3")
                            frame:ClearIndicator("corner2")
                            frame:ClearIndicator("bottomright2")
                            frame:ClearIndicator("bottomright3")
                            frame:ClearIndicator("Top")
                            frame:ClearIndicator("Top2")
                            frame:ClearIndicator("Top3")
                            frame:ClearIndicator("Top4")
                            frame:ClearIndicator("Bottom")
                            frame:ClearIndicator("Bottom2")
                            frame:ClearIndicator("Bottom3")
                            frame:ClearIndicator("Bottom4")
                            frame:ClearIndicator("Left")
                            frame:ClearIndicator("Left2")
                            frame:ClearIndicator("Left3")
                            frame:ClearIndicator("Left4")
                            frame:ClearIndicator("Right")
                            frame:ClearIndicator("Right2")
                            frame:ClearIndicator("Right3")
                            frame:ClearIndicator("Right4")
                        end
                    end,
                },
            },
        },
        extrabar = {
            name = L["Extra Bar Indicator Options"],
            desc = L["Options related to extra indicators."],
            order = 6,
            type = "group",
            args = {
                enableExtraBar = {
                    name = "Enable Extra Bar Requires ReloadUI",
                    desc = "Enable/disable Extra Bar Indicator.",
                    order = 1, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enableExtraBar = v
                        PlexusFrame:UpdateAllFrames()
                        PlexusFrame:UpdateOptionsMenu()
                    end,
                },
                ExtraBarHeader1 = {
                    name = "",
                    order = 2, width = "double",
                    type = "header",
                },
                ExtraBarSize = {
                    name = L["Size"],
                    desc = "Percentage of frame for extra bar",
                    order = 3, width = "double",
                    type = "range", min = 1, max = 50, step = 1,
                    get = function ()
                        return PlexusFrame.db.profile.ExtraBarSize * 100
                    end,
                    set = function(_, v)
                        PlexusFrame.db.profile.ExtraBarSize = v / 100
                        PlexusFrame:UpdateAllFrames()
                    end
                },
                ExtraBarBorderSize = {
                    name = L["Border Size"],
                    desc = L["Adjust the size of the border on extra bar."],
                    order = 4, width = "double",
                    type = "range", min = 1, max = 20, step = 1,
                },
                ExtraBarSide = {
                    type = "select",
                    name = "Location",
                    order = 5, width = "full",
                    desc = "Where extra bar attaches to",
                    get = function ()
                        return PlexusFrame.db.profile.ExtraBarSide
                        end,
                    set = function(_, v)
                        PlexusFrame.db.profile.ExtraBarSide = v
                        PlexusFrame:UpdateAllFrames()
                    end,
                    values={["Left"] = "Left", ["Top"] = "Top", ["Right"] = "Right", ["Bottom"] = "Bottom" },
                },
                ExtraBarInvertColor = {
                    name = L["Invert Extra Bar Color"],
                    desc = L["Swap foreground/background colors on bars."],
                    order = 6, width = "double",
                    type = "toggle",
                },
                ExtraBarTrackDuration = {
                    name = L["Enable Extra Bar Duration Tracking Behaviour"],
                    desc = L["For buffs/debuffs with a duration show the remaining duration on the extra bar"],
                    order = 7, width = "double",
                    type = "toggle",
                },
                ExtraBarDurationUpdateRate = {
                    name = L["Extra Bar Duration Update Rate Requires ReloadUI"],
                    desc = L["Sets the frequency in seconds at which the extra bar updates. Smaller is smoother, but more work for the UI"],
                    order = 8, width = "double",
                    type = "range", min = 0.01, max = 5, step = 0.01, bigStep = 0.05,
                },
                ExtraBarHeader2 = {
                    name = "",
                    order = 9, width = "double",
                    type = "header",
                },
                ExtraBarTestModeEnable = {
                    name = "Extra Bar Test Mode Enable",
                    order = 10,
                    width = "double",
                    type = "execute",
                    func = function()
                        local color = { r = 0, g = 1, b = 0, a = 1 }
                        local value = 50
                        local maxvalue = 100
                        local start = GetTime()
                        local duration = 30
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for _, frame in pairs(PlexusFrameTest.registeredFrames) do
                            for k in pairs(frame.indicators) do
                                if string.find(k, "ei_bar") then
                                    frame:SetIndicator(k, color, nil, value, maxvalue, nil, start, duration)
                                end
                            end
                        end
                    end,
                },
                ExtraBarTestModeDisable = {
                    name = "Extra Bar Test Mode Disable",
                    order = 11,
                    width = "double",
                    type = "execute",
                    func = function()
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for _, frame in pairs(PlexusFrameTest.registeredFrames) do
                            for k in pairs(frame.indicators) do
                                if string.find(k, "ei_bar") then
                                    frame:ClearIndicator(k)
                                end
                            end
                        end
                    end,
                },
            },
        },
        privateaura = {
            name = L["Private Aura Options"],
            desc = L["Private Aura Options."],
            order = 7,
            type = "group",
            disabled = not Plexus:IsRetailWow(),
            args = {
                enablePrivateAura = {
                    name = "Enable Private Aura",
                    desc = "Enable/disable Private Aura.",
                    order = 1, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enablePrivateAura = v
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                enablePrivateAuraCountdownFrame = {
                    name = "Enable Private Aura Countdown Frame",
                    desc = "Enable/disable Private Aura Countdown Frame.",
                    order = 2, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enablePrivateAuraCountdownFrame = v
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                enablePrivateAuraCountdownNumbers = {
                    name = "Enable Private Aura Countdown Numbers",
                    desc = "Enable/disable Private Aura Countdown Numbers.",
                    order = 3, width = "double",
                    type = "toggle",
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.enablePrivateAuraCountdownNumbers = v
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                PrivateAuraWidth = {
                    name = "Icon Width",
                    desc = "Adjust the size of the Private Aura icon.",
                    order = 4, width = "double",
                    type = "range", min = 5, max = 100, step = 1,
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.PrivateAuraWidth = v
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                PrivateAuraHeight = {
                    name = "Icon Height",
                    desc = "Adjust the size of the Private Aura icon.",
                    order = 5, width = "double",
                    type = "range", min = 5, max = 100, step = 1,
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.PrivateAuraHeight = v
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                PrivateAuraOffsetX = {
                    name = "Icon Possition left/right",
                    desc = "Adjust the possition of the Private Aura icon.",
                    order = 6, width = "double",
                    type = "range", min = -250, max = 250, step = 1,
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.PrivateAuraOffsetX = v
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                PrivateAuraOffsetY = {
                    name = "Icon Possition Up/Down",
                    desc = "Adjust the possition of the Private Aura icon.",
                    order = 7, width = "double",
                    type = "range", min = -250, max = 250, step = 1,
                    set = function(info, v) --luacheck: ignore 212
                        PlexusFrame.db.profile.PrivateAuraOffsetY = v
                        PlexusFrame:UpdateAllFrames()
                    end,
                },
                PrivateAuraTestModeEnable = {
                    name = "Private Aura Test Mode Enable/Refresh Possition",
                    order = 8,
                    width = "double",
                    type = "execute",
                    func = function()
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for frameName, frame in pairs(PlexusFrameTest.registeredFrames) do
                            if frame.unit then
                                local testFrame = frameName .. "_PrivateAuras_Test"
                                if not _G[testFrame] then
                                    local PAFTest = CreateFrame('Frame', frameName .. "_PrivateAuras_Test", frame.indicators.bar)
                                    PAFTest:SetPoint("CENTER", frame.indicators.bar, "CENTER", PlexusFrame.db.profile.PrivateAuraOffsetX,PlexusFrame.db.profile.PrivateAuraOffsetY)
                                    PAFTest:SetSize(PlexusFrame.db.profile.PrivateAuraWidth, PlexusFrame.db.profile.PrivateAuraHeight)
                                    PAFTest.texture = PAFTest:CreateTexture()
                                    PAFTest.texture:SetAllPoints(PAFTest)
                                    PAFTest.texture:SetTexture(134532)
                                    PAFTest:Show()
                                else
                                    _G[testFrame]:SetPoint("CENTER", frame.indicators.bar, "CENTER", PlexusFrame.db.profile.PrivateAuraOffsetX,PlexusFrame.db.profile.PrivateAuraOffsetY)
                                    _G[testFrame]:SetSize(PlexusFrame.db.profile.PrivateAuraWidth, PlexusFrame.db.profile.PrivateAuraHeight)
                                    _G[testFrame].texture:SetTexture(134532)
                                    _G[testFrame]:Show()
                                end
                            end
                        end
                    end,
                },
                PrivateAuraTestModeDisable = {
                    name = "Private Aura Test Mode Disable",
                    order = 9,
                    width = "double",
                    type = "execute",
                    func = function()
                        local PlexusFrameTest = Plexus:GetModule("PlexusFrame")
                        for frameName, frame in pairs(PlexusFrameTest.registeredFrames) do
                            if frame.unit then
                                local testFrame = frameName .. "_PrivateAuras_Test"
                                _G[testFrame].texture:SetTexture()
                                _G[testFrame]:Hide()
                            end
                        end
                    end,
                },
            },
        },
    },
}

Plexus.options.args.PlexusIndicator = {
    name = L["Indicators"],
    desc = L["Options for assigning statuses to indicators."],
    order = 3,
    type = "group",
    childGroups = "tree",
    args = {}
}

------------------------------------------------------------------------

function PlexusFrame:PostInitialize()
    PlexusStatus = Plexus:GetModule("PlexusStatus")
    PlexusStatusRange = PlexusStatus:GetModule("PlexusStatusRange", true)

    self.frames = {}
    self.registeredFrames = {}
end

function PlexusFrame:OnEnable()
    self:RegisterMessage("Plexus_StatusGained")
    self:RegisterMessage("Plexus_StatusLost")

    self:RegisterMessage("Plexus_StatusRegistered", "UpdateOptionsMenu")
    self:RegisterMessage("Plexus_StatusUnregistered", "UpdateOptionsMenu")

    self:RegisterMessage("Plexus_ColorsChanged", "UpdateAllFrames")

    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateFrameUnits")
    if not Plexus:IsClassicWow() then
        self:RegisterEvent("UNIT_ENTERED_VEHICLE", "SendMessage_UpdateFrameUnits")
        self:RegisterEvent("UNIT_EXITED_VEHICLE", "SendMessage_UpdateFrameUnits")
    end

    self:RegisterMessage("Plexus_RosterUpdated", "SendMessage_UpdateFrameUnits")

    if self.db.profile.throttleUpdates then
        self.bucket_UpdateFrameUnits = self:RegisterBucketMessage("UpdateFrameUnits", 0.3)
    else
        self:RegisterMessage("UpdateFrameUnits")
    end

    Media.RegisterCallback(self, "LibSharedMedia_Registered", "LibSharedMedia_Update")
    Media.RegisterCallback(self, "LibSharedMedia_SetGlobal", "LibSharedMedia_Update")

    self:Reset()
end

function PlexusFrame:SendMessage_UpdateFrameUnits()
    self:SendMessage("UpdateFrameUnits")
end

function PlexusFrame:LibSharedMedia_Update(_, mediatype)
     if mediatype == "font" or mediatype == "statusbar" then
        self:UpdateAllFrames()
    end
end

function PlexusFrame:OnDisable()
    self:Debug("OnDisable")
    -- should probably disable and hide all of our frames here
end

function PlexusFrame:PostReset()
    self:Debug("PostReset")

    self:UpdateOptionsMenu()

    self:ResetAllFrames()
    self:UpdateFrameUnits()
    self:UpdateAllFrames()

    -- different fix for ticket #556, maybe fixes #603 too
    self:ResizeAllFrames()
end

------------------------------------------------------------------------

function PlexusFrame:RegisterFrame(frame)
    self:Debug("RegisterFrame", frame:GetName())

    self.registeredFrameCount = (self.registeredFrameCount or 0) + 1
    self.registeredFrames[frame:GetName()] = self:InitializeFrame(frame)
    self:UpdateFrameUnits()
end

function PlexusFrame:WithAllFrames(func, ...)
    for _, frame in pairs(self.registeredFrames) do
        if type(frame[func]) == "function" then
            frame[func](frame, ...)
        end
    end
end

function PlexusFrame:ResetAllFrames()
    self:WithAllFrames("Reset")
    self:SendMessage("Plexus_UpdateLayoutSize")
end

function PlexusFrame:ResizeAllFrames()
    if InCombatLockdown() then return end -- TODO: some kind of alert
    self:WithAllFrames("SetWidth", self.db.profile.frameWidth)
    self:WithAllFrames("SetHeight", self.db.profile.frameHeight)
    self:ResetAllFrames()
    if not reloadHandle then
        reloadHandle = PlexusFrame:ScheduleTimer("Plexus_ReloadLayout", 0.1)
    end
end

function PlexusFrame:UpdateAllFrames()
    for _, frame in pairs(self.registeredFrames) do
        self:UpdateIndicators(frame)
    end
end

------------------------------------------------------------------------

local SecureButton_GetModifiedUnit = SecureButton_GetModifiedUnit -- it's so slow

function PlexusFrame:UpdateFrameUnits()
    local settings = self.db.profile
    for frame_name, frame in pairs(self.registeredFrames) do
        if frame:IsVisible() then
            local old_unit = frame.unit
            local old_guid = frame.unitGUID
            local unitid = SecureButton_GetModifiedUnit(frame)
                  unitid = unitid and gsub(unitid, "petpet", "pet") -- http://forums.wowace.com/showpost.php?p=307619&postcount=3174
            local guid = unitid and ( (not Plexus.IsSpecialUnit[unitid]) and UnitGUID(unitid) or unitid ) or nil

            --Start Priavte Aura
            if Plexus:IsRetailWow() and settings.enablePrivateAura and guid and (old_unit ~= unitid or old_guid ~= guid) and not frame.anchorID then
                local icon = CreateFrame("Button", frame_name .. "PA", frame.indicators.bar, BackdropTemplateMixin and "BackdropTemplate")
                icon:SetPoint("CENTER")
                icon:SetSize(1, 1)
                icon:EnableMouse(false)
                icon:Show()
                local auraAnchor = {
                    durationAnchor =
                    {
                        point = "CENTER",
                        relativeTo = icon, --frame.Duration
                        relativePoint = "CENTER",
                        offsetX = settings.PrivateAuraOffsetX,
                        offsetY = settings.PrivateAuraOffsetY,
                    };
                    unitToken = unitid,
                    auraIndex = 1, --frame.auraIndex
                    parent = icon,
                    showCountdownFrame = settings.enablePrivateAuraCountdownFrame,
                    showCountdownNumbers = settings.enablePrivateAuraCountdownNumbers,
                    iconInfo =
                    {
                        iconAnchor = {
                            point = "CENTER",
                            relativeTo = icon,
                            relativePoint = "CENTER",
                            offsetX = settings.PrivateAuraOffsetX,
                            offsetY = settings.PrivateAuraOffsetY,
                        },
                        iconWidth = settings.PrivateAuraWidth, --frame.indicators.icon:GetWidth()
                        iconHeight = settings.PrivateAuraHeight, --frame.indicators.icon:GetHeight()
                    };
                }
                frame.anchorID = C_UnitAuras.AddPrivateAuraAnchor(auraAnchor)
            end
            if Plexus:IsRetailWow() and settings.enablePrivateAura and guid and (old_unit ~= unitid or old_guid ~= guid) and frame.anchorID then
                C_UnitAuras.RemovePrivateAuraAnchor(frame.anchorID)
                frame.anchorID = nil
                local icon = _G[frame_name .. "PA"]
                icon:SetParent(frame.indicators.bar)
                icon:SetPoint("CENTER")
                icon:SetSize(1, 1)
                icon:EnableMouse(false)
                icon:Show()
                local auraAnchor = {
                    durationAnchor =
                    {
                        point = "CENTER",
                        relativeTo = icon, --frame.Duration
                        relativePoint = "CENTER",
                        offsetX = settings.PrivateAuraOffsetX,
                        offsetY = settings.PrivateAuraOffsetY,
                    };
                    unitToken = unitid,
                    auraIndex = 1, --frame.auraIndex
                    parent = icon,
                    showCountdownFrame = settings.enablePrivateAuraCountdownFrame,
                    showCountdownNumbers = settings.enablePrivateAuraCountdownNumbers,
                    iconInfo =
                    {
                        iconAnchor = {
                            point = "CENTER",
                            relativeTo = icon,
                            relativePoint = "CENTER",
                            offsetX = settings.PrivateAuraOffsetX,
                            offsetY = settings.PrivateAuraOffsetY,
                        },
                        iconWidth = settings.PrivateAuraWidth, --frame.indicators.icon:GetWidth()
                        iconHeight = settings.PrivateAuraHeight, --frame.indicators.icon:GetHeight()
                    };
                }
                frame.anchorID = C_UnitAuras.AddPrivateAuraAnchor(auraAnchor)
            end
            if Plexus:IsRetailWow() and not settings.enablePrivateAura then
                if frame and frame.anchorID then
                    C_UnitAuras.RemovePrivateAuraAnchor(frame.anchorID)
                    frame.anchorID = nil
                end
            end
            --End Priavte Aura

            if old_unit ~= unitid or old_guid ~= guid then
                self:Debug("Updating", frame_name, "to", unitid, guid, "was", old_unit, old_guid)

                if unitid then
                    frame.unit = unitid
                    if not Plexus.IsSpecialUnit[unitid] then
                        frame.unitGUID = guid
                    else
                        frame.unitGUID = unitid
                    end

                    if guid then
                        self:UpdateIndicators(frame)
                    end
                else
                    frame.unit = nil
                    frame.unitGUID = nil

                    self:ClearIndicators(frame)
                end
            end
        end
    end
end

function PlexusFrame:UpdateIndicators(frame)
    local unitid = frame.unit
    if not unitid then return end

    -- statusmap[indicator][status]
    frame:ResetAllIndicators()
    for indicator in pairs(self.db.profile.statusmap) do
        self:UpdateIndicator(frame, indicator)
    end
end

function PlexusFrame:ClearIndicators(frame)
    for indicator in pairs(self.db.profile.statusmap) do
        frame:ClearIndicator(indicator)
    end
end

function PlexusFrame:UpdateIndicatorsForStatus(frame, status)
    local unitid = frame.unit
    if not unitid then return end

    -- self.statusmap[indicator][status]
    local statusmap = self.db.profile.statusmap
    for indicator, map_for_indicator in pairs(statusmap) do
        if map_for_indicator[status] then
            self:UpdateIndicator(frame, indicator)
        end
    end
end

function PlexusFrame:UpdateIndicator(frame, indicator)
    local status = self:StatusForIndicator(frame.unit, frame.unitGUID, indicator)
    if status then
        self:Debug("Showing status", status.text, "for", UnitName(frame.unit), "on", indicator)
        frame:SetIndicator(indicator,
            status.color,
            status.text,
            status.value,
            status.maxValue,
            status.texture,
            status.start,
            status.duration,
            status.count,
            status.texCoords,
            status.expirationTime)
    else
        self:Debug("Clearing indicator", indicator, "for", (UnitName(frame.unit)))
        frame:ClearIndicator(indicator)
    end
end

local TextNames = {
    -- Center Text
    text = true,
    text2 = true,
    text3 = true,

    -- Top
    ei_text_top = true,
    ei_text_top2 = true,
    ei_text_top3 = true,
    ei_text_top4 = true,

    -- Top Left
    ei_text_topleft = true,
    ei_text_topleft2 = true,
    ei_text_topleft3 = true,

    -- Top Right
    ei_text_topright = true,
    ei_text_topright2 = true,
    ei_text_topright3 = true,

    -- Bottom
    ei_text_bottom = true,
    ei_text_bottom2 = true,
    ei_text_bottom3 = true,
    ei_text_bottom4 = true,

    -- Bottom Left
    ei_text_bottomleft = true,
    ei_text_bottomleft2 = true,
    ei_text_bottomleft3 = true,

    -- Bottom Right
    ei_text_bottomright = true,
    ei_text_bottomright2 = true,
    ei_text_bottomright3 = true,
}


local IconNames = {
    ["icon"] = true,
    ["ei_icon_top"] = true,
    ["ei_icon_top2"] = true,
    ["ei_icon_top3"] = true,
    ["ei_icon_top4"] = true,
    ["ei_icon_topleft"] = true,
    ["ei_icon_topleft2"] = true,
    ["ei_icon_topleft3"] = true,
    ["ei_icon_topleft4"] = true,
    ["ei_icon_topright"] = true,
    ["ei_icon_topright2"] = true,
    ["ei_icon_topright3"] = true,
    ["ei_icon_topright4"] = true,
    ["ei_icon_bottom"] = true,
    ["ei_icon_bottom2"] = true,
    ["ei_icon_bottom3"] = true,
    ["ei_icon_bottom4"] = true,
    ["ei_icon_botleft"] = true,
    ["ei_icon_botleft2"] = true,
    ["ei_icon_botleft3"] = true,
    ["ei_icon_botleft4"] = true,
    ["ei_icon_botright"] = true,
    ["ei_icon_botright2"] = true,
    ["ei_icon_botright3"] = true,
    ["ei_icon_botright4"] = true,
    ["ei_icon_left"] = true,
    ["ei_icon_left2"] = true,
    ["ei_icon_left3"] = true,
    ["ei_icon_left4"] = true,
    ["ei_icon_right"] = true,
    ["ei_icon_right2"] = true,
    ["ei_icon_right3"] = true,
    ["ei_icon_right4"] = true,
}


function PlexusFrame:StatusForIndicator(_, guid, indicator)
    local topPriority = 0
    local topStatus
    local statusmap = self.db.profile.statusmap[indicator]

    -- self.statusmap[indicator][status]
    for statusName, enabled in pairs(statusmap) do
        local status = enabled and PlexusStatus:GetCachedStatus(guid, statusName)
        if status then
            local valid = true

            -- make sure the status can be displayed
            if TextNames[indicator] and not status.text then
                self:Debug("unable to display", statusName, "on", indicator, ": no text")
                valid = false
            end
            if IconNames[indicator] and not status.texture then
                self:Debug("unable to display", statusName, "on", indicator, ": no texture")
                valid = false
            end

            if status.priority and type(status.priority) ~= "number" then
                self:Debug("priority not number for", statusName)
                valid = false
            end

            -- only check range for valid statuses
            if valid then
        -- #DELETE
        --		local inRange = not status.range or self:UnitInRange(unitid)
        --		if inRange and ((status.priority or 99) > topPriority) then
                if (status.priority or 100) > topPriority then
                    topStatus = status
                    topPriority = topStatus.priority
                end
            end
        end
    end

    return topStatus
end

function PlexusFrame:UnitInRange(unit) --luacheck: ignore 212
    if not unit or not UnitExists(unit) then return false end

    if UnitIsUnit(unit, "player") then
        return true
    end

    if PlexusStatusRange then
        return PlexusStatusRange:UnitInRange(unit)
    end

    return UnitInRange(unit)
end

------------------------------------------------------------------------

function PlexusFrame:Plexus_StatusGained(_, guid, status)
    for _, frame in pairs(self.registeredFrames) do
        if not Plexus:issecretvalue(guid) and not Plexus:issecretvalue(frame.unitGUID) and frame.unitGUID == guid then
            self:UpdateIndicatorsForStatus(frame, status)
        end
    end
end

function PlexusFrame:Plexus_StatusLost(_, guid, status)
    for _, frame in pairs(self.registeredFrames) do
        if not Plexus:issecretvalue(guid) and not Plexus:issecretvalue(frame.unitGUID) and frame.unitGUID == guid then
            self:UpdateIndicatorsForStatus(frame, status)
        end
    end
end

------------------------------------------------------------------------
-- TODO: move indicator specific options into indicators, add API

function PlexusFrame:UpdateOptionsMenu()
    self:Debug("UpdateOptionsMenu()")

    for id, info in pairs(self.indicators) do
        self:UpdateOptionsForIndicator(id, info.name, defaultOrder[id])
    end
end

function PlexusFrame:UpdateOptionsForIndicator(indicator, name, order)
    local menu = Plexus.options.args.PlexusIndicator.args
    PlexusStatus = Plexus:GetModule("PlexusStatus")

    if indicator == "bar" then
        menu[indicator] = nil
        return
    end

    if indicator == "text2" and not self.db.profile.enableText2 then
        self:Debug("indicator text2 is disabled")
        menu[indicator] = nil
        return
    end

    if indicator == "text3" and not self.db.profile.enableText3 then
        self:Debug("indicator text3 is disabled")
        menu[indicator] = nil
        return
    end

    if indicator == "tooltip" then
        self:Debug("indicator tooltip is disabled")
        menu[indicator] = nil
        return
    end

    if (string.find(name, "Indicator") and (string.find(name, "2")) and not self.db.profile.enableCorner2) then --luacheck:ignore 631
        self:Debug("Disabling Corners 2")
        menu[indicator] = nil
        return
    end
    if (string.find(name, "Indicator") and (string.find(name, "3") or string.find(name, "4")) and not self.db.profile.enableCorner34) then --luacheck:ignore 631
        self:Debug("Disabling Corners 3-4")
        menu[indicator] = nil
        return
    end

    if (string.find(indicator, "ei_icon") and (string.find(indicator, "2")) and not self.db.profile.enableIcon2) then
        self:Debug("Disabling Extra Icons 2")
        menu[indicator] = nil
        return
    end
    if (string.find(indicator, "ei_icon") and (string.find(indicator, "3") or string.find(indicator, "4")) and not self.db.profile.enableIcon34) then --luacheck:ignore 631
        self:Debug("Disabling Extra Icons 3-4")
        menu[indicator] = nil
        return
    end

    if indicator == "ei_bar_barone" and not self.db.profile.enableExtraBar  then
        self:Debug("disableing extra bar one menu")
        menu[indicator] = nil
        return
    end

    if indicator == "barcolor" and not self.db.profile.enableBarColor then
        self:Debug("indicator barcolor is disabled")
        menu[indicator] = nil
        return
    end

    -- ensure statusmap entry exists for indicator
    local statusmap = self.db.profile.statusmap
    if not statusmap[indicator] then
        statusmap[indicator] = {}
    end

    -- create menu for indicator
    if not menu[indicator] then
        menu[indicator] = {
            name = name,
            order = order and (order + 1) or nil,
            type = "group",
            args = {
                StatusesHeader = {
                    type = "header",
                    name = L["Statuses"],
                    order = 1,
                },
            },
        }
        if indicator == "text2" then
            menu[indicator].hidden = function() return not PlexusFrame.db.profile.enableText2 end
        end
        if indicator == "text3" then
            menu[indicator].hidden = function() return not PlexusFrame.db.profile.enableText3 end
        end
        if indicator == "tooltip" then
            menu[indicator].hidden = function() return true end
        end
        if (string.find(name, "Indicator") and string.find(name, "2")) then
            menu[indicator].hidden = function() return not PlexusFrame.db.profile.enableCorner2 end
        end
        if (string.find(name, "Indicator") and (string.find(name, "3") or string.find(name, "4"))) then
            menu[indicator].hidden = function() return not PlexusFrame.db.profile.enableCorner34 end
        end
        if (string.find(indicator, "ei_icon") and string.find(indicator, "2")) then
            menu[indicator].hidden = function() return not PlexusFrame.db.profile.enableIcon2 end
        end
        if (string.find(indicator, "ei_icon") and (string.find(indicator, "3") or string.find(indicator, "4"))) then
            menu[indicator].hidden = function() return not PlexusFrame.db.profile.enableIcon34 end
        end
        if indicator == "ei_bar_barone" then
            menu[indicator].hidden = function() return not PlexusFrame.db.profile.enableExtraBar end
        end
    end

    local indicatorMenu = menu[indicator].args

    -- remove statuses that are not registered
    for status, _ in pairs(indicatorMenu) do
        if status ~= "StatusesHeader" and not PlexusStatus:IsStatusRegistered(status) then
            indicatorMenu[status] = nil
            self:Debug("Removed", indicator, status)
        end
    end

    -- create entry for each registered status
    for status, _, descr in PlexusStatus:RegisteredStatusIterator() do
        -- needs to be local for the get/set closures
        local indicatorType = indicator
        local statusKey = status

        self:Debug(indicator.type, status)

        if not indicatorMenu[status] then
            indicatorMenu[status] = {
                name = descr,
                desc = L["Toggle status display."],
                width = "double",
                type = "toggle",
                get = function()
                    return PlexusFrame.db.profile.statusmap[indicatorType][statusKey]
                end,
                set = function(info, v) --luacheck: ignore 212
                    PlexusFrame.db.profile.statusmap[indicatorType][statusKey] = v
                    PlexusFrame:UpdateAllFrames()
                end,
            }
            self:Debug("Added", indicator.type, status)
        end
    end
end

------------------------------------------------------------------------

function PlexusFrame:ListRegisteredFrames()
    self:Debug("--[ BEGIN Registered Frame List ]--")
    self:Debug("FrameName", "UnitId", "UnitName", "Status")
    for frameName, frame in pairs(self.registeredFrames) do
        local frameStatus = "|cff00ff00"

        if frame:IsVisible() then
            frameStatus = frameStatus .. "visible"
        elseif frame:IsShown() then
            frameStatus = frameStatus .. "shown"
        else
            frameStatus = "|cffff0000"
            frameStatus = frameStatus .. "hidden"
        end

        frameStatus = frameStatus .. "|r"

        self:Debug(
            frameName == frame:GetName() and "|cff00ff00"..frameName.."|r" or "|cffff0000"..frameName.."|r",
            frame.unit == frame:GetAttribute("unit") and "|cff00ff00"..(frame.unit or "nil").."|r" or "|cffff0000"..(frame.unit or "nil").."|r",
            frame.unit and frame.unitGUID == UnitGUID(frame.unit) and "|cff00ff00"..(frame.unitName or "nil").."|r" or "|cffff0000"..(frame.unitName or "nil").."|r",
            frame:GetAttribute("type1"),
            frame:GetAttribute("*type1"),
            frameStatus)
    end
    PlexusFrame:Debug("--[ END Registered Frame List ]--")
end
