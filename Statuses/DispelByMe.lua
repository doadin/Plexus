local _, Plexus = ...

local UnitAura, UnitGUID, pairs = _G.UnitAura, _G.UnitGUID, _G.pairs

local L = setmetatable(PlexusDeDeBuffIconsLocale or {}, {__index = function(t, k) t[k] = k return k end})

local PlexusRoster = _G.Plexus:GetModule("PlexusRoster")
local PlexusFrame = Plexus:GetModule("PlexusFrame")

local PlexusStatusDispelByMe = _G.Plexus:NewStatusModule("PlexusStatusDispelByMe", "AceTimer-3.0")
PlexusStatusDispelByMe.menuName = L["Dispelable By Me"]

PlexusStatusDispelByMe.defaultDB = {
    dispelable_by_me = {
        enable = true,
        priority = 70,
        range = false,
        color = { r = 0, g = 0, b = 1.0, a = 1.0 },
    },
}

function PlexusStatusDispelByMe:PostInitialize()
    self:RegisterStatus("dispelable_by_me", L["Dispelable By Me"], nil, true)
end

function PlexusStatusDispelByMe:OnEnable()
    --self:RegisterEvent("UNIT_AURA")
    --self:RegisterEvent("UNIT_FLAGS")
    --self:RegisterEvent("LOADING_SCREEN_DISABLED", "MakeContainers")
    --self:RegisterMessage("Plexus_RosterUpdated", "MakeContainers")
    self:RegisterMessage("UpdateFrameUnits", "MakeContainers")
    --self:UpdateAllUnitsBuffs()
end

function PlexusStatusDispelByMe:OnDisable()
    --self:UnregisterEvent("UNIT_AURA")
    --self:UnregisterEvent("UNIT_FLAGS")
    --self:UnregisterEvent("LOADING_SCREEN_DISABLED")
    self:UnRegisterMessage("UpdateFrameUnits")
end

--function PlexusStatusDispelByMe:UNIT_FLAGS(_,unit)
--    --local hostile = UnitCanAttack("player", unit) or UnitIsCharmed(unitid)
--    --if hostile then
--    --    self:UNIT_AURA("UpdateAllUnitsBuffs", unit, {isFullUpdate = true} )
--    --end
--end

--function PlexusStatusDispelByMe:LOADING_SCREEN_DISABLED()
--    PlexusStatusDispelByMe:UpdateAllUnitsBuffs()
--end

--function PlexusStatusDispelByMe:UpdateAllUnitsBuffs()
--    for _, unitid in PlexusRoster:IterateRoster() do
--        self:UNIT_AURA("UpdateAllUnitsBuffs", unitid)
--    end
--end

local function createButton(status, name)
    local frameSettings = PlexusFrame.db.profile
    return function(button)
        if name == "icon" then
            button:SetSize(frameSettings.centerIconSize, frameSettings.centerIconSize)
        else
            button:SetSize(frameSettings.iconSize, frameSettings.iconSize)
        end
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
end

local function createFrame(status, name)
    local frameSettings = PlexusFrame.db.profile
    return function(button)
        button:SetSize(frameSettings.cornerSize, frameSettings.cornerSize)

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

function PlexusStatusDispelByMe:MakeContainers()
    local settings = PlexusStatusDispelByMe.db.profile.dispelable_by_me
    if not settings.enable then
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
        C_Timer.After(1, function() PlexusStatusDispelByMe:MakeContainers() end)
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
                    if not frameTable.container[name]:HasAuraGroup(frameName .. ":" .. name .. ":" .. "PlexusDispelByMe") then
                        for status, statusEnabled in pairs(PlexusFrame.db.profile.statusmap[name]) do
                            if status == "dispelable_by_me" and statusEnabled then
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
                                frameTable.container[name]:AddAuraGroup(frameName .. ":" .. name .. ":" .. "PlexusDispelByMe", "HARMFUL|RAID_PLAYER_DISPELLABLE", {
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
