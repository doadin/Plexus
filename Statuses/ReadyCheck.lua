--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    ReadyCheck.lua
    Plexus status module for ready check responses.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusReadyCheck = Plexus:NewStatusModule("PlexusStatusReadyCheck", "AceTimer-3.0")
PlexusStatusReadyCheck.menuName = L["Ready Check"]
local READY_CHECK_WAITING_TEXTURE
local READY_CHECK_READY_TEXTURE
local READY_CHECK_NOT_READY_TEXTURE
local READY_CHECK_AFK_TEXTURE
READY_CHECK_WAITING_TEXTURE = "Interface\\RaidFrame\\ReadyCheck-Waiting";
READY_CHECK_READY_TEXTURE = "Interface\\RaidFrame\\ReadyCheck-Ready";
READY_CHECK_NOT_READY_TEXTURE = "Interface\\RaidFrame\\ReadyCheck-NotReady";
READY_CHECK_AFK_TEXTURE = "Interface\\RaidFrame\\ReadyCheck-NotReady";

PlexusStatusReadyCheck.defaultDB = {
    ready_check = {
        text = L["Ready Check"],
        enable = true,
        color = { r = 1, g = 1, b = 1, a = 1 },
        priority = 95,
        delay = 5,
        range = false,
        colors = {
            waiting = { r = 1, g = 1, b = 0, a = 1, ignore = true },
            ready = { r = 0, g = 1, b = 0, a = 1, ignore = true },
            notready = { r = 1, g = 0, b = 0, a = 1, ignore = true },
            afk = { r = 1, g = 0, b = 0, a = 1, ignore = true }
        },
    },
}

PlexusStatusReadyCheck.options = false

local readystatus = {
    waiting = {
        text = L["?"],
        icon = READY_CHECK_WAITING_TEXTURE
    },
    ready = {
        text = L["R"],
        icon = READY_CHECK_READY_TEXTURE
    },
    notready = {
        text = L["X"],
        icon = READY_CHECK_NOT_READY_TEXTURE
    },
    afk = {
        text = L["AFK"],
        icon = READY_CHECK_AFK_TEXTURE
    },
}

local function getstatuscolor(key)
    local color = PlexusStatusReadyCheck.db.profile.ready_check.colors[key]
    return color.r, color.g, color.b, color.a
end

local function setstatuscolor(key, r, g, b, a)
    local color = PlexusStatusReadyCheck.db.profile.ready_check.colors[key]
    color.r = r
    color.g = g
    color.b = b
    color.a = a or 1
    color.ignore = true
end

local readyCheckOptions = {
    color = false,
    ["ready_colors"] = {
        type = "group",
        dialogInline = true,
        name = L["Color"],
        order = 86,
        args = {
            waiting = {
                name = L["Waiting"],
                order = 100,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("waiting") end,
                set = function(_, r, g, b, a) setstatuscolor("waiting", r, g, b, a) end,
            },
            ready = {
                name = L["Ready"],
                order = 101,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("ready") end,
                set = function(_, r, g, b, a) setstatuscolor("ready", r, g, b, a) end,
            },
            notready = {
                name = L["Not Ready"],
                order = 102,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("notready") end,
                set = function(_, r, g, b, a) setstatuscolor("notready", r, g, b, a) end,
            },
            afk = {
                name = L["AFK"],
                order = 103,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("afk") end,
                set = function(_, r, g, b, a) setstatuscolor("afk", r, g, b, a) end,
            },
        },
    },
    delay = {
        name = L["Delay"],
        desc = L["Set the delay until ready check results are cleared."],
        width = "double",
        type = "range", min = 0, max = 10, step = 1,
        get = function()
            return PlexusStatusReadyCheck.db.profile.ready_check.delay
        end,
        set = function(_, v)
            PlexusStatusReadyCheck.db.profile.ready_check.delay = v
        end,
    },
}

function PlexusStatusReadyCheck:PostInitialize()
    self:RegisterStatus("ready_check", L["Ready Check"], readyCheckOptions, true)
end

function PlexusStatusReadyCheck:OnStatusEnable(status)
    if status ~= "ready_check" then return end

    self:RegisterEvent("READY_CHECK")
    self:RegisterEvent("READY_CHECK_CONFIRM")
    self:RegisterEvent("READY_CHECK_FINISHED")
    self:RegisterEvent("GROUP_ROSTER_UPDATE", "GroupChanged")
    self:RegisterMessage("Plexus_UnitJoined")
end

function PlexusStatusReadyCheck:OnStatusDisable(status)
    if status ~= "ready_check" then return end

    self:UnregisterEvent("READY_CHECK")
    self:UnregisterEvent("READY_CHECK_CONFIRM")
    self:UnregisterEvent("READY_CHECK_FINISHED")
    self:UnregisterEvent("GROUP_ROSTER_UPDATE")
    self:UnregisterMessage("Plexus_UnitJoined")

    self:StopTimer("ClearStatus")
    self.core:SendStatusLostAllUnits("ready_check")
end

function PlexusStatusReadyCheck:GainStatus(guid, key, settings)
    local status = readystatus[key]
    self.core:SendStatusGained(guid, "ready_check",
        settings.priority,
        nil,
        settings.colors[key],
        status.text,
        nil,
        nil,
        status.icon)
end

function PlexusStatusReadyCheck:UpdateAllUnits()
    if GetReadyCheckStatus("player") then
        for _, unitid in PlexusRoster:IterateRoster() do
            self:UpdateUnit(unitid)
        end
    else
        self:StopTimer("ClearStatus")
        self.core:SendStatusLostAllUnits("ready_check")
    end
end

function PlexusStatusReadyCheck:UpdateUnit(unitid)
    local guid = UnitGUID(unitid)
    local key = GetReadyCheckStatus(unitid)
    if key then
        local settings = self.db.profile.ready_check
        self:GainStatus(guid, key, settings)
    else
        self.core:SendStatusLost(guid, "ready_check")
    end
end

function PlexusStatusReadyCheck:READY_CHECK()
    if self.db.profile.ready_check.enable then
        self:StopTimer("ClearStatus")
        self:UpdateAllUnits()
    end
end

function PlexusStatusReadyCheck:READY_CHECK_CONFIRM(event, unitid)
    self:Debug("READY_CHECK_CONFIRM event: ", event)
    if unitid and self.db.profile.ready_check.enable then
        self:UpdateUnit(unitid)
    end
end

function PlexusStatusReadyCheck:READY_CHECK_FINISHED()
    local settings = self.db.profile.ready_check
    if settings.enable then
        local afk = {}
        for guid, _, statusTbl in self.core:CachedStatusIterator("ready_check") do
            if statusTbl.texture == READY_CHECK_WAITING_TEXTURE then
                afk[guid] = true
            end
        end
        for guid in pairs(afk) do
            self:GainStatus(guid, "afk", settings)
        end
        self:StartTimer("ClearStatus", settings.delay or 0)
    end
end

function PlexusStatusReadyCheck:GroupChanged()
    if self.db.profile.ready_check.enable then
        self:UpdateAllUnits()
    end
end

function PlexusStatusReadyCheck:Plexus_UnitJoined(event, guid, unitid)
    self:Debug("Plexus_UnitJoined event: ", event)
    self:Debug("Plexus_UnitJoined guid: ", guid)
    if unitid and self.db.profile.ready_check.enable then
        self:UpdateUnit(unitid)
    end
end

function PlexusStatusReadyCheck:ClearStatus()
    self.core:SendStatusLostAllUnits("ready_check")
end
