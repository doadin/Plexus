--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2026 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Defensives.lua
    Plexus status module for defensive buffs.
----------------------------------------------------------------------]]

local Plexus = _G.Plexus


local PlexusStatusDefensives = Plexus:GetModule("PlexusStatus"):NewModule("PlexusStatusDefensives")  --luacheck: ignore 211
PlexusStatusDefensives.menuName = "Defensives"  --luacheck: ignore 112

-- locals
local PlexusRoster = Plexus:GetModule("PlexusRoster") --luacheck: ignore 211
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local UnitGUID = UnitGUID

if Plexus:IsRetailWow() then
PlexusStatusDefensives.defaultDB = { --luacheck: ignore 112
    debug = false,
    alert_EXTERNAL_DEFENSIVE = {
        enable = true,
        color = { r = 1, g = 1, b = 0, a = 1 },
        priority = 99,
        range = false,
    },
    alert_BIG_DEFENSIVE = {
        enable = true,
        color = { r = 1, g = 1, b = 0, a = 1 },
        priority = 99,
        range = false,
    }
}
end

function PlexusStatusDefensives:OnInitialize() --luacheck: ignore 112
    self.super.OnInitialize(self)

    self:RegisterStatus("alert_EXTERNAL_DEFENSIVE", "External Defensives", nil, true)
    self:RegisterStatus("alert_BIG_DEFENSIVE", "Big Defensives", nil, true)

end

function PlexusStatusDefensives:OnStatusEnable() --status --luacheck: ignore 112
    self:RegisterMessage("UpdateFrameUnits", "MakeContainers")
    self:RegisterEvent("LOADING_SCREEN_DISABLED", "MakeContainers")
    --self:UpdateAllUnits()
end

function PlexusStatusDefensives:OnStatusDisable(status) -- status --luacheck: ignore 112
    self:UnRegisterMessage("UpdateFrameUnits")
    self:UnRegisterMessage("LOADING_SCREEN_DISABLED")
    --self.core:SendStatusLostAllUnits(status)
end

function PlexusStatusDefensives:Plexus_UnitJoined(_, _, unitid)-- _, guid, unitid --luacheck: ignore 112
    self:ScanUnitByAuraInfo(_, unitid, {isFullUpdate = true})
end

function PlexusStatusDefensives:UpdateAllUnits() --luacheck: ignore 112
    for _, unitid in PlexusRoster:IterateRoster() do
        self:ScanUnitByAuraInfo(_, unitid, {isFullUpdate = true})
    end
end

local function createButton(button)
    button:SetSize(12, 12)
    button:SetCancelAuraButtons('RightButtonUp')
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
    --local Overlay = CreateFrame("Frame", nil, button)
    --Overlay:SetFrameLevel(button:GetFrameLevel() + 10)
    ----Overlay:SetInside()
    --local DispelIndicator = Overlay:CreateTexture(nil, "OVERLAY")
    --DispelIndicator:SetSize(8, 8)
    --DispelIndicator:SetPoint("TOPRIGHT", button, 0, 0)
    --button:AddDispelTypeTexture(DispelIndicator, {
    --    style = Enum.CustomAuraButtonDispelTypeTextureStyle.Icon,
    --    showWhenHarmful = true,
    --    showWhenHelpful = false,
    --})
end

local anchor = {
    -- left/right up/down
    icon = { "CENTER", 0, 0},
    ei_icon_topleft = { "TOPLEFT", 1, -1 },
    ei_icon_topleft2 = { "TOPLEFT", 10, -1 },
    ei_icon_topleft3 = { "TOPLEFT", 1, -10 },
    ei_icon_topleft4 = { "TOPLEFT", 10, -10 },
    -- left/right up/down
    ei_icon_topright = { "TOPRIGHT", -1, -1 },
    ei_icon_topright2 = { "TOPRIGHT", -10, -1 },
    ei_icon_topright3 = { "TOPRIGHT", -1, -10 },
    ei_icon_topright4 = { "TOPRIGHT", -10, -10 },
    -- left/right up/down
    ei_icon_botleft = { "BOTTOMLEFT", 1, 1 },
    ei_icon_botleft2 = { "BOTTOMLEFT", 10, 1 },
    ei_icon_botleft3 = { "BOTTOMLEFT", 1, 10 },
    ei_icon_botleft4 = { "BOTTOMLEFT", 10, 10 },
    -- left/right up/down
    ei_icon_botright = { "BOTTOMRIGHT", -1, 1 },
    ei_icon_botright2 = { "BOTTOMRIGHT", -10, 1 },
    ei_icon_botright3 = { "BOTTOMRIGHT", -1, 10 },
    ei_icon_botright4 = { "BOTTOMRIGHT", -10, 10 },
    -- left/right up/down
    ei_icon_top = { "TOP", 0, -1 },
    ei_icon_top2 = { "TOP", 0, -10 },
    ei_icon_top3 = { "TOP", -10, -1 },
    ei_icon_top4 = { "TOP", 10, -1 },
    -- left/right up/down
    ei_icon_bottom = { "BOTTOM", 0, 1 },
    ei_icon_bottom2 = { "BOTTOM", 0, 10 },
    ei_icon_bottom3 = { "BOTTOM", -10, 1 },
    ei_icon_bottom4 = { "BOTTOM", 10, 1 },
    -- left/right up/down
    ei_icon_left = { "LEFT", 1, 0 },
    ei_icon_left2 = { "LEFT", 10, 0 },
    ei_icon_left3 = { "LEFT", 1, 10 },
    ei_icon_left4 = { "LEFT", 1, -10 },
    -- left/right up/down
    ei_icon_right = { "RIGHT", -1, 0 },
    ei_icon_right2 = { "RIGHT", -10, 0 },
    ei_icon_right3 = { "RIGHT", -1, 10 },
    ei_icon_right4 = { "RIGHT", -1, -10 },
}

function PlexusStatusDefensives:MakeContainers()
    --local settings = PlexusStatusDefensives.db.profile.dispelable_by_me
    --if not settings.enable then
    --    return
    --end
    local registeredFrames = PlexusFrame.registeredFrames
    local count = 0
    for _, frameTable  in pairs(registeredFrames) do
        if frameTable.unit then
            count = count + 1
        end
    end
    if count == 0 then
        C_Timer.After(1, function() PlexusStatusDefensives:MakeContainers() end)
        return
    end
    for frameName, frameTable in pairs(registeredFrames) do
        if frameTable.unit then
            --print("frameTable.unit", frameTable.unit)
            for name, indicator in pairs(frameTable.indicators) do
                if type(indicator) == "table" and indicator.GetObjectType and indicator:GetObjectType() == "Button" then
                    if not frameTable.container then
                        frameTable.container = {}
                    end
                    if not frameTable.container[name] then
                        frameTable.container[name] = CreateFrame('AuraContainer', nil, frameTable, 'CustomAuraContainerTemplate')
                        frameTable.container[name]:SetUnit(frameTable.unit)
                        local point, x, y = unpack(anchor[name])
                        frameTable.container[name]:SetPoint(point, x, y)
                    end
                    if not frameTable.container[name]:HasAuraGroup(frameName .. ":" .. name .. ":" .. "alert_EXTERNAL_DEFENSIVE") then
                        for status, statusEnabled in pairs(PlexusFrame.db.profile.statusmap[name]) do
                            if status == "alert_EXTERNAL_DEFENSIVE" and statusEnabled then
                                --local candidateFilters = {
                                --    includeSpellIDs = {
                                --    --    53563,  -- Beacon of Light
                                --    },
                                --    excludeSpellIDs = {
                                --    --    53563,  -- Beacon of Light
                                --    },
                                --}
                                --candidateFilters.includeSpellIDs[id] = true
                                frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name .. ":" .. "alert_EXTERNAL_DEFENSIVE", "HELPFUL|EXTERNAL_DEFENSIVE", {
                                      initializeFrame = createButton,
                                      sortMethod = AuraContainerSortMethod.ExpirationOnly,
                                      sortDirection = AuraContainerSortDirection.Reverse,
                                      layout = {
                                         elementSpacing = 5,
                                         lineSpacing = 5,
                                      },
                                      maxFrameCount = 1,
                                      --candidateFilters = candidateFilters
                                    }
                                )
                                frameTable.container[name]:UpdateAllAuras()
                            end
                        end
                    else
                        frameTable.container[name]:SetUnit(frameTable.unit)
                    end

                    if not frameTable.container[name]:HasAuraGroup(frameName .. ":" .. name .. ":" .. "alert_BIG_DEFENSIVE") then
                        for status, statusEnabled in pairs(PlexusFrame.db.profile.statusmap[name]) do
                            if status == "alert_EXTERNAL_DEFENSIVE" and statusEnabled then
                                --local candidateFilters = {
                                --    includeSpellIDs = {
                                --    --    53563,  -- Beacon of Light
                                --    },
                                --    excludeSpellIDs = {
                                --    --    53563,  -- Beacon of Light
                                --    },
                                --}
                                --candidateFilters.includeSpellIDs[id] = true
                                frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name .. ":" .. "alert_BIG_DEFENSIVE", "HELPFUL|BIG_DEFENSIVE", {
                                      initializeFrame = createButton,
                                      sortMethod = AuraContainerSortMethod.ExpirationOnly,
                                      sortDirection = AuraContainerSortDirection.Reverse,
                                      layout = {
                                         elementSpacing = 5,
                                         lineSpacing = 5,
                                      },
                                      maxFrameCount = 1,
                                      --candidateFilters = candidateFilters
                                    }
                                )
                                frameTable.container[name]:UpdateAllAuras()
                            end
                        end
                    else
                        frameTable.container[name]:SetUnit(frameTable.unit)
                    end

                end
            end
        end
    end
end
