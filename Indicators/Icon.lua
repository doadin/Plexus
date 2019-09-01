--[[--------------------------------------------------------------------
	Plexus
	Compact party and raid unit frames.
	Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
	Copyright (c) 2009-2018 Phanx <addons@phanx.net>
	All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local Media = LibStub("LibSharedMedia-3.0")
local L = Plexus.L

local BACKDROP = {
	edgeFile = "Interface\\BUTTONS\\WHITE8X8", edgeSize = 2,
	insets = { left = 2, right = 2, top = 2, bottom = 2 },
}

PlexusFrame:RegisterIndicator("icon", L["Center Icon"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("CENTER")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)

PlexusFrame:RegisterIndicator("ei_topleft", L["Extra Icon: Top Left"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("TOPLEFT")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)

PlexusFrame:RegisterIndicator("ei_botleft", L["Extra Icon: Bottom Left"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("BOTTOMLEFT")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)

PlexusFrame:RegisterIndicator("ei_topright", L["Extra Icon: Top Right"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("TOPRIGHT")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)

PlexusFrame:RegisterIndicator("ei_botright", L["Extra Icon: Bottom Right"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("BOTTOMRIGHT")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)

PlexusFrame:RegisterIndicator("ei_top", L["Extra Icon: Top"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("TOP")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)

PlexusFrame:RegisterIndicator("ei_bottom", L["Extra Icon: Bottom"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("BOTTOM")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)

PlexusFrame:RegisterIndicator("ei_left", L["Extra Icon: Left"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("LEFT")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)

PlexusFrame:RegisterIndicator("ei_right", L["Extra Icon: Right"],
	-- New
	function(frame)
		local icon = CreateFrame("Frame", nil, frame)
		icon:SetPoint("RIGHT")
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

		local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
		cd:SetAllPoints(true)
		cd:SetDrawBling(false)
		cd:SetDrawEdge(false)
		cd:SetHideCountdownNumbers(true)
		cd:SetReverse(true)
		icon.cooldown = cd

		cd:SetScript("OnShow", function()
			text:SetParent(cd)
		end)
		cd:SetScript("OnHide", function()
			text:SetParent(icon)
		end)

		return icon
	end,

	-- Reset
	function(self)
		local profile = PlexusFrame.db.profile
		local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
		local iconSize = profile.iconSize
		local iconBorderSize = profile.iconBorderSize

		local frame = self.__owner
		local r, g, b, a = self:GetBackdropBorderColor()

		self:SetParent(frame.indicators.bar)
		self:SetWidth(iconSize + (iconBorderSize * 2))
		self:SetHeight(iconSize + (iconBorderSize * 2))

		BACKDROP.edgeSize = iconBorderSize
		BACKDROP.insets.left = iconBorderSize
		BACKDROP.insets.right = iconBorderSize
		BACKDROP.insets.top = iconBorderSize
		BACKDROP.insets.bottom = iconBorderSize

		self:SetBackdrop(BACKDROP)
		self:SetBackdropBorderColor(r, g, b, a)

		self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
		self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

		self.text:SetFont(font, profile.fontSize, "OUTLINE")
	end,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not texture then return end
		--ChatFrame3:AddMessage(strjoin(" ", tostringall("SetStatus", self.__id, text, texture)))

		local profile = PlexusFrame.db.profile

		if type(texture) == "table" then
			self.texture:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
		else
			self.texture:SetTexture(texture)
			self.texture:SetTexCoord(texCoords.left, texCoords.right, texCoords.top, texCoords.bottom)
		end

		if type(color) == "table" then
			self:SetAlpha(color.a or 1)
			self:SetBackdropBorderColor(color.r, color.g, color.b, color.ignore and 0 or color.a or 1)
		else
			self:SetAlpha(1)
			self:SetBackdropBorderColor(0, 0, 0, 0)
		end

		if profile.enableIconCooldown and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
			self.cooldown:SetCooldown(start, duration)
			self.cooldown:Show()
		else
			self.cooldown:Hide()
		end

		if profile.enableIconStackText and type(count) == "number" and count > 1 then
			self.text:SetText(count)
		else
			self.text:SetText("")
		end

		self:Show()
	end,

	-- ClearStatus
	function(self)
		self:Hide()

		self.texture:SetTexture(1, 1, 1, 0)
		self.texture:SetTexCoord(0, 1, 0, 1)

		self.text:SetText("")
		self.text:SetTextColor(1, 1, 1, 1)

		self.cooldown:Hide()
	end
)
