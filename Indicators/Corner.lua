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
    corner3 = { "TOPLEFT", -1, 1 },
    topleft2 = { "TOPLEFT", 4, 1 },
    topleft3 = { "TOPLEFT", -1, -4 },
    -- left/right up/down
    corner4 = { "TOPRIGHT", 1, 1 },
    topright2 = { "TOPRIGHT", 1, -4 },
    topright3 = { "TOPRIGHT", -4, 1 },
    -- left/right up/down
    corner1 = { "BOTTOMLEFT", -1, -1 },
    bottomleft2 = { "BOTTOMLEFT", -1, 4 },
    bottomleft3 = { "BOTTOMLEFT", 4, -1 },
    -- left/right up/down
    corner2 = { "BOTTOMRIGHT", 1, -1 },
    bottomright2 = { "BOTTOMRIGHT", -4, -1 },
    bottomright3 = { "BOTTOMRIGHT", 1, 4 },
    -- left/right up/down
    Top = { "TOP", 1, 1 },
    Top2 = { "TOP", 6, 1 },
    Top3 = { "TOP", 1, -4 },
    Top4 = { "TOP", -4, 1 },
    -- left/right up/down
    Bottom = { "BOTTOM", 1, 0 },
    Bottom2 = { "BOTTOM", -4, 0 },
    Bottom3 = { "BOTTOM", 1, 5 },
    Bottom4 = { "BOTTOM", 6, 0 },
    -- left/right up/down
    Left = { "LEFT", -1, -1 },
    Left2 = { "LEFT", -1, 4 },
    Left3 = { "LEFT", 4, -1 },
    Left4 = { "LEFT", -1, -6 },
    -- left/right up/down
    Right = { "RIGHT", 1, -1 },
    Right2 = { "RIGHT", 1, -6 },
    Right3 = { "RIGHT", -4, -1 },
    Right4 = { "RIGHT", 1, 4 },
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

PlexusFrame:RegisterIndicator("Top",  L["Indicator Top"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Top2",  L["Indicator Top 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Top3",  L["Indicator Top 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Top4",  L["Indicator Top 4"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("corner3",  L["Indicator Top Left Corner"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("topleft2",  L["Indicator Top Left Corner 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("topleft3",  L["Indicator Top Left Corner 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("corner4",  L["Indicator Top Right Corner"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("topright2",  L["Indicator Top Right Corner 2"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("topright3",  L["Indicator Top Right Corner 3"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Bottom",  L["Indicator Bottom"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Bottom2",  L["Indicator Bottom 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Bottom3",  L["Indicator Bottom 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Bottom4",  L["Indicator Bottom 4"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("corner1",  L["Indicator Bottom Left Corner"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("bottomleft2",  L["Indicator Bottom Left Corner 2"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("bottomleft3",  L["Indicator Bottom Left Corner 3"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("corner2",  L["Indicator Bottom Right Corner"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("bottomright2",  L["Indicator Bottom Right Corner 2"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("bottomright3",  L["Indicator Bottom Right Corner 3"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Left",  L["Indicator Left"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Left2",  L["Indicator Left 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Left3",  L["Indicator Left 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Left4",  L["Indicator Left 4"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Right",  L["Indicator Right"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Right2",  L["Indicator Right 2"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Right3",  L["Indicator Right 3"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Right4",  L["Indicator Right 4"],     New, Reset, SetStatus, Clear)
