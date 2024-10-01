--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Range.lua
    Plexus status module for unit range.
    Created by neXter, modified by Pastamancer, modified by Phanx.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local GetSpellInfo = C_Spell and C_Spell.GetSpellInfo and C_Spell.GetSpellInfo or GetSpellInfo
local IsSpellInRange = C_Spell and C_Spell.IsSpellInRange and C_Spell.IsSpellInRange or IsSpellInRange
local UnitClass = UnitClass
local UnitInRange = UnitInRange
local UnitIsDead = UnitIsDead
local UnitIsUnit = UnitIsUnit

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusRange = Plexus:NewStatusModule("PlexusStatusRange", "AceTimer-3.0")
PlexusStatusRange.menuName = L["Out of Range"]

PlexusStatusRange.defaultDB = {
    alert_range = {
        enable = true,
        text = L["Range"],
        color = { r = 0.8, g = 0.2, b = 0.2, a = 0.5 },
        priority = 80,
        range = false,
        frequency = 0.2,
    }
}

local extraOptions = {
    frequency = {
        name = L["Range check frequency"],
        desc = L["Seconds between range checks"],
        order = -1,
        width = "double",
        type = "range", min = 0.1, max = 5, step = 0.1,
        get = function()
            return PlexusStatusRange.db.profile.alert_range.frequency
        end,
        set = function(_, v)
            PlexusStatusRange.db.profile.alert_range.frequency = v
            PlexusStatusRange:OnStatusDisable("alert_range")
            PlexusStatusRange:OnStatusEnable("alert_range")
        end,
    },
    text = {
        name = L["Text"],
        desc = L["Text to display on text indicators"],
        order = 113,
        type = "input",
        get = function()
            return PlexusStatusRange.db.profile.alert_range.text
        end,
        set = function(_, v)
            PlexusStatusRange.db.profile.alert_range.text = v
        end,
    },
    range = false,
}

function PlexusStatusRange:PostInitialize()
    self:RegisterStatus("alert_range", L["Out of Range"], extraOptions, true)
end

function PlexusStatusRange:OnStatusEnable()
    self:RegisterMessage("Plexus_PartyTransition", "PartyTransition")
    self:PartyTransition("OnStatusEnable", PlexusRoster:GetPartyState())
end

function PlexusStatusRange:OnStatusDisable()
    self:StopTimer("CheckRange")
    self:UnregisterMessage("Plexus_PartyTransition", "PartyTransition")
    self.core:SendStatusLostAllUnits("alert_range")
end

local function GetSpellName(spellid)
    local info = C_Spell.GetSpellName and C_Spell.GetSpellName(spellid) or GetSpellInfo(spellid)
    return info
end

local resSpell
do
    local _, class = UnitClass("player")
    if class == "DEATHKNIGHT" then
        resSpell = GetSpellName(61999)  -- Raise Ally
    elseif class == "DRUID" then
        resSpell = GetSpellName(50769)  -- Revive
    elseif class == "MONK" then
        resSpell = GetSpellName(115178) -- Resuscitate
    elseif class == "PALADIN" then
        resSpell = GetSpellName(7328)   -- Redemption
    elseif class == "PRIEST" then
        resSpell = GetSpellName(2006)   -- Resurrection
    elseif class == "SHAMAN" then
        resSpell = GetSpellName(2008)   -- Ancestral Spirit
    elseif class == "WARLOCK" then
        resSpell = GetSpellName(20707)  -- Soulstone
    elseif class == "EVOKER" then
        resSpell = GetSpellName(361227)  -- Return
    end
end

local function GroupRangeCheck(_, unit)
    --local _, class = UnitClass("player")
    if UnitIsUnit(unit, "player") then
        return true
    elseif resSpell and UnitIsDead(unit) and not UnitIsDead("player") then
        if Plexus:IsRetailWow() then
            return IsSpellInRange(resSpell, unit)
        else
            return IsSpellInRange(resSpell, unit) == 1
        end
    else
        local inRange, checkedRange = UnitInRange(unit)
        if checkedRange then
            return inRange
        else
            return true
        end
    end
end

PlexusStatusRange.UnitInRange = GroupRangeCheck

function PlexusStatusRange:CheckRange()
    local settings = self.db.profile.alert_range
    for guid, unit in PlexusRoster:IterateRoster() do
        if self:UnitInRange(unit) then
            self.core:SendStatusLost(guid, "alert_range")
        else
            self.core:SendStatusGained(guid, "alert_range",
                settings.priority,
                false,
                settings.color,
                settings.text)
        end
    end
end

function PlexusStatusRange:PartyTransition(message, state, oldstate)
    self:Debug("PartyTransition", message, state, oldstate)
    if state == "solo" then
        self:StopTimer("CheckRange")
        self.UnitInRange = "True"
        self.core:SendStatusLostAllUnits("alert_range")
    else
        self:StartTimer("CheckRange", self.db.profile.alert_range.frequency, true)
        self.UnitInRange = GroupRangeCheck
    end
end
