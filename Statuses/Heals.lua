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

local format = _G.format

local UnitGetIncomingHeals = _G.UnitGetIncomingHeals
local UnitGUID = _G.UnitGUID
local UnitHealth = _G.UnitHealth
local UnitHealthMax = _G.UnitHealthMax
local UnitIsDeadOrGhost = _G.UnitIsDeadOrGhost
local UnitIsVisible = _G.UnitIsVisible

local settings

local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatusHeals = Plexus:NewStatusModule("PlexusStatusHeals")

PlexusStatusHeals.menuName = L["Heals"]
PlexusStatusHeals.options = false

local HealComm

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
        type = "range", min = 0, max = 0.5, step = 0.005, isPercent = true,
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
        if Plexus:IsRetailWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
            self:RegisterEvent("UNIT_HEAL_PREDICTION", "UpdateUnit")
        end
        if Plexus:IsClassicWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
            --local HealComm
            assert(_G.LibStub, "Heals Status requires LibStub")
            assert(_G.LibStub:GetLibrary("LibHealComm-4.0", true), "Heals Status requires LibHealComm-4.0(which should be included)")
            HealComm = _G.LibStub:GetLibrary("LibHealComm-4.0", true) --luacheck: ignore 111
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
        if Plexus:IsRetailWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
            self:UnregisterEvent("UNIT_HEAL_PREDICTION")
        end
        if Plexus:IsClassicWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
            --local HealComm
            assert(_G.LibStub, "Heals Status requires LibStub")
            assert(_G.LibStub:GetLibrary("LibHealComm-4.0", true), "Heals Status requires LibHealComm-4.0(which should be included)")
            HealComm = _G.LibStub:GetLibrary("LibHealComm-4.0", true) --luacheck: ignore 111

            HealComm.UnregisterCallback(self, 'HealComm_HealStarted')
            HealComm.UnregisterCallback(self, 'HealComm_HealUpdated')
            HealComm.UnregisterCallback(self, 'HealComm_HealDelayed')
            HealComm.UnregisterCallback(self, 'HealComm_HealStopped')
            HealComm.UnregisterCallback(self, 'HealComm_ModifierChanged')
            HealComm.UnregisterCallback(self, 'HealComm_GUIDDisappeared')
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

function PlexusStatusHeals:UpdateUnit(event, unit)
    self:Debug("UpdateUnit Event: ", event)
    if not unit then return end

    local guid = UnitGUID(unit)
    if not PlexusRoster:IsGUIDInRaid(guid) then return end

    if UnitIsVisible(unit) and not UnitIsDeadOrGhost(unit) then
        local incoming = 0
        if Plexus:IsRetailWow() then
            incoming = UnitGetIncomingHeals(unit) or 0
        end
        if Plexus:IsClassicWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
            local myIncomingHeal = (HealComm:GetHealAmount(guid, HealComm.ALL_HEALS) or 0) * (HealComm:GetHealModifier(guid) or 1)
            incoming = (incoming + myIncomingHeal) or 0
        end
        --if Plexus:IsTBCWow() or Plexus:IsWrathWow() then
        --    local myIncomingHeal = (HealComm:GetHealAmount(guid, HealComm.OVERTIME_AND_BOMB_HEALS) or 0) * (HealComm:GetHealModifier(guid) or 1) + (UnitGetIncomingHeals(unit) or 0)
        --    incoming = myIncomingHeal or 0
        --end
        if incoming > 0 then
            if Plexus:IsRetailWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
                self:Debug("UpdateUnit", unit, incoming, UnitGetIncomingHeals(unit, "player") or 0, format("%.2f%%", incoming / UnitHealthMax(unit) * 100))
            end
        end
        if settings.ignore_self then
            if Plexus:IsClassicWow() or Plexus:IsTBCWow() or Plexus:IsWrathWow() then
                incoming = HealComm:GetOthersHealAmount(guid, HealComm.ALL_HEALS) or 0
            end
            --if Plexus:IsTBCWow() or Plexus:IsWrathWow() then
            --    incoming = (HealComm:GetOthersHealAmount(guid, HealComm.OVERTIME_AND_BOMB_HEALS) or 0) + (UnitGetIncomingHeals(unit) - (UnitGetIncomingHeals(unit, "player") or 0))
            --end
            if Plexus:IsRetailWow() then
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
