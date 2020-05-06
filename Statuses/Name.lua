--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Name.lua
    Plexus status module for unit names.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusName = Plexus:NewStatusModule("PlexusStatusName")
PlexusStatusName.menuName = L["Unit Name"]
PlexusStatusName.options = false

PlexusStatusName.defaultDB = {
    unit_name = {
        enable = true,
        priority = 1,
        text = L["Unit Name"],
        color = { r = 1, g = 1, b = 1, a = 1 },
        class = true,
    },
}

local nameOptions = {
    class = {
        name = L["Use class color"],
        desc = L["Color by class"],
        type = "toggle", width = "double",
        get = function()
            return PlexusStatusName.db.profile.unit_name.class
        end,
        set = function()
            PlexusStatusName.db.profile.unit_name.class = not PlexusStatusName.db.profile.unit_name.class
            PlexusStatusName:UpdateAllUnits()
        end,
    }
}

local classIconCoords = {}
for class, t in pairs(CLASS_ICON_TCOORDS) do
    local offset, left, right, bottom, top = 0.025, unpack(t)
    classIconCoords[class] = {
        left   = left   + offset,
        right  = right  - offset,
        bottom = bottom + offset,
        top    = top    - offset,
    }
end

function PlexusStatusName:PostInitialize()
    self:RegisterStatus("unit_name", L["Unit Name"], nameOptions, true)
end

function PlexusStatusName:OnStatusEnable(status)
    if status ~= "unit_name" then return end

    self:RegisterEvent("UNIT_NAME_UPDATE", "UpdateUnit")
    self:RegisterEvent("UNIT_PORTRAIT_UPDATE", "UpdateUnit")
    if not Plexus:IsClassicWow() then
        self:RegisterEvent("UNIT_ENTERED_VEHICLE", "UpdateVehicle")
        self:RegisterEvent("UNIT_EXITED_VEHICLE", "UpdateVehicle")
    end
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")

    self:RegisterMessage("Plexus_UnitJoined", "UpdateUnit")
    self:RegisterMessage("Plexus_UnitChanged", "UpdateUnit")
    self:RegisterMessage("Plexus_UnitLeft", "UpdateUnit")

    self:RegisterMessage("Plexus_ColorsChanged", "UpdateAllUnits")

    self:UpdateAllUnits()
end

function PlexusStatusName:OnStatusDisable(status)
    if status ~= "unit_name" then return end

    self:UnregisterEvent("UNIT_NAME_UPDATE")
    self:UnregisterEvent("UNIT_PORTRAIT_UPDATE")
    if not Plexus:IsClassicWow() then
        self:UnregisterEvent("UNIT_ENTERED_VEHICLE")
        self:UnregisterEvent("UNIT_EXITED_VEHICLE")
    end
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")

    self:UnregisterMessage("Plexus_UnitJoined")
    self:UnregisterMessage("Plexus_UnitChanged")
    self:UnregisterMessage("Plexus_UnitLeft")
    self:UnregisterMessage("Plexus_ColorsChanged")

    self.core:SendStatusLostAllUnits("unit_name")
end

function PlexusStatusName:UpdateVehicle(event, unitid)
    self:UpdateUnit(event, unitid)
    local pet_unit = unitid .. "pet"
    if UnitExists(pet_unit) then
        self:UpdateUnit(event, pet_unit)
    end
end

function PlexusStatusName:UpdateUnit(event, guid)
    self:Debug("UpdateUnit event: ", event)
    local settings = self.db.profile.unit_name

    local name = PlexusRoster:GetNameByGUID(guid)
    if not name or not settings.enable then return end

    local unitid = PlexusRoster:GetUnitidByGUID(guid)
    local _, class = UnitClass(unitid)

    -- show player name instead of vehicle name
    local owner_unitid = PlexusRoster:GetOwnerUnitidByUnitid(unitid)
    if not Plexus:IsClassicWow() then
        if owner_unitid and UnitHasVehicleUI(owner_unitid) then
            local owner_guid = UnitGUID(owner_unitid)
            name = PlexusRoster:GetNameByGUID(owner_guid)
        end
    end
    if Plexus:IsClassicWow() then
        if owner_unitid and UnitOnTaxi(owner_unitid) then
            local owner_guid = UnitGUID(owner_unitid)
            name = PlexusRoster:GetNameByGUID(owner_guid)
        end
    end

    self.core:SendStatusGained(guid, "unit_name",
        settings.priority,
        nil,
        settings.class and self.core:UnitColor(guid) or settings.color,
        name,
        nil,
        nil,
        class and [[Interface\Glues\CharacterCreate\UI-CharacterCreate-Classes]] or nil,
        nil,
        nil,
        nil,
        class and classIconCoords[class] or nil)
end

function PlexusStatusName:UpdateAllUnits()
    for guid, _ in PlexusRoster:IterateRoster() do
        self:UpdateUnit("UpdateAllUnits", guid)
    end
end
