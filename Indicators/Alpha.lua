--[[--------------------------------------------------------------------
	Plexus
	Compact party and raid unit frames.
	Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
	Copyright (c) 2009-2018 Phanx <addons@phanx.net>
	All rights reserved. See the accompanying LICENSE file for details.
	https://github.com/Phanx/Plexus
	https://www.curseforge.com/wow/addons/plexus
	https://www.wowinterface.com/downloads/info5747-Plexus.html
----------------------------------------------------------------------]]

local _, Plexus = ...
local PlexusFrame = Plexus:GetModule("PlexusFrame")
local L = Plexus.L

PlexusFrame:RegisterIndicator("frameAlpha", L["Frame Alpha"],
	-- New
	nil,

	-- Reset
	nil,

	-- SetStatus
	function(self, color, text, value, maxValue, texture, texCoords, count, start, duration)
		if not color then return end

		local frame = self.__owner
		frame:SetAlpha(color.a or 1)
	end,

	-- ClearStatus
	function(self)
		local frame = self.__owner
		frame:SetAlpha(1)
	end
)
