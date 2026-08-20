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

local function createButton(status, name)
    local frameSettings = PlexusFrame.db.profile
    return function(button)
        if name == "icon" then
            button:SetSize(frameSettings.centerIconSize, frameSettings.centerIconSize)
        else
            button:SetSize(frameSettings.iconSize, frameSettings.iconSize)
        end
        button:EnableMouse(false)
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
end

local function createFrame(status, name)
    local frameSettings = PlexusFrame.db.profile
    return function(button)
        button:SetSize(frameSettings.cornerSize, frameSettings.cornerSize)
        button:EnableMouse(false)

        local Icon = button.icon or button:CreateTexture(nil, "ARTWORK")
        button.icon = Icon
        Icon:SetAllPoints()
        Icon:SetColorTexture(0, 0, 0, 0)

        local Time = button.durationText or button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.durationText = Time
        Time:SetText("")
        Time:Hide()

        local cooldown = button.cooldown or CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
        button.cooldown = cooldown
        cooldown:SetAllPoints()
        cooldown:Hide()

        local text = button.text or button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        button.text = text
        text:SetText("")
        text:Hide()

        local colorTex = button.colorTex or button:CreateTexture(nil, "ARTWORK")
        button.colorTex = colorTex
        colorTex:SetAllPoints()
        local color = status.color
        colorTex:SetColorTexture(color.r, color.g, color.b, 1)
    end
end

local function createBorder(status, name, indicator)
    local frameSettings = PlexusFrame.db.profile

    return function(button)
        button:SetSize(frameSettings.frameWidth, frameSettings.frameHeight)

        -- Create border ON the button, not the unit frame
        local child = button.childBorder or CreateFrame("Frame", nil, button)
        button.childBorder = child
        button:EnableMouse(false)

        Mixin(child, BackdropTemplateMixin)

        child:SetPoint("TOPLEFT")
        child:SetPoint("BOTTOMRIGHT")

        child:SetBackdrop({
            bgFile = nil, -- no fill
            edgeFile = "Interface\\BUTTONS\\WHITE8X8",
            edgeSize = frameSettings.borderSize or 1,
            insets = { left = 1, right = 1, top = 1, bottom = 1 },
        })

        -- Only show border when aura is active
        if status.color then
            child:SetBackdropBorderColor(status.color.r, status.color.g, status.color.b, status.color.a or 1)
            child:Show()
        else
            child:Hide()
        end
    end
end

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
                if name == "border" then
                    indicator = indicator.__owner
                end
                if type(indicator) == "table" and indicator.GetObjectType and indicator:GetObjectType() == "Button" then
                    if not frameTable.container then
                        frameTable.container = {}
                    end
                    if not frameTable.container[name] then
                        frameTable.container[name] = CreateFrame('AuraContainer', nil, frameTable, 'CustomAuraContainerTemplate')
                        frameTable.container[name]:SetUnit(frameTable.unit)
                        local point, x, y = unpack(Plexus.utility.Indicator.anchor[name])
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
                                local init
                                if indicator:GetObjectType() == "Button" then
                                    if name == "border" then
                                        init = createBorder(self.db.profile[status], name, indicator)
                                    else
                                        init = createButton(self.db.profile[status], name)
                                    end
                                elseif indicator:GetObjectType() == "Frame" then
                                    init = createFrame(self.db.profile[status], name)
                                else
                                    init = createButton(self.db.profile[status], name)
                                end
                                frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name .. ":" .. "alert_EXTERNAL_DEFENSIVE", "HELPFUL|EXTERNAL_DEFENSIVE", {
                                      initializeFrame = init,
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
                                local init
                                if indicator:GetObjectType() == "Button" then
                                    if name == "border" then
                                        init = createBorder(self.db.profile[status], name, indicator)
                                    else
                                        init = createButton(self.db.profile[status], name)
                                    end
                                elseif indicator:GetObjectType() == "Frame" then
                                    init = createFrame(self.db.profile[status], name)
                                else
                                    init = createButton(self.db.profile[status], name)
                                end
                                frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name .. ":" .. "alert_BIG_DEFENSIVE", "HELPFUL|BIG_DEFENSIVE", {
                                      initializeFrame = init,
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
