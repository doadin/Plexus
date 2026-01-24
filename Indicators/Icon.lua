--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...

local CreateFrame = CreateFrame

local PlexusFrame = Plexus:GetModule("PlexusFrame")
local Media = LibStub("LibSharedMedia-3.0") --luacheck: ignore 113
local L = Plexus.L

local PlexusIndicatorCornerIcons = PlexusFrame:NewModule("PlexusIndicatorCornerIcons")
local BACKDROP = {
    bgFile = "Interface\\BUTTONS\\WHITE8X8",
	edgeFile = "Interface\\BUTTONS\\WHITE8X8", edgeSize = 1,
	insets = { left = 1, right = 1, top = 1, bottom = 1 },
}

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

local function New(frame)
	local icon = CreateFrame("Button", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
	icon:EnableMouse(false)
	icon:SetBackdrop(BACKDROP)

	local texture = icon:CreateTexture(nil, "ARTWORK")
	texture:SetPoint("BOTTOMLEFT", 2, 2)
	texture:SetPoint("TOPRIGHT", -2, -2)
	icon.texture = texture

    local text = icon:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    text:SetPoint("BOTTOMRIGHT", 2, -2)
	text:SetJustifyH("RIGHT")
	text:SetJustifyV("BOTTOM")
    icon.text = text

    local cooldowntext = icon:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    cooldowntext:SetPoint("TOPLEFT", 0, 0)
	cooldowntext:SetJustifyH("LEFT")
	cooldowntext:SetJustifyV("TOP")
	icon.cooldowntext = cooldowntext

	return icon
end

local function Reset(self)
    local profile = PlexusFrame.db.profile

	if not self.cooldown then
		local cd = CreateFrame("Cooldown", nil, self, "CooldownFrameTemplate")
        cd:SetAllPoints()
        cd:SetDrawBling(false)
        cd:SetDrawEdge(false)
        cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		self.cooldown = cd

		cd:SetScript("OnShow", function()
			self.text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			self.text:SetParent(self)
		end)
    end

	local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
    local iconStackFontSize = profile.iconStackFontSize
    local iconCoolDownFontSize = profile.iconCoolDownFontSize
    local iconSize
    if self.__id == "icon" then
        iconSize = profile.centerIconSize
        local frame = self.__owner
        self:SetParent(frame.indicators.bar)
    else
        iconSize = profile.iconSize
    end

	local iconBorderSize = profile.iconBorderSize
	local totalSize = iconSize + (iconBorderSize * 2)
	local frame = self.__owner
	local r, g, b, a = self:GetBackdropBorderColor()

	self:SetFrameLevel(frame.indicators.bar:GetFrameLevel() + 2)
	self:SetWidth(totalSize)
	self:SetHeight(totalSize)

	self:ClearAllPoints()

    local point, x, y = unpack(anchor[self.__id])
    local frameWidth = PlexusFrame.db.profile.frameWidth
    local frameHeight = PlexusFrame.db.profile.frameHeight
    local ExtraBarSide = profile.ExtraBarSide
    local ExtraBarSize = profile.ExtraBarSize
    local enableExtraBar = profile.enableExtraBar
    local enableIconBarSeparation = profile.enableIconBarSeparation

    if x == 10 then
        x = 0 + totalSize + profile.spacingSize
    end
    if x == -10 then
        x = 0 - totalSize - profile.spacingSize
    end
    if y == 10 then
        y = 0 + totalSize + profile.spacingSize
    end
    if y == -10 then
        y = 0 - totalSize - profile.spacingSize
    end
    if enableIconBarSeparation then
        if enableExtraBar and ExtraBarSide == "Bottom" and (point == "BOTTOM" or point == "BOTTOMLEFT" or point == "BOTTOMRIGHT") then
            y = y + frameWidth * ExtraBarSize
        end
        if enableExtraBar and ExtraBarSide == "Left" and (point == "LEFT" or point == "TOPLEFT" or point == "BOTTOMLEFT") then
            x = x + frameHeight * ExtraBarSize
        end
        if enableExtraBar and ExtraBarSide == "Top" and (point == "TOP" or point == "TOPLEFT" or point == "TOPRIGHT") then
            y = y - frameWidth * ExtraBarSize
        end
        if enableExtraBar and ExtraBarSide == "Right" and (point == "RIGHT" or point == "TOPRIGHT" or point == "BOTTOMRIGHT") then
            x = x - frameHeight * ExtraBarSize
        end
    end
    self:SetPoint( point, x, y )

	if iconBorderSize == 0 then
		self:SetBackdrop(nil)
	else
		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)
	end

	self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
	self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

	self.text:SetPoint("CENTER", profile.stackOffsetX, profile.stackOffsetY)
    self.text:SetFont(font, iconStackFontSize, "OUTLINE")
    self.cooldowntext:SetFont(font, iconCoolDownFontSize, "OUTLINE")

end

local function SetStatus(self, color, text, value, _, texture, texCoords, stack, start, duration, expirationTime)
	local profile = PlexusFrame.db.profile
	if not texture then return end

	if type(texture) == "table" then
		self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
	else
        self.texture:SetTexture(texture)
        if texture == "Interface\\TargetingFrame\\UI-RaidTargetingIcons" then
            SetRaidTargetIconTexture(self.texture,value)
        end
        if profile.enableIconBackgroundColor then
            self.texture:SetAlpha(profile.iconBackgroundAlpha)
        else
            self.texture:SetAlpha(1)
        end
        if (texture ~= "Interface\\TargetingFrame\\UI-RaidTargetingIcons") and texCoords then
		    self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
        end
	end

	if type(color) == "table" then
		self:SetAlpha(color.a or 1)
        self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
        self:SetBackdropColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
	else
		self:SetAlpha(1)
        self:SetBackdropBorderColor(0, 0, 0, 0)
        self:SetBackdropColor(0, 0, 0, 0)
	end

	if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then --luacheck: ignore 631
        self.cooldown:SetCooldown(start, duration)
		self.cooldown:Show()
    elseif profile.enableIconCooldown and self.cooldown.SetCooldownFromDurationObject and duration and type(duration == "userdata") then
		self.cooldown:SetCooldownFromDurationObject(duration)
		self.cooldown:Show()
	else
		self.cooldown:Hide()
	end

    if Plexus:issecretvalue(stack) then
        self.text:SetText(C_StringUtil.TruncateWhenZero(stack))
    else
	    if profile.enableIconStackText and stack and stack ~= 0 then
	        self.text:SetText(stack)
	    else
	        self.text:SetText("")
        end
    end

    local CountDownNumber = tonumber(text)
    if Plexus:issecretvalue(CountDownNumber) then
        if profile.showIconCountDownText and type(CountDownNumber) == "number" then
            self.text:SetText(C_StringUtil.TruncateWhenZero(CountDownNumber))
        end
    else
        if profile.showIconCountDownText and type(CountDownNumber) == "number" and CountDownNumber ~= 0 then
            self.cooldowntext:SetText(text)
	    else
	        self.cooldowntext:SetText("")
        end
    end

	self:Show()
end

local function Clear(self)
	self:Hide()

	self.texture:SetTexture(1, 1, 1, 0)
	self.texture:SetTexCoord(0, 1, 0, 1)

	self.text:SetText("")
    self.text:SetTextColor(1, 1, 1, 1)
    self.cooldowntext:SetText("")

	self.cooldown:Hide()
end

function PlexusIndicatorCornerIcons:OnInitialize() --luacheck: ignore 212
    local profile = PlexusFrame.db.profile

    PlexusFrame:RegisterIndicator("icon", L["Center Icon"], New, Reset, SetStatus, Clear)

    PlexusFrame:RegisterIndicator("ei_icon_top", "Extra Icon: Top", New, Reset, SetStatus, Clear)
    if profile.enableIcon2 then
        PlexusFrame:RegisterIndicator("ei_icon_top2", "Extra Icon: Top 2", New, Reset, SetStatus, Clear)
    end
    if profile.enableIcon34 then
        PlexusFrame:RegisterIndicator("ei_icon_top3", "Extra Icon: Top 3", New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_icon_top4", "Extra Icon: Top 4", New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("ei_icon_topleft", "Extra Icon: Top Left Corner", New, Reset, SetStatus, Clear)
    if profile.enableIcon2 then
        PlexusFrame:RegisterIndicator("ei_icon_topleft2", "Extra Icon: Top Left Corner 2", New, Reset, SetStatus, Clear)
    end
    if profile.enableIcon34 then
        PlexusFrame:RegisterIndicator("ei_icon_topleft3", "Extra Icon: Top Left Corner 3", New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_icon_topleft4", "Extra Icon: Top Left Corner 4", New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("ei_icon_topright", "Extra Icon: Top Right Corner", New, Reset, SetStatus, Clear)
    if profile.enableIcon2 then
        PlexusFrame:RegisterIndicator("ei_icon_topright2", "Extra Icon: Top Right Corner 2", New, Reset, SetStatus, Clear)
    end
    if profile.enableIcon34 then
        PlexusFrame:RegisterIndicator("ei_icon_topright3", "Extra Icon: Top Right Corner 3", New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_icon_topright4", "Extra Icon: Top Right Corner 4", New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("ei_icon_bottom", "Extra Icon: Bottom", New, Reset, SetStatus, Clear)
    if profile.enableIcon2 then
        PlexusFrame:RegisterIndicator("ei_icon_bottom2", "Extra Icon: Bottom 2", New, Reset, SetStatus, Clear)
    end
    if profile.enableIcon34 then
        PlexusFrame:RegisterIndicator("ei_icon_bottom3", "Extra Icon: Bottom 3", New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_icon_bottom4", "Extra Icon: Bottom 4", New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("ei_icon_botleft", "Extra Icon: Bottom Left Corner", New, Reset, SetStatus, Clear)
    if profile.enableIcon2 then
        PlexusFrame:RegisterIndicator("ei_icon_botleft2", "Extra Icon: Bottom Left Corner 2", New, Reset, SetStatus, Clear)
    end
    if profile.enableIcon34 then
        PlexusFrame:RegisterIndicator("ei_icon_botleft3", "Extra Icon: Bottom Left Corner 3", New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_icon_botleft4", "Extra Icon: Bottom Left Corner 4", New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("ei_icon_botright", "Extra Icon: Bottom Right Corner", New, Reset, SetStatus, Clear)
    if profile.enableIcon2 then
        PlexusFrame:RegisterIndicator("ei_icon_botright2", "Extra Icon: Bottom Right Corner 2", New, Reset, SetStatus, Clear) --luacheck: ignore 631
    end
    if profile.enableIcon34 then
        PlexusFrame:RegisterIndicator("ei_icon_botright3", "Extra Icon: Bottom Right Corner 3", New, Reset, SetStatus, Clear) --luacheck: ignore 631
        PlexusFrame:RegisterIndicator("ei_icon_botright4", "Extra Icon: Bottom Right Corner 4", New, Reset, SetStatus, Clear)  --luacheck: ignore 631
    end

    PlexusFrame:RegisterIndicator("ei_icon_left", "Extra Icon: Left", New, Reset, SetStatus, Clear)
    if profile.enableIcon2 then
        PlexusFrame:RegisterIndicator("ei_icon_left2", "Extra Icon: Left 2", New, Reset, SetStatus, Clear)
    end
    if profile.enableIcon34 then
        PlexusFrame:RegisterIndicator("ei_icon_left3", "Extra Icon: Left 3", New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_icon_left4", "Extra Icon: Left 4", New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("ei_icon_right", "Extra Icon: Right", New, Reset, SetStatus, Clear)
    if profile.enableIcon2 then
        PlexusFrame:RegisterIndicator("ei_icon_right2", "Extra Icon: Right 2", New, Reset, SetStatus, Clear)
    end
    if profile.enableIcon34 then
        PlexusFrame:RegisterIndicator("ei_icon_right3", "Extra Icon: Right 3", New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_icon_right4", "Extra Icon: Right 4", New, Reset, SetStatus, Clear)
    end

end
