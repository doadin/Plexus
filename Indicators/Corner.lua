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
    corner3 = { "TOPLEFT", 0, 0 },
    topleft2 = { "TOPLEFT", 10, 0 },
    topleft3 = { "TOPLEFT", 0, -10 },
    -- left/right up/down
    corner4 = { "TOPRIGHT", 0, 0 },
    topright2 = { "TOPRIGHT", 0, -10 },
    topright3 = { "TOPRIGHT", -10, 0 },
    -- left/right up/down
    corner1 = { "BOTTOMLEFT", 0, 0 },
    bottomleft2 = { "BOTTOMLEFT", 0, 10 },
    bottomleft3 = { "BOTTOMLEFT", 10, 0 },
    -- left/right up/down
    corner2 = { "BOTTOMRIGHT", 0, 0 },
    bottomright2 = { "BOTTOMRIGHT", -10, 0 },
    bottomright3 = { "BOTTOMRIGHT", 0, 10 },
    -- left/right up/down
    Top = { "TOP", 0, 0 },
    Top2 = { "TOP", 10, 0 },
    Top3 = { "TOP", 0, -10 },
    Top4 = { "TOP", -10, 0 },
    -- left/right up/down
    Bottom = { "BOTTOM", 0, 0 },
    Bottom2 = { "BOTTOM", -10, 0 },
    Bottom3 = { "BOTTOM", 0, 10 },
    Bottom4 = { "BOTTOM", 10, 0 },
    -- left/right up/down
    Left = { "LEFT", 0, 0 },
    Left2 = { "LEFT", 0, 10 },
    Left3 = { "LEFT", 10, 0 },
    Left4 = { "LEFT", 0, -10 },
    -- left/right up/down
    Right = { "RIGHT", 0, 0 },
    Right2 = { "RIGHT", 0, -10 },
    Right3 = { "RIGHT", -10, 0 },
    Right4 = { "RIGHT", 0, 10 },
}

local function New(frame)
    local square = CreateFrame("Frame", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
    square:SetBackdrop(BACKDROP)
    square:SetBackdropBorderColor(0, 0, 0, 1)
    return square
end

local function Reset(self)
    local profile = PlexusFrame.db.profile
    if (not string.find(self.__id,"corner") and string.find(self.__id, "2")) then
        if not profile.enableCorner2 then
            return self:Hide()
        end
        self:Show()
    end
    if (not string.find(self.__id,"corner") and (string.find(self.__id, "3") or string.find(self.__id, "4"))) then
        if not profile.enableCorner34 then
            return self:Hide()
        end
        self:Show()
    end

    self:SetWidth(profile.cornerSize)
    self:SetHeight(profile.cornerSize)
    self:SetParent(self.__owner.indicators.bar)
    self:SetFrameLevel(self.__owner.indicators.bar:GetFrameLevel() + 1)

    self:ClearAllPoints()
    local point, x, y = unpack(anchor[self.__id])
    local totalSize = profile.cornerSize
    local ExtraBarSide = profile.ExtraBarSide
    local ExtraBarSize = profile.ExtraBarSize
    local enableExtraBar = profile.enableExtraBar

    if x == 10 then
        x = 0 + totalSize
    end
    if x == -10 then
        x = 0 - totalSize
    end
    if y == 10 then
        y = 0 + totalSize
    end
    if y == -10 then
        y = 0 - totalSize
    end
    if enableExtraBar and ExtraBarSide == "Bottom" and (point == "BOTTOM" or point == "BOTTOMLEFT" or point == "BOTTOMRIGHT") then
        y = y + ExtraBarSize * 40
    end
    if enableExtraBar and ExtraBarSide == "Left" and (point == "LEFT" or point == "TOPLEFT" or point == "BOTTOMLEFT") then
        x = x + ExtraBarSize * 60
    end
    if enableExtraBar and ExtraBarSide == "Top" and (point == "TOP" or point == "TOPLEFT" or point == "TOPRIGHT") then
        y = y - ExtraBarSize * 40
    end
    if enableExtraBar and ExtraBarSide == "Right" and (point == "RIGHT" or point == "TOPRIGHT" or point == "BOTTOMRIGHT") then
        x = x - ExtraBarSize * 60
    end
    self:SetPoint( point, x, y )
end

local function SetStatus(self, color)
    if not color then return end
    local bordercolor = PlexusFrame.db.profile.cornerBorderColor
    self:SetBackdropColor(color.r, color.g, color.b, color.a or 1)
    if bordercolor then
        self:SetBackdropBorderColor(bordercolor.r, bordercolor.g, bordercolor.b, bordercolor.a or 1)
    else
        self:SetBackdropBorderColor(0, 0, 0, 1)
    end
    self:Show()
end

local function Clear(self)
    self:SetBackdropColor(1, 1, 1, 0)
    self:SetBackdropBorderColor(1, 1, 1, 0)
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
