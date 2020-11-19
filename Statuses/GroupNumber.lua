--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2018-2020 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    GroupNumber.lua
    Plexus status module for group number.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L
local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatus = Plexus:GetModule("PlexusStatus")

local PlexusStatusGroupNumber = Plexus:NewStatusModule("PlexusStatusGroupNumber", "AceBucket-3.0", "AceEvent-3.0")
PlexusStatusGroupNumber.menuName = L["Group Number"]
PlexusStatusGroupNumber.options = false

PlexusStatusGroupNumber.defaultDB = {
    groupnumber = {
        enable = false,
        priority = 50,
    }
}

function PlexusStatusGroupNumber:PostInitialize()
    self:Debug("PostInitialize")
    self:RegisterStatus("groupnumber", L["Group Number"], nil, true)
    PlexusStatus.options.args['groupnumber'].args['color'] = nil
end

function PlexusStatusGroupNumber:OnStatusEnable(status)
    self:Debug("OnStatusEnable", status)
    self:RegisterBucketEvent("GROUP_ROSTER_UPDATE", 0.5, "UpdateAllUnits")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
    self:UpdateAllUnits()
end

function PlexusStatusGroupNumber:OnStatusDisable(status)
    self:Debug("OnStatusDisable", status)
    self:UnregisterAllBuckets()
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    self:SendStatusLostAllUnits(status)
end

function PlexusStatusGroupNumber:UpdateAllUnits()
    for guid, unit in PlexusRoster:IterateRoster() do
        local raidIndex = UnitInRaid(unit)
        if raidIndex then
            local _,_,GroupNumber = GetRaidRosterInfo(raidIndex)
            self:UpdateUnit("UpdateAllUnits",guid, GroupNumber)
        else
            self.core:SendStatusLost(guid, "groupnumber")
        end
    end
end

function PlexusStatusGroupNumber:UpdateUnit(event, unitguid, GroupNumber)
    self:Debug("UpdateUnit Event", event)
    self:Debug("UpdateUnit UnitGUID", unitguid)
    local profile = self.db.profile.groupnumber
    if profile.enable then
        self:Debug("UpdateUnit", "Unit is in group: ", GroupNumber)
        self.core:SendStatusGained(unitguid, "groupnumber",
            profile.priority,
            nil,
            nil,
            tostring(GroupNumber)
        )
    else
        self:Debug("Unit group number status not enabled why are we running?")
        self.core:SendStatusLost(unitguid, "groupnumber")
    end
end
