--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Phase.lua
    Plexus status module for phase status pending accepted and denied.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusPhase = Plexus:NewStatusModule("PlexusStatusPhase", "AceTimer-3.0")
PlexusStatusPhase.menuName = L["Phase Status"]

PlexusStatusPhase.defaultDB = {
    phase_status = {
        text = L["Phase Status"],
        enable = true,
        color = { r = 1, g = 1, b = 1, a = 1 },
        priority = 65,
        delay = 0,
        range = false,
        colors = {
            OUT_PHASE = { r = 255, g = 255, b = 0, a = 1, ignore = true },
        },
    },
}

PlexusStatusPhase.options = false

local phasestatus = {
    OUT_PHASE = {
        text = L["?"],
        icon = "Interface\\TargetingFrame\\UI-PhasingIcon"
    },
}

local function getstatuscolor(key)
    local color = PlexusStatusPhase.db.profile.phase_status.colors[key]
    return color.r, color.g, color.b, color.a
end

local function setstatuscolor(key, r, g, b, a)
    local color = PlexusStatusPhase.db.profile.phase_status.colors[key]
    color.r = r
    color.g = g
    color.b = b
    color.a = a or 1
    color.ignore = true
end

local phaseStatusOptions = {
    color = false,
    ["phase_colors"] = {
        type = "group",
        dialogInline = true,
        name = L["Color"],
        order = 86,
        args = {
            OUT_PHASE = {
                name = L["Different Phase"],
                order = 100,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("OUT_PHASE") end,
                set = function(_, r, g, b, a) setstatuscolor("OUT_PHASE", r, g, b, a) end,
            },
        },
    },
}

function PlexusStatusPhase:PostInitialize()
    self:RegisterStatus("phase_status", L["Phase Status"], phaseStatusOptions, true)
end

function PlexusStatusPhase:OnStatusEnable(status)
    if status ~= "phase_status" then return end

    self:RegisterEvent("UNIT_PHASE")
    self:RegisterEvent("GROUP_ROSTER_UPDATE", "GroupChanged")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "GroupChanged")
    self:RegisterMessage("Plexus_PartyTransition", "GroupChanged")
    self:RegisterMessage("Plexus_UnitJoined")
end

function PlexusStatusPhase:OnStatusDisable(status)
    if status ~= "phase_status" then return end

    self:UnregisterEvent("UNIT_PHASE")
    self:UnregisterEvent("GROUP_ROSTER_UPDATE")
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    self:UnregisterMessage("Plexus_PartyTransition")
    self:UnregisterMessage("Plexus_UnitJoined")

    self:StopTimer("ClearStatus")
    self.core:SendStatusLostAllUnits("phase_status")
end

function PlexusStatusPhase:GainStatus(guid, key, settings)
    local status = phasestatus[key]
    self.core:SendStatusGained(guid, "phase_status",
        settings.priority,
        nil,
        settings.colors[key],
        status.text,
        nil,
        nil,
        status.icon,
        nil,
        nil,
        nil,
        {left = 0.25, right = 0.75, top = 0.25, bottom = 0.75}
    )
end

function PlexusStatusPhase:UpdateAllUnits()
    for _, unitid in PlexusRoster:IterateRoster() do
        self:UpdateUnit(unitid)
    end
end

function PlexusStatusPhase:UpdateUnit(unitid)
    local guid = UnitGUID(unitid)
    local _, _, _, wowtocversion = GetBuildInfo()
    local isInSamePhase
    if (wowtocversion > 90000) then
        isInSamePhase = not UnitPhaseReason(unitid)
    else
        isInSamePhase = UnitInPhase(unitid) and not UnitIsWarModePhased(unitid)
    end
    if not isInSamePhase then
        local key = "OUT_PHASE"
        local settings = self.db.profile.phase_status
        self:GainStatus(guid, key, settings)
    else
        self.core:SendStatusLost(guid, "phase_status")
    end
end

function PlexusStatusPhase:UNIT_PHASE(event, unitid)
    self:Debug("UNIT_PHASE event: ", event)
    if unitid and self.db.profile.phase_status.enable then
        self:UpdateUnit(unitid)
    end
end

function PlexusStatusPhase:GroupChanged()
    if self.db.profile.phase_status.enable then
        self:UpdateAllUnits()
    end
end

function PlexusStatusPhase:Plexus_UnitJoined(event, guid, unitid)
    if (not event) or (not guid) or (not unitid) then return end
    self:Debug("Plexus_UnitJoined event: ", event)
    self:Debug("Plexus_UnitJoined guid: ", guid)
    if unitid and self.db.profile.phase_status.enable then
        self:UpdateUnit(unitid)
    end
end

function PlexusStatusPhase:ClearStatus()
    self.core:SendStatusLostAllUnits("phase_status")
end
