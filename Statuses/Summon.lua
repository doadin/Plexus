--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Summon.lua
    Plexus status module for summon status pending accepted and denied.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local C_IncomingSummon = C_IncomingSummon
local GetTime = GetTime
local UnitGUID = UnitGUID

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusSummon = Plexus:NewStatusModule("PlexusStatusSummon", "AceTimer-3.0")
PlexusStatusSummon.menuName = L["Summon Status"]

--local SUMMON_STATUS_NONE = Enum.SummonStatus.None or 0
--local SUMMON_STATUS_PENDING = Enum.SummonStatus.Pending or 1
--local SUMMON_STATUS_ACCEPTED = Enum.SummonStatus.Accepted or 2
--local SUMMON_STATUS_DECLINED = Enum.SummonStatus.Declined or 3

PlexusStatusSummon.defaultDB = {
    summon_status = {
        text = L["Summon Status"],
        enable = true,
        color = { r = 1, g = 1, b = 1, a = 1 },
        priority = 70,
        delay = 5,
        range = false,
        colors = {
            SUMMON_STATUS_PENDING = { r = 255, g = 255, b = 0, a = 1, ignore = true },
            SUMMON_STATUS_ACCEPTED = { r = 0, g = 255, b = 0, a = 1, ignore = true },
            SUMMON_STATUS_DECLINED = { r = 1, g = 0, b = 0, a = 1, ignore = true }
        },
    },
}

PlexusStatusSummon.options = false

local summonstatus = {
    SUMMON_STATUS_PENDING = {
        text = L["?"],
        icon = "Interface\\RaidFrame\\Raid-Icon-SummonPending"
    },
    SUMMON_STATUS_ACCEPTED = {
        text = L["A"],
        icon = "Interface\\RaidFrame\\Raid-Icon-SummonAccepted"
    },
    SUMMON_STATUS_DECLINED = {
        text = L["X"],
        icon = "Interface\\RaidFrame\\Raid-Icon-SummonDeclined"
    },
}

local function getstatuscolor(key)
    local color = PlexusStatusSummon.db.profile.summon_status.colors[key]
    return color.r, color.g, color.b, color.a
end

local function setstatuscolor(key, r, g, b, a)
    local color = PlexusStatusSummon.db.profile.summon_status.colors[key]
    color.r = r
    color.g = g
    color.b = b
    color.a = a or 1
    color.ignore = true
end

local summonStatusOptions = {
    color = false,
    ["summon_colors"] = {
        type = "group",
        dialogInline = true,
        name = L["Color"],
        order = 86,
        args = {
            SUMMON_STATUS_PENDING = {
                name = L["Summon Pending"],
                order = 100,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("SUMMON_STATUS_PENDING") end,
                set = function(_, r, g, b, a) setstatuscolor("SUMMON_STATUS_PENDING", r, g, b, a) end,
            },
            SUMMON_STATUS_ACCEPTED = {
                name = L["Summon Accepted"],
                order = 101,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("SUMMON_STATUS_ACCEPTED") end,
                set = function(_, r, g, b, a) setstatuscolor("SUMMON_STATUS_ACCEPTED", r, g, b, a) end,
            },
            SUMMON_STATUS_DECLINED = {
                name = L["Summon Declined"],
                order = 102,
                type = "color",
                hasAlpha = true,
                get = function() return getstatuscolor("SUMMON_STATUS_DECLINED") end,
                set = function(_, r, g, b, a) setstatuscolor("SUMMON_STATUS_DECLINED", r, g, b, a) end,
            },
        },
    },
    delay = {
        name = L["Delay"],
        desc = L["Set the delay until summon results are cleared."],
        width = "double",
        type = "range", min = 0, max = 5, step = 1,
        get = function()
            return PlexusStatusSummon.db.profile.summon_status.delay
        end,
        set = function(_, v)
            PlexusStatusSummon.db.profile.summon_status.delay = v
        end,
    },
}

function PlexusStatusSummon:PostInitialize()
    self:RegisterStatus("summon_status", L["Summon Status"], summonStatusOptions, true)
end

function PlexusStatusSummon:OnStatusEnable(status)
    if status ~= "summon_status" then return end

    self:RegisterEvent("INCOMING_SUMMON_CHANGED")
    self:RegisterEvent("LOADING_SCREEN_DISABLED", "UpdateAllUnits")
end

function PlexusStatusSummon:OnStatusDisable(status)
    if status ~= "summon_status" then return end

    self:UnregisterEvent("INCOMING_SUMMON_CHANGED")
    self:UnregisterEvent("LOADING_SCREEN_DISABLED")

    self.core:SendStatusLostAllUnits("summon_status")
end

function PlexusStatusSummon:GainStatus(guid, key, settings, start)
    local status = summonstatus[key]
    local duration
    if key == "SUMMON_STATUS_PENDING" then
        duration = 120
    elseif key == "SUMMON_STATUS_ACCEPTED" then
        duration = PlexusStatusSummon.db.profile.summon_status.delay
    elseif key == "SUMMON_STATUS_DECLINED" then
        duration = PlexusStatusSummon.db.profile.summon_status.delay
    end
    self.core:SendStatusGained(guid, "summon_status",
        settings.priority,
        nil,
        settings.colors[key],
        status.text,
        nil,
        nil,
        status.icon,
        start,
        duration,
        nil,
        {left = 0.25, right = 0.85, top = 0.25, bottom = 0.85}
    )
end
--smaller { left = 0.06, right = 0.94, top = 0.06, bottom = 0.94 }
--bigger {left = 0.15625, right = 0.84375, top = 0.15625, bottom = 0.84375}
--better {left = 0.3, right = 0.7, top = 0.3, bottom = 0.7}

function PlexusStatusSummon:UpdateAllUnits()
    -- As long as a unit has a summon keep checking
    --for every units that doesnt have a summon clear summon
    --if no units have summon cancel timer
    --local unithassummon
    for guid, unitid in PlexusRoster:IterateRoster() do
        --if C_IncomingSummon.HasIncomingSummon(unitid) then
        --    unithassummon = true
        --    return
        --end
        if not C_IncomingSummon.HasIncomingSummon(unitid) then
            self.core:SendStatusLost(guid, "summon_status")
            --unithassummon = false
        end
    end
    --if not unithassummon then
    --    self.CancelAllTimers()
    --end
end

function PlexusStatusSummon:UpdateUnit(unitid)
    local guid = UnitGUID(unitid)
    local key = C_IncomingSummon.IncomingSummonStatus(unitid)
    --if not C_IncomingSummon.HasIncomingSummon(unitid) then self.core:SendStatusLost(guid, "summon_status") end
    local settings = self.db.profile.summon_status
    local start = GetTime()

    if key == 0 then key = "SUMMON_STATUS_NONE" end
    if key == 1 then key = "SUMMON_STATUS_PENDING" end
    if key == 2 then key = "SUMMON_STATUS_ACCEPTED" end
    if key == 3 then key = "SUMMON_STATUS_DECLINED" end
    if key == "SUMMON_STATUS_PENDING" then
        self:GainStatus(guid, key, settings, start)
    elseif key == "SUMMON_STATUS_ACCEPTED" then
        self:GainStatus(guid, key, settings, start)
    elseif key == "SUMMON_STATUS_DECLINED" then
        self:GainStatus(guid, key, settings, start)
    elseif key == "SUMMON_STATUS_NONE" then
        self.core:SendStatusLost(guid, "summon_status")
    end
    --self.timer = self:ScheduleRepeatingTimer("UpdateAllUnits", 10)
end

function PlexusStatusSummon:INCOMING_SUMMON_CHANGED(event, unitid)
    self:Debug("INCOMING_SUMMON_CHANGED event: ", event)
    if unitid and self.db.profile.summon_status.enable then
        self:UpdateUnit(unitid)
    end
end

function PlexusStatusSummon:ClearStatus()
    self.core:SendStatusLostAllUnits("summon_status")
end
