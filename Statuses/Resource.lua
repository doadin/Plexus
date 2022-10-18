--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2021 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...

local UnitGUID = _G.UnitGUID
local UnitIsPlayer = _G.UnitIsPlayer
local UnitPower = _G.UnitPower
local UnitPowerMax = _G.UnitPowerMax
local UnitPowerType = _G.UnitPowerType
local GetNumGroupMembers = _G.GetNumGroupMembers
local GetNumSubgroupMembers = _G.GetNumSubgroupMembers
local GetSpecialization
local GetSpecializationInfo
local UnitGroupRolesAssigned
if Plexus:IsRetailWow() then
    GetSpecialization = _G.GetSpecialization
    GetSpecializationInfo = _G.GetSpecializationInfo
    UnitGroupRolesAssigned = _G.UnitGroupRolesAssigned
end

local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatus = Plexus:GetModule("PlexusStatus")
local PlexusFrame = Plexus:GetModule("PlexusFrame")

local PlexusStatusResource = PlexusStatus:NewModule("PlexusStatusResource")

PlexusStatusResource.menuName = "Resource"

PlexusStatusResource.defaultDB = {
    debug = false,
    manacolor = { r = 0, g = 0.5, b = 1, a = 1.0 },
    energycolor = { r = 1, g = 1, b = 0, a = 1.0 },
    ragecolor = { r = 1, g = 0, b = 0, a = 1.0 },
    unit_resource = {
        color = { r=1, g=1, b=1, a=1 },
        text = "Resource",
        enable = false,
        priority = 30,
        range = false
    },
    EnableOnlyMana = false,
    NoPets = false,
}
if Plexus:IsRetailWow() then
    PlexusStatusResource.defaultDB.runiccolor = { r = 0, g = 0.8, b = 0.8, a = 1.0 }
    PlexusStatusResource.defaultDB.focuscolor = { r = 1, g = 0.50, b = 0.25, a = 1.0 }
    PlexusStatusResource.defaultDB.insanitycolor = { r = 0.40, g = 0, b = 0.80, a = 1.0 }
    PlexusStatusResource.defaultDB.furycolor = { r = 0.788, g = 0.259, b = 0.992, a = 1.0 }
    PlexusStatusResource.defaultDB.paincolor = { r = 255/255, g = 156/255, b = 0, a = 1.0 }
    PlexusStatusResource.defaultDB.maelstromcolor = { r = 0.00, g = 0.50, b = 1.00, a = 1.0 }
    PlexusStatusResource.defaultDB.lunarcolor = { r = 0.30, g = 0.52, b = 0.90, a = 1.0 }
    PlexusStatusResource.defaultDB.EnableForHealers = false
end

local resource_options = {
    ["Resource Mana Only"] = {
        type = "toggle",
        name = "Only show mana",
        order = 60,
        desc = "Only show mana",
        get = function ()
            return PlexusStatusResource.db.profile.EnableOnlyMana
            end,
        set = function(_, v)
            PlexusStatusResource.db.profile.EnableOnlyMana = v
            PlexusStatusResource:UpdateAllUnits()
        end
    },
    ["No Pets"] = {
        type = "toggle",
        name = "Don't Show Pets",
        order = 70,
        desc = "Only show for players",
        get = function ()
            return PlexusStatusResource.db.profile.NoPets
            end,
        set = function(_, v)
            PlexusStatusResource.db.profile.NoPets = v
            PlexusStatusResource:UpdateAllUnits()
        end
    },
    ["Resource Colors"] = {
        name = "Colors",
        order = 200,
        type = "group",
        dialogInline = true,
        --childGroups = "tab",
        args = {
            ["Mana Color"] = {
                name = "Mana Color",
                order = 40,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusStatusResource.db.profile.manacolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusStatusResource.db.profile.manacolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Energy Color"] = {
                name = "Energy Color",
                order = 50,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusStatusResource.db.profile.energycolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusStatusResource.db.profile.energycolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Rage Color"] = {
                name = "Rage Color",
                order = 60,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusStatusResource.db.profile.ragecolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusStatusResource.db.profile.ragecolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Reset"] = {
                order = 1000,
                name = "Reset Resource colors (Require Reload)",
                type = "execute", width = "double",
                func = function() PlexusStatusResource:ResetResourceColors() end,
            },
        },
    },
}
if Plexus:IsRetailWow() then
    resource_options["Resource Healer Only"] = {
        type = "toggle",
        name = "Only show for healers",
        order = 50,
        desc = "Only show healers resource",
        get = function ()
            return PlexusStatusResource.db.profile.EnableForHealers
            end,
        set = function(_, v)
            PlexusStatusResource.db.profile.EnableForHealers = v
            PlexusStatusResource:UpdateAllUnits()
        end
    }
    resource_options["Runic Color"] = {
        name = "Runic Color",
        order = 70,
        type = "color", hasAlpha = true,
        get = function()
            local color = PlexusStatusResource.db.profile.runiccolor
            return color.r, color.g, color.b, color.a
        end,
        set = function(_, r, g, b, a)
            local color = PlexusStatusResource.db.profile.runiccolor
            color.r = r
            color.g = g
            color.b = b
            color.a = a or 1
            PlexusFrame:UpdateAllFrames()
        end,
    }
    resource_options["Focus Color"] = {
        name = "Focus Color",
        order = 80,
        type = "color", hasAlpha = true,
        get = function()
            local color = PlexusStatusResource.db.profile.focuscolor
            return color.r, color.g, color.b, color.a
        end,
        set = function(_, r, g, b, a)
            local color = PlexusStatusResource.db.profile.focuscolor
            color.r = r
            color.g = g
            color.b = b
            color.a = a or 1
            PlexusFrame:UpdateAllFrames()
        end,
    }
    resource_options["Insanity Color"] = {
        name = "Insanity Color",
        order = 90,
        type = "color", hasAlpha = true,
        get = function()
            local color = PlexusStatusResource.db.profile.insanitycolor
            return color.r, color.g, color.b, color.a
        end,
        set = function(_, r, g, b, a)
            local color = PlexusStatusResource.db.profile.insanitycolor
            color.r = r
            color.g = g
            color.b = b
            color.a = a or 1
            PlexusFrame:UpdateAllFrames()
        end,
    }
    resource_options["Fury Color"] = {
        name = "Fury Color",
        order = 100,
        type = "color", hasAlpha = true,
        get = function()
            local color = PlexusStatusResource.db.profile.furycolor
            return color.r, color.g, color.b, color.a
        end,
        set = function(_, r, g, b, a)
            local color = PlexusStatusResource.db.profile.furycolor
            color.r = r
            color.g = g
            color.b = b
            color.a = a or 1
            PlexusFrame:UpdateAllFrames()
        end,
    }
    resource_options["Pain Color"] = {
        name = "Pain Color",
        order = 110,
        type = "color", hasAlpha = true,
        get = function()
            local color = PlexusStatusResource.db.profile.paincolor
            return color.r, color.g, color.b, color.a
        end,
        set = function(_, r, g, b, a)
            local color = PlexusStatusResource.db.profile.paincolor
            color.r = r
            color.g = g
            color.b = b
            color.a = a or 1
            PlexusFrame:UpdateAllFrames()
        end,
    }
    resource_options["Maelstrom Color"] = {
        name = "Maelstrom Color",
        order = 120,
        type = "color", hasAlpha = true,
        get = function()
            local color = PlexusStatusResource.db.profile.maelstromcolor
            return color.r, color.g, color.b, color.a
        end,
        set = function(_, r, g, b, a)
            local color = PlexusStatusResource.db.profile.maelstromcolor
            color.r = r
            color.g = g
            color.b = b
            color.a = a or 1
            PlexusFrame:UpdateAllFrames()
        end,
    }
    resource_options["Lunar Color"] = {
        name = "Lunar Color(Balance Druid)",
        order = 130,
        type = "color", hasAlpha = true,
        get = function()
            local color = PlexusStatusResource.db.profile.lunarcolor
            return color.r, color.g, color.b, color.a
        end,
        set = function(_, r, g, b, a)
            local color = PlexusStatusResource.db.profile.lunarcolor
            color.r = r
            color.g = g
            color.b = b
            color.a = a or 1
            PlexusFrame:UpdateAllFrames()
        end,
    }
end

function PlexusStatusResource:ResetResourceColors() --luacheck: ignore 212
    PlexusStatusResource.db.profile.manacolor = PlexusStatusResource.defaultDB.manacolor
    PlexusStatusResource.db.profile.energycolor = PlexusStatusResource.defaultDB.energycolor
    PlexusStatusResource.db.profile.ragecolor = PlexusStatusResource.defaultDB.ragecolor
    PlexusStatusResource.db.profile.runiccolor = PlexusStatusResource.defaultDB.runiccolor
    PlexusStatusResource.db.profile.focuscolor = PlexusStatusResource.defaultDB.focuscolor
    PlexusStatusResource.db.profile.insanitycolor = PlexusStatusResource.defaultDB.insanitycolor
    PlexusStatusResource.db.profile.furycolor = PlexusStatusResource.defaultDB.furycolor
    PlexusStatusResource.db.profile.paincolor = PlexusStatusResource.defaultDB.paincolor
    PlexusStatusResource.db.profile.maelstromcolor = PlexusStatusResource.defaultDB.maelstromcolor
    PlexusStatusResource.db.profile.lunarcolor = PlexusStatusResource.defaultDB.lunarcolor
    PlexusFrame:UpdateAllFrames()
end

function PlexusStatusResource:OnInitialize()
    self.super.OnInitialize(self)

    self:RegisterStatus('unit_resource',"Resource", resource_options, true)
    PlexusStatus.options.args['unit_resource'].args['color'] = nil

end

function PlexusStatusResource:OnStatusEnable(status)
    if status == "unit_resource" then
        self:RegisterEvent("UNIT_POWER_UPDATE","UpdateUnit")
        self:RegisterEvent("UNIT_MAXPOWER","UpdateUnit")
        self:RegisterEvent("UNIT_DISPLAYPOWER","UpdateUnit")
        self:RegisterEvent("PLAYER_ENTERING_WORLD","UpdateAllUnits")
        if Plexus:IsRetailWow() then
            self:RegisterEvent("ROLE_CHANGED_INFORM")
        end
        self:RegisterMessage("Plexus_UnitJoined")
        self:UpdateAllUnits()
    end
end

function PlexusStatusResource:OnStatusDisable(status)
    if status == "unit_resource" then
        for guid, _ in PlexusRoster:IterateRoster() do
            self.core:SendStatusLost(guid, "unit_resource")
        end
        self:UnregisterEvent("UNIT_POWER_UPDATE")
        self:UnregisterEvent("UNIT_MAXPOWER")
        self:UnregisterEvent("UNIT_DISPLAYPOWER")
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        if Plexus:IsRetailWow() then
            self:UnregisterEvent("ROLE_CHANGED_INFORM")
        end
        self:UnregisterMessage("Plexus_UnitJoined")
    end
end

function PlexusStatusResource:UpdateUnit(_, unitid)
    if not unitid then return end
    local NoPets = PlexusStatusResource.db.profile.NoPets
    local unitGUID = UnitGUID(unitid)
    --don't update for a unit not in group
    if not PlexusRoster:IsGUIDInGroup(unitGUID) then return end
    if (NoPets and not UnitIsPlayer(unitid)) then
        self.core:SendStatusLost(unitGUID, "unit_resource")
    else
        self:UpdateUnitResource(unitid)
    end
end

function PlexusStatusResource:ROLE_CHANGED_INFORM(event, changedName, fromName, oldRole, newRole)
    -- Catch if a unit changes role so that if a unit power doesn't change(role changed spec not changed)
    -- We will still update their frame
    if not Plexus:IsRetailWow() then return end
    local unitGUID = PlexusRoster:GetGUIDByFullName(changedName)
    local unitid = PlexusRoster:GetUnitidByGUID(unitGUID)
    self:Debug("ROLE_CHANGED_INFORM", event, changedName, fromName, oldRole, newRole)
    self:Debug("ROLE_CHANGED_INFORM",changedName, unitGUID, unitid)
    local EnableForHealers = PlexusStatusResource.db.profile.EnableForHealers
    if EnableForHealers then
        if newRole ~= "HEALER" then
            self.core:SendStatusLost(unitGUID, "unit_resource")
            return
        end
    end

    if not unitid then return end
    self:UpdateUnitResource(unitid)
end

function PlexusStatusResource:Plexus_UnitJoined(_, _, unitid)
    local NoPets = PlexusStatusResource.db.profile.NoPets
    local unitGUID = UnitGUID(unitid)
    if not unitid then return end
    if (NoPets and not UnitIsPlayer(unitid)) then
        self.core:SendStatusLost(unitGUID, "unit_resource")
    else
        self:UpdateUnitResource(unitid)
    end
end

function PlexusStatusResource:UpdateAllUnits()
    local NoPets = PlexusStatusResource.db.profile.NoPets
    for _, unitid in PlexusRoster:IterateRoster() do
        local unitGUID = UnitGUID(unitid)
        if (NoPets and not UnitIsPlayer(unitid)) then
            self.core:SendStatusLost(unitGUID, "unit_resource")
        else
            self:UpdateUnitResource(unitid)
        end
    end
end

function PlexusStatusResource:UpdateUnitResource(unitid)
    local color
    if not unitid then return end
    local unitGUID = UnitGUID(unitid)
    local current, max = UnitPower(unitid), UnitPowerMax(unitid)
    local priority = PlexusStatusResource.db.profile.unit_resource.priority
    local EnableForHealers = PlexusStatusResource.db.profile.EnableForHealers
    local unitpower = UnitPowerType(unitid)
    if Plexus:IsRetailWow() then
        if EnableForHealers then
            local currentSpecRole = GetSpecialization and select(5, GetSpecializationInfo(GetSpecialization())) or "None"
            if ((GetNumGroupMembers() ~= 0 or GetNumSubgroupMembers() ~= 0) and UnitGroupRolesAssigned(unitid) ~= "HEALER") or
            (UnitGUID("player") == UnitGUID(unitid) and currentSpecRole ~= "HEALER") then
                self.core:SendStatusLost(unitGUID, "unit_resource")
                return
            end
        end
    end
    local NoPets = PlexusStatusResource.db.profile.NoPets
    if (NoPets and not UnitIsPlayer(unitid)) then
        self.core:SendStatusLost(unitGUID, "unit_resource")
        return
    end
    local EnableOnlyMana = PlexusStatusResource.db.profile.EnableOnlyMana
    if EnableOnlyMana then
        if unitpower ~= 0 then
            self.core:SendStatusLost(unitGUID, "unit_resource")
            return
        end
    end

    if Plexus:IsRetailWow() then
        if unitpower == 3 then
            color = PlexusStatusResource.db.profile.energycolor
        elseif unitpower == 2 then
            color = PlexusStatusResource.db.profile.focuscolor
        elseif unitpower == 6 then
            color = PlexusStatusResource.db.profile.runiccolor
        elseif unitpower == 8 then
            color = PlexusStatusResource.db.profile.lunarcolor
        elseif unitpower == 11 then
            color = PlexusStatusResource.db.profile.maelstromcolor
        elseif unitpower == 13 then
            color = PlexusStatusResource.db.profile.insanitycolor
        elseif unitpower == 17 then
            color = PlexusStatusResource.db.profile.furycolor
        elseif unitpower == 18 then
            color = PlexusStatusResource.db.profile.paincolor
        elseif unitpower == 1 then
            color = PlexusStatusResource.db.profile.ragecolor
        else
            color = PlexusStatusResource.db.profile.manacolor
        end
    else
        if unitpower == 3 then
            color = PlexusStatusResource.db.profile.energycolor
        elseif unitpower == 1 then
            color = PlexusStatusResource.db.profile.ragecolor
        else
            color = PlexusStatusResource.db.profile.manacolor
        end
    end

    self.core:SendStatusGained(
        unitGUID, "unit_resource",
        priority,
        nil,
        color,
        nil,
        current,max,
        nil
    )
end

