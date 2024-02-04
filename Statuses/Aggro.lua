--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Aggro.lua
    Plexus status module for aggro/threat.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local GetThreatStatusColor
if Plexus:IsRetailWow() then
    GetThreatStatusColor = _G.GetThreatStatusColor
end
local UnitGUID = _G.UnitGUID
local UnitIsVisible = _G.UnitIsVisible
local UnitThreatSituation = _G.UnitThreatSituation
local UnitGroupRolesAssigned = _G.UnitGroupRolesAssigned

local PlexusStatus = Plexus:GetModule("PlexusStatus")
local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusAggro = Plexus:NewStatusModule("PlexusStatusAggro")
PlexusStatusAggro.menuName = L["Aggro"]

local function getthreatcolor(status)
    if Plexus:IsRetailWow() then
        local r, g, b = GetThreatStatusColor(status)
        return { r = r, g = g, b = b, a = 1 }
    end
    if Plexus:IsClassicWow() or Plexus:IsTBCWow() then
        if status == 1 then
            return { r = 0, g = 0, b = 0, a = 0 }
        end
        if status == 2 then
            return { r = 255, g = 255, b = 0, a = 1 }
        end
        if status == 3 then
            return { r = 1, g = 0, b = 0, a = 1 }
        end
    end
end

PlexusStatusAggro.defaultDB = {
    alert_aggro = {
        text =  L["Aggro"],
        enable = true,
        color = { r = 1, g = 0, b = 0, a = 1 },
        priority = 75,
        range = false,
        threat = false,
        onlyastank = false,
        hideontanks = false,
        threatcolors = {
            [1] = getthreatcolor(1),
            [2] = getthreatcolor(2),
            [3] = getthreatcolor(3),
        },
        threattexts = {
            [1] = L["High"],
            [2] = L["Aggro"],
            [3] = L["Tank"]
        },
    },
}

PlexusStatusAggro.options = false

local function getstatuscolor(status)
    local color = PlexusStatusAggro.db.profile.alert_aggro.threatcolors[status]
    return color.r, color.g, color.b, color.a
end

local function setstatuscolor(status, r, g, b, a)
    local color = PlexusStatusAggro.db.profile.alert_aggro.threatcolors[status]
    color.r = r
    color.g = g
    color.b = b
    color.a = a or 1
end

local aggroDynamicOptions = {
    ["threat_colors"] = {
        type = "group",
        dialogInline = true,
        name = L["Color"],
        order = 87,
        args = {
            ["1"] = {
                type = "color",
                name = L["High Threat"],
                order = 100,
                width = "double",
                hasAlpha = true,
                get = function() return getstatuscolor(1) end,
                set = function(_, r, g, b, a) setstatuscolor(1, r, g, b, a) end,
            },
            ["2"] = {
                type = "color",
                name = L["Aggro"],
                order = 101,
                width = "double",
                hasAlpha = true,
                get = function() return getstatuscolor(2) end,
                set = function(_, r, g, b, a) setstatuscolor(2, r, g, b, a) end,
            },
            ["3"] = {
                type = "color",
                name = L["Tanking"],
                order = 102,
                width = "double",
                hasAlpha = true,
                get = function() return getstatuscolor(3) end,
                set = function(_, r, g, b, a) setstatuscolor(3, r, g, b, a) end,
            },
        },
    },
}

local function setupmenu()
    local args = PlexusStatus.options.args["alert_aggro"].args
    local threat = PlexusStatusAggro.db.profile.alert_aggro.threat

    if not aggroDynamicOptions.aggroColor then
        aggroDynamicOptions.aggroColor = args.color
    end

    if threat then
        args.color = nil
        args.threat_colors = aggroDynamicOptions.threat_colors
    else
        args.color = aggroDynamicOptions.aggroColor
        args.threat_colors = nil
    end
end

local aggroOptions = {
    threat = {
        type = "toggle",
        name = L["Threat levels"],
        desc = L["Show more detailed threat levels."],
        order = 102,
        get = function() return PlexusStatusAggro.db.profile.alert_aggro.threat end,
        set = function()
            PlexusStatusAggro.db.profile.alert_aggro.threat = not PlexusStatusAggro.db.profile.alert_aggro.threat
            PlexusStatusAggro.UpdateAllUnits(PlexusStatusAggro)
            setupmenu()
        end,
    },
    onlyastank = {
        type = "toggle",
        name = L["Only as Tank"],
        desc = L["Only show when you're a Tank."],
        order = 100,
        get = function() return PlexusStatusAggro.db.profile.alert_aggro.onlyastank end,
        set = function()
            PlexusStatusAggro.db.profile.alert_aggro.onlyastank = not PlexusStatusAggro.db.profile.alert_aggro.onlyastank
            PlexusStatusAggro.UpdateAllUnits(PlexusStatusAggro)
            setupmenu()
        end,
    },
    hideontanks = {
        type = "toggle",
        name = L["Hide on Tanks"],
        desc = L["Hide threat status of Tanks."],
        order = 101,
        get = function() return PlexusStatusAggro.db.profile.alert_aggro.hideontanks end,
        set = function()
            PlexusStatusAggro.db.profile.alert_aggro.hideontanks = not PlexusStatusAggro.db.profile.alert_aggro.hideontanks
            PlexusStatusAggro.UpdateAllUnits(PlexusStatusAggro)
            setupmenu()
        end,
    },
}

function PlexusStatusAggro:PostInitialize()
    self:RegisterStatus("alert_aggro", L["Aggro"], aggroOptions, true)
    setupmenu()
end

function PlexusStatusAggro:OnStatusEnable(status)
    if status == "alert_aggro" then
        self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", "UpdateUnit")
        self:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED", "UpdateAllUnits")
        self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
        self:UpdateAllUnits()
    end
end

function PlexusStatusAggro:OnStatusDisable(status)
    if status == "alert_aggro" then
        self:UnregisterEvent("UNIT_THREAT_SITUATION_UPDATE")
        self:UnregisterEvent("PLAYER_SPECIALIZATION_CHANGED")
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        self.core:SendStatusLostAllUnits("alert_aggro")
    end
end

function PlexusStatusAggro:PostReset() --luacheck: ignore 212
    setupmenu()
end

function PlexusStatusAggro:UpdateAllUnits()
    for _, unit in PlexusRoster:IterateRoster() do
        self:UpdateUnit("UpdateAllUnits", unit)
    end
end
function PlexusStatusAggro:UNIT_COMBAT_A(event, unitTarget)
    self:UpdateUnit(event, unitTarget)
end

------------------------------------------------------------------------

function PlexusStatusAggro:UpdateUnit(event, unit, guid)
    self:Debug("UpdateUnit Event", event)
    if not guid then
        guid = UnitGUID(unit)
    end
    if not guid or not PlexusRoster:IsGUIDInRaid(guid) then return end -- sometimes unit can be nil or invalid, wtf?

    local settings = self.db.profile.alert_aggro
    local threat = settings.threat
    local onlyastank = settings.onlyastank
    local hideontanks = settings.hideontanks
    local status = UnitIsVisible(unit) and UnitThreatSituation(unit) or 0

    if  (not onlyastank or UnitGroupRolesAssigned("player") == 'TANK')
    and (not hideontanks or UnitGroupRolesAssigned(unit) ~= 'TANK')
    and status and ((threat and (status > 0)) or (status > 1)) then
        PlexusStatusAggro.core:SendStatusGained(guid, "alert_aggro", settings.priority, settings.range,
            (threat and settings.threatcolors[status] or settings.color),
            (threat and settings.threattexts[status] or settings.text),
                                                nil, nil, settings.icon)
    else
        PlexusStatusAggro.core:SendStatusLost(guid, "alert_aggro")
    end
end
