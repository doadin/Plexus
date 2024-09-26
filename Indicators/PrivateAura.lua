--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2021 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...

local CreateFrame = CreateFrame

local PlexusFrame = Plexus:GetModule("PlexusFrame")
local Media = LibStub("LibSharedMedia-3.0") --luacheck: ignore 113
local L = Plexus.L

local PlexusIndicatorCornerIcons = PlexusFrame:NewModule("PlexusIndicatorPrivateAura")
local BACKDROP = {
    bgFile = "Interface\\BUTTONS\\WHITE8X8",
	edgeFile = "Interface\\BUTTONS\\WHITE8X8", edgeSize = 1,
	insets = { left = 1, right = 1, top = 1, bottom = 1 },
}

local anchor = {
    -- left/right up y/down x
    PA = { "CENTER", 0, 0},
}

local function New(frame)
	local icon = CreateFrame("Button", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
	icon:EnableMouse(false)
	icon:SetBackdrop(BACKDROP)

	--local texture = icon:CreateTexture(nil, "ARTWORK")
	--texture:SetPoint("BOTTOMLEFT", 2, 2)
	--texture:SetPoint("TOPRIGHT", -2, -2)
	--icon.texture = texture

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

    icon:Show()

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

	--self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
	--self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

	self.text:SetPoint("CENTER", profile.stackOffsetX, profile.stackOffsetY)
    self.text:SetFont(font, iconStackFontSize, "OUTLINE")
    self.cooldowntext:SetFont(font, iconCoolDownFontSize, "OUTLINE")

end

local function SetStatus(self, color, text, _, _, texture, texCoords, stack, start, duration)
	local profile = PlexusFrame.db.profile
	if not texture then return end

	if type(texture) == "table" then
		self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
	else
        self.texture:SetTexture(texture)
        if profile.enableIconBackgroundColor then
            self.texture:SetAlpha(profile.iconBackgroundAlpha)
        else
            self.texture:SetAlpha(1)
        end
		self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
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
	else
		self.cooldown:Hide()
	end

	if profile.enableIconStackText and stack and stack ~= 0 then
		self.text:SetText(stack)
	else
		self.text:SetText("")
    end

    local CountDownNumber = tonumber(text)
    if profile.showIconCountDownText and type(CountDownNumber) == "number" and CountDownNumber ~= 0 then
        self.cooldowntext:SetText(text)
	else
		self.cooldowntext:SetText("")
    end

	self:Show()
end

local function Clear(self)
	--self:Hide()

	--self.texture:SetTexture(1, 1, 1, 0)
	--self.texture:SetTexCoord(0, 1, 0, 1)

	self.text:SetText("")
    self.text:SetTextColor(1, 1, 1, 1)
    self.cooldowntext:SetText("")

	self.cooldown:Hide()
end

function PlexusIndicatorCornerIcons:OnInitialize() --luacheck: ignore 212
    local profile = PlexusFrame.db.profile

    --if profile.enablePrivateAura then
        PlexusFrame:RegisterIndicator("PA", L["Private Aura"], New, Reset, SetStatus, Clear)
    --end

end
