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

local strsub = string.utf8sub or string.sub
local PlexusIndicatorsText = PlexusFrame:NewModule("PlexusIndicatorsText")

local anchor = {
    -- left/right up/down
    ei_text_topleft = { "TOPLEFT", 1, -1 },
    -- left/right up/down
    ei_text_topright = { "TOPRIGHT", -1, -1 },
    -- left/right up/down
    ei_text_bottomleft = { "BOTTOMLEFT", 1, 1 },
    -- left/right up/down
    ei_text_bottomright = { "BOTTOMRIGHT", -1, 1 },
}

local function New(frame)
    local text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    return text
end

local function Reset(self)
    local profile = PlexusFrame.db.profile
    local PLEXUS_STANDARD_TEXT_FONT
    if (GetLocale() == koKR) then
        PLEXUS_STANDARD_TEXT_FONT = "Fonts\\2002.TTF";
    elseif (GetLocale() == zhCN) then
        PLEXUS_STANDARD_TEXT_FONT = "Fonts\\ARKai_T.ttf";
    elseif (GetLocale() == zhTW) then
        PLEXUS_STANDARD_TEXT_FONT = "Fonts\\blei00d.TTF";
    elseif (GetLocale() == ruRU) then
        PLEXUS_STANDARD_TEXT_FONT = "Fonts\\FRIZQT___CYR.TTF";
    else
        PLEXUS_STANDARD_TEXT_FONT = "Fonts\\FRIZQT__.TTF";
    end
    local font = Media:Fetch("font", profile.font) or PLEXUS_STANDARD_TEXT_FONT

    local frame = self.__owner
    local bar = frame.indicators.bar

    self:SetParent(bar)
    self:SetFont(font, profile.fontSize, profile.fontOutline)

    if profile.fontShadow then
        self:SetShadowOffset(1, -1)
    else
        self:SetShadowOffset(0, 0)
    end

    if profile.invertBarColor and profile.invertTextColor then
        self:SetShadowColor(1, 1, 1)
    else
        self:SetShadowColor(0, 0, 0)
    end

    self:ClearAllPoints()
    if self.__id == "text" then
        if profile.textorientation == "HORIZONTAL" then
            self:SetJustifyH("LEFT")
            self:SetJustifyV("CENTER")
            self:SetPoint("TOPLEFT", 2, -2)
            self:SetPoint("BOTTOMLEFT", 2, 2)
            if profile.enableText2 then
                self:SetPoint("RIGHT", bar, "CENTER")
            else
                self:SetPoint("RIGHT", bar, -2, 0)
            end
        else
            self:SetJustifyH("CENTER")
            self:SetJustifyV("CENTER")
            self:SetPoint("TOPLEFT", 2, -2)
            self:SetPoint("TOPRIGHT", -2, -2)
            if profile.enableText2 then
                self:SetPoint("BOTTOM", bar, "CENTER")
            else
                self:SetPoint("BOTTOM", bar, 0, 2)
            end
        end
    elseif self.__id == "text2" then
        if profile.textorientation == "HORIZONTAL" then
            self:SetJustifyH("RIGHT")
            self:SetJustifyV("CENTER")
            self:SetPoint("TOPRIGHT", -2, -2)
            self:SetPoint("BOTTOMRIGHT", -2, 2)
            if profile.enableText3 then
                self:SetPoint("LEFT", bar, "CENTER")
            else
                self:SetPoint("LEFT", bar, -2, 0)
            end
        else
            self:SetJustifyH("CENTER")
            self:SetJustifyV("CENTER")
            self:SetPoint("BOTTOMLEFT", 2, -2)
            self:SetPoint("BOTTOMRIGHT", -2, -2)
            if profile.enableText3 then
                self:SetPoint("TOP", bar, -2, 0)
            else
                self:SetPoint("TOP", bar, "CENTER")
            end
        end
    elseif self.__id == "text3" then
        if profile.textorientation == "HORIZONTAL" then
            self:SetJustifyH("RIGHT")
            self:SetJustifyV("CENTER")
            self:SetPoint("TOPRIGHT", -2, -2)
            self:SetPoint("BOTTOMRIGHT", -2, 2)
            self:SetPoint("LEFT", bar, "CENTER")
        else
            self:SetJustifyH("CENTER")
            self:SetJustifyV("CENTER")
            self:SetPoint("BOTTOMLEFT", 2, -2)
            self:SetPoint("BOTTOMRIGHT", -2, -2)
            self:SetPoint("TOP", bar, "CENTER")
        end
    else
        local point, x, y = unpack(anchor[self.__id])
        self:SetPoint(point, x, y)
    end
end

local function SetStatus(self, color, text)
    local profile = PlexusFrame.db.profile
    if (self.__id == "text2" or self.__id == "text3") and not (profile.enableText2 or profile.enableText3) then
        return
    elseif not text or text == "" then
        return self:SetText("")
    end

    self:SetText(strsub(text, 1, profile.textlength))

    if color then
        if profile.invertBarColor and profile.invertTextColor then
            self:SetTextColor(color.r * 0.2, color.g * 0.2, color.b * 0.2, color.a or 1)
        else
            self:SetTextColor(color.r, color.g, color.b, color.a or 1)
        end
    end
end

local function Clear(self)
    self:SetText("")
end

function PlexusIndicatorsText:OnInitialize() --luacheck: ignore 212
    local profile = PlexusFrame.db.profile
    PlexusFrame:RegisterIndicator("text",  L["Center Text"],   New, Reset, SetStatus, Clear)
    if profile.enableText2 then
        PlexusFrame:RegisterIndicator("text2", L["Center Text 2"], New, Reset, SetStatus, Clear)
    end
    if profile.enableText3 then
        PlexusFrame:RegisterIndicator("text3", L["Center Text 3"], New, Reset, SetStatus, Clear)
    end
    if profile.enableTextTopLeft then
        PlexusFrame:RegisterIndicator("ei_text_topleft", L["Extra text: Top Left"], New, Reset, SetStatus, Clear)
    end
    if profile.enableTextTopRight then
        PlexusFrame:RegisterIndicator("ei_text_topright", L["Extra text: Top Right"], New, Reset, SetStatus, Clear)
    end
    if profile.enableTextBottomLeft then
        PlexusFrame:RegisterIndicator("ei_text_bottomleft", L["Extra text: Bottom Left"], New, Reset, SetStatus, Clear)
    end
    if profile.enableTextBottomRight then
        PlexusFrame:RegisterIndicator("ei_text_bottomright", L["Extra text: Bottom Right"], New, Reset, SetStatus, Clear)
    end
end
