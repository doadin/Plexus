--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local GetNumGroupMembers = _G.GetNumGroupMembers
local GetRaidRosterInfo = _G.GetRaidRosterInfo

local Layout = Plexus:GetModule("PlexusLayout")
local Roster = Plexus:GetModule("PlexusRoster")

local DEFAULT_ROLE 		  = Plexus:IsClassicWow() and 'ROLE' or 'ASSIGNEDROLE'
local DEFAULT_ROLE_ORDER  = Plexus:IsClassicWow() and 'MAINTANK,MAINASSIST,NONE' or 'TANK,HEALER,DAMAGER,NONE'

-- nameList = "",
-- groupFilter = "",
-- sortMethod = "INDEX", -- or "NAME"
-- sortDir = "ASC", -- or "DESC"
-- strictFiltering = false,
-- unitsPerColumn = 5, -- treated specifically to do the right thing when available
-- maxColumns = 5, -- mandatory if unitsPerColumn is set, or defaults to 1
-- isPetGroup = true, -- special case, not part of the Header API

local Layouts = {
    None = {
        name = L["None"],
    },
    ByGroup = {
        name = L["By Group"],
        defaults = {
            sortMethod = "INDEX",
            unitsPerColumn = 5,
            maxColumns = 1,
        },
        [1] = {
            groupFilter = "1",
        },
        -- additional groups added/removed dynamically
    },
    ByGroupPets = {
        name = L["By Group With Pets"],
        defaults = {
            sortMethod = "INDEX",
            unitsPerColumn = 5,
            maxColumns = 1,
        },
        [1] = {
            groupFilter = "1",
        },
        -- additional groups added/removed dynamically
    },
    ByGroupRole = {
        name = L["By Group & Role"],
        defaults = {
            groupBy = DEFAULT_ROLE,
            groupingOrder = DEFAULT_ROLE_ORDER,
            sortMethod = "NAME",
            unitsPerColumn = 5,
            maxColumns = 1,
        },
        [1] = {
            groupFilter = "1",
        },
        -- additional groups added/removed dynamically
    },
    ByGroupRolePets = {
        name = L["By Group & Role With Pets"],
        defaults = {
            groupBy = DEFAULT_ROLE,
            groupingOrder = DEFAULT_ROLE_ORDER,
            sortMethod = "NAME",
            unitsPerColumn = 5,
            maxColumns = 1,
        },
        [1] = {
            groupFilter = "1",
        },
        -- additional groups added/removed dynamically
    },
    ByClass = {
        name = L["By Class"],
        defaults = {
            groupBy = "CLASS",
            groupingOrder = "WARRIOR,DEATHKNIGHT,DEMONHUNTER,ROGUE,MONK,PALADIN,DRUID,SHAMAN,PRIEST,MAGE,WARLOCK,HUNTER",
            sortMethod = "NAME",
            unitsPerColumn = 5,
        },
        [1] = {
            groupFilter = "1", -- updated dynamically
        },
    },
    ByClassPets = {
        name = L["By Class With Pets"],
        defaults = {
            groupBy = "CLASS",
            groupingOrder = "WARRIOR,DEATHKNIGHT,DEMONHUNTER,ROGUE,MONK,PALADIN,DRUID,SHAMAN,PRIEST,MAGE,WARLOCK,HUNTER",
            sortMethod = "NAME",
            unitsPerColumn = 5,
        },
        [1] = {
            groupFilter = "1", -- updated dynamically
        },
    },
    ByRole = {
        name = L["By Role"],
        defaults = {
            groupBy = DEFAULT_ROLE,
            groupingOrder = DEFAULT_ROLE_ORDER,
            sortMethod = "NAME",
            unitsPerColumn = 5,
        },
        [1] = {
            groupFilter = "1", -- updated dynamically
        },
    },
    ByRolePets = {
        name = L["By Role With Pets"],
        defaults = {
            groupBy = DEFAULT_ROLE,
            groupingOrder = DEFAULT_ROLE_ORDER,
            sortMethod = "NAME",
            unitsPerColumn = 5,
        },
        [1] = {
            groupFilter = "1", -- updated dynamically
        },
    },
    ByName = {
        name = L["By Name"],
        defaults = {
            sortMethod = "NAME",
            unitsPerColumn = 5;NOREPEAT, --luacheck: ignore
            maxColumns = 8,
        },
        [1] = {
            groupFilter = "1", -- updated dynamically
        },
    },
    ByNamePets = {
        name = L["By Name With Pets"],
        defaults = {
            sortMethod = "NAME",
            unitsPerColumn = 5;NOREPEAT, --luacheck: ignore
            maxColumns = 8,
        },
        [1] = {
            groupFilter = "1", -- updated dynamically
        },
    },
}
--[==[@debug@
_G.PLEXUSLAYOUTS = Layouts --luacheck: ignore 111
--@end-debug@]==]

--------------------------------------------------------------------------------

local Manager = Layout:NewModule("PlexusLayoutManager", "AceEvent-3.0")
Manager.Debug = Plexus.Debug -- PlexusLayout doesn't have a module prototype

function Manager:OnInitialize()
    self:Debug("OnInitialize")

    Plexus:SetDebuggingEnabled(self.moduleName)

    for k, v in pairs(Layouts) do
        Layout:AddLayout(k, v)
    end

    self:RegisterMessage("Plexus_RosterUpdated", "UpdateLayouts")
end

--------------------------------------------------------------------------------

local function AddPetGroup(t, groupFilter, numGroups)
--[==[@debug@
    assert(t == nil or type(t) == "table")
    assert(type(groupFilter) == "string")
    assert(string.len(groupFilter) > 0 and string.len(groupFilter) % 2 == 1)
    assert(type(numGroups) == "number")
    assert(numGroups == (1 + string.len(groupFilter)) / 2)
--@end-debug@]==]
    t = t or {}
    t.groupFilter = groupFilter
    t.maxColumns = numGroups

    t.isPetGroup = true
    t.groupBy = "CLASS"
    t.groupingOrder = "HUNTER,WARLOCK,MAGE,DEATHKNIGHT,DRUID,PRIEST,SHAMAN,MONK,PALADIN,DEMONHUNTER,ROGUE,WARRIOR"
    -- t.sortMethod = "NAME"

    return t
end


local function UpdateSplitGroups(layout, groupFilter, numGroups, showPets)
--[==[@debug@
    assert(type(layout) == "table")
    assert(type(groupFilter) == "string")
    assert(string.len(groupFilter) > 0 and string.len(groupFilter) % 2 == 1)
    assert(type(numGroups) == "number")
    assert(numGroups == (1 + string.len(groupFilter)) / 2)
--@end-debug@]==]

    for i = 1, numGroups do
        local t = layout[i] or {}
        layout[i] = t

        t.groupFilter = string.sub(groupFilter, i * 2 - 1, i * 2)

        -- Reset attributes from merged layout
        t.maxColumns = 1

        -- Remove attributes for pet group
        t.isPetGroup = nil
        t.groupBy = nil
        t.groupingOrder = nil
    end

    if showPets then
        local i = numGroups + 1
        layout[i] = AddPetGroup(layout[i], groupFilter, numGroups)
        numGroups = i
    end

    for i = numGroups + 1, #layout do
        layout[i] = nil
    end
end


local function UpdateMergedGroups(layout, groupFilter, numGroups, showPets)
--[==[@debug@
    assert(type(layout) == "table")
    assert(type(groupFilter) == "string")
    assert(string.len(groupFilter) > 0 and string.len(groupFilter) % 2 == 1)
    assert(type(numGroups) == "number")
    assert(numGroups == (1 + string.len(groupFilter)) / 2)
--@end-debug@]==]

    layout[1].groupFilter = groupFilter
    layout[1].maxColumns = numGroups

    layout[2] = showPets and AddPetGroup(layout[2], groupFilter, numGroups) or nil

    for i = 3, numGroups do
        layout[i] = nil
    end
end


local hideGroup = {}

function Manager:GetGroupFilter()
    local groupType, maxPlayers = Roster:GetPartyState()
    self:Debug("groupType", groupType, "maxPlayers", maxPlayers)

    if groupType ~= "raid" and groupType ~= "bg" then
        return "1", 1
    end

    local showOffline = Layout.db.profile.showOffline
    local showWrongZone = Layout:ShowWrongZone()
    local _, _, diffIndex = _G.GetInstanceInfo()
    local curMapID = _G.C_Map.GetBestMapForUnit("player")
    local curMapInfo = curMapID and _G.C_Map.GetMapInfo(curMapID)
    local MAX_RAID_GROUPS = _G.MAX_RAID_GROUPS or 8

    for i = 1, MAX_RAID_GROUPS do
        hideGroup[i] = ""
    end

    for i = 1, GetNumGroupMembers() do
        local _, _, subgroup, _, _, _, _, online = GetRaidRosterInfo(i)
        local mapID = _G.C_Map.GetBestMapForUnit("raid" .. i)
	local mapInfo = mapID and _G.C_Map.GetMapInfo(mapID)

        if showWrongZone == "MYTHICFIXED" then
            if diffIndex == 16 and subgroup < 5 then
                hideGroup[subgroup] = nil
            elseif diffIndex ~= 16 then
                hideGroup[subgroup] = nil
            end
        end
        if (showOffline or online) and (showWrongZone ~= "MYTHICFIXED") and (showWrongZone or mapInfo and curMapInfo.parentMapID == mapInfo.parentMapID) then
            hideGroup[subgroup] = nil
        end
    end

    local groupFilter, numGroups = "", 0
    for i = 1, MAX_RAID_GROUPS do
        if not hideGroup[i] then
            groupFilter = groupFilter .. "," .. i
            numGroups = numGroups + 1
--[==[@debug@
        else
            self:Debug("Group", i, "hidden:", hideGroup[i])
--@end-debug@]==]
        end
    end
    return groupFilter:sub(2), numGroups
end


local lastGroupFilter

function Manager:UpdateLayouts(event)
    self:Debug("UpdateLayouts", event)

    local groupFilter, numGroups = self:GetGroupFilter()
    local splitGroups = Layout.db.profile.splitGroups

    if not groupFilter then
        return false
    end

    self:Debug("groupFilter", groupFilter, "numGroups", numGroups, "splitGroups", splitGroups)

    if lastGroupFilter == groupFilter then
        self:Debug("No changes necessary")
        return false
    end

    lastGroupFilter = groupFilter

    -- Update class and role layouts
    if splitGroups then
        UpdateSplitGroups(Layouts.ByClass,  groupFilter, numGroups, false)
        UpdateSplitGroups(Layouts.ByRole,   groupFilter, numGroups, false)
    else
        UpdateMergedGroups(Layouts.ByClass, groupFilter, numGroups, false)
        UpdateMergedGroups(Layouts.ByClassPets, groupFilter, numGroups, true)
        UpdateMergedGroups(Layouts.ByRole,  groupFilter, numGroups, false)
        UpdateMergedGroups(Layouts.ByRolePets,  groupFilter, numGroups, true)
    end

    -- Update group layout (always split)
    UpdateSplitGroups(Layouts.ByGroup, groupFilter, numGroups, false)
    UpdateSplitGroups(Layouts.ByGroupPets, groupFilter, numGroups, true)
    UpdateSplitGroups(Layouts.ByGroupRole, groupFilter, numGroups, false)
    UpdateSplitGroups(Layouts.ByGroupRolePets, groupFilter, numGroups, true)
    UpdateSplitGroups(Layouts.ByName, groupFilter, numGroups, false)
    UpdateSplitGroups(Layouts.ByNamePets, groupFilter, numGroups, true)

    -- Apply changes
    Layout:ReloadLayout()

    return true
end
