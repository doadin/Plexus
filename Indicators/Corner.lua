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
    corner3 = { "TOPLEFT", -1, 1 },
    corner4 = { "TOPRIGHT", 1, 1 },
    corner1 = { "BOTTOMLEFT", -1, -1 },
    corner2 = { "BOTTOMRIGHT", 1, -1 },
    Top = { "TOP", -1, 1 },
    Bottom = { "BOTTOM", 1, 1 },
    Left = { "LEFT", -1, -1 },
    Right = { "RIGHT", 1, -1 },
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

PlexusFrame:RegisterIndicator("corner3",  L["Indicator Top Left Corner"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("corner4",  L["Indicator Top Right Corner"],    New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("corner1",  L["Indicator Bottom Left Corner"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("corner2",  L["Indicator Bottom Right Corner"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Top",  L["Indicator Top"],     New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Bottom",  L["Indicator Bottom"],  New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Left",  L["Indicator Left"], New, Reset, SetStatus, Clear)
PlexusFrame:RegisterIndicator("Right",  L["Indicator Right"],    New, Reset, SetStatus, Clear)
