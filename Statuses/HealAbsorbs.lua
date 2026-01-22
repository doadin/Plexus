--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    HealAbsorbs.lua
    Plexus status module for absorption effects.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local format = format

local UnitGetTotalHealAbsorbs = UnitGetTotalHealAbsorbs
local UnitGUID = UnitGUID
local UnitHealth = UnitHealth
--local UnitHealthMax = UnitHealthMax
local UnitIsVisible = UnitIsVisible

local settings

local PlexusRoster = Plexus:GetModule("PlexusRoster")
--local PlexusStatusHealth = Plexus:GetModule("PlexusStatusHealth")

local PlexusStatusAbsorbs = Plexus:NewStatusModule("PlexusStatusBadAbsorbs")
PlexusStatusAbsorbs.menuName = L["Heal Absorbs"]
PlexusStatusAbsorbs.options = false

PlexusStatusAbsorbs.defaultDB = {
    alert_heal_absorbs = {
        enable = true,
        priority = 40,
        color = { r = 1, g = 0, b = 0, a = 1 },
        text = "-%s",
        minimumValue = 0.05,
    },
}

local extraOptionsForStatus = {
    minimumValue = {
        width = "double",
        type = "range", min = 0, max = 0.5, step = 0.01, isPercent = true,
        name = L["Minimum Value"],
        desc = L["Only show total absorbs greater than this percent of the unit's maximum health."],
        get = function()
            return PlexusStatusAbsorbs.db.profile.alert_heal_absorbs.minimumValue
        end,
        set = function(_, v)
            PlexusStatusAbsorbs.db.profile.alert_heal_absorbs.minimumValue = v
        end,
    },
}

function PlexusStatusAbsorbs:PostInitialize()
    self:RegisterStatus("alert_heal_absorbs", L["Heal Absorbs"], extraOptionsForStatus, true)
    settings = self.db.profile.alert_heal_absorbs
end

function PlexusStatusAbsorbs:OnStatusEnable(status)
    if status == "alert_heal_absorbs" then
        self:RegisterEvent("UNIT_HEALTH", "UpdateUnit")
        self:RegisterEvent("UNIT_MAXHEALTH", "UpdateUnit")
        if not Plexus:IsClassicWow() then
            self:RegisterEvent("UNIT_HEAL_ABSORB_AMOUNT_CHANGED", "UpdateUnit")
        end
        self:UpdateAllUnits()
    end
end

function PlexusStatusAbsorbs:OnStatusDisable(status)
    if status == "alert_heal_absorbs" then
        self:UnregisterEvent("UNIT_HEALTH")
        self:UnregisterEvent("UNIT_MAXHEALTH")
        if not Plexus:IsClassicWow() then
            self:UnregisterEvent("UNIT_HEAL_ABSORB_AMOUNT_CHANGED")
        end
        self.core:SendStatusLostAllUnits("alert_heal_absorbs")
    end
end

function PlexusStatusAbsorbs:PostReset()
    settings = self.db.profile.alert_heal_absorbs
end

function PlexusStatusAbsorbs:UpdateAllUnits()
    for _, unit in PlexusRoster:IterateRoster() do
        self:UpdateUnit("UpdateAllUnits", unit)
    end
end

function PlexusStatusAbsorbs:UpdateUnit(event, unit)
    self:Debug("UpdateUnit Event", event)
    if not unit then return end

    local guid = UnitGUID(unit)
    if not PlexusRoster:IsGUIDInRaid(guid) then return end
    local amount = 0
    local amountText
    if not Plexus:IsClassicWow() then
        amount = UnitIsVisible(unit) and UnitGetTotalHealAbsorbs(unit) or 0
    end
    if Plexus:IsRetailWow() then
        local maxHealth = Plexus:CalcMaxHP(unit)
        amountText = AbbreviateNumbers(amount)
        self.core:SendStatusGained(guid, "alert_heal_absorbs",
            settings.priority,
            nil,
            settings.color,
            amountText,
            amount,
            maxHealth,
            settings.icon
        )
    else
        if amount > 0 then
            local maxHealth = Plexus:CalcMaxHP(unit)
            if (amount / maxHealth) > settings.minimumValue then
                local text = amount
                if amount > 9999 then
                    text = format("%.0fk", amount / 1000)
                elseif amount > 999 then
                    text = format("%.1fk", amount / 1000)
                end
                if not settings.text then return end
                self.core:SendStatusGained(guid, "alert_heal_absorbs",
                    settings.priority,
                    nil,
                    settings.color,
                    format(settings.text, text),
                    UnitHealth(unit) + amount,
                    maxHealth,
                    settings.icon
                )
            end
        else
            self.core:SendStatusLost(guid, "alert_heal_absorbs")
        end
    end
end
