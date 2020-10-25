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
    self:RegisterEvent("PLAYER_FLAGS_CHANGED", "UpdateUnit")
    self:RegisterEvent("UNIT_FLAGS", "UpdateUnit")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
    self:RegisterMessage("Plexus_UnitJoined")
    self:UpdateAllUnits()
end

function PlexusStatusAFK:OnStatusDisable(status)
    self:Debug("OnStatusDisable", status)
    self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
    self:UnregisterEvent("UNIT_FLAGS")
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    self:UnregisterMessage("Plexus_UnitJoined")
    self:SendStatusLostAllUnits(status)
end

function PlexusStatusAFK:UpdateAllUnits()
    for _, unit in PlexusRoster:IterateRoster() do
        self:UpdateUnit("UpdateAllUnits",unit)
    end
end

function PlexusStatusAFK:Plexus_UnitJoined(_, _, unitid)
    if not unitid then return end
    self:UpdateUnit(_,unitid)
end

function PlexusStatusAFK:UpdateUnit(event, unitid)
    self:Debug("UpdateUnit Event", event)
    local profile = self.db.profile.afk
    local uguid = UnitGUID(unitid)
        if UnitIsAFK(unitid) then
            self:Debug("UpdateUnit", "Unit is afk", unitid)
            self.core:SendStatusGained(uguid, "afk",
                profile.priority,
                nil,
                profile.color,
                profile.text
            )
        else
            self:Debug("UpdateUnit", "Unit is NOT afk", unitid)
            self.core:SendStatusLost(uguid, "afk")
        end
end
