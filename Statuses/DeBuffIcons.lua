local function IsRetailWow()
    return WOW_PROJECT_ID == WOW_PROJECT_MAINLINE
end

local UnitAura, UnitGUID, pairs = _G.UnitAura, _G.UnitGUID, _G.pairs

local MAX_BUFFS = 40

local L = setmetatable(PlexusDebuffIconsLocale or {}, {__index = function(t, k) t[k] = k return k end})

local PlexusRoster = _G.Plexus:GetModule("PlexusRoster")
local PlexusFrame = _G.Plexus:GetModule("PlexusFrame")
local PlexusDebuffIcons = _G.Plexus:NewModule("PlexusDebuffIcons", "AceBucket-3.0")

PlexusDebuffIcons.menuName = L["Debuff Icons"]

PlexusDebuffIcons.defaultDB = {
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
        text = "DebuffIcons",
        enable = true,
        priority = 30,
        range = false
    },
    overrideFilter = "false"
}

local options = {
    type = "group",
    inline = PlexusFrame.options.args.bar.inline,
    name = L["Debuff Icons"],
    desc = L["Debuff Icons"],
    order = 1200,
    get = function(info)
        local k = info[#info]
        return PlexusDebuffIcons.db.profile[k]
    end,
    set = function(info, v)
        local k = info[#info]
        PlexusDebuffIcons.db.profile[k] = v
        PlexusDebuffIcons:UpdateAllUnitsBuffs()
    end,
    args = {
        enabled = {
            order = 40, width = "double",
            type = "toggle",
            name = L["Enable"],
            desc = L["Enabling/disabling the module will display all buff or Debuff icons."],
            get = function()
                return PlexusDebuffIcons.db.profile.enabled
            end,
            set = function(_, v)
                PlexusDebuffIcons.db.profile.enabled = v
                if v and not PlexusDebuffIcons.enabled then
                    PlexusDebuffIcons:OnEnable()
                elseif not v and PlexusDebuffIcons.enabled then
                    PlexusDebuffIcons:OnDisable()
                end
            end,
        },
        showMine = {
            order = 41, width = "double",
            type = "toggle",
            name = L["Show Mine"],
            desc = L["Enabling/disabling will display only buffs you casted."],
            get = function()
                return PlexusDebuffIcons.db.profile.showMine
            end,
            set = function(_, v)
                PlexusDebuffIcons.db.profile.showMine = v
                PlexusDebuffIcons:UpdateAllUnitsBuffs()
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
            get = function () return PlexusDebuffIcons.db.profile.iconsize end,
            set = function(_, v)
                PlexusDebuffIcons.db.profile.iconsize = v
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
            get = function () return PlexusDebuffIcons.db.profile.alpha end,
            set = function(_, v)
                PlexusDebuffIcons.db.profile.alpha = v
            end
        },
        offsetx = {
            order = 60, width = "double",
            type = "range",
            name = L["Offset X"],
            desc = L["X-axis offset from the selected anchor point, minus value to move inside."],
            max = 250,
            min = -20,
            step = 1,
            get = function () return PlexusDebuffIcons.db.profile.offsetx end,
            set = function(_, v)
                PlexusDebuffIcons.db.profile.offsetx = v
            end
        },
        offsety = {
            order = 65, width = "double",
            type = "range",
            name = L["Offset Y"],
            desc = L["Y-axis offset from the selected anchor point, minus value to move inside."],
            max = 250,
            min = -20,
            step = 1,
            get = function () return PlexusDebuffIcons.db.profile.offsety end,
            set = function(_, v)
                PlexusDebuffIcons.db.profile.offsety = v
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
        --        return PlexusDebuffIcons.db.profile.iconperrow
        --    end,
        --    set = function(_, v)
        --        PlexusDebuffIcons.db.profile.iconperrow = v
        --    end,
        --},
        --orientation = {
        --    order = 80,  width = "double",
        --    type = "select",
        --    name = L["Orientation of Icon"],
        --    desc = L["Set icons list orientation."],
        --    get = function ()
        --        return PlexusDebuffIcons.db.profile.orientation
        --    end,
        --    set = function(_, v)
        --        PlexusDebuffIcons.db.profile.orientation = v
        --    end,
        --    values ={["HORIZONTAL"] = L["HORIZONTAL"], ["VERTICAL"] = L["VERTICAL"]}
        --},
        anchor = {
            order = 90,  width = "double",
            type = "select",
            name = L["Anchor Point"],
            desc = L["Anchor point of the first icon."],
            get = function ()
                return PlexusDebuffIcons.db.profile.anchor
            end,
            set = function(_, v)
                PlexusDebuffIcons.db.profile.anchor = v
            end,
            values ={["TOPRIGHT"] = L["TOPRIGHT"], ["TOPLEFT"] = L["TOPLEFT"], ["BOTTOMLEFT"] = L["BOTTOMLEFT"], ["BOTTOMRIGHT"] = L["BOTTOMRIGHT"]}
        },
        overrideFilter = {
            order = 100,  width = "double",
            type = "select",
            name = L["Override Aura Filter(Advanced)"],
            desc = L["Choose an option for aura filtering. Or false to keep defaults"],
            get = function ()
                return PlexusDebuffIcons.db.profile.overrideFilter
            end,
            set = function(_, v)
                PlexusDebuffIcons.db.profile.overrideFilter = v
            end,
        values = {
            ["false"] = L["False"],
            ["HARMFUL"] = L["HARMFUL"],
            ["HARMFUL|PLAYER"] = L["HARMFUL PLAYER"],
            ["HARMFUL|RAID"] = L["HARMFUL RAID"],
            ["HARMFUL|RAID_IN_COMBAT"] = L["HARMFUL RAID IN COMBAT"],
            ["HARMFUL|PLAYER|RAID"] = L["HARMFUL PLAYER RAID"],
            ["HARMFUL|PLAYER|RAID_IN_COMBAT"] = L["HARMFUL PLAYER RAID IN COMBAT"],
            ["HARMFUL|RAID|RAID_IN_COMBAT"] = L["HARMFUL RAID RAID IN COMBAT"],
            ["HARMFUL|PLAYER|RAID|RAID_IN_COMBAT"] = L["HARMFUL PLAYER RAID RAID IN COMBAT"],
        }
        },
    }
}

_G.Plexus.options.args.PlexusDebuffIcons = options


function PlexusDebuffIcons:OnInitialize()
end

function PlexusDebuffIcons:OnEnable()
    --self:RegisterEvent("UNIT_AURA")
    --self:RegisterEvent("UNIT_FLAGS")
    self:RegisterMessage("UpdateFrameUnits", "MakeContainers")
    self:RegisterEvent("LOADING_SCREEN_DISABLED", "MakeContainers")
    --self:RegisterMessage("Plexus_ExtraUnitsChanged", "ExtraUnitsChanged")
    --self:UpdateAllUnitsBuffs()
end

function PlexusDebuffIcons:OnDisable()
    --self.enabled = nil
    --self:UnregisterEvent("UNIT_AURA")
    --self:UnregisterEvent("UNIT_FLAGS")
    self:UnRegisterMessage("UpdateFrameUnits")
    self:UnregisterEvent("LOADING_SCREEN_DISABLED")
    --self:UnregisterMessage("Plexus_ExtraUnitsChanged")
end

function PlexusDebuffIcons:UpdateAllUnitsBuffs()
    for _, unitid in PlexusRoster:IterateRoster() do
        self:UNIT_AURA("UpdateAllUnitsBuffs", unitid, {isFullUpdate = true} )
    end
end

local function createButton(button)
    button:SetSize(12, 12)
    button:SetCancelAuraButtons('RightButtonUp')
    button:EnableMouse(false)
    local Icon = button:CreateTexture(nil, 'ARTWORK')
    Icon:SetAllPoints()
    button:SetIcon(Icon)
    local Time = button:CreateFontString(nil, 'OVERLAY', 'GameFontNormal')
    Time:SetPoint('TOPLEFT', 1, -1)
    Time:SetJustifyH('LEFT')
    Time:SetSize(8,8)
    button:SetDurationText(Time)
    local cooldown = button.cooldown or CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
    cooldown:SetAllPoints()
    cooldown:SetAlpha(1)
    cooldown:SetHideCountdownNumbers(true)
    cooldown:SetDrawEdge(false)
    cooldown:SetDrawSwipe(true)
    cooldown:SetReverse(true)
    cooldown:Show()
    button.cooldown = cooldown
    button:SetDurationCooldown(cooldown)
    --local fontSize = self.fontSize<1 and self.fontSize*iconSize or self.fontSize
    local text = button.text
    if not text then
        local tframe = CreateFrame("frame", nil, button)
        text = tframe:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.text = text
        text.tframe = tframe
        tframe:SetAllPoints()
    end
    local level = button:GetFrameLevel()
    text.tframe:SetFrameLevel(level+2)
    --text:SetFont(self.font, fontSize, self.fontFlags)
    --text:SetTextColor(UnpackColor(self.colorStack))
    text:ClearAllPoints()
    text:SetPoint("BOTTOMRIGHT", 0, 0)
    text:Show()
    button:SetApplicationCount(text, {})
    --local borderOptions = {
    --    showAlways = false,
    --    showIcon = true,
    --    showWhenHarmful = true,
    --    showWhenHelpful = true,
    --    showWithoutDispelType = false,
    --    style = Enum.CustomAuraButtonDispelTypeTextureStyle.Icon,
    --}
	----local borderSize = self.borderSize
	----if borderSize>0 then
	--	local border = button.border
	--	if not border then
	--		border = button:CreateTexture(nil, "BACKGROUND")
	--		border:ClearAllPoints()
	--		border:SetAllPoints()
	--		border:SetColorTexture(0,0,0,0)
	--		button.border = border
	--	end
	--	--if self.useStatusColor then -- dispel border
	--		button:SetAuraBorder(border, borderOptions)
	--	--else -- fixed border
	--	--	button:ClearAuraBorder()
	--	--	border:SetColorTexture(UnpackColor(self.colorBorder))
	--	--end
    --    --border:SetColorTexture
	--	border:Show()
	----elseif button.border then
	----	button:ClearAuraBorder(button.border)
	----	button.border:Hide()
    ----end
    local Overlay = CreateFrame("Frame", nil, button)
    Overlay:SetFrameLevel(button:GetFrameLevel() + 10)
    --Overlay:SetInside()
    local DispelIndicator = Overlay:CreateTexture(nil, "OVERLAY")
    DispelIndicator:SetSize(8, 8)
    DispelIndicator:SetPoint("TOPRIGHT", button, 0, 0)
    button:AddDispelTypeTexture(DispelIndicator, {
        style = Enum.CustomAuraButtonDispelTypeTextureStyle.Icon,
        showWhenHarmful = true,
        showWhenHelpful = false,
    })
end

function PlexusDebuffIcons:MakeContainers()
    if not PlexusDebuffIcons.db.profile.enabled then
        return
    end
    local registeredFrames = PlexusFrame.registeredFrames
    local count = 0
    for _, frameTable  in pairs(registeredFrames) do
        if frameTable.unit then
            count = count + 1
        end
    end
    if count == 0 then
        C_Timer.After(1, function() PlexusDebuffIcons:MakeContainers() end)
        return
    end
    local name = "PlexusDebuffIcons"
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
                    frameTable.container[name]:SetPoint(PlexusDebuffIcons.db.profile.anchor, PlexusDebuffIcons.db.profile.offsetx, PlexusDebuffIcons.db.profile.offsety)
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
                        local filter = PlexusDebuffIcons.db.showMine and "PLAYER|HARMFUL" or "HARMFUL"
                        frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name, (PlexusDebuffIcons.db.overrideFilter and PlexusDebuffIcons.db.overrideFilter or filter), {
                              initializeFrame = createButton,
                              sortMethod = AuraContainerSortMethod.ExpirationOnly,
                              sortDirection = AuraContainerSortDirection.Reverse,
                              layout = {
                                 elementSpacing = 1,
                                 lineSpacing = 1,
                              },
                              maxFrameCount = PlexusDebuffIcons.db.profile.iconnum,
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
