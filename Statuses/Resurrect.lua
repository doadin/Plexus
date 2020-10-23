--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Resurrect.lua
    Plexus status module for resurrections.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local UnitCastingInfo = _G.UnitCastingInfo
local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusResurrect = Plexus:NewStatusModule("PlexusStatusResurrect", "AceTimer-3.0")
PlexusStatusResurrect.menuName = L["Resurrection"]
PlexusStatusResurrect.options = false

PlexusStatusResurrect.defaultDB = {
    alert_resurrect = {
        enable = true,
        text = L["RES"],
        color = { r = 0.8, g = 1, b = 0, a = 1 },
        color2 = { r = 0.2, g = 1, b = 0, a = 1 },
        priority = 50,
    },
}

local extraOptionsForStatus = {
    color = false,
    colors = {
        type = "group",
        dialogInline = true,
        name = L["Resurrection colors"],
        order = 86,
        args = {
            color = {
                order = 100,
                name = L["Casting color"],
                desc = L["Use this color for resurrections that are currently being cast."],
                type = "color",
                hasAlpha = true,
                get = function(t) --luacheck: ignore 212
                    local color = PlexusStatusResurrect.db.profile.alert_resurrect.color
                    return color.r, color.g, color.b, color.a or 1
                end,
                set = function(t, r, g, b, a) --luacheck: ignore 212
                    local color = PlexusStatusResurrect.db.profile.alert_resurrect.color
                    color.r, color.g, color.b, color.a = r, g, b, a or 1
                end,
            },
            color2 = {
                order = 101,
                name = L["Pending color"],
                desc = L["Use this color for resurrections that have finished casting and are waiting to be accepted."],
                type = "color",
                hasAlpha = true,
                get = function(t) --luacheck: ignore 212
                    local color = PlexusStatusResurrect.db.profile.alert_resurrect.color2
                    return color.r, color.g, color.b, color.a or 1
                end,
                set = function(t, r, g, b, a) --luacheck: ignore 212
                    local color = PlexusStatusResurrect.db.profile.alert_resurrect.color2
                    color.r, color.g, color.b, color.a = r, g, b, a or 1
                end,
            },
        },
    },
}

local ResSpells = {
    -- Class Abilities
    [2008]   = GetSpellInfo(2008),   -- Ancestral Spirit (Shaman)
    [7328]   = GetSpellInfo(7328),   -- Redemption (Paladin)
    [2006]   = GetSpellInfo(2006),   -- Resurrection (Priest)
    [115178] = GetSpellInfo(115178), -- Resuscitate (Monk)
    [50769]  = GetSpellInfo(50769),  -- Revive (Druid)
    [20484]  = GetSpellInfo(20484),  -- Rebirth (Druid)
    --[982]    = GetSpellInfo(982),    -- Revive Pet (Hunter)
    -- Items
    [8342]   = GetSpellInfo(8342),   -- Defibrillate (Goblin Jumper Cables)
    [22999]  = GetSpellInfo(22999),  -- Defibrillate (Goblin Jumper Cables XL)
    [54732]  = GetSpellInfo(54732),  -- Defibrillate (Gnomish Army Knife)
    [164729] = GetSpellInfo(164729), -- Defibrillate (Ultimate Gnomish Army Knife)
    [265116] = GetSpellInfo(265116), -- Defibrillate (Unstable Temporal Time Shifter)
    [199119] = GetSpellInfo(199119), -- Failure Detection Aura (Failure Detection Pylon) -- NEEDS CHECK
    [187777] = GetSpellInfo(187777), -- Reawaken (Brazier of Awakening)
    -- massSpells
    --[212056] = GetSpellInfo(212056), -- Absolution (Holy Paladin)
    --[212048] = GetSpellInfo(212048), -- Ancestral Vision (Restoration Shaman)
    --[212036] = GetSpellInfo(212036), -- Mass Resurrection (Discipline/Holy Priest)
    --[212051] = GetSpellInfo(212051), -- Reawaken (Mistweaver Monk)
    --[212040] = GetSpellInfo(212040), -- Revitalize (Restoration Druid)
    -- pening souslstone ank etc
    [160029] = GetSpellInfo(160029), -- Resurrecting aka pending
    --[27740] = GetSpellInfo(27740), -- Reincarnation
    --[20608] = GetSpellInfo(20608), -- Reincarnation
    --[225080] = GetSpellInfo(225080), -- Reincarnation
    --[21169] = GetSpellInfo(21169), -- Reincarnation
}
local MassResSpells = {
    -- massSpells
    [212056] = GetSpellInfo(212056), -- Absolution (Holy Paladin)
    [212048] = GetSpellInfo(212048), -- Ancestral Vision (Restoration Shaman)
    [212036] = GetSpellInfo(212036), -- Mass Resurrection (Discipline/Holy Priest)
    [212051] = GetSpellInfo(212051), -- Reawaken (Mistweaver Monk)
    [212040] = GetSpellInfo(212040) -- Revitalize (Restoration Druid)
}

------------------------------------------------------------------------

function PlexusStatusResurrect:PostInitialize()
    self:Debug("PostInitialize")

    self:RegisterStatus("alert_resurrect", L["Resurrection"], extraOptionsForStatus, true)

    self.core.options.args.alert_resurrect.args.range = nil
end

function PlexusStatusResurrect:OnStatusEnable(status)
    self:Debug("OnStatusEnable", status)

    if not Plexus:IsClassicWow() then
      self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
      self:RegisterEvent("UNIT_SPELLCAST_STOP")
      self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
      self:RegisterEvent("UNIT_SPELLCAST_START")
      --self:RegisterEvent("UNIT_AURA", "HasRessPending")
      self:RegisterEvent("INCOMING_RESURRECT_CHANGED")
    end
    if Plexus:IsClassicWow() then
        self:RegisterEvent("UNIT_SPELLCAST_START")
        self:RegisterEvent("INCOMING_RESURRECT_CHANGED")
    end

    --self:RegisterMessage("Plexus_RosterUpdated", "UpdateAllUnits")
end

function PlexusStatusResurrect:OnStatusDisable(status)
    self:Debug("OnStatusDisable", status)

    if not Plexus:IsClassicWow() then
        self:UnRegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
        self:UnRegisterEvent("UNIT_SPELLCAST_STOP")
        self:UnRegisterEvent("UNIT_SPELLCAST_INTERRUPTED")
        self:UnRegisterEvent("UNIT_SPELLCAST_START")
        --self:UnRegisterEvent("UNIT_AURA", "HasRessPending")
        self:UnRegisterEvent("INCOMING_RESURRECT_CHANGED")
    end
    if Plexus:IsClassicWow() then
        self:UnRegisterEvent("UNIT_SPELLCAST_START")
        self:UnRegisterEvent("INCOMING_RESURRECT_CHANGED")
    end

    --self:UnRegisterMessage("Plexus_RosterUpdated")
    self.core:SendStatusLostAllUnits("alert_resurrect")
end

------------------------------------------------------------------------
function PlexusStatusResurrect:UNIT_SPELLCAST_STOP(event, eventunit, castguid, spellid) --luacheck: ignore 212
    --print(event)
    for spelllistid, _ in pairs(MassResSpells) do
        if spellid == spelllistid then
            self.core:SendStatusLostAllUnits("alert_resurrect")
        end
    end
end
function PlexusStatusResurrect:UNIT_SPELLCAST_INTERRUPTED(event, unit, castguid, spellid) --luacheck: ignore 212
    for spelllistid, _ in pairs(MassResSpells) do
        if spellid == spelllistid then
            self.core:SendStatusLostAllUnits("alert_resurrect")
        end
    end
end
function PlexusStatusResurrect:UNIT_SPELLCAST_START(event, source, destGUID, castguid, spellid) --luacheck: ignore 212
    local sourceguid = UnitGUID(source)
    local db = self.db.profile.alert_resurrect
    for spelllistid, _ in pairs(ResSpells) do
        if spellid == spelllistid then
            for guid, unit in PlexusRoster:IterateRoster() do
                if not destGUID == guid then return end
                if UnitIsDead(unit) or UnitIsGhost(unit) or UnitIsDeadOrGhost(unit) then
                    local _, _, _, startTimeMS, endTimeMS = UnitCastingInfo(sourceguid)
                    local _, _, icon = GetSpellInfo(spellid)
                    if not icon then icon = "Interface\\ICONS\\Spell_Shadow_Soulgem" end
                    if not startTimeMS then startTimeMS = GetTime() end
                    if not endTimeMS then endTimeMS = startTimeMS + 10 end
                    local duration = ((endTimeMS - startTimeMS))
                    --combat res does not work with above math.
                    if duration <= 0 then
                        duration = ((endTimeMS - startTimeMS))
                    end
                    self.core:SendStatusGained(guid, "alert_resurrect",
                    db.priority,
                    nil,
                    db.color,
                    db.text,
                    nil,
                    nil,
                    icon,
                    startTimeMS,
                    duration)
                end
            end
        end
    end
end
-- Guess mass ress from combat log since INCOMING_RESURRECT_CHANGED event doesnt fire
function PlexusStatusResurrect:COMBAT_LOG_EVENT_UNFILTERED(event, eventunit, castguid, spellid) --luacheck: ignore 212
    --print(CombatLogGetCurrentEventInfo())
    local timestamp, eventType, _, sourceGUID, sourceName, _, _, destGUID, _, _, _, spellId, spellName, _ = CombatLogGetCurrentEventInfo()
    if not PlexusRoster:IsGUIDInGroup(sourceGUID) then
        return
    end
    --Dead Players Cant Cast
    if (not UnitIsDead(sourceGUID) or not UnitIsGhost(sourceGUID) or not UnitIsDeadOrGhost(sourceGUID)) then
        self.core:SendStatusLost(sourceGUID, "alert_resurrect")
    end
    local db = self.db.profile.alert_resurrect
    for _, spelllistname in pairs(MassResSpells) do --check that the spell casted is a mass res
        if spellName == spelllistname then
            if eventType == "SPELL_CAST_START" then
                for guid, unit in PlexusRoster:IterateRoster() do
                    if (UnitIsDead(unit) or UnitIsGhost(unit) or UnitIsDeadOrGhost(unit)) then
                        local startTime = GetTime()
                        local _, _, _, startTimeMS, endTimeMS = UnitCastingInfo(sourceName)
                        local duration = ((endTimeMS - startTimeMS) / 1000)
                        local _, _, icon = GetSpellInfo(spellId)
                        if not icon then icon = "Interface\\ICONS\\Spell_holy_guardianspirit" end
                        self.core:SendStatusGained(guid, "alert_resurrect",
                        db.priority,
                        nil,
                        db.color,
                        db.text,
                        nil,
                        nil,
                        icon,
                        startTime,
                        duration)
                    end
                end
            end
            if eventType == "SPELL_CAST_SUCCESS" then
                self.core:SendStatusLostAllUnits("alert_resurrect")
            end
            if eventType == "SPELL_CAST_FAILED" then --luacheck: ignore 631
                self.core:SendStatusLostAllUnits("alert_resurrect")
            end
        end
    end
    for spelllistid, spelllistname in pairs(ResSpells) do --check that the spell casted is a single res
        if spellName == spelllistname then
            if eventType == "SPELL_CAST_SUCCESS" then
                if name == spelllistname then
                    self.core:SendStatusLost(destGUID, "alert_resurrect")
                end
            end
            if eventType == "SPELL_CAST_FAILED" then
                if name == spelllistname then
                    self.core:SendStatusLost(destGUID, "alert_resurrect")
                end
            end
            if eventType == "SPELL_AURA_APPLIED" then
                local _, _, icon = GetSpellInfo(spelllistid)
                if not icon then icon = "Interface\\ICONS\\Spell_holy_guardianspirit" end
                if not timestamp then timestamp = GetTime() end
                local startTime = GetTime()
                self.core:SendStatusGained(destGUID, "alert_resurrect",
                db.priority,
                nil,
                db.color2,
                db.text,
                nil,
                nil,
                icon,
                startTime,
                60)
            end
            if eventType == "SPELL_AURA_REMOVED" then
                self.core:SendStatusLost(destGUID, "alert_resurrect")
            end
        end
    end
end

function PlexusStatusResurrect:INCOMING_RESURRECT_CHANGED(event, unit) --luacheck: ignore 212
    if Plexus:IsClassicWow() then
        if not unit then return end
        local guid = UnitGUID(unit)
        local db = self.db.profile.alert_resurrect
        if not PlexusRoster:IsGUIDInRaid(guid) then return end
        local startTime = GetTime()
        local duration = 10
        local hasIncomingRes = UnitHasIncomingResurrection(unit)
        if hasIncomingRes then
            self.core:SendStatusGained(guid, "alert_resurrect",
                db.priority,
                nil,
                db.color,
                db.text,
                nil,
                nil,
                "Interface\\ICONS\\Spell_holy_guardianspirit",
                startTime,
                duration)
        else
            self.core:SendStatusLost(guid, "alert_resurrect")
        end
    end
    if not Plexus:IsClassicWow() then
        if not unit then return end
        local guid = UnitGUID(unit)
        local db = self.db.profile.alert_resurrect
        if not PlexusRoster:IsGUIDInRaid(guid) then return end
        local startTime = GetTime()
        local duration = 10
        local hasIncomingRes = UnitHasIncomingResurrection(unit)
        if hasIncomingRes then
            self.core:SendStatusGained(guid, "alert_resurrect",
                db.priority,
                nil,
                db.color,
                db.text,
                nil,
                nil,
                "Interface\\ICONS\\Spell_holy_guardianspirit",
                startTime,
                duration)
        else
            self.core:SendStatusLost(guid, "alert_resurrect")
        end
    end
end
