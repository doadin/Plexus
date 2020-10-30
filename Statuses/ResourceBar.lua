--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2020 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
----------------------------------------------------------------------]]

local _, Plexus = ...
local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatus = Plexus:GetModule("PlexusStatus")
local PlexusFrame = Plexus:GetModule("PlexusFrame")

local PlexusResourceBar = PlexusStatus:NewModule("PlexusResourceBar")

PlexusResourceBar.menuName = "ResourceBar"

PlexusResourceBar.defaultDB = {
    debug = false,
    manacolor = { r = 0, g = 0.5, b = 1, a = 1.0 },
    energycolor = { r = 1, g = 1, b = 0, a = 1.0 },
    ragecolor = { r = 1, g = 0, b = 0, a = 1.0 },
--@retail@
    runiccolor = { r = 0, g = 0.8, b = 0.8, a = 1.0 },
    focuscolor = { r = 1, g = 0.50, b = 0.25, a = 1.0 };
    insanitycolor = { r = 0.40, g = 0, b = 0.80, a = 1.0 };
    furycolor = { r = 0.788, g = 0.259, b = 0.992, a = 1.0 };
    paincolor = { r = 255/255, g = 156/255, b = 0, a = 1.0 };
    maelstromcolor = { r = 0.00, g = 0.50, b = 1.00, a = 1.0 };
    lunarcolor = { r = 0.30, g = 0.52, b = 0.90, a = 1.0 };
--@end-retail@
    unit_resource = {
        color = { r=1, g=1, b=1, a=1 },
        text = "ResourceBar",
        enable = false,
        priority = 30,
        range = false
    },
--@retail@
    EnableForHealers = false,
--@end-retail@
    EnableOnlyMana = false,
    NoPets = false,
}

local resourcebar_options = {
--@retail@
    ["Resource Bar Healer Only"] = {
        type = "toggle",
        name = "Only show Healers Bar",
        order = 50,
        desc = "Only show healers resource bar",
        get = function ()
            return PlexusResourceBar.db.profile.EnableForHealers
            end,
        set = function(_, v)
            PlexusResourceBar.db.profile.EnableForHealers = v
            PlexusResourceBar:UpdateAllUnits()
        end
    },
--@end-retail@
    ["Resource Bar Mana Only"] = {
        type = "toggle",
        name = "Only show mana Bars",
        order = 60,
        desc = "Only show mana bars",
        get = function ()
            return PlexusResourceBar.db.profile.EnableOnlyMana
            end,
        set = function(_, v)
            PlexusResourceBar.db.profile.EnableOnlyMana = v
            PlexusResourceBar:UpdateAllUnits()
        end
    },
    ["No Pets"] = {
        type = "toggle",
        name = "Don't Show Pets",
        order = 70,
        desc = "Only show player bars",
        get = function ()
            return PlexusResourceBar.db.profile.NoPets
            end,
        set = function(_, v)
            PlexusResourceBar.db.profile.NoPets = v
            PlexusResourceBar:UpdateAllUnits()
        end
    },
    ["Resource Bar Colors"] = {
        name = "Colors",
        order = 200,
        type = "group",
        dialogInline = true,
        --childGroups = "tab",
        args = {
            ["Mana Bar Color"] = {
                name = "Mana Color",
                order = 40,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.manacolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.manacolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Energy Bar Color"] = {
                name = "Energy Color",
                order = 50,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.energycolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.energycolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Rage Bar Color"] = {
                name = "Rage Color",
                order = 60,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.ragecolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.ragecolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
--@retail@
            ["Runic Bar Color"] = {
                name = "Runic Color",
                order = 70,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.runiccolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.runiccolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Focus Bar Color"] = {
                name = "Focus Color",
                order = 80,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.focuscolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.focuscolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Insanity Bar Color"] = {
                name = "Insanity Color",
                order = 90,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.insanitycolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.insanitycolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Fury Bar Color"] = {
                name = "Fury Color",
                order = 100,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.furycolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.furycolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Pain Bar Color"] = {
                name = "Pain Color",
                order = 110,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.paincolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.paincolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Maelstrom Bar Color"] = {
                name = "Maelstrom Color",
                order = 120,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.maelstromcolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.maelstromcolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
            ["Lunar Bar Color"] = {
                name = "Lunar Color(Balance Druid)",
                order = 130,
                type = "color", hasAlpha = true,
                get = function()
                    local color = PlexusResourceBar.db.profile.lunarcolor
                    return color.r, color.g, color.b, color.a
                end,
                set = function(_, r, g, b, a)
                    local color = PlexusResourceBar.db.profile.lunarcolor
                    color.r = r
                    color.g = g
                    color.b = b
                    color.a = a or 1
                    PlexusFrame:UpdateAllFrames()
                end,
            },
--@end-retail@
            ["Reset"] = {
                order = 1000,
                name = "Reset Resource colors (Require Reload)",
                type = "execute", width = "double",
                func = function() PlexusResourceBar:ResetResourceColors() end,
            },
        },
    },
}

function PlexusResourceBar:ResetResourceColors() --luacheck: ignore 212
    PlexusResourceBar.db.profile.manacolor = PlexusResourceBar.defaultDB.manacolor
    PlexusResourceBar.db.profile.energycolor = PlexusResourceBar.defaultDB.energycolor
    PlexusResourceBar.db.profile.ragecolor = PlexusResourceBar.defaultDB.ragecolor
    PlexusResourceBar.db.profile.runiccolor = PlexusResourceBar.defaultDB.runiccolor
    PlexusResourceBar.db.profile.focuscolor = PlexusResourceBar.defaultDB.focuscolor
    PlexusResourceBar.db.profile.insanitycolor = PlexusResourceBar.defaultDB.insanitycolor
    PlexusResourceBar.db.profile.furycolor = PlexusResourceBar.defaultDB.furycolor
    PlexusResourceBar.db.profile.paincolor = PlexusResourceBar.defaultDB.paincolor
    PlexusResourceBar.db.profile.maelstromcolor = PlexusResourceBar.defaultDB.maelstromcolor
    PlexusResourceBar.db.profile.lunarcolor = PlexusResourceBar.defaultDB.lunarcolor
    PlexusFrame:UpdateAllFrames()
end

function PlexusResourceBar:OnInitialize()
    self.super.OnInitialize(self)

    self:RegisterStatus('unit_resource',"Resource Bar", resourcebar_options, true)
    PlexusStatus.options.args['unit_resource'].args['color'] = nil

end

function PlexusResourceBar:OnStatusEnable(status)
    if status == "unit_resource" then
        self:RegisterEvent("UNIT_POWER_UPDATE","UpdateUnit")
        self:RegisterEvent("UNIT_MAXPOWER","UpdateUnit")
        self:RegisterEvent("PLAYER_ENTERING_WORLD","UpdateAllUnits")
--@retail@
        self:RegisterEvent("ROLE_CHANGED_INFORM")
--@end-retail@
        self:RegisterMessage("Plexus_UnitJoined")
        self:UpdateAllUnits()
    end
end

function PlexusResourceBar:OnStatusDisable(status)
    if status == "unit_resource" then
        for guid, _ in PlexusRoster:IterateRoster() do
            self.core:SendStatusLost(guid, "unit_resource")
        end
        self:UnregisterEvent("UNIT_POWER_UPDATE")
        self:UnregisterEvent("UNIT_MAXPOWER")
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
--@retail@
        self:UnregisterEvent("ROLE_CHANGED_INFORM")
--@end-retail@
        self:UnregisterMessage("Plexus_UnitJoined")
    end
end

function PlexusResourceBar:UpdateUnit(_, unitid)
    if not unitid then return end
    local NoPets = PlexusResourceBar.db.profile.NoPets
    local unitGUID = UnitGUID(unitid)
    --don't update for a unit not in group
    if not PlexusRoster:IsGUIDInGroup(unitGUID) then return end
    if (NoPets and not UnitIsPlayer(unitid)) then
        self.core:SendStatusLost(unitGUID, "unit_resource")
    else
        self:UpdateUnitResource(unitid)
    end
end

--@retail@
function PlexusResourceBar:ROLE_CHANGED_INFORM(event, changedName, fromName, oldRole, newRole)
    -- Catch if a unit changes role so that if a unit power doesn't change(role changed spec not changed)
    -- We will still update their frame
    local unitGUID = PlexusRoster:GetGUIDByFullName(changedName)
    local unitid = PlexusRoster:GetUnitidByGUID(unitGUID)
    self:Debug("ROLE_CHANGED_INFORM", event, changedName, fromName, oldRole, newRole)
    self:Debug("ROLE_CHANGED_INFORM",changedName, unitGUID, unitid)
    local EnableForHealers = PlexusResourceBar.db.profile.EnableForHealers
    if EnableForHealers then
        if newRole ~= "HEALER" then
            self.core:SendStatusLost(unitGUID, "unit_resource")
            return
        end
    end

    if not unitid then return end
    self:UpdateUnitResource(unitid)
end
--@end-retail@

function PlexusResourceBar:Plexus_UnitJoined(_, _, unitid)
    local NoPets = PlexusResourceBar.db.profile.NoPets
    local unitGUID = UnitGUID(unitid)
    if not unitid then return end
    if (NoPets and not UnitIsPlayer(unitid)) then
        self.core:SendStatusLost(unitGUID, "unit_resource")
    else
        self:UpdateUnitResource(unitid)
    end
end

function PlexusResourceBar:UpdateAllUnits()
    local NoPets = PlexusResourceBar.db.profile.NoPets
    for _, unitid in PlexusRoster:IterateRoster() do
        local unitGUID = UnitGUID(unitid)
        if (NoPets and not UnitIsPlayer(unitid)) then
            self.core:SendStatusLost(unitGUID, "unit_resource")
        else
            self:UpdateUnitResource(unitid)
        end
    end
end

function PlexusResourceBar:UpdateUnitResource(unitid)
    local color
    if not unitid then return end
    --local UnitGUID = UnitGUID(unitid)
    --if not UnitGUID then return end
    local unitGUID = UnitGUID(unitid)
    local current, max = UnitPower(unitid), UnitPowerMax(unitid)
    local priority = PlexusResourceBar.db.profile.unit_resource.priority
    local EnableForHealers = PlexusResourceBar.db.profile.EnableForHealers
    local unitpower = UnitPowerType(unitid)
--@retail@
    if EnableForHealers then
        local members = GetNumGroupMembers();
        local subGroupMembers = GetNumSubgroupMembers()
        local currentSpec = GetSpecialization()
        local currentSpecRole = currentSpec and select(5, GetSpecializationInfo(currentSpec)) or "None"
        if ((members ~= 0 or subGroupMembers ~= 0) and UnitGroupRolesAssigned(unitid) ~= "HEALER") or
        (UnitGUID("player") == UnitGUID(unitid) and currentSpecRole ~= "HEALER") then
            self.core:SendStatusLost(unitGUID, "unit_resource")
            return
        end
    end
--@end-retail@
    local NoPets = PlexusResourceBar.db.profile.NoPets
    if (NoPets and not UnitIsPlayer(unitid)) then
        self.core:SendStatusLost(unitGUID, "unit_resource")
        return
    end
    local EnableOnlyMana = PlexusResourceBar.db.profile.EnableOnlyMana
    if EnableOnlyMana then
        if unitpower ~= 0 then
            self.core:SendStatusLost(unitGUID, "unit_resource")
            return
        end
    end

    if unitpower == 3 then
        color = PlexusResourceBar.db.profile.energycolor
--@retail@
    elseif unitpower == 2 then
        color = PlexusResourceBar.db.profile.focuscolor
    elseif unitpower == 6 then
        color = PlexusResourceBar.db.profile.runiccolor
    elseif unitpower == 8 then
        color = PlexusResourceBar.db.profile.lunarcolor
    elseif unitpower == 11 then
        color = PlexusResourceBar.db.profile.maelstromcolor
    elseif unitpower == 13 then
        color = PlexusResourceBar.db.profile.insanitycolor
    elseif unitpower == 17 then
        color = PlexusResourceBar.db.profile.furycolor
    elseif unitpower == 18 then
        color = PlexusResourceBar.db.profile.paincolor
--@end-retail@
    elseif unitpower == 1 then
        color = PlexusResourceBar.db.profile.ragecolor
    else
        color = PlexusResourceBar.db.profile.manacolor
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

