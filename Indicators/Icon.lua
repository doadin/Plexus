--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local Media = LibStub:GetLibrary("LibSharedMedia-3.0")
local L = Plexus.L

local BACKDROP = {
    edgeFile = "Interface\\BUTTONS\\WHITE8X8", edgeSize = 2,
    insets = { left = 2, right = 2, top = 2, bottom = 2 },
}

local function Icon_NewIndicator(frame)
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
end

local function Icon_ClearStatus(self)
    self:Hide()

    self.texture:SetTexture(1, 1, 1, 0)
    self.texture:SetTexCoord(0, 1, 0, 1)

    self.text:SetText("")
    self.text:SetTextColor(1, 1, 1, 1)

    self.cooldown:Hide()
end

local function Icon_SetStatus(self, color, _, _, _, texture, texCoords, count, start, duration)
    if not texture then return end

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
end

local function Icon_ResetIndicator(self, point, idx)
    local profile = PlexusFrame.db.profile
    local font = Media:Fetch("font", profile.font) or STANDARD_TEXT_FONT
    local iconSize
    if point == "CENTER" then
        iconSize = profile.centerIconSize
    else
        iconSize = profile.iconSize
    end
    local iconBorderSize = profile.iconBorderSize
    local totalSize = iconSize + (iconBorderSize * 2)
    local frame = self.__owner
    local r, g, b, a = self:GetBackdropBorderColor()

    if point == "CENTER" then
        self:SetParent(frame.indicators.bar)
    else
        self:SetFrameLevel(frame.indicators.bar:GetFrameLevel() + 1)
    end
    self:SetWidth(totalSize)
    self:SetHeight(totalSize)

    -- positioning
    self:ClearAllPoints()

    --local is_side = point == "TOP" or point == "BOTTOM" or point == "LEFT" or point == "RIGHT"
    local is_left = string.match(point, "LEFT") and 1 or string.match(point, "RIGHT") and -1 or 0
    local is_top = string.match(point, "TOP") and -1 or string.match(point, "BOTTOM") and 1 or 0

    local m = profile.marginSize
    local ts = totalSize + profile.spacingSize
    local mts = profile.marginSize + totalSize + profile.spacingSize

    if idx == 1 then
        self:SetPoint(point, is_left * m, is_top * m)
    elseif idx == 2 then
        if point == "TOP" or point == "BOTTOM" then
            self:SetPoint(point, 0, is_top * mts)
        else
            self:SetPoint(point, is_left * mts, is_top * m)
        end
    elseif idx == 3 then
        if point == "TOP" or point == "BOTTOM" then
            self:SetPoint(point, -ts, is_top * m)
        elseif point == "LEFT" or point == "RIGHT" then
            self:SetPoint(point, is_left * m, ts)
        else
            self:SetPoint(point, is_left * m, is_top * mts)
        end
    elseif idx == 4 then
        if point == "TOP" or point == "BOTTOM" then
            self:SetPoint(point, ts, is_top * m)
        elseif point == "LEFT" or point == "RIGHT" then
            self:SetPoint(point, is_left * m, -ts)
        else
            self:SetPoint(point, is_left * mts, is_top * mts)
        end
    end

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

    self:SetBackdrop(BACKDROP)
    self:SetBackdropBorderColor(r, g, b, a)

    self.texture:SetPoint("BOTTOMLEFT", iconBorderSize, iconBorderSize)
    self.texture:SetPoint("TOPRIGHT", -iconBorderSize, -iconBorderSize)

    self.text:SetPoint("CENTER", profile.stackOffsetX, profile.stackOffsetY)
    self.text:SetFont(font, profile.fontSize, "OUTLINE")
end

local function Icon_RegisterIndicator_Plus(id, name, point, idx)
    PlexusFrame:RegisterIndicator(id .. (idx == 1 and "" or tostring(idx)), name .. (idx == 1 and "" or (" " .. tostring(idx))),
        Icon_NewIndicator,
        function(self)
            Icon_ResetIndicator(self, point, idx)
        end,
        Icon_SetStatus,
        Icon_ClearStatus
    )
end

local function Icon_RegisterIndicator(id, name, point, iconsMore1, iconsMore2)
    Icon_RegisterIndicator_Plus(id, name, point, 1)

    if iconsMore1 then
        Icon_RegisterIndicator_Plus(id, name, point, 2)
    end

    if iconsMore2 then
        Icon_RegisterIndicator_Plus(id, name, point, 3)
        Icon_RegisterIndicator_Plus(id, name, point, 4)
    end
end

local iconsMore1 = true
local iconsMore2 = true
local prefix = "Extra Icon: "
Icon_RegisterIndicator("icon", L["Center Icon"], "CENTER")
Icon_RegisterIndicator("ei_icon_topleft", prefix .. "Top Left", "TOPLEFT", iconsMore1, iconsMore2)
Icon_RegisterIndicator("ei_icon_botleft", prefix .. "Bottom Left", "BOTTOMLEFT", iconsMore1, iconsMore2)
Icon_RegisterIndicator("ei_icon_topright", prefix .. "Top Right", "TOPRIGHT", iconsMore1, iconsMore2)
Icon_RegisterIndicator("ei_icon_botright", prefix .. "Bottom Right", "BOTTOMRIGHT", iconsMore1, iconsMore2)

Icon_RegisterIndicator("ei_icon_top", prefix .. "Top", "TOP", iconsMore1, iconsMore2)
Icon_RegisterIndicator("ei_icon_bottom", prefix .. "Bottom", "BOTTOM", iconsMore1, iconsMore2)
Icon_RegisterIndicator("ei_icon_left", prefix .. "Left", "LEFT", iconsMore1, iconsMore2)
Icon_RegisterIndicator("ei_icon_right", prefix .. "Right", "RIGHT", iconsMore1, iconsMore2)