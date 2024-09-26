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
	local icon = CreateFrame("Frame", nil, frame)
	icon:EnableMouse(false)
	--icon:SetBackdrop(BACKDROP)
    icon:Show()
	return icon
end

local function Reset(self)

    local point, x, y = unpack(anchor[self.__id])
    self:SetPoint( point, x, y )

end

local function SetStatus(self, color, text, _, _, texture, texCoords, stack, start, duration)

end

local function Clear(self)

end

function PlexusIndicatorCornerIcons:OnInitialize() --luacheck: ignore 212
    PlexusFrame:RegisterIndicator("PA", L["Private Aura"], New, Reset, SetStatus, Clear)
end
