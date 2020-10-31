--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
---------------------------------------------------------------------]]

local _, Plexus = ...
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local L = Plexus.L

local BACKDROP = {
    bgFile = "Interface\\BUTTONS\\WHITE8X8", tile = true, tileSize = 8,
    edgeFile = "Interface\\BUTTONS\\WHITE8X8", edgeSize = 1,
    insets = {left = 1, right = 1, top = 1, bottom = 1},
}

local anchor = {
    -- left/right up/down
    topleft = { "TOPLEFT", -1, 1 },
    ei_corner_topleft2 = { "TOPLEFT", 4, 1 },
    ei_corner_topleft3 = { "TOPLEFT", -1, -4 },
    -- left/right up/down
    topright = { "TOPRIGHT", 1, 1 },
    ei_corner_topright2 = { "TOPRIGHT", 1, -4 },
    ei_corner_topright3 = { "TOPRIGHT", -4, 1 },
    -- left/right up/down
    bottomleft = { "BOTTOMLEFT", -1, -1 },
    ei_corner_bottomleft2 = { "BOTTOMLEFT", -1, 4 },
    ei_corner_bottomleft3 = { "BOTTOMLEFT", 4, -1 },
    -- left/right up/down
    bottomright = { "BOTTOMRIGHT", 1, -1 },
    ei_corner_bottomright2 = { "BOTTOMRIGHT", -4, -1 },
    ei_corner_bottomright3 = { "BOTTOMRIGHT", 1, 4 },
    -- left/right up/down
    top = { "TOP", 1, 1 },
    ei_corner_top2 = { "TOP", 6, 1 },
    ei_corner_top3 = { "TOP", 1, -4 },
    ei_corner_top4 = { "TOP", -4, 1 },
    -- left/right up/down
    bottom = { "BOTTOM", 1, 0 },
    ei_corner_bottom2 = { "BOTTOM", -4, 0 },
    ei_corner_bottom3 = { "BOTTOM", 1, 5 },
    ei_corner_bottom4 = { "BOTTOM", 6, 0 },
    -- left/right up/down
    left = { "LEFT", -1, -1 },
    ei_corner_left2 = { "LEFT", -1, 4 },
    ei_corner_left3 = { "LEFT", 4, -1 },
    ei_corner_left4 = { "LEFT", -1, -6 },
    -- left/right up/down
    right = { "RIGHT", 1, -1 },
    ei_corner_right2 = { "RIGHT", 1, -6 },
    ei_corner_right3 = { "RIGHT", -4, -1 },
    ei_corner_right4 = { "RIGHT", 1, 4 },
}

local function New(frame)
    local square = CreateFrame("Frame", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
    square:SetBackdrop(BACKDROP)
    square:SetBackdropBorderColor(0, 0, 0, 1)
    return square
end

local function Reset(self)
    local profile = PlexusFrame.db.profile

    self:SetWidth(profile.cornerSize)
    self:SetHeight(profile.cornerSize)
    self:SetParent(self.__owner.indicators.bar)
    self:SetFrameLevel(self.__owner.indicators.bar:GetFrameLevel() + 1)

    self:ClearAllPoints()
    self:SetPoint(unpack(anchor[self.__id]))
end

local function SetStatus(self, color)
    if not color then return end
    self:SetBackdropColor(color.r, color.g, color.b, color.a or 1)
    self:Show()
end

local function Clear(self)
    self:SetBackdropColor(1, 1, 1, 1)
    self:Hide()
end

PlexusFrame:RegisterIndicator("top",  L["Indicator Top"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_top2",  L["Indicator Top 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_top3",  L["Indicator Top 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_top4",  L["Indicator Top 4"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("topleft",  L["Indicator Top Left Corner"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_topleft2",  L["Indicator Top Left Corner 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_topleft3",  L["Indicator Top Left Corner 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("topright",  L["Indicator Top Right Corner"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_topright2",  L["Indicator Top Right Corner 2"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_topright3",  L["Indicator Top Right Corner 3"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("bottom",  L["Indicator Bottom"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_bottom2",  L["Indicator Bottom 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_bottom3",  L["Indicator Bottom 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_bottom4",  L["Indicator Bottom 4"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("bottomleft",  L["Indicator Bottom Left Corner"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_bottomleft2",  L["Indicator Bottom Left Corner 2"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_bottomleft3",  L["Indicator Bottom Left Corner 3"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("bottomright",  L["Indicator Bottom Right Corner"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_bottomright2",  L["Indicator Bottom Right Corner 2"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_bottomright3",  L["Indicator Bottom Right Corner 3"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("left",  L["Indicator Left"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_left2",  L["Indicator Left 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_left3",  L["Indicator Left 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_left4",  L["Indicator Left 4"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("right",  L["Indicator Right"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_right2",  L["Indicator Right 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_right3",  L["Indicator Right 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("ei_corner_right4",  L["Indicator Right 4"],     New, Reset, SetStatus, Clear)
