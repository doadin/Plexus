--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local GetNumGroupMembers = GetNumGroupMembers
local GetRaidRosterInfo = GetRaidRosterInfo

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
            groupingOrder = "WARRIOR,DEATHKNIGHT,DEMONHUNTER,ROGUE,MONK,PALADIN,DRUID,SHAMAN,PRIEST,MAGE,WARLOCK,HUNTER,EVOKER",
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
            groupingOrder = "WARRIOR,DEATHKNIGHT,DEMONHUNTER,ROGUE,MONK,PALADIN,DRUID,SHAMAN,PRIEST,MAGE,WARLOCK,HUNTER,EVOKER",
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
--@debug@
    assert(t == nil or type(t) == "table")
    assert(type(groupFilter) == "string")
    assert(string.len(groupFilter) > 0 and string.len(groupFilter) % 2 == 1)
    assert(type(numGroups) == "number")
    assert(numGroups == (1 + string.len(groupFilter)) / 2)
--@end-debug@
    t = t or {}
    t.groupFilter = groupFilter
    t.maxColumns = numGroups

    t.isPetGroup = true
    t.groupBy = "CLASS"
    t.groupingOrder = "HUNTER,WARLOCK,MAGE,DEATHKNIGHT,DRUID,PRIEST,SHAMAN,MONK,PALADIN,DEMONHUNTER,ROGUE,WARRIOR,EVOKER"
    -- t.sortMethod = "NAME"

    return t
end


local function UpdateSplitGroups(layout, groupFilter, numGroups, showPets)
--@debug@
    assert(type(layout) == "table")
    assert(type(groupFilter) == "string")
    assert(string.len(groupFilter) > 0 and string.len(groupFilter) % 2 == 1)
    assert(type(numGroups) == "number")
    assert(numGroups == (1 + string.len(groupFilter)) / 2)
--@end-debug@

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
--@debug@
    assert(type(layout) == "table")
    assert(type(groupFilter) == "string")
    assert(string.len(groupFilter) > 0 and string.len(groupFilter) % 2 == 1)
    assert(type(numGroups) == "number")
    assert(numGroups == (1 + string.len(groupFilter)) / 2)
--@end-debug@

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

    -- GetNumGroupMembers when solo returns 0 even in world BG zones such as wintergrasp
    -- Therefore even in BG if GetNumGroupMembers == 0 return 1
    if groupType ~= "raid" and groupType ~= "bg" or (groupType == "bg" and GetNumGroupMembers() == 0) then
        return "1", 1
    end

    local showOffline = Layout.db.profile.showOffline
    local showWrongZone = Layout:ShowWrongZone()
    local playerMapID = C_Map.GetBestMapForUnit("player")
    local MAX_RAID_GROUPS = MAX_RAID_GROUPS or 8
    local MAX_RAID_MEMBERS = MAX_RAID_MEMBERS or 40

    for i = 1, MAX_RAID_GROUPS do
        hideGroup[i] = ""
    end

    --discouraged to use GetNumGroupMembers
    for i = 1, MAX_RAID_MEMBERS do
        --name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML, combatRole
        local _, _, subgroup, _, _, _, _, online = GetRaidRosterInfo(i)
        local raidMemberMapID = C_Map.GetBestMapForUnit("raid" .. i)
        local playerMapGroupID
        local raidMemberMapGroupID
        if playerMapID and raidMemberMapID then
            playerMapGroupID = C_Map.GetMapGroupID(playerMapID)
            raidMemberMapGroupID = C_Map.GetMapGroupID(raidMemberMapID)
        end
        if playerMapGroupID and raidMemberMapGroupID then
            if (showOffline or online) and (showWrongZone or playerMapGroupID == raidMemberMapGroupID) then
                hideGroup[subgroup] = nil
            end
        elseif playerMapID and raidMemberMapID then
            if (showOffline or online) and (showWrongZone or playerMapID == raidMemberMapID) then
                hideGroup[subgroup] = nil
            end
        -- if we cant get zone info for a unit just show the group
        else
            if (showOffline or online) then
                hideGroup[subgroup] = nil
            end
        end
    end

    local groupFilter, numGroups = "", 0
    for i = 1, MAX_RAID_GROUPS do
        if not hideGroup[i] then
            groupFilter = groupFilter .. "," .. i
            numGroups = numGroups + 1
--@debug@
        else
            self:Debug("Group", i, "hidden:", hideGroup[i])
--@end-debug@
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
