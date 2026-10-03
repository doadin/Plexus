--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2026 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Heals.lua
    Plexus status module for incoming heals.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local format = format

local UnitGetIncomingHeals = UnitGetIncomingHeals
local UnitGUID = UnitGUID
local UnitHealth = UnitHealth
--local UnitHealthMax = UnitHealthMax
local UnitIsDeadOrGhost = UnitIsDeadOrGhost
local UnitIsVisible = UnitIsVisible

-- AbbreviateNumbers returns values below its smallest breakpoint unrounded (e.g. "51.777"),
-- and the amount may be secret, so it can't be rounded here. The breakpoint at 1 makes
-- AbbreviateNumbers round it down instead. Custom breakpoints replace the game's defaults,
-- so the usual K/M steps are listed as well.
local abbreviateOptions = {
    breakpointData = {
        { breakpoint = 10000000, abbreviation = SECOND_NUMBER_CAP_NO_SPACE, abbreviationIsGlobal = false, significandDivisor = 1000000, fractionDivisor = 1 },
        { breakpoint = 1000000,  abbreviation = SECOND_NUMBER_CAP_NO_SPACE, abbreviationIsGlobal = false, significandDivisor = 100000,  fractionDivisor = 10 },
        { breakpoint = 10000,    abbreviation = FIRST_NUMBER_CAP_NO_SPACE,  abbreviationIsGlobal = false, significandDivisor = 1000,    fractionDivisor = 1 },
        { breakpoint = 1000,     abbreviation = FIRST_NUMBER_CAP_NO_SPACE,  abbreviationIsGlobal = false, significandDivisor = 100,     fractionDivisor = 10 },
        { breakpoint = 1,        abbreviation = "",                         abbreviationIsGlobal = false, significandDivisor = 1,       fractionDivisor = 1 },
    },
}

local settings

local PlexusRoster = Plexus:GetModule("PlexusRoster")
--local PlexusStatusHealth = Plexus:GetModule("PlexusStatusHealth")
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
        ignore_heal_comm = true,
        minimumValue = 0.1,
        reduced_heal_absorb = true,
        deficit = false,
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
        --hidden = Plexus:IsRetailWow(),
    },
    ignoreHealComm = {
        type = "toggle", width = "double",
        name = L["Ignore LibHealComm"],
        desc = L["Ignore LibHealComm and Use Game API."],
        get = function()
            return PlexusStatusHeals.db.profile.alert_heals.ignore_heal_comm
        end,
        set = function(_, v)
            PlexusStatusHeals.db.profile.alert_heals.ignore_heal_comm = v
            PlexusStatusHeals:UpdateAllUnits()
        end,
        hidden = Plexus:IsRetailWow(),
    },
    reduced_heal_absorb = {
        type = "toggle", width = "double",
        name = L["Factor Heal Absorbs"],
        desc = L["Factor heal absorbs into the incoming heals."],
        get = function()
            return PlexusStatusHeals.db.profile.alert_heals.reduced_heal_absorb
        end,
        set = function(_, v)
            PlexusStatusHeals.db.profile.alert_heals.reduced_heal_absorb = v
            PlexusStatusHeals:UpdateAllUnits()
        end,
        hidden = true,
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
        hidden = Plexus:IsRetailWow(),
    },
    deficit = {
        type = "toggle", width = "double",
        name = L["Work With Health Deficit"],
        desc = L[""],
        get = function()
            return PlexusStatusHeals.db.profile.alert_heals.deficit
        end,
        set = function(_, v)
            PlexusStatusHeals.db.profile.alert_heals.deficit = v
            PlexusStatusHeals:UpdateAllUnits()
        end,
        hidden = Plexus:IsRetailWow(),
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
        self:RegisterEvent("UNIT_HEAL_PREDICTION", "UpdateUnit")
        if not Plexus:IsRetailWow() then
            HealComm = LibStub:GetLibrary("LibHealComm-4.0", true) --luacheck: ignore 111
            if HealComm then
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
        end
        self:UpdateAllUnits()
    end
end

function PlexusStatusHeals:OnStatusDisable(status)
    if status == "alert_heals" then
        self:UnregisterEvent("UNIT_HEALTH")
        self:UnregisterEvent("UNIT_MAXHEALTH")
        self:UnregisterEvent("UNIT_HEAL_PREDICTION")
        if not Plexus:IsRetailWow() then
            HealComm = LibStub:GetLibrary("LibHealComm-4.0", true) --luacheck: ignore 111
            if HealComm then
                HealComm.UnregisterCallback(self, 'HealComm_HealStarted')
                HealComm.UnregisterCallback(self, 'HealComm_HealUpdated')
                HealComm.UnregisterCallback(self, 'HealComm_HealDelayed')
                HealComm.UnregisterCallback(self, 'HealComm_HealStopped')
                HealComm.UnregisterCallback(self, 'HealComm_ModifierChanged')
                HealComm.UnregisterCallback(self, 'HealComm_GUIDDisappeared')
            end
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

local calculator
function PlexusStatusHeals:UpdateUnit(event, unit)
    self:Debug("UpdateUnit Event: ", event)
    if not unit then return end

    local guid = UnitGUID(unit)
    if not PlexusRoster:IsGUIDInRaid(guid) then return end

    if UnitIsVisible(unit) and not UnitIsDeadOrGhost(unit) then
        local incoming, incomingHealsFromHealer, incomingHealsFromOthers, incomingHealsClamped = 0
        if not Plexus:IsRetailWow() then
            if Plexus:IsRetailWow() or (not HealComm and not Plexus:IsRetailWow()) or settings.ignore_heal_comm then
                incoming = UnitGetIncomingHeals(unit) or 0
            end
            if HealComm and not settings.ignore_heal_comm and (not Plexus:IsRetailWow()) then
                local myIncomingHeal = (HealComm:GetHealAmount(guid, HealComm.ALL_HEALS) or 0) * (HealComm:GetHealModifier(guid) or 1)
                incoming = (incoming + myIncomingHeal) or 0
            end
            if Plexus:IsTBCWow() or Plexus:IsWrathWow() then
                self:Debug("UpdateUnit", unit, incoming, UnitGetIncomingHeals(unit, "player") or 0, format("%.2f%%", incoming / Plexus:CalcMaxHP(unit) * 100))
            end
            if settings.ignore_self then
                if HealComm and not settings.ignore_heal_comm and (not Plexus:IsRetailWow()) then
                    incoming = HealComm:GetOthersHealAmount(guid, HealComm.ALL_HEALS) or 0
                end
                --if Plexus:IsRetailWow() or (not HealComm and not Plexus:IsRetailWow()) or settings.ignore_heal_comm then
                --    incoming = incoming - (UnitGetIncomingHeals(unit, "player") or 0)
                --end
            end
        end

        if Plexus:IsRetailWow() then
            if not calculator then
                calculator = CreateUnitHealPredictionCalculator()
            else
                calculator:Reset()
            end
            --UnitHealPredictionCalculator:SetHealAbsorbMode(settings.reduced_heal_absorb and 0 or 1)
            local role = UnitGroupRolesAssigned(unit)
            local healer = role == "HEALER" and unit or nil
            UnitGetDetailedHealPrediction(unit, healer, calculator)  -- 'calculator' is updated with new data after this call.
            incoming, incomingHealsFromHealer, incomingHealsFromOthers, incomingHealsClamped = calculator:GetIncomingHeals()
            if settings.ignore_self then
                incoming = incomingHealsFromOthers or 0
            end
            --myStatusBar:SetValue(incomingHealsFromHealer);
            --DevTools_Dump(incoming, incomingHealsFromHealer, incomingHealsFromOthers, incomingHealsClamped)
            --DevTools_Dump(calculator:GetHealAbsorbs())
            --DevTools_Dump(calculator:GetPredictedValues())
            --local values = calculator:GetPredictedValues()
            --local healthMax = values and values.healthMax or Plexus:CalcMaxHP(unit)
        end

        local maxHealth = Plexus:CalcMaxHP(unit)
        if not Plexus:IsRetailWow() then
            if incoming > 0 then
                if (incoming / maxHealth) > (settings and settings.minimumValue or 0.1) then
                    return self:SendIncomingHealsStatus(guid, incoming, UnitHealth(unit) + incoming, maxHealth)
                end
            else
                self.core:SendStatusLost(guid, "alert_heals")
            end
        else
            self:SendIncomingHealsStatus(guid, incoming, incoming, maxHealth)
            --if timer and timer[guid] and not timer[guid]:IsCancelled() then
            --    timer[guid]:Cancel()
            --end
            --timer[guid] = C_Timer.After(1.5, function()
            --    self.core:SendStatusLost(guid, "alert_heals")
            --end)
        end
    end
end

function PlexusStatusHeals:SendIncomingHealsStatus(guid, incoming, estimatedHealth, maxHealth)
    if not Plexus:issecretvalue(estimatedHealth) and settings.deficit then
        local healthDeficit = maxHealth - estimatedHealth
        local deficitText
        if healthDeficit < 0 then
            if healthDeficit > 0.1 then
                deficitText = tostring(-healthDeficit)  -- Convert to string without "-" sign
            else
                deficitText = format("+%.1fk", -healthDeficit / 1000)
            end
        else
            if healthDeficit <= -0.1 then
                deficitText = tostring(healthDeficit)  -- Convert to string without "+" sign
            else
                deficitText = format("-%.1fk", healthDeficit / 1000)
            end
        end
        local incomingText = format("%s", deficitText, incoming)
        self.core:SendStatusGained(guid, "alert_heals",
            settings.priority,
            settings.range,
            settings.color,
            incomingText,
            estimatedHealth,
            maxHealth)
        return
    end
    local incomingText = incoming
    if not Plexus:issecretvalue(incoming) then
        if incoming > 9999 then
            incomingText = format("%.0fk", incoming / 1000)
        elseif incoming > 999 then
            incomingText = format("%.1fk", incoming / 1000)
        else
            -- amounts can be fractional (heal modifiers), so round them
            incomingText = format("%.0f", incoming)
        end
    else
        incomingText = AbbreviateNumbers(incomingText, abbreviateOptions)
    end
    self.core:SendStatusGained(guid, "alert_heals",
        settings.priority,
        settings.range,
        settings.color,
        not Plexus:issecretvalue(incomingText) and format(settings.text, incomingText) or incomingText,
        estimatedHealth,
        maxHealth)
end
