--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Vehicle.lua
    Plexus status module for showing when a unit is driving a vehicle with a UI.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L
local Roster = Plexus:GetModule("PlexusRoster")

local PlexusStatusVehicle = Plexus:NewStatusModule("PlexusStatusVehicle")
PlexusStatusVehicle.menuName = L["In Vehicle"]
PlexusStatusVehicle.options = false

PlexusStatusVehicle.defaultDB = {
    alert_vehicleui = {
        enable = false,
        priority = 50,
        text = L["Driving"],
        color = { r = 0.8, g = 0.8, b = 0.8, a = 0.7, ignore = true },
    },
}

function PlexusStatusVehicle:PostInitialize()
    self:RegisterStatus("alert_vehicleui", L["In Vehicle"], nil, true)
end

function PlexusStatusVehicle:OnStatusEnable(status)
    if status == "alert_vehicleui" then return end

    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
    if not Plexus.IsClassicWow() then
        self:RegisterEvent("UNIT_ENTERED_VEHICLE", "UpdateUnit")
        self:RegisterEvent("UNIT_EXITED_VEHICLE", "UpdateUnit")
    end

    self:UpdateAllUnits()
end

function PlexusStatusVehicle:OnStatusDisable(status)
    if status ~= "alert_vehicleui" then return end

    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    if not Plexus.IsClassicWow() then
        self:UnregisterEvent("UNIT_ENTERED_VEHICLE")
        self:UnregisterEvent("UNIT_EXITED_VEHICLE")
    end

    self.core:SendStatusLostAllUnits("alert_vehicleui")
end

function PlexusStatusVehicle:UpdateAllUnits()
    for _, unit in Roster:IterateRoster() do
        self:UpdateUnit(unit)
    end
end

function PlexusStatusVehicle:UpdateUnit(unit)
    local guid
    if unit ~= "UpdateAllUnits" then
        guid = UnitGUID(unit)
    end

--	local pet_unit = Roster:GetPetunitByunit(unit)
--	if not pet_unit then return end

--	local guid = UnitGUID(pet_unit)

    if (UnitHasVehicleUI and UnitHasVehicleUI(unit)) then
        local settings = self.db.profile.alert_vehicleui
        self.core:SendStatusGained(guid, "alert_vehicleui",
            settings.priority,
            nil,
            settings.color,
            settings.text,
            nil,
            nil,
            "Interface\\Vehicles\\UI-Vehicles-Raid-Icon")
    else
        self.core:SendStatusLost(guid, "alert_vehicleui")
    end
end
