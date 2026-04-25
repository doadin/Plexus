--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2026 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Defensives.lua
    Plexus status module for defensive buffs.
----------------------------------------------------------------------]]

local Plexus = _G.Plexus


local PlexusStatusDefensives = Plexus:GetModule("PlexusStatus"):NewModule("PlexusStatusDefensives")  --luacheck: ignore 211
PlexusStatusDefensives.menuName = "Defensives"  --luacheck: ignore 112

-- locals
local PlexusRoster = Plexus:GetModule("PlexusRoster") --luacheck: ignore 211
local UnitGUID = UnitGUID

local settings

if Plexus:IsRetailWow() then
PlexusStatusDefensives.defaultDB = { --luacheck: ignore 112
    debug = false,
    alert_EXTERNAL_DEFENSIVE = {
        enable = true,
        color = { r = 1, g = 1, b = 0, a = 1 },
        priority = 99,
        range = false,
    },
    alert_BIG_DEFENSIVE = {
        enable = true,
        color = { r = 1, g = 1, b = 0, a = 1 },
        priority = 99,
        range = false,
    }
}
end

function PlexusStatusDefensives:OnInitialize() --luacheck: ignore 112
    self.super.OnInitialize(self)

    self:RegisterStatus("alert_EXTERNAL_DEFENSIVE", "External Defensives", nil, true)
    self:RegisterStatus("alert_BIG_DEFENSIVE", "Big Defensives", nil, true)

    settings = self.db.profile
end

function PlexusStatusDefensives:OnStatusEnable() --status --luacheck: ignore 112
    self:RegisterEvent("UNIT_AURA", "ScanUnitByAuraInfo")
    self:RegisterMessage("Plexus_UnitJoined")
    self:UpdateAllUnits()
end

function PlexusStatusDefensives:OnStatusDisable(status) -- status --luacheck: ignore 112
    self:UnregisterEvent("UNIT_AURA")
    self:UnregisterMessage("Plexus_UnitJoined")
    self.core:SendStatusLostAllUnits(status)
end

function PlexusStatusDefensives:Plexus_UnitJoined(_, _, unitid)-- _, guid, unitid --luacheck: ignore 112
    self:ScanUnitByAuraInfo(_, unitid, {isFullUpdate = true})
end

function PlexusStatusDefensives:UpdateAllUnits() --luacheck: ignore 112
    for _, unitid in PlexusRoster:IterateRoster() do
        self:ScanUnitByAuraInfo(_, unitid, {isFullUpdate = true})
    end
end

function PlexusStatusDefensives:ScanUnitByAuraInfo(_, unit, _)
    if not unit then return end
    local guid = UnitGUID(unit)
    if not guid then
        return
    end
    if not PlexusRoster:IsGUIDInRaid(guid) then
        return
    end
    if Plexus.IsSpecialUnit[unit] then
        return
    end

    if not Plexus:issecretvalue(unit) and not UnitIsVisible(unit) then
        return
    end

    local filter
    local result

    if settings.alert_EXTERNAL_DEFENSIVE.enable then
        filter = "HELPFUL|EXTERNAL_DEFENSIVE"
        result = C_UnitAuras.GetUnitAuras(unit, filter , 1 , Enum.UnitAuraSortRule.ExpirationOnly , Enum.UnitAuraSortDirection.Normal)
        local dur = result and result[1] and C_UnitAuras.GetAuraDuration(unit, result[1].auraInstanceID)
        if result and result[1] then
            self.core:SendStatusGained(
                guid, "alert_EXTERNAL_DEFENSIVE", settings.alert_EXTERNAL_DEFENSIVE.priority, (settings.alert_EXTERNAL_DEFENSIVE.range and 40),
                nil, nil, nil, nil, result[1].icon, nil, dur, result[1].applications, nil, result[1].expirationTime)
        else
            self.core:SendStatusLost(guid, "alert_EXTERNAL_DEFENSIVE")
        end
    end

    if settings.alert_BIG_DEFENSIVE.enable then
        filter = "HELPFUL|BIG_DEFENSIVE"
        result = C_UnitAuras.GetUnitAuras(unit, filter , 1 , Enum.UnitAuraSortRule.ExpirationOnly , Enum.UnitAuraSortDirection.Normal)
        local dur = result and result[1] and C_UnitAuras.GetAuraDuration(unit, result[1].auraInstanceID)
        if result and result[1] then
            self.core:SendStatusGained(
                guid, "alert_BIG_DEFENSIVE", settings.alert_BIG_DEFENSIVE.priority, (settings.alert_BIG_DEFENSIVE.range and 40),
                nil, nil, nil, nil, result[1].icon, nil, dur, result[1].applications, nil, result[1].expirationTime)
        else
            self.core:SendStatusLost(guid, "alert_BIG_DEFENSIVE")
        end
    end

    return
end
