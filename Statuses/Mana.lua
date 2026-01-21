--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Mana.lua
    Plexus status module for unit mana.
----------------------------------------------------------------------]]

local _, Plexus = ...

if Plexus:IsRetailWow() then
    return
end

local L = Plexus.L

local UnitGUID = UnitGUID
local UnitIsDeadOrGhost = UnitIsDeadOrGhost
local UnitIsVisible = UnitIsVisible
local UnitName = UnitName
local UnitPower = UnitPower
local UnitPowerMax = UnitPowerMax
local UnitPowerType = UnitPowerType

local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatus = Plexus:GetModule("PlexusStatus")

local PlexusStatusMana = PlexusStatus:NewModule("PlexusStatusMana")
PlexusStatusMana.menuName = L["Mana"]

PlexusStatusMana.defaultDB = {
    alert_lowMana = {
        text = L["Low Mana"],
        enable = true,
        color = { r = .5, g = .5, b = 1, a = 1 },
        priority = 40,
        threshold = 10,
        range = false,
    },
}

PlexusStatusMana.options = false

local low_manaOptions = {
    ["threshold"] = {
        type = "range", width = "double",
        name = L["Mana threshold"],
        desc = L["Set the percentage for the low mana warning."],
        max = 100,
        min = 0,
        step = 1,
        get = function()
            return PlexusStatusMana.db.profile.alert_lowMana.threshold
        end,
        set = function(_, v)
            PlexusStatusMana.db.profile.alert_lowMana.threshold = v
        end,
    },
}

function PlexusStatusMana:PostInitialize()
    self:RegisterStatus("alert_lowMana", L["Low Mana warning"], low_manaOptions, true)
end

function PlexusStatusMana:OnStatusEnable(status)
    if status ~= "alert_lowMana" then return end

    self:RegisterMessage("Plexus_UnitJoined")

    self:RegisterEvent("UNIT_POWER_UPDATE", "UpdateUnit")
    self:RegisterEvent("UNIT_MAXPOWER", "UpdateUnit")
    self:RegisterEvent("UNIT_DISPLAYPOWER", "UpdateUnit")

    self:UpdateAllUnits()
end

function PlexusStatusMana:OnStatusDisable(status)
    if status ~= "alert_lowMana" then return end

    self:UnregisterMessage("Plexus_UnitJoined")

    self:UnregisterEvent("UNIT_POWER_UPDATE")
    self:UnregisterEvent("UNIT_MAXPOWER")
    self:UnregisterEvent("UNIT_DISPLAYPOWER")

    self.core:SendStatusLostAllUnits("alert_lowMana")
end

function PlexusStatusMana:Plexus_UnitJoined(event, guid, unit)
    self:Debug("Plexus_UnitJoined guid: ", guid)
    if unit then
        self:UpdateUnit(event, unit)
    end
end

function PlexusStatusMana:UpdateAllUnits()
    for _, unit in PlexusRoster:IterateRoster() do
        self:UpdateUnit("UpdateAllUnits", unit)
    end
end

function PlexusStatusMana:UpdateUnit(event, unit)
    local guid = UnitGUID(unit)
    self:Debug("UpdateUnit event: ", event)
    if not PlexusRoster:IsGUIDInRaid(guid) then return end

    if UnitIsVisible(unit) and not UnitIsDeadOrGhost(unit) and UnitPowerType(unit) == 0 then
        -- mana user and is alive
        local cur = UnitPower(unit, 0)
        local max = UnitPowerMax(unit, 0)
        local settings = self.db.profile.alert_lowMana
        if Plexus:IsRetailWow() then
                return PlexusStatus:SendStatusGained(guid, "alert_lowMana",
                    settings.priority,
                    settings.range,
                    settings.color,
                    settings.text,
                    nil,
                    nil,
                    settings.icon)
        else
            if max > 0 and settings.threshold > (cur / max * 100) then
                return PlexusStatus:SendStatusGained(guid, "alert_lowMana",
                    settings.priority,
                    settings.range,
                    settings.color,
                    settings.text,
                    nil,
                    nil,
                    settings.icon)
            end
        end
    end
    PlexusStatus:SendStatusLost(guid, "alert_lowMana")
end
