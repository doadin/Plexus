--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Factions.lua
    Plexus status module for other faction units.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local UnitGUID = UnitGUID
local IsInInstance = IsInInstance
local UnitFactionGroup = UnitFactionGroup

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusFactions = Plexus:NewStatusModule("PlexusStatusFactions")
PlexusStatusFactions.menuName = L["Factions"]
PlexusStatusFactions.options = false

PlexusStatusFactions.defaultDB = {
    faction = {
        enable = true,
        priority = 50,
        color = { r = 1, g = 0.3, b = 0.3, a = 1 },
        text = L["Other Faction"],
        icon = "Interface\\Buttons\\UI-GroupLoot-Pass-Up"
    }
}

function PlexusStatusFactions:PostInitialize()
    self:Debug("PostInitialize")
    self:RegisterStatus("faction", L["Faction"], nil, true)
end

function PlexusStatusFactions:OnStatusEnable(status)
    self:Debug("OnStatusEnable", status)
    self:RegisterEvent("PLAYER_FLAGS_CHANGED", "UpdateUnit")
    self:RegisterEvent("UNIT_FLAGS", "UpdateUnit")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
    self:RegisterMessage("Plexus_UnitJoined")

    self:RegisterEvent("UNIT_FACTION", "UpdateUnit")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "UpdateAllUnits")
    self:UpdateAllUnits()
end

function PlexusStatusFactions:OnStatusDisable(status)
    self:Debug("OnStatusDisable", status)
    self:UnregisterEvent("PLAYER_FLAGS_CHANGED")
    self:UnregisterEvent("UNIT_FLAGS")
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    self:UnregisterMessage("Plexus_UnitJoined")

    self:UnregisterEvent("UNIT_FACTION")
    self:SendStatusLostAllUnits(status)
end

function PlexusStatusFactions:UpdateAllUnits()
    for guid, unit in PlexusRoster:IterateRoster() do
        if IsInInstance() then
            self.core:SendStatusLost(guid, "faction")
        else
            self:UpdateUnit("UpdateAllUnits",unit)
        end
    end
end

function PlexusStatusFactions:Plexus_UnitJoined(_, _, unitid)
    if not unitid then return end
    self:UpdateUnit("Plexus_UnitJoined",unitid)
end

function PlexusStatusFactions:UpdateUnit(event, unitid)
    if unitid then
        self:Debug("UpdateUnit", event, unitid)
    else
        self:Debug("UpdateUnit", event)
    end
    local guid = UnitGUID(unitid)
    if IsInInstance() then
        self.core:SendStatusLost(guid, "faction")
    else
        if UnitFactionGroup("player") ~= UnitFactionGroup(unitid) then
            local profile = self.db.profile.faction
            self:Debug("UpdateUnit", "Unit is other faction", unitid)
            self.core:SendStatusGained(guid, "faction",
                profile.priority,
                nil,
                profile.color,
                profile.text,
                nil,
                nil,
                profile.icon
            )
        end
    end
end
