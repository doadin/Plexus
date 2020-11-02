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
local PlexusFrame = Plexus:GetModule("PlexusFrame")

local PlexusStatusPhase = Plexus:NewStatusModule("PlexusStatusPhase")
PlexusStatusPhase.menuName = L["Phase Status"]

PlexusStatusPhase.defaultDB = {
    phase_status = {
        enable = true,
        priority = 65,
        delay = 0,
        range = false,
        colors = {
            WAR_MODE = { r = 255, g = 0, b = 0, a = 1, ignore = true },
            CHROMIE_TIME = { r = 0, g = 0, b = 255, a = 1, ignore = true },
            PHASING = { r = 255, g = 255, b = 0, a = 1, ignore = true },
            SHARDING = { r = 255, g = 255, b = 0, a = 1, ignore = true },
            NORMAL = { r = 0, g = 255, b = 0, a = 1, ignore = true },
        },
        text = {
            WAR_MODE = L["WM"],
            CHROMIE_TIME = L["CT"],
            PHASING = L["PHASE"],
            SHARDING = L["SHARD"],
            NORMAL = L["N"],
        },
        icon = {
            ignoreColor = true,
            WAR_MODE = "Interface\\TargetingFrame\\UI-PhasingIcon",
            CHROMIE_TIME = "Interface\\TargetingFrame\\UI-PhasingIcon",
            PHASING = "Interface\\TargetingFrame\\UI-PhasingIcon",
            SHARDING = "Interface\\TargetingFrame\\UI-PhasingIcon",
            NORMAL = "Interface\\TargetingFrame\\UI-PhasingIcon",
        },
    },
}

PlexusStatusPhase.options = false

local function getstatuscolor(key)
    local color = PlexusStatusPhase.db.profile.phase_status.colors[key]
    return color.r, color.g, color.b, color.a
end

local function setstatuscolor(key, r, g, b, a)
    local color = PlexusStatusPhase.db.profile.phase_status.colors[key]
    local ignoreColor = PlexusStatusPhase.db.profile.phase_status.icon.ignoreColor
    color.r = r
    color.g = g
    color.b = b
    color.a = a or 1
    color.ignore = ignoreColor
    for _, frame in pairs(PlexusFrame.registeredFrames) do
        PlexusFrame:UpdateIndicators(frame)
    end
end

local function getignoreColor()
    local ignoreColor = PlexusStatusPhase.db.profile.phase_status.icon.ignoreColor
    return ignoreColor
end

local function setignoreColor()
    local ignoreColor = PlexusStatusPhase.db.profile.phase_status.icon.ignoreColor
    if ignoreColor == true then PlexusStatusPhase.db.profile.phase_status.icon.ignoreColor = false end
    if ignoreColor == false then PlexusStatusPhase.db.profile.phase_status.icon.ignoreColor = true end
    for k in pairs(PlexusStatusPhase.db.profile.phase_status.colors) do
        local r,g,b,a = getstatuscolor(k)
        setstatuscolor(k,r,g,b,a)
    end
    for _, frame in pairs(PlexusFrame.registeredFrames) do
        PlexusFrame:UpdateIndicators(frame)
    end
end

local phaseStatusOptions = {
    color = false,
    ["phase_icon"] = {
        type = "group",
        dialogInline = true,
        name = L["Icon"],
        order = 85,
        args = {
            ignoreColor = {
                name = L["Ignore Color On Icon"],
                order = 100,
                type = "toggle",
                get = getignoreColor,
                set = setignoreColor,
            },
        },
    },
    ["phase_colors"] = {
        type = "group",
        dialogInline = true,
        name = L["Color"],
        order = 86,
        args = {
            WAR_MODE = {
                name = L["War Mode Phased"],
                order = 100,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("WAR_MODE") end,
                set = function(_, r, g, b, a) setstatuscolor("WAR_MODE", r, g, b, a) end,
            },
            CHROMIE_TIME = {
                name = L["Chromie Time Phased"],
                order = 100,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("CHROMIE_TIME") end,
                set = function(_, r, g, b, a) setstatuscolor("CHROMIE_TIME", r, g, b, a) end,
            },
            PHASING = {
                name = L["Different Phase"],
                order = 100,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("PHASING") end,
                set = function(_, r, g, b, a) setstatuscolor("PHASING", r, g, b, a) end,
            },
            SHARDING = {
                name = L["Different Shard"],
                order = 100,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("SHARDING") end,
                set = function(_, r, g, b, a) setstatuscolor("SHARDING", r, g, b, a) end,
            },
            NORMAL = {
                name = L["Not Phased"],
                order = 100,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("NORMAL") end,
                set = function(_, r, g, b, a) setstatuscolor("NORMAL", r, g, b, a) end,
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

    self.core:SendStatusLostAllUnits("phase_status")
end

function PlexusStatusPhase:GainStatus(guid, key, settings)
    self.core:SendStatusGained(guid, "phase_status",
        settings.priority,
        nil,
        settings.colors[key],
        settings.text[key],
        nil,
        nil,
        settings.icon[key],
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
    local reason = UnitPhaseReason(unitid)
    local key
	if reason == Enum.PhaseReason.WarMode then
		key = "WAR_MODE"
	elseif reason == Enum.PhaseReason.ChromieTime then
		key = "CHROMIE_TIME"
	elseif reason == Enum.PhaseReason.Phasing then
		key = "PHASING"
	elseif reason == Enum.PhaseReason.Sharding then
		key = "SHARDING"
    elseif not reason then
        key = "NORMAL"
		self.core:SendStatusLost(guid, "phase_status")
	end
    if reason then
        local settings = self.db.profile.phase_status
        self:GainStatus(guid, key, settings)
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
