local function IsRetailWow()
    return WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
end

local UnitAura, UnitGUID, pairs = _G.UnitAura, _G.UnitGUID, _G.pairs

local MAX_BUFFS = 40

local L = setmetatable(PlexusBuffIconsLocale or {}, {__index = function(t, k) t[k] = k return k end})

local PlexusRoster = _G.Plexus:GetModule("PlexusRoster")
local PlexusFrame = _G.Plexus:GetModule("PlexusFrame")
local PlexusBuffIcons = _G.Plexus:NewModule("PlexusBuffIcons", "AceBucket-3.0")

PlexusBuffIcons.menuName = L["Buff Icons"]

PlexusBuffIcons.defaultDB = {
    enabled = true,
    showMine = true,
    iconsize = 9,
    offsetx = -1,
    offsety = -1,
    alpha = 0.9,
    iconnum = 4,
    --iconperrow = 2,
    --orientation = "VERTICAL",
    anchor = "TOPRIGHT",
    color = { r = 0, g = 0.5, b = 1.0, a = 1.0 },
    ecolor = { r = 1, g = 1, b = 0, a = 1.0 },
    rcolor = { r = 1, g = 0, b = 0, a = 1.0 },
    unit_buff_icons = {
        color = { r=1, g=1, b=1, a=1 },
        text = "BuffIcons",
        enable = true,
        priority = 30,
        range = false
    },
    overrideFilter = "false"
}

local options = {
    type = "group",
    inline = PlexusFrame.options.args.bar.inline,
    name = L["Buff Icons"],
    desc = L["Buff Icons"],
    order = 1200,
    get = function(info)
        local k = info[#info]
        return PlexusBuffIcons.db.profile[k]
    end,
    set = function(info, v)
        local k = info[#info]
        PlexusBuffIcons.db.profile[k] = v
        PlexusBuffIcons:UpdateAllUnitsBuffs()
    end,
    args = {
        enabled = {
            order = 40, width = "double",
            type = "toggle",
            name = L["Enable"],
            desc = L["Enabling/disabling the module will display all buff or debuff icons."],
            get = function()
                return PlexusBuffIcons.db.profile.enabled
            end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.enabled = v
                if v and not PlexusBuffIcons.enabled then
                    PlexusBuffIcons:OnEnable()
                elseif not v and PlexusBuffIcons.enabled then
                    PlexusBuffIcons:OnDisable()
                end
            end,
        },
        showMine = {
            order = 41, width = "double",
            type = "toggle",
            name = L["Show Mine"],
            desc = L["Enabling/disabling will display only buffs you casted."],
            get = function()
                return PlexusBuffIcons.db.profile.showMine
            end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.showMine = v
                PlexusBuffIcons:UpdateAllUnitsBuffs()
            end,
        },
        iconsize = {
            order = 55, width = "double",
            type = "range",
            name = L["Icons Size"],
            desc = L["Size for each buff icon"],
            max = 50,
            min = 5,
            step = 1,
            get = function () return PlexusBuffIcons.db.profile.iconsize end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.iconsize = v
            end
        },
        alpha = {
            order = 70, width = "double",
            type = "range",
            name = L["Alpha"],
            desc = L["Alpha value for each buff icon"],
            max = 1,
            min = 0.1,
            step = 0.1,
            get = function () return PlexusBuffIcons.db.profile.alpha end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.alpha = v
            end
        },
        offsetx = {
            order = 60, width = "double",
            type = "range",
            name = L["Offset X"],
            desc = L["X-axis offset from the selected anchor point, minus value to move inside."],
            max = 20,
            min = -20,
            step = 1,
            get = function () return PlexusBuffIcons.db.profile.offsetx end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.offsetx = v
            end
        },
        offsety = {
            order = 65, width = "double",
            type = "range",
            name = L["Offset Y"],
            desc = L["Y-axis offset from the selected anchor point, minus value to move inside."],
            max = 20,
            min = -20,
            step = 1,
            get = function () return PlexusBuffIcons.db.profile.offsety end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.offsety = v
            end
        },
        iconnum = {
            order = 75, width = "double",
            type = "range",
            name = L["Icon Numbers"],
            desc = L["Max icons to show."],
            max = MAX_BUFFS,
            min = 1,
            step = 1,
        },
        --iconperrow = {
        --    order = 76, width = "double",
        --    type = "range",
        --    name = L["Icons Per Row"],
        --    desc = L["Sperate icons in several rows."],
        --    max = MAX_BUFFS,
        --    min = 0,
        --    step = 1,
        --    get = function()
        --        return PlexusBuffIcons.db.profile.iconperrow
        --    end,
        --    set = function(_, v)
        --        PlexusBuffIcons.db.profile.iconperrow = v
        --    end,
        --},
        --orientation = {
        --    order = 80,  width = "double",
        --    type = "select",
        --    name = L["Orientation of Icon"],
        --    desc = L["Set icons list orientation."],
        --    get = function ()
        --        return PlexusBuffIcons.db.profile.orientation
        --    end,
        --    set = function(_, v)
        --        PlexusBuffIcons.db.profile.orientation = v
        --    end,
        --    values ={["HORIZONTAL"] = L["HORIZONTAL"], ["VERTICAL"] = L["VERTICAL"]}
        --},
        anchor = {
            order = 90,  width = "double",
            type = "select",
            name = L["Anchor Point"],
            desc = L["Anchor point of the first icon."],
            get = function ()
                return PlexusBuffIcons.db.profile.anchor
            end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.anchor = v
            end,
            values ={["TOPRIGHT"] = L["TOPRIGHT"], ["TOPLEFT"] = L["TOPLEFT"], ["BOTTOMLEFT"] = L["BOTTOMLEFT"], ["BOTTOMRIGHT"] = L["BOTTOMRIGHT"]}
        },
        overrideFilter = {
            order = 100,  width = "double",
            type = "select",
            name = L["Override Aura Filter(Advanced)"],
            desc = L["Choose an option for aura filtering. Or false to keep defaults"],
            get = function ()
                return PlexusBuffIcons.db.profile.overrideFilter
            end,
            set = function(_, v)
                PlexusBuffIcons.db.profile.overrideFilter = v
            end,
        values = {
            ["false"] = L["False"],
            ["HELPFUL"] = L["HELPFUL"],
            ["HELPFUL|PLAYER"] = L["HELPFUL PLAYER"],
            ["HELPFUL|RAID"] = L["HELPFUL RAID"],
            ["HELPFUL|RAID_IN_COMBAT"] = L["HELPFUL RAID IN COMBAT"],
            ["HELPFUL|PLAYER|RAID"] = L["HELPFUL PLAYER RAID"],
            ["HELPFUL|PLAYER|RAID_IN_COMBAT"] = L["HELPFUL PLAYER RAID IN COMBAT"],
            ["HELPFUL|RAID|RAID_IN_COMBAT"] = L["HELPFUL RAID RAID IN COMBAT"],
            ["HELPFUL|PLAYER|RAID|RAID_IN_COMBAT"] = L["HELPFUL PLAYER RAID RAID IN COMBAT"],
        }
        },
    }
}

_G.Plexus.options.args.PlexusBuffIcons = options


function PlexusBuffIcons:OnInitialize()
end

function PlexusBuffIcons:OnEnable()
    --self:RegisterEvent("UNIT_AURA")
    --self:RegisterEvent("UNIT_FLAGS")
    self:RegisterMessage("UpdateFrameUnits", "MakeContainers")
    self:RegisterEvent("LOADING_SCREEN_DISABLED", "MakeContainers")
    --self:RegisterMessage("Plexus_ExtraUnitsChanged", "ExtraUnitsChanged")
    --self:UpdateAllUnitsBuffs()
end

function PlexusBuffIcons:OnDisable()
    --self.enabled = nil
    --self:UnregisterEvent("UNIT_AURA")
    --self:UnregisterEvent("UNIT_FLAGS")
    self:UnRegisterMessage("UpdateFrameUnits")
    self:UnregisterEvent("LOADING_SCREEN_DISABLED")
    --self:UnregisterMessage("Plexus_ExtraUnitsChanged")
end

function PlexusBuffIcons:UpdateAllUnitsBuffs()
    for _, unitid in PlexusRoster:IterateRoster() do
        self:UNIT_AURA("UpdateAllUnitsBuffs", unitid, {isFullUpdate = true} )
    end
end

local function createButton(button)
   button:SetSize(PlexusBuffIcons.db.profile.iconsize, PlexusBuffIcons.db.profile.iconsize)
   button:SetCancelAuraButtons('RightButtonUp')
   local Icon = button:CreateTexture(nil, 'ARTWORK')
   Icon:SetAllPoints()
   button:SetIcon(Icon)
   local Time = button:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
   Time:SetPoint('TOPLEFT', 1, -1)
   Time:SetJustifyH('LEFT')
   Time:SetSize(PlexusBuffIcons.db.profile.iconsize/2, PlexusBuffIcons.db.profile.iconsize/2)
   button:SetDurationText(Time)
end

function PlexusBuffIcons:MakeContainers()
    if not PlexusBuffIcons.db.profile.enabled then
        return
    end
    local registeredFrames = PlexusFrame.registeredFrames
    local name = "PlexusBuffIcons"
    --C_Timer.After(1, function()
    --    for frameName, frameTable in pairs(registeredFrames) do
    --      print(frameTable.unit)
    --    end
    --end)
    --C_Timer.After(10, function()
        for frameName, frameTable in pairs(registeredFrames) do
            if frameTable.unit then
                --local unit = frameTable.unit
                if not frameTable.container then
                    frameTable.container = {}
                end
                if not frameTable.container[name] then
                    --print("creating container for " .. name, "for unit " .. unit)
                    frameTable.container[name] = CreateFrame('AuraContainer', nil, frameTable, 'CustomAuraContainerTemplate')
                    frameTable.container[name]:SetUnit(frameTable.unit)
                    --print(unit)
                    --frameTable.container[name]:SetPoint('TOP', 0, 0)
                    --local point, x, y = unpack(anchor[name])
                    frameTable.container[name]:SetPoint(PlexusBuffIcons.db.profile.anchor, PlexusBuffIcons.db.profile.offsetx, PlexusBuffIcons.db.profile.offsety)
                end
                if not frameTable.container[name]:HasAuraGroup(frameName .. ":" .. name) then
                    if frameTable.unit then
                        --if unit == "player" then
                        --print(unit)
                        --end
                        --print(type(unit))
                        --frameTable.container[name]:SetUnit("player")
                        --else
                        --    frameTable.container[name]:SetUnit("player")
                        --local candidateFilters = {
                        --    includeSpellIDs = {
                        --    --    53563,  -- Beacon of Light
                        --    },
                        --    excludeSpellIDs = {
                        --    --    53563,  -- Beacon of Light
                        --    },
                        --}
                        --candidateFilters.includeSpellIDs[id] = true
                        local filter = PlexusBuffIcons.db.showMine and "PLAYER|HARMFUL" or "HARMFUL"
                        frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name, (PlexusBuffIcons.db.overrideFilter and PlexusBuffIcons.db.overrideFilter or filter), {
                              initializeFrame = createButton,
                              sortMethod = AuraContainerSortMethod.ExpirationOnly,
                              sortDirection = AuraContainerSortDirection.Reverse,
                              layout = {
                                 elementSpacing = 1,
                                 lineSpacing = 1,
                              },
                              maxFrameCount = PlexusBuffIcons.db.profile.iconnum,
                              --candidateFilters = candidateFilters
                            }
                        )
                        frameTable.container[name]:UpdateAllAuras()
                    end
                else
                    frameTable.container[name]:SetUnit(frameTable.unit)
                    frameTable.container[name]:UpdateAllAuras()
                end
            end
        end
    --end)
end
