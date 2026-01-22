--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local Media = LibStub:GetLibrary("LibSharedMedia-3.0")
local L = Plexus.L

local strsub = string.utf8sub or string.sub --luacheck: ignore 143
local PlexusIndicatorsText = PlexusFrame:NewModule("PlexusIndicatorsText")

local anchor = {
    -- left/right up/down
    ei_text_top = { "TOP", 0, -1 },
    ei_text_top2 = { "TOP", 10, 1 },
    ei_text_top3 = { "TOP", 0, -10 },
    ei_text_top4 = { "TOP", -10, 1 },
    -- left/right up/down
    ei_text_topleft = { "TOPLEFT", 1, -1 },
    ei_text_topleft2 = { "TOPLEFT", 10, 1 },
    ei_text_topleft3 = { "TOPLEFT", -1, -10 },
    -- left/right up/down
    ei_text_topright = { "TOPRIGHT", -1, -1 },
    ei_text_topright2 = { "TOPRIGHT", 1, -10 },
    ei_text_topright3 = { "TOPRIGHT", -10, 1 },
    -- left/right up/down
    ei_text_bottom = { "BOTTOM", 0, 1 },
    ei_text_bottom2 = { "BOTTOM", -10, -1 },
    ei_text_bottom3 = { "BOTTOM", 0, 10 },
    ei_text_bottom4 = { "BOTTOM", 10, -1 },
    -- left/right up/down
    ei_text_bottomleft = { "BOTTOMLEFT", 1, 1 },
    ei_text_bottomleft2 = { "BOTTOMLEFT", -1, 10 },
    ei_text_bottomleft3 = { "BOTTOMLEFT", 10, -1 },
    -- left/right up/down
    ei_text_bottomright = { "BOTTOMRIGHT", -1, 1 },
    ei_text_bottomright2 = { "BOTTOMRIGHT", -10, -1 },
    ei_text_bottomright3 = { "BOTTOMRIGHT", 1, 10 },
}

local function New(frame)
    local text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    return text
end

local function Reset(self)
    local profile = PlexusFrame.db.profile
    local PLEXUS_STANDARD_TEXT_FONT
    if (GetLocale() == "koKR") then
        PLEXUS_STANDARD_TEXT_FONT = "Fonts\\2002.TTF";
    elseif (GetLocale() == "zhCN") then
        PLEXUS_STANDARD_TEXT_FONT = "Fonts\\ARKai_T.ttf";
    elseif (GetLocale() == "zhTW") then
        PLEXUS_STANDARD_TEXT_FONT = "Fonts\\blei00d.TTF";
    elseif (GetLocale() == "ruRU") then
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
            self:SetJustifyV("MIDDLE")
            self:SetPoint("TOPLEFT", 2, -2)
            self:SetPoint("BOTTOMLEFT", 2, 2)
            if profile.enableText2 then
                self:SetPoint("RIGHT", bar, "CENTER")
            else
                self:SetPoint("RIGHT", bar, -2, 0)
            end
        else
            self:SetJustifyH("CENTER")
            self:SetJustifyV("MIDDLE")
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
            self:SetJustifyV("MIDDLE")
            self:SetPoint("TOPRIGHT", -2, -2)
            self:SetPoint("BOTTOMRIGHT", -2, 2)
            if profile.enableText3 then
                self:SetPoint("LEFT", bar, "CENTER")
            else
                self:SetPoint("LEFT", bar, -2, 0)
            end
        else
            self:SetJustifyH("CENTER")
            self:SetJustifyV("MIDDLE")
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
            self:SetJustifyV("MIDDLE")
            self:SetPoint("TOPRIGHT", -2, -2)
            self:SetPoint("BOTTOMRIGHT", -2, 2)
            self:SetPoint("LEFT", bar, "CENTER")
        else
            self:SetJustifyH("CENTER")
            self:SetJustifyV("MIDDLE")
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
    elseif not text or (not Plexus:issecretvalue(text) and text == "") then
        return self:SetText("")
    end

    if type(text) == "number" then
        text = tostring(text)
    end
    if type(text) ~= "string" then
        PlexusFrame:Debug("text indicator got text that is not a string")
        return
    end

    if not Plexus:issecretvalue(text) then
        self:SetText(strsub(text, 1, profile.textlength))
    else
        self:SetText(text)
    end

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

    if profile.enableTextTop then
        PlexusFrame:RegisterIndicator("ei_text_top", L["Extra Text: Top"], New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText2 then
        PlexusFrame:RegisterIndicator("ei_text_top2",  L["Extra Text: Top 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText34 then
        PlexusFrame:RegisterIndicator("ei_text_top3",  L["Extra Text: Top 3"],     New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_text_top4",  L["Extra Text: Top 4"],     New, Reset, SetStatus, Clear)
    end

    if profile.enableTextTopLeft then
        PlexusFrame:RegisterIndicator("ei_text_topleft", L["Extra Text: Top Left"], New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText2 then
        PlexusFrame:RegisterIndicator("ei_text_topleft2",  L["Extra Text: Top Left 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText34 then
        PlexusFrame:RegisterIndicator("ei_text_topleft3",  L["Extra Text: Top Left 3"],     New, Reset, SetStatus, Clear)
    end

    if profile.enableTextTopRight then
        PlexusFrame:RegisterIndicator("ei_text_topright", L["Extra Text: Top Right"], New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText2 then
        PlexusFrame:RegisterIndicator("ei_text_topright2",  L["Extra Text: Top Right 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText34 then
        PlexusFrame:RegisterIndicator("ei_text_topright3",  L["Extra Text: Top Right 3"],     New, Reset, SetStatus, Clear)
    end

    if profile.enableTextBottom then
        PlexusFrame:RegisterIndicator("ei_text_bottom", L["Extra Text: Bottom"], New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText2 then
        PlexusFrame:RegisterIndicator("ei_text_bottom2",  L["Extra Text: Bottom 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText34 then
        PlexusFrame:RegisterIndicator("ei_text_bottom3",  L["Extra Text: Bottom 3"],     New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("ei_text_bottom4",  L["Extra Text: Bottom 4"],     New, Reset, SetStatus, Clear)
    end

    if profile.enableTextBottomLeft then
        PlexusFrame:RegisterIndicator("ei_text_bottomleft", L["Extra Text: Bottom Left"], New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText2 then
        PlexusFrame:RegisterIndicator("ei_text_bottomleft2",  L["Extra Text: Bottom Left 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText34 then
        PlexusFrame:RegisterIndicator("ei_text_bottomleft3",  L["Extra Text: Bottom Left 3"],     New, Reset, SetStatus, Clear)
    end

    if profile.enableTextBottomRight then
        PlexusFrame:RegisterIndicator("ei_text_bottomright", L["Extra Text: Bottom Right"], New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText2 then
        PlexusFrame:RegisterIndicator("ei_text_bottomright2",  L["Extra Text: Bottom Right 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableExtraText34 then
        PlexusFrame:RegisterIndicator("ei_text_bottomright3",  L["Extra Text: Bottom Right 3"],     New, Reset, SetStatus, Clear)
    end
end
