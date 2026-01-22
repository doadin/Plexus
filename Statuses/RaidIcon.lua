--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    RaidIcon.lua
    Plexus status module for raid target icons.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local format = format
local GetRaidTargetIndex = GetRaidTargetIndex

local Roster = Plexus:GetModule("PlexusRoster")

local PlexusStatusRaidIcon = Plexus:NewStatusModule("PlexusStatusRaidIcon")
PlexusStatusRaidIcon.menuName = L["Raid Icon"]
PlexusStatusRaidIcon.options = false

PlexusStatusRaidIcon.defaultDB = {
    raid_icon = {
        enable = true,
        priority = 50,
        color = {
            { r = 249/255, g = 237/255, b =  85/255, a = 1, ignore = true }, -- 1 / Yellow Star
            { r = 255/255, g = 146/255, b =   0/255, a = 1, ignore = true }, -- 2 / Orange Circle
            { r = 214/255, g =  77/255, b = 231/255, a = 1, ignore = true }, -- 3 / Purple Diamond
            { r =  41/255, g = 227/255, b =  33/255, a = 1, ignore = true }, -- 4 / Green Triangle
            { r = 118/255, g = 175/255, b = 236/255, a = 1, ignore = true }, -- 5 / White Moon
            { r =   0/255, g = 146/255, b = 255/255, a = 1, ignore = true }, -- 6 / Blue Square
            { r = 255/255, g =  59/255, b =  52/255, a = 1, ignore = true }, -- 7 / Red Cross
            { r = 255/255, g = 253/255, b = 252/255, a = 1, ignore = true }, -- 8 / White Skull
        },
        icon = {},
        text = {},
    }
}
for i = 1, 8 do
    PlexusStatusRaidIcon.defaultDB.raid_icon.icon[i] = "Interface\\TargetingFrame\\UI-RaidTargetingIcon_"..i
    PlexusStatusRaidIcon.defaultDB.raid_icon.text[i] = _G["RAID_TARGET_"..i]
end

function PlexusStatusRaidIcon:PostInitialize()
    self:Debug("PostInitialize")

    local optionsForStatus = {
        text = false,
        color = false,
    }
    local get = function(info)
        local k, i = info[#info], tonumber(info[#info-1])
        local v = self.db.profile.raid_icon[k][i]
        if type(v) == "table" then
            return v.r, v.g, v.b, v.a
        else
            return v
        end
    end
    local set = function(info, r, g, b, a)
        local k, i = info[#info], tonumber(info[#info-1])
        local v = self.db.profile.raid_icon[k][i]
        if type(v) == "table" then
            v.r, v.g, v.b, v.a = r, g, b, a
        else
            self.db.profile.raid_icon[k][i] = r
        end
    end
    for i = 1, 8 do
        optionsForStatus[tostring(i)] = {
            name = format("|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_%d:0|t %s", i, _G["RAID_TARGET_"..i]),
            type = "group",
            guiInline = true,
            order = -9 + i,
            get = get,
            set = set,
            args = {
                color = {
                    name = L["Color"],
                    type = "color",
                    hasAlpha = true,
                },
                text = {
                    name = L["Text"],
                    type = "input",
                },
            }
        }
    end
    self:RegisterStatus("raid_icon", L["Raid Icon"], optionsForStatus, true)
end

function PlexusStatusRaidIcon:OnStatusEnable(status)
    self:Debug("OnStatusEnable", status)
    self:RegisterEvent("RAID_TARGET_UPDATE", "UpdateAllUnits")
    self:RegisterEvent("GROUP_ROSTER_UPDATE", "UpdateAllUnits")
    self:RegisterMessage("Plexus_RosterUpdated", "UpdateAllUnits")
    self:UpdateAllUnits("OnStatusEnable")
end

function PlexusStatusRaidIcon:OnStatusDisable(status)
    self:Debug("OnStatusDisable", status)
    self:UnregisterEvent("RAID_TARGET_UPDATE")
    self:UnregisterEvent("GROUP_ROSTER_UPDATE")
    self:UnregisterMessage("Plexus_RosterUpdated")
    self:SendStatusLostAllUnits(status)
end

function PlexusStatusRaidIcon:UpdateAllUnits(event, ...)
    self:Debug("UpdateAllUnits", event, ...)
    local settings = self.db.profile.raid_icon
    local icon
    local color
    local text

    for guid, unit in Roster:IterateRoster() do
        local i = GetRaidTargetIndex(unit)
        --self:Debug(unit, i, i and settings.text[i], i and settings.icon[i])
        if Plexus:IsRetailWow() then
            icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons"
        end
        if i then
            if not Plexus:IsRetailWow() then
                color = settings.color[i]
                text = settings.text[i]
                icon = settings.icon[i]
            end
            self.core:SendStatusGained(guid, "raid_icon",
                settings.priority,
                nil,
                color, -- settings.color[i]
                text, -- settings.text[i]
                i,
                nil,
                icon)
        else
            self.core:SendStatusLost(guid, "raid_icon")
        end
    end
end
