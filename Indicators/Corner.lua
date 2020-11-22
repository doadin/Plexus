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

local PlexusIndicatorCornerSquares = PlexusFrame:NewModule("PlexusIndicatorCornerSquares")
local BACKDROP = {
    bgFile = "Interface\\BUTTONS\\WHITE8X8", tile = true, tileSize = 8,
    edgeFile = "Interface\\BUTTONS\\WHITE8X8", edgeSize = 1,
    insets = {left = 1, right = 1, top = 1, bottom = 1},
}

local anchor = {
    -- left/right up/down
    corner3 = { "TOPLEFT", -1, 1 },
    topleft2 = { "TOPLEFT", 10, 1 },
    topleft3 = { "TOPLEFT", -1, -10 },
    -- left/right up/down
    corner4 = { "TOPRIGHT", 1, 1 },
    topright2 = { "TOPRIGHT", 1, -10 },
    topright3 = { "TOPRIGHT", -10, 1 },
    -- left/right up/down
    corner1 = { "BOTTOMLEFT", -1, -1 },
    bottomleft2 = { "BOTTOMLEFT", -1, 10 },
    bottomleft3 = { "BOTTOMLEFT", 10, -1 },
    -- left/right up/down
    corner2 = { "BOTTOMRIGHT", 1, -1 },
    bottomright2 = { "BOTTOMRIGHT", -10, -1 },
    bottomright3 = { "BOTTOMRIGHT", 1, 10 },
    -- left/right up/down
    Top = { "TOP", 0, 1 },
    Top2 = { "TOP", 10, 1 },
    Top3 = { "TOP", 0, -10 },
    Top4 = { "TOP", -10, 1 },
    -- left/right up/down
    Bottom = { "BOTTOM", 0, -1 },
    Bottom2 = { "BOTTOM", -10, -1 },
    Bottom3 = { "BOTTOM", 0, 10 },
    Bottom4 = { "BOTTOM", 10, -1 },
    -- left/right up/down
    Left = { "LEFT", -1, 0 },
    Left2 = { "LEFT", -1, 10 },
    Left3 = { "LEFT", 10, 0 },
    Left4 = { "LEFT", -1, -10 },
    -- left/right up/down
    Right = { "RIGHT", 1, 0 },
    Right2 = { "RIGHT", 1, -10 },
    Right3 = { "RIGHT", -10, 0 },
    Right4 = { "RIGHT", 1, 10 },
}

local function New(frame)
    local square = CreateFrame("Frame", nil, frame, BackdropTemplateMixin and "BackdropTemplate")
    square:SetBackdrop(BACKDROP)
    square:SetBackdropBorderColor(0, 0, 0, 1)
    return square
end

local function Reset(self)
    local profile = PlexusFrame.db.profile
    local cornerBorderSize = profile.cornerBorderSize
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
    local enableCornerBarSeparation = profile.enableCornerBarSeparation

    if x == 10 then
        x = -1 + totalSize
    end
    if x == -10 then
        x = 1 - totalSize
    end
    if y == 10 then
        y = -1 + totalSize
    end
    if y == -10 then
        y = 1 - totalSize
    end
    if enableCornerBarSeparation then
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
    end
    self:SetPoint( point, x, y )
    --if cornerBorderSize == 0 then
    --    BACKDROP.edgeFile = nil
    --    self:SetBackdrop(BACKDROP)
	--else
	--	BACKDROP.edgeSize = cornerBorderSize
	--	self:SetBackdrop(BACKDROP)
	--end
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

function PlexusIndicatorCornerSquares:OnInitialize() --luacheck: ignore 212
    local profile = PlexusFrame.db.profile

    PlexusFrame:RegisterIndicator("Top",  L["Indicator Top"],     New, Reset, SetStatus, Clear)
    if profile.enableCorner2 then
        PlexusFrame:RegisterIndicator("Top2",  L["Indicator Top 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableCorner34 then
        PlexusFrame:RegisterIndicator("Top3",  L["Indicator Top 3"],     New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("Top4",  L["Indicator Top 4"],     New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("corner3",  L["Indicator Top Left Corner"],     New, Reset, SetStatus, Clear)
    if profile.enableCorner2 then
        PlexusFrame:RegisterIndicator("topleft2",  L["Indicator Top Left Corner 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableCorner34 then
        PlexusFrame:RegisterIndicator("topleft3",  L["Indicator Top Left Corner 3"],     New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("corner4",  L["Indicator Top Right Corner"],    New, Reset, SetStatus, Clear)
    if profile.enableCorner2 then
        PlexusFrame:RegisterIndicator("topright2",  L["Indicator Top Right Corner 2"],    New, Reset, SetStatus, Clear)
    end
    if profile.enableCorner34 then
        PlexusFrame:RegisterIndicator("topright3",  L["Indicator Top Right Corner 3"],    New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("Bottom",  L["Indicator Bottom"],  New, Reset, SetStatus, Clear)
    if profile.enableCorner2 then
        PlexusFrame:RegisterIndicator("Bottom2",  L["Indicator Bottom 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableCorner34 then
        PlexusFrame:RegisterIndicator("Bottom3",  L["Indicator Bottom 3"],     New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("Bottom4",  L["Indicator Bottom 4"],     New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("corner1",  L["Indicator Bottom Left Corner"],  New, Reset, SetStatus, Clear)
    if profile.enableCorner2 then
        PlexusFrame:RegisterIndicator("bottomleft2",  L["Indicator Bottom Left Corner 2"],  New, Reset, SetStatus, Clear)
    end
    if profile.enableCorner34 then
        PlexusFrame:RegisterIndicator("bottomleft3",  L["Indicator Bottom Left Corner 3"],  New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("corner2",  L["Indicator Bottom Right Corner"], New, Reset, SetStatus, Clear)
    if profile.enableCorner2 then
        PlexusFrame:RegisterIndicator("bottomright2",  L["Indicator Bottom Right Corner 2"], New, Reset, SetStatus, Clear)
    end
    if profile.enableCorner34 then
        PlexusFrame:RegisterIndicator("bottomright3",  L["Indicator Bottom Right Corner 3"], New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("Left",  L["Indicator Left"], New, Reset, SetStatus, Clear)
    if profile.enableCorner2 then
        PlexusFrame:RegisterIndicator("Left2",  L["Indicator Left 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableCorner34 then
        PlexusFrame:RegisterIndicator("Left3",  L["Indicator Left 3"],     New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("Left4",  L["Indicator Left 4"],     New, Reset, SetStatus, Clear)
    end

    PlexusFrame:RegisterIndicator("Right",  L["Indicator Right"],    New, Reset, SetStatus, Clear)
    if profile.enableCorner2 then
        PlexusFrame:RegisterIndicator("Right2",  L["Indicator Right 2"],     New, Reset, SetStatus, Clear)
    end
    if profile.enableCorner34 then
        PlexusFrame:RegisterIndicator("Right3",  L["Indicator Right 3"],     New, Reset, SetStatus, Clear)
        PlexusFrame:RegisterIndicator("Right4",  L["Indicator Right 4"],     New, Reset, SetStatus, Clear)
    end
end