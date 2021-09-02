--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Health.lua
    Plexus status module for unit health.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local format = _G.format

local CombatLogGetCurrentEventInfo = _G.CombatLogGetCurrentEventInfo
local UnitGUID = _G.UnitGUID
local UnitHealth = _G.UnitHealth
local UnitHealthMax = _G.UnitHealthMax
local UnitIsConnected = _G.UnitIsConnected
local UnitIsDeadOrGhost = _G.UnitIsDeadOrGhost
local UnitIsFeignDeath = _G.UnitIsFeignDeath

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusHealth = Plexus:NewStatusModule("PlexusStatusHealth", "AceTimer-3.0")
PlexusStatusHealth.menuName = L["Health"]

PlexusStatusHealth.defaultDB = {
    unit_health = {
        enable = true,
        color = { r = 1, g = 1, b = 1, a = 1 },
        priority = 30,
        range = false,
        deadAsFullHealth = true,
        useClassColors = true,
        enableupdateFrequency = false,
        updateFrequency = 1,
    },
    unit_healthDeficit = {
        enable = true,
        color = { r = 1, g = 1, b = 1, a = 1 },
        priority = 30,
        threshold = 80,
        range = false,
        useClassColors = true,
    },
    alert_lowHealth = {
        text = L["Low HP"],
        enable = true,
        color = { r = 1, g = 1, b = 1, a = 1 },
        priority = 30,
        threshold = 80,
        range = false,
    },
    alert_death = {
        text = L["DEAD"],
        enable = true,
        color = { r = 0.5, g = 0.5, b = 0.5, a = 1 },
        icon = "Interface\\TargetingFrame\\UI-TargetingFrame-Skull",
        priority = 50,
        range = false,
    },
    alert_feignDeath = {
        text = L["FD"],
        enable = true,
        color = { r = 0.5, g = 0.5, b = 0.5, a = 1 },
        icon = "Interface\\Icons\\Ability_Rogue_FeignDeath",
        priority = 55,
        range = false,
    },
    alert_offline = {
        text = L["Offline"],
        enable = true,
        color = { r = 1, g = 1, b = 1, a = 0.6, ignore = true },
        icon = "Interface\\CharacterFrame\\Disconnect-Icon",
        priority = 60,
        range = false,
    },
}

PlexusStatusHealth.extraOptions = {
    deadAsFullHealth = {
        order = 101, width = "double",
        name = L["Show dead as full health"],
        desc = L["Treat dead units as being full health."],
        type = "toggle",
        get = function()
            return PlexusStatusHealth.db.profile.unit_health.deadAsFullHealth
        end,
        set = function(_, v)
            PlexusStatusHealth.db.profile.unit_health.deadAsFullHealth = v
            PlexusStatusHealth:UpdateAllUnits()
        end,
    },
}

local healthOptions = {
    enable = false, -- you can't disable this
    useClassColors = {
        name = L["Use class color"],
        desc = L["Color health based on class."],
        type = "toggle", width = "double",
        order = 1,
        get = function()
            return PlexusStatusHealth.db.profile.unit_health.useClassColors
        end,
        set = function(_, v)
            PlexusStatusHealth.db.profile.unit_health.useClassColors = v
            PlexusStatusHealth:UpdateAllUnits()
        end,
    },
    enableupdateFrequency = {
        name = "Enable Custom Health Update Interval",
        desc = "Enable Use of Update Frequency Setting",
        type = "toggle", width = "double",
        order = 100,
        get = function()
            return PlexusStatusHealth.db.profile.unit_health.enableupdateFrequency
        end,
        set = function(_, v)
            PlexusStatusHealth.db.profile.unit_health.enableupdateFrequency = v
            PlexusStatusHealth:UpdateAllUnits()
        end,
    },
    updateFrequency = {
        name = "Update Frequency (Note setting this too low can hurt performance)",
        desc = "How often unit health will update in seconds",
        type = "range", min = 0.01, max = 1, step = 0.01,
        order = 200,
        hidden = function()
            return not PlexusStatusHealth.db.profile.unit_health.enableupdateFrequency
        end,
        get = function()
            return PlexusStatusHealth.db.profile.unit_health.updateFrequency
        end,
        set = function(_, v)
            PlexusStatusHealth.db.profile.unit_health.updateFrequency = v
            PlexusStatusHealth:UpdateAllUnits()
        end,
    },
}

local healthDeficitOptions = {
    threshold = {
        name = L["Health threshold"],
        desc = L["Only show deficit above % damage."],
        type = "range", min = 0, max = 100, step = 1, width = "double",
        get = function()
            return PlexusStatusHealth.db.profile.unit_healthDeficit.threshold
        end,
        set = function(_, v)
            PlexusStatusHealth.db.profile.unit_healthDeficit.threshold = v
            PlexusStatusHealth:UpdateAllUnits()
        end,
    },
    useClassColors = {
        name = L["Use class color"],
        desc = L["Color deficit based on class."],
        type = "toggle", width = "double",
        get = function()
            return PlexusStatusHealth.db.profile.unit_healthDeficit.useClassColors
        end,
        set = function(_, v)
            PlexusStatusHealth.db.profile.unit_healthDeficit.useClassColors = v
            PlexusStatusHealth:UpdateAllUnits()
        end,
    },
}

local low_healthOptions = {
    threshold = {
        name = L["Low HP threshold"],
        desc = L["Set the HP % for the low HP warning."],
        type = "range", min = 0, max = 100, step = 1, width = "double",
        get = function()
            return PlexusStatusHealth.db.profile.alert_lowHealth.threshold
        end,
        set = function(_, v)
            PlexusStatusHealth.db.profile.alert_lowHealth.threshold = v
            PlexusStatusHealth:UpdateAllUnits()
        end,
    },
}

function PlexusStatusHealth:PostInitialize()
    self:RegisterStatus("unit_health", L["Unit health"], healthOptions)
    self:RegisterStatus("unit_healthDeficit", L["Health deficit"], healthDeficitOptions)
    self:RegisterStatus("alert_lowHealth", L["Low HP warning"], low_healthOptions)
    self:RegisterStatus("alert_death", L["Death warning"], nil, true)
    self:RegisterStatus("alert_feignDeath", L["Feign Death warning"], nil, true)
    self:RegisterStatus("alert_offline", L["Offline warning"], nil, true)
end

-- you can't disable the unit_health status, so no need to ever unregister
function PlexusStatusHealth:PostEnable()
    self:RegisterMessage("Plexus_UnitJoined")

    self:RegisterEvent("UNIT_AURA", "UpdateUnit")
    self:RegisterEvent("UNIT_CONNECTION", "UpdateUnit")
    self:RegisterEvent("UNIT_HEALTH", "UpdateUnit")
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "CLEU")
    if Plexus:IsClassicWow() then
        self:RegisterEvent("UNIT_HEALTH_FREQUENT", "UpdateUnit")
    end
    self:RegisterEvent("UNIT_MAXHEALTH", "UpdateUnit")
    self:RegisterEvent("UNIT_NAME_UPDATE", "UpdateUnit")

    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
    self:RegisterEvent("GROUP_ROSTER_UPDATE", "UpdateAllUnits")

    self:RegisterMessage("Plexus_ColorsChanged", "UpdateAllUnits")
end

function PlexusStatusHealth:OnStatusEnable()
    self:UpdateAllUnits()
    if self.db.profile.unit_health.enableupdateFrequency then
        self.timer = self:ScheduleRepeatingTimer("FrequentHealth", self.db.profile.unit_health.updateFrequency)
    end
end

function PlexusStatusHealth:OnStatusDisable(status)
    self.core:SendStatusLostAllUnits(status)
end

function PlexusStatusHealth:CLEU()
    local _, eventType, _, _, _, _, _, destGUID, _, _, _, _, _, _ = CombatLogGetCurrentEventInfo()
    --self:Debug("Unit Died: ", sourceGUID)
    if eventType == "UNIT_DIED" then
        if not PlexusRoster:IsGUIDInGroup(destGUID) then
            --print(sourceGUID)
            return
        end
        --print("timestamp: ", timestamp, "eventType: ", eventType, "sourceGUID: ", sourceGUID, "sourceName: ", sourceName, "destGUID: ", destGUID, "spellId: ", spellId, "spellName: ", spellName)
        self:StatusDeath(destGUID, true)
    end
end

function PlexusStatusHealth:UpdateAllUnits()
    if (self.timer and not self.db.profile.unit_health.enableupdateFrequency) then
        self:Debug("have timer but not enabled")
        self:CancelTimer(self.timer)
    end
    if (not self.timer and self.db.profile.unit_health.enableupdateFrequency) then
        self:Debug("no timer but enabled")
        self.timer = self:ScheduleRepeatingTimer("FrequentHealth", self.db.profile.unit_health.updateFrequency)
    end
    for guid, unitid in PlexusRoster:IterateRoster() do
        self:Plexus_UnitJoined("UpdateAllUnits", guid, unitid)
    end
end

function PlexusStatusHealth:Plexus_UnitJoined(event, guid, unitid)
    self:Debug("Plexus_UnitJoined guid: ", guid)
    if unitid then
        self:UpdateUnit(event, unitid, true)
        self:UpdateUnit(event, unitid)
    end
end

function PlexusStatusHealth:UpdateUnit(event, unitid, ignoreRange)
    self:Debug("UpdateUnit Event: ", event)
    if not unitid then
        -- 7.1: UNIT_HEALTH and UNIT_MAXHEALTH sometimes fire with no unit token
        -- https://wow.curseforge.com/addons/plexus/tickets/859
        return
    end

    local guid = UnitGUID(unitid)

    if not PlexusRoster:IsGUIDInRaid(guid) then
        return
    end

    local cur, max = UnitHealth(unitid), UnitHealthMax(unitid)
    if max == 0 then
        -- fix for 4.3 division by zero
        cur, max = 100, 100
    end

    local healthSettings = self.db.profile.unit_health
    local deficitSettings = self.db.profile.unit_healthDeficit
    local healthPriority = healthSettings.priority
    local deficitPriority = deficitSettings.priority

    if UnitIsDeadOrGhost(unitid) then
        self:StatusDeath(guid, true)
        self:StatusFeignDeath(guid, false)
        self:StatusLowHealth(guid, false)
        if healthSettings.deadAsFullHealth then
            cur = max
        end
    else
        self:StatusDeath(guid, false)
        self:StatusFeignDeath(guid, UnitIsFeignDeath(unitid))
        self:StatusLowHealth(guid, (cur / max * 100) <= self.db.profile.alert_lowHealth.threshold)
    end

    self:StatusOffline(guid, not UnitIsConnected(unitid))

    local healthText
    local deficitText

    if cur < max then
        if cur > 999 then
            healthText = format("%.1fk", cur / 1000)
        else
            healthText = format("%d", cur)
        end

        local deficit = max - cur
        if deficit > 999 then
            deficitText = format("-%.1fk", deficit / 1000)
        else
            deficitText = format("-%d", deficit)
        end
    else
        healthPriority = 1
        deficitPriority = 1
    end

    if (cur / max * 100) <= deficitSettings.threshold then
        self.core:SendStatusGained(guid, "unit_healthDeficit",
            deficitPriority,
            deficitSettings.range,
            (deficitSettings.useClassColors and self.core:UnitColor(guid) or deficitSettings.color),
            deficitText,
            cur,
            max,
            deficitSettings.icon)
    else
        self.core:SendStatusLost(guid, "unit_healthDeficit")
    end

    self.core:SendStatusGained(guid, "unit_health",
        healthPriority,
        (not ignoreRange and healthSettings.range),
        (healthSettings.useClassColors and self.core:UnitColor(guid) or healthSettings.color),
        healthText,
        cur,
        max,
        healthSettings.icon)
end

function PlexusStatusHealth:FrequentHealth()
    if self.db.profile.unit_health.enableupdateFrequency then
        self:UpdateAllUnits()
    end
end

function PlexusStatusHealth:IsLowHealth(cur, max)
    return (cur / max * 100) <= self.db.profile.alert_lowHealth.threshold
end

function PlexusStatusHealth:StatusLowHealth(guid, gained)
    local settings = self.db.profile.alert_lowHealth

    -- return if this option isn't enabled
    if not settings.enable then return end

    if gained then
        self.core:SendStatusGained(guid, "alert_lowHealth",
            settings.priority,
            settings.range,
            settings.color,
            settings.text,
            nil,
            nil,
            settings.icon)
    else
        self.core:SendStatusLost(guid, "alert_lowHealth")
    end
end

function PlexusStatusHealth:StatusDeath(guid, gained)
    local settings = self.db.profile.alert_death

    if not guid then return end

    -- return if this option isnt enabled
    if not settings.enable then return end

    if gained then
        -- trigger death event for other modules as wow isnt firing a death event
        self:SendMessage("Plexus_UnitDeath", guid)
        self.core:SendStatusGained(guid, "alert_death",
            settings.priority,
            settings.range,
            settings.color,
            settings.text,
            (self.db.profile.unit_health.deadAsFullHealth and 100 or 0),
            100,
            settings.icon)
    else
        self.core:SendStatusLost(guid, "alert_death")
    end
end

function PlexusStatusHealth:StatusFeignDeath(guid, gained)
    local settings = self.db.profile.alert_feignDeath

    -- return if this option isnt enabled
    if not settings.enable then return end

    if gained then
        self.core:SendStatusGained(guid, "alert_feignDeath",
            settings.priority,
            settings.range,
            settings.color,
            settings.text,
            (self.db.profile.unit_health.deadAsFullHealth and 100 or 0),
            100,
            settings.icon)
    else
        self.core:SendStatusLost(guid, "alert_feignDeath")
    end
end

function PlexusStatusHealth:StatusOffline(guid, gained)
    local settings = self.db.profile.alert_offline

    if not guid then return end

    if gained then
        -- trigger offline event for other modules
        self:SendMessage("Plexus_UnitOffline", guid)
        self.core:SendStatusGained(guid, "alert_offline",
            settings.priority,
            settings.range,
            settings.color,
            settings.text,
            nil,
            nil,
            settings.icon)
    else
        self.core:SendStatusLost(guid, "alert_offline")
    end
end
