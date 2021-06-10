--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2021-2021 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local InCombatLockdown = _G.InCombatLockdown

local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusProfileSwitcher = Plexus:NewModule("PlexusProfileSwitcher")

PlexusProfileSwitcher.defaultDB = {
    enable = false,
    style = "GroupType"
}

PlexusProfileSwitcher.options = {
    name = L["Profile Switcher"],
    disabled = InCombatLockdown,
    order = 101,
    type = "group",
    get = function(info)
        local k = info[#info]
        local v = PlexusProfileSwitcher.db.profile[k]
        if type(v) == "table" and v.r and v.g and v.b then
            return v.r, v.g, v.b, v.a
        else
            return v
        end
    end,
    set = function(info, v)
        local k = info[#info]
        PlexusProfileSwitcher.db.profile[k] = v
        print(PlexusProfileSwitcher.db.profile.style)
    end,
    args = {
        warning = {
            name = "EXPERIMENTAL, you have been warned!",
            fontSize = "large",
            type = "description",
            order = 101,
        },
        enable = {
            name = L["Enable Profile Switching"],
            desc = L[""],
            order = 102,
            width = "double",
            type = "toggle",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.enable = v
            end,
        },
        style = {
            name = L["Switch Profile based On:"],
            desc = L[""],
            order = 103,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.style = v
            end,
            values = {
                GroupType = "GroupType",
                GroupSize = "GroupSize",
            },
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                end
            end,
        },
        GroupTypeSoloProfile = {
            name = L["When Group Type Solo Switch to profile:"],
            desc = L[""],
            order = 104,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupTypeSoloProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupType" then
                        return true
                    end
                end
            end,
        },
        GroupTypePartyProfile = {
            name = L["When Group Type Party Switch to profile:"],
            desc = L[""],
            order = 105,
            width = "double",
            type = "select",
            set = function(_, v) --luacheck: ignore 212
                PlexusProfileSwitcher.db.profile.GroupTypePartyProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupType" then
                        return true
                    end
                end
            end,
        },
        GroupTypeRaidProfile = {
            name = L["When Group Type Raid Switch to profile:"],
            desc = L[""],
            order = 106,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupTypeRaidProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupType" then
                        return true
                    end
                end
            end,
        },
        GroupTypeArenaProfile = {
            name = L["When Group Type Arena Switch to profile:"],
            desc = L[""],
            order = 107,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupTypeArenaProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupType" then
                        return true
                    end
                end
            end,
        },
        GroupTypeBGProfile = {
            name = L["When Group Type BG Switch to profile:"],
            desc = L[""],
            order = 108,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupTypeBGProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupType" then
                        return true
                    end
                end
            end,
        },
        GroupSizeOneProfile = {
            name = L["When Group Size Solo Switch to profile:"],
            desc = L[""],
            order = 109,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupSizeOneProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupSize" then
                        return true
                    end
                end
            end,
        },
        GroupSizeFiveProfile = {
            name = L["When Group Size 2-5 Switch to profile:"],
            desc = L[""],
            order = 110,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupSizeFiveProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupSize" then
                        return true
                    end
                end
            end,
        },
        GroupSizeTenProfile = {
            name = L["When Group Size 6-10 Switch to profile:"],
            desc = L[""],
            order = 111,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupSizeTenProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupSize" then
                        return true
                    end
                end
            end,
        },
        GroupSizeTwentyProfile = {
            name = L["When Group Size 11-20 Switch to profile:"],
            desc = L[""],
            order = 112,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupSizeTwentyProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupSize" then
                        return true
                    end
                end
            end,
        },
        GroupSizeFourtyProfile = {
            name = L["When Group Size 21+ Switch to profile:"],
            desc = L[""],
            order = 113,
            width = "double",
            type = "select",
            set = function(_, v)
                PlexusProfileSwitcher.db.profile.GroupSizeFourtyProfile = v
            end,
            values = function()
                if Plexus.db then
                    local profiles = {}
                    for _,v in pairs(Plexus.db:GetProfiles()) do
                        profiles[v] = v
                    end
                    return profiles
                else
                    return {}
                end
            end,
            hidden = function()
                if not PlexusProfileSwitcher.db.profile.enable then
                    return true
                else
                    if PlexusProfileSwitcher.db.profile.style ~= "GroupSize" then
                        return true
                    end
                end
            end,
        },
    }
}

local function HandleProfileSwitching()
    local profile = PlexusProfileSwitcher.db.profile
    if not profile.enable then return end
    --local getProfiles = Plexus.db:GetProfiles()
    local getCurrentProfile = Plexus.db:GetCurrentProfile()
    --local isDualSpecEnabled = Plexus.IsRetailWow() and Plexus.db:IsDualSpecEnabled()
    local instanceType, groupSize = PlexusRoster:GetPartyState()
    local Style = PlexusProfileSwitcher.db.profile.style

    if Style == "GroupType" then
        if instanceType == "solo" then
            if getCurrentProfile ~= profile.GroupTypeSoloProfile then
                Plexus.db:SetProfile(profile.GroupTypeSoloProfile)
            end
        end
        if instanceType == "party" then
            if getCurrentProfile ~= profile.GroupTypePartyProfile then
                Plexus.db:SetProfile(profile.GroupTypePartyProfile)
            end
        end
        if instanceType == "raid" then
            if getCurrentProfile ~= profile.GroupTypeRaidProfile then
                Plexus.db:SetProfile(profile.GroupTypeRaidProfile)
            end
        end
        if instanceType == "arena" then
            if getCurrentProfile ~= profile.GroupTypeArenaProfile then
                Plexus.db:SetProfile(profile.GroupTypeArenaProfile)
            end
        end
        if instanceType == "bg" then
            if getCurrentProfile ~= profile.GroupTypeBGProfile then
                Plexus.db:SetProfile(profile.GroupTypeBGProfile)
            end
        end
    end
    if Style == "GroupSize" then
        if groupSize <= 1 then
            if getCurrentProfile ~= profile.GroupSizeOneProfile then
                Plexus.db:SetProfile(profile.GroupSizeOneProfile)
            end
        end
        if groupSize >= 1 and groupSize <=5 then
            if getCurrentProfile ~= profile.GroupSizeFiveProfile then
                Plexus.db:SetProfile(profile.GroupSizeFiveProfile)
            end
        end
        if groupSize > 5 and groupSize <=10 then
            if getCurrentProfile ~= profile.GroupSizeTenProfile then
                Plexus.db:SetProfile(profile.GroupSizeTenProfile)
            end
        end
        if groupSize > 10 and groupSize <=20 then
            if getCurrentProfile ~= profile.GroupSizeTwentyProfile then
                Plexus.db:SetProfile(profile.GroupSizeTwentyProfile)
            end
        end
        if groupSize > 20 and groupSize <=80 then
            if getCurrentProfile ~= profile.GroupSizeFourtyProfile then
                Plexus.db:SetProfile(profile.GroupSizeFourtyProfile)
            end
        end
    end
end

function PlexusProfileSwitcher:OnInitialize() --luacheck: ignore 212
    return
end

function PlexusProfileSwitcher:OnEnable()
    --local profile = PlexusProfileSwitcher.db.profile
    --local isDualSpecEnabled = Plexus.IsRetailWow() and Plexus.db:IsDualSpecEnabled()
    self:RegisterMessage("Plexus_UnitJoined",HandleProfileSwitching)
    self:RegisterMessage("Plexus_UnitChanged",HandleProfileSwitching)
    self:RegisterMessage("Plexus_RosterUpdated",HandleProfileSwitching)
    self:RegisterMessage("Plexus_UnitLeft",HandleProfileSwitching)
    self:RegisterEvent("GROUP_ROSTER_UPDATE",HandleProfileSwitching)
    self:RegisterEvent("UNIT_AURA",HandleProfileSwitching)
end