--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Stagger.lua
    Plexus status module for Monk Stagger.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

if Plexus:IsRetailWow() then
    return
end

local format = format
local wipe = wipe
local UnitClass = UnitClass
local UnitGUID = UnitGUID
local GetAuraDataByAuraInstanceID = C_UnitAuras.GetAuraDataByAuraInstanceID
local ForEachAura = AuraUtil.ForEachAura

local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatus = Plexus:GetModule("PlexusStatus")

local PlexusStatusStagger = Plexus:NewStatusModule("PlexusStatusStagger")
PlexusStatusStagger.menuName = L["Stagger"]
PlexusStatusStagger.options = false
PlexusStatusStagger.defaultDB = {
    alert_stagger = {
        enable = true,
        colors = {
            light = { r = 0, g = 1, b = 0, a = 1 },
            moderate = { r = 1, g = 1, b = 0, a = 1 },
            heavy = { r = 1, g = 0, b = 0, a = 1 },
        },
        priority = 75,
        range = false,
    },
}

local spellID_severity = {
    [124273] = "heavy",
    [124274] = "moderate",
    [124275] = "light",
}

local monks = {}

local function getstaggercolor(severity)
    local color = PlexusStatusStagger.db.profile.alert_stagger.colors[severity]
    return color.r, color.g, color.b, color.a
end

local function setstaggercolor(severity, r, g, b, a)
    local color = PlexusStatusStagger.db.profile.alert_stagger.colors[severity]
    color.r = r
    color.g = g
    color.b = b
    color.a = a or 1
    PlexusStatus:SendMessage("Plexus_ColorsChanged")
end

local staggerOptions = {
    stagger_color = {
        type = "group",
        dialogInline = true,
        name = L["Stagger colors"],
        order = 80,
        args = {
            light = {
                type = "color",
                name = L["Light Stagger"],
                desc = L["Color for Light Stagger."],
                order = 100,
                hasAlpha = true,
                get = function () return getstaggercolor("light") end,
                set = function (_, r, g, b, a) setstaggercolor("light", r, g, b, a) end,
            },
            moderate = {
                type = "color",
                name = L["Moderate Stagger"],
                desc = L["Color for Moderate Stagger."],
                order = 101,
                hasAlpha = true,
                get = function () return getstaggercolor("moderate") end,
                set = function (_, r, g, b, a) setstaggercolor("moderate", r, g, b, a) end,
            },
            heavy = {
                type = "color",
                name = L["Heavy Stagger"],
                desc = L["Color for Heavy Stagger."],
                order = 102,
                hasAlpha = true,
                get = function () return getstaggercolor("heavy") end,
                set = function (_, r, g, b, a) setstaggercolor("heavy", r, g, b, a) end,
            },
        },
    },
    color = false,
}

function PlexusStatusStagger:PostInitialize()
    self:RegisterStatus("alert_stagger", L["Stagger"], staggerOptions, true)

    local options = PlexusStatus.options.args["alert_stagger"]
    options.desc = format(L["Status: %s\n\nSeverity of Stagger on Monk tanks"], options.name)
end

function PlexusStatusStagger:OnStatusEnable(status)
    if status == "alert_stagger" then
        self:RegisterMessage("Plexus_UnitJoined")
        self:RegisterMessage("Plexus_UnitLeft")
        self:RegisterEvent("UNIT_AURA", "UpdateUnit")
        self:RegisterEvent("UNIT_NAME_UPDATE", "UpdateName")
        for guid, unitid in PlexusRoster:IterateRoster() do
            local _, class = UnitClass(unitid)
            if class == "MONK" then
                monks[guid] = true
            end
        end
        self:UpdateAllUnits()
    end
end

function PlexusStatusStagger:OnStatusDisable(status)
    if status == "alert_stagger" then
        self:UnregisterMessage("Plexus_UnitJoined")
        self:UnregisterMessage("Plexus_UnitLeft")
        self:UnregisterEvent("UNIT_AURA")
        self:UnregisterEvent("UNIT_NAME_UPDATE")
        wipe(monks)
        self.core:SendStatusLostAllUnits("alert_stagger")
    end
end

function PlexusStatusStagger:Plexus_UnitJoined(event, guid, unitid)
    local _, class = UnitClass(unitid)
    if class == "MONK" then
        monks[guid] = true
        self:UpdateUnit(event, unitid, {isFullUpdate = true})
    end
end

function PlexusStatusStagger:Plexus_UnitLeft(event, guid) --luacheck: ignore 212
    self:Debug("Plexus_UnitLeft event: ", event)
    if monks[guid] then
        monks[guid] = nil
    end
end

function PlexusStatusStagger:UpdateName(event, unitid)
    local _, class = UnitClass(unitid)
    if class == "MONK" then
        local guid = UnitGUID(unitid)
        if not guid then return end
        if PlexusRoster:IsGUIDInGroup(guid) and not monks[guid] then
            monks[guid] = true
            self:UpdateUnit(event, unitid, {isFullUpdate = true})
        end
    end
end

function PlexusStatusStagger:UpdateAllUnits()
    for _, unitid in PlexusRoster:IterateRoster() do
        self:UpdateUnit("UpdateAllUnits", unitid, {isFullUpdate = true})
    end
end

local unitAuras
function PlexusStatusStagger:UpdateUnit(_, unitid, updatedAuras) --event, unitid, updatedAuras
    local guid = UnitGUID(unitid)
    if not unitid then return end
    if not guid then return end
    if not monks[guid] then return end
    if not PlexusRoster:IsGUIDInGroup(guid) then return end

    if not unitAuras then
        unitAuras = {}
    end

    -- Full Update
    if (updatedAuras and updatedAuras.isFullUpdate) then --or (not updatedAuras.isFullUpdate and (not updatedAuras.addedAuras and not updatedAuras.updatedAuraInstanceIDs and not updatedAuras.removedAuraInstanceIDs)) then
        local unitauraInfo = {}
        if (ForEachAura) then
            --ForEachAura(unitid, "HELPFUL", nil,
            --    function(aura)
            --        if aura and aura.auraInstanceID then
            --            unitauraInfo[aura.auraInstanceID] = aura
            --        end
            --    end,
            --true)
            ForEachAura(unitid, "HARMFUL", nil,
                function(aura)
                    if aura and aura.auraInstanceID and spellID_severity[aura.spellId] then
                        unitauraInfo[aura.auraInstanceID] = aura
                    end
                end,
            true)
        else
            --for i = 0, 40 do
            --    local auraData = C_UnitAuras.GetAuraDataByIndex(unitid, i, "HELPFUL")
            --    if auraData then
            --        unitauraInfo[auraData.auraInstanceID] = auraData
            --    end
            --end
            for i = 0, 40 do
                local auraData = C_UnitAuras.GetAuraDataByIndex(unitid, i, "HARMFUL")
                if auraData and auraData.auraInstanceID and spellID_severity[auraData.spellId] then
                    unitauraInfo[auraData.auraInstanceID] = auraData
                end
            end
        end
        if unitAuras[guid] then
            unitAuras[guid] = nil
        end
        for _, v in pairs(unitauraInfo) do
            if not unitAuras[guid] then
                unitAuras[guid] = {}
            end
            if v.spellId == 367364 then
                v.name = "Echo: Reversion"
            end
            if v.spellId == 376788 then
                v.name = "Echo: Dream Breath"
            end
            unitAuras[guid][v.auraInstanceID] = v
        end
    end

    if updatedAuras and updatedAuras.addedAuras then
        for _, aura in pairs(updatedAuras.addedAuras) do
            if aura.spellId == 367364 then
                aura.name = "Echo: Reversion"
            end
            if aura.spellId == 376788 then
                aura.name = "Echo: Dream Breath"
            end
            if aura and aura.auraInstanceID and spellID_severity[aura.spellId] then
                if not unitAuras[guid] then
                    unitAuras[guid] = {}
                end
                unitAuras[guid][aura.auraInstanceID] = aura
            end
       end
    end

    if updatedAuras and updatedAuras.updatedAuraInstanceIDs then
        for _, auraInstanceID in ipairs(updatedAuras.updatedAuraInstanceIDs) do
            local auraTable = GetAuraDataByAuraInstanceID(unitid, auraInstanceID)
            if auraTable and auraTable.spellId == 367364 then
                auraTable.name = "Echo: Reversion"
            end
            if auraTable and auraTable.spellId == 376788 then
                auraTable.name = "Echo: Dream Breath"
            end
            if not unitAuras[guid] then
                unitAuras[guid] = {}
            end
            if auraTable and auraTable.auraInstanceID and spellID_severity[auraTable.spellId] then
                unitAuras[guid][auraInstanceID] = auraTable
            elseif not auraTable then
                unitAuras[guid][auraInstanceID] = auraTable
            end
        end
    end

    if updatedAuras and updatedAuras.removedAuraInstanceIDs then
        for _, auraInstanceIDTable in ipairs(updatedAuras.removedAuraInstanceIDs) do
            if unitAuras[guid] and unitAuras[guid][auraInstanceIDTable] then
                unitAuras[guid][auraInstanceIDTable] = nil
            end
        end
    end

    if unitAuras[guid] then
        local numAuras = 0
        --id, info
        for id in pairs(unitAuras[guid]) do
            local auraTable = GetAuraDataByAuraInstanceID(unitid, id)
            if not auraTable then
                unitAuras[guid][id] = nil
            end
            if auraTable  then
                numAuras = numAuras + 1
                if not auraTable.name then
                    break
                end
                local severity = spellID_severity[auraTable.spellId]
                if severity then
                    local settings = self.db.profile.alert_stagger
                    local color = severity and settings.colors[severity]
                    return self.core:SendStatusGained(guid,
                                                        "alert_stagger",
                                                        settings.priority,
                                                        settings.range,
                                                        color,
                                                        auraTable.name,
                                                        nil,
                                                        nil,
                                                        auraTable.icon)
                end
            end
        end
        if numAuras == 0 then
            unitAuras[guid] = nil
            self.core:SendStatusLost(guid, "alert_stagger")
        end
    end
end
