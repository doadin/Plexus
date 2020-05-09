--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Heals.lua
    Plexus status module for incoming heals.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local settings

local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatusHeals = Plexus:NewStatusModule("PlexusStatusHeals")

PlexusStatusHeals.menuName = L["Heals"]
PlexusStatusHeals.options = false

PlexusStatusHeals.defaultDB = {
    alert_heals = {
        enable = true,
        priority = 50,
        color = { r = 0, g = 1, b = 0, a = 1 },
        text = "+%s",
        icon = nil,
        ignore_self = false,
        minimumValue = 0.1,
    },
}

local healsOptions = {
    ignoreSelf = {
        type = "toggle", width = "double",
        name = L["Ignore Self"],
        desc = L["Ignore heals cast by you."],
        get = function()
            return PlexusStatusHeals.db.profile.alert_heals.ignore_self
        end,
        set = function(_, v)
            PlexusStatusHeals.db.profile.alert_heals.ignore_self = v
            PlexusStatusHeals:UpdateAllUnits()
        end,
    },
    minimumValue = {
        width = "double",
        type = "range", min = 0, max = 0.5, step = 0.05, isPercent = true,
        name = L["Minimum Value"],
        desc = L["Only show incoming heals greater than this percent of the unit's maximum health."],
        get = function()
            return PlexusStatusHeals.db.profile.alert_heals.minimumValue
        end,
        set = function(_, v)
            PlexusStatusHeals.db.profile.alert_heals.minimumValue = v
        end,
    },
}

function PlexusStatusHeals:PostInitialize()
    settings = PlexusStatusHeals.db.profile.alert_heals
    self:RegisterStatus("alert_heals", L["Incoming heals"], healsOptions, true)
end

function PlexusStatusHeals:OnStatusEnable(status)
    if status == "alert_heals" then
        self:RegisterEvent("UNIT_HEALTH", "UpdateUnit")
        self:RegisterEvent("UNIT_MAXHEALTH", "UpdateUnit")
        if not Plexus:IsClassicWow() then
            self:RegisterEvent("UNIT_HEAL_PREDICTION", "UpdateUnit")
        end
        if Plexus:IsClassicWow() then
            --local HealComm
            assert(LibStub, "Aggro Status requires LibStub")
            assert(LibStub:GetLibrary("LibHealComm-4.0", true), "Heals Status requires LibHealComm-4.0(which should be included)")
            HealComm = LibStub:GetLibrary("LibHealComm-4.0", true) --luacheck: ignore 111
            local function HealComm_Heal_Update()
                self:UpdateAllUnits()
            end

            local function HealComm_Modified()
                self:UpdateAllUnits()
            end

            HealComm.RegisterCallback(self, 'HealComm_HealStarted', HealComm_Heal_Update)
            HealComm.RegisterCallback(self, 'HealComm_HealUpdated', HealComm_Heal_Update)
            HealComm.RegisterCallback(self, 'HealComm_HealDelayed', HealComm_Heal_Update)
            HealComm.RegisterCallback(self, 'HealComm_HealStopped', HealComm_Heal_Update)
            HealComm.RegisterCallback(self, 'HealComm_ModifierChanged', HealComm_Modified)
            HealComm.RegisterCallback(self, 'HealComm_GUIDDisappeared', HealComm_Modified)
        end
        self:UpdateAllUnits()
    end
end

function PlexusStatusHeals:OnStatusDisable(status)
    if status == "alert_heals" then
        self:UnregisterEvent("UNIT_HEALTH")
        self:UnregisterEvent("UNIT_MAXHEALTH")
        if not Plexus:IsClassicWow() then
            self:UnregisterEvent("UNIT_HEAL_PREDICTION")
        end
        self.core:SendStatusLostAllUnits("alert_heals")
    end
end

function PlexusStatusHeals:PostReset() --luacheck: ignore 212
    settings = PlexusStatusHeals.db.profile.alert_heals
end

function PlexusStatusHeals:UpdateAllUnits()
    for _, unit in PlexusRoster:IterateRoster() do
        self:UpdateUnit("UpdateAllUnits", unit)
    end
end

local UnitGetIncomingHeals, UnitGUID, UnitHealth, UnitHealthMax, UnitIsDeadOrGhost, UnitIsVisible
    = UnitGetIncomingHeals, UnitGUID, UnitHealth, UnitHealthMax, UnitIsDeadOrGhost, UnitIsVisible

function PlexusStatusHeals:UpdateUnit(event, unit)
    self:Debug("UpdateUnit Event: ", event)
    if not unit then return end

    local guid = UnitGUID(unit)
    if not PlexusRoster:IsGUIDInRaid(guid) then return end

    if UnitIsVisible(unit) and not UnitIsDeadOrGhost(unit) then
        local incoming = 0
        if not Plexus:IsClassicWow() then
            incoming = UnitGetIncomingHeals(unit) or 0
        end
        if Plexus:IsClassicWow() then
            local myGUID = UnitGUID('player')
            local myIncomingHeal = (HealComm:GetHealAmount(guid, HealComm.ALL_HEALS) or 0) * (HealComm:GetHealModifier(myGUID) or 1)
            incoming = myIncomingHeal or 0
        end
        if incoming > 0 then
            if not Plexus:IsClassicWow() then
                self:Debug("UpdateUnit", unit, incoming, UnitGetIncomingHeals(unit, "player") or 0, format("%.2f%%", incoming / UnitHealthMax(unit) * 100))
            end
        end
        if settings.ignore_self then
            if Plexus:IsClassicWow() then
                incoming = HealComm:GetOthersHealAmount(guid, HealComm.ALL_HEALS) or 0
            end
            if not Plexus:IsClassicWow() then
                incoming = incoming - (UnitGetIncomingHeals(unit, "player") or 0)
            end
        end
        if incoming > 0 then
            local maxHealth = UnitHealthMax(unit)
            if (incoming / maxHealth) > settings.minimumValue then
                return self:SendIncomingHealsStatus(guid, incoming, UnitHealth(unit) + incoming, maxHealth)
            end
        end
    end
    self.core:SendStatusLost(guid, "alert_heals")
end

function PlexusStatusHeals:SendIncomingHealsStatus(guid, incoming, estimatedHealth, maxHealth)
    local incomingText = incoming
    if incoming > 9999 then
        incomingText = format("%.0fk", incoming / 1000)
    elseif incoming > 999 then
        incomingText = format("%.1fk", incoming / 1000)
    end
    self.core:SendStatusGained(guid, "alert_heals",
        settings.priority,
        settings.range,
        settings.color,
        format(settings.text, incomingText),
        estimatedHealth,
        maxHealth,
        settings.icon)
end
