--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Absorbs.lua
    Plexus status module for absorption effects.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local settings

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusAbsorbs = Plexus:NewStatusModule("PlexusStatusAbsorbs")
PlexusStatusAbsorbs.menuName = L["Absorbs"]
PlexusStatusAbsorbs.options = false

PlexusStatusAbsorbs.defaultDB = {
    alert_absorbs = {
        enable = true,
        priority = 40,
        color = { r = 1, g = 1, b = 0, a = 1 },
        text = "+%s",
        minimumValue = 0.1,
    },
}

local extraOptionsForStatus = {
    minimumValue = {
        width = "double",
        type = "range", min = 0, max = 0.5, step = 0.05, isPercent = true,
        name = L["Minimum Value"],
        desc = L["Only show total absorbs greater than this percent of the unit's maximum health."],
        get = function()
            return PlexusStatusAbsorbs.db.profile.alert_absorbs.minimumValue
        end,
        set = function(_, v)
            PlexusStatusAbsorbs.db.profile.alert_absorbs.minimumValue = v
        end,
    },
}

function PlexusStatusAbsorbs:PostInitialize()
    self:RegisterStatus("alert_absorbs", L["Absorbs"], extraOptionsForStatus, true)
    settings = self.db.profile.alert_absorbs
end

function PlexusStatusAbsorbs:OnStatusEnable(status)
    if status == "alert_absorbs" then
        self:RegisterEvent("UNIT_HEALTH", "UpdateUnit")
        self:RegisterEvent("UNIT_MAXHEALTH", "UpdateUnit")
        if not Plexus:IsClassicWow() then
            self:RegisterEvent("UNIT_ABSORB_AMOUNT_CHANGED", "UpdateUnit")
        end
        self:UpdateAllUnits()
    end
end

function PlexusStatusAbsorbs:OnStatusDisable(status)
    if status == "alert_absorbs" then
        self:UnregisterEvent("UNIT_HEALTH")
        self:UnregisterEvent("UNIT_MAXHEALTH")
        if not Plexus:IsClassicWow() then
            self:UnregisterEvent("UNIT_ABSORB_AMOUNT_CHANGED")
        end
        self.core:SendStatusLostAllUnits("alert_absorbs")
    end
end

function PlexusStatusAbsorbs:PostReset()
    settings = self.db.profile.alert_absorbs
end

function PlexusStatusAbsorbs:UpdateAllUnits()
    for _, unit in PlexusRoster:IterateRoster() do
        self:UpdateUnit("UpdateAllUnits", unit)
    end
end

local UnitGetTotalAbsorbs, UnitGUID, UnitHealth, UnitHealthMax, UnitIsVisible
    = UnitGetTotalAbsorbs, UnitGUID, UnitHealth, UnitHealthMax, UnitIsVisible

function PlexusStatusAbsorbs:UpdateUnit(event, unit)
    self:Debug("UpdateUnit Event", event)
    if not unit then return end

    local guid = UnitGUID(unit)
    if not PlexusRoster:IsGUIDInRaid(guid) then return end
    local amount = 0
    if not Plexus:IsClassicWow() then
        amount = UnitIsVisible(unit) and UnitGetTotalAbsorbs(unit) or 0
    end
    if amount > 0 then
        local maxHealth = UnitHealthMax(unit)
        if (amount / maxHealth) > settings.minimumValue then
            local text = amount
            if amount > 9999 then
                text = format("%.0fk", amount / 1000)
            elseif amount > 999 then
                text = format("%.1fk", amount / 1000)
            end
            self.core:SendStatusGained(guid, "alert_absorbs",
                settings.priority,
                nil,
                settings.color,
                format(settings.text, text),
                UnitHealth(unit) + amount,
                UnitHealthMax(unit),
                settings.icon
            )
        end
    else
        self.core:SendStatusLost(guid, "alert_absorbs")
    end
end
