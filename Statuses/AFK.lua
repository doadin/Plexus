--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2020 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    AFK.lua
    Plexus status module for away units.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L
local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusAFK = Plexus:NewStatusModule("PlexusStatusAFK")
PlexusStatusAFK.menuName = L["AFK"]
PlexusStatusAFK.options = false

PlexusStatusAFK.defaultDB = {
    afk = {
        enable = true,
        priority = 50,
        color = { r = 1, g = 0, b = 0, a = 1 },
        text = L["AFK"],
    }
}

function PlexusStatusAFK:PostInitialize()
    self:Debug("PostInitialize")
    self:RegisterStatus("afk", L["AFK"], nil, true)
end

function PlexusStatusAFK:OnStatusEnable(status)
    self:Debug("OnStatusEnable", status)
	self:RegisterEvent("PLAYER_FLAGS_CHANGED", "UpdateAllUnits")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "UpdateAllUnits")
	self:RegisterEvent("READY_CHECK", "UpdateAllUnits")
	self:RegisterEvent("READY_CHECK_FINISHED", "UpdateAllUnits")
    self:UpdateAllUnits()
end

function PlexusStatusAFK:OnStatusDisable(status)
    self:Debug("OnStatusDisable", status)
	self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
	self:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
	self:UnregisterEvent("READY_CHECK")
	self:UnregisterEvent("READY_CHECK_FINISHED")
    self:SendStatusLostAllUnits(status)
end

function PlexusStatusAFK:UpdateAllUnits()
    self:Debug("UpdateAllUnits", "Updating Units")
	for guid, unit in PlexusRoster:IterateRoster() do
		if (UnitExists(unit)) then
			self:UpdateUnit(unit)
		end
	end
end

function PlexusStatusAFK:UpdateUnit(unit)
    self:Debug("UpdateUnit", "Updating Unit")
    local profile = self.db.profile.afk
    local uguid = UnitGUID(unit)
        if UnitIsAFK(unit) then
            self:Debug("UpdateUnit", "Unit is afk", unit)
            self.core:SendStatusGained(uguid, "afk",
                profile.priority,
                nil,
                profile.color,
                profile.text
            )
        else
            self:Debug("UpdateUnit", "Unit is NOT afk", unit)
            self.core:SendStatusLost(uguid, "afk")
        end
end
