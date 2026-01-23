--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2025 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Name.lua
    Plexus status module for unit names.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local DEFAULT_CHAT_FRAME = DEFAULT_CHAT_FRAME
local CLASS_ICON_TCOORDS = CLASS_ICON_TCOORDS
local UnitClass = UnitClass
local UnitExists = UnitExists
local UnitGUID = UnitGUID
local UnitName = UnitName
local UnitHasVehicleUI = UnitHasVehicleUI
local UnitOnTaxi = UnitOnTaxi

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
        translate = false,
        translatemark = false,
        usenicktag = false,
    },
}

local CyrToLat = {
	["А"] = "A",
	["а"] = "a",
	["Б"] = "B",
	["б"] = "b",
	["В"] = "V",
	["в"] = "v",
	["Г"] = "G",
	["г"] = "g",
	["Д"] = "D",
	["д"] = "d",
	["Е"] = "E",
	["е"] = "e",
	["Ё"] = "e",
	["ё"] = "e",
	["Ж"] = "Zh",
	["ж"] = "zh",
	["З"] = "Z",
	["з"] = "z",
	["И"] = "I",
	["и"] = "i",
	["Й"] = "Y",
	["й"] = "y",
	["К"] = "K",
	["к"] = "k",
	["Л"] = "L",
	["л"] = "l",
	["М"] = "M",
	["м"] = "m",
	["Н"] = "N",
	["н"] = "n",
	["О"] = "O",
	["о"] = "o",
	["П"] = "P",
	["п"] = "p",
	["Р"] = "R",
	["р"] = "r",
	["С"] = "S",
	["с"] = "s",
	["Т"] = "T",
	["т"] = "t",
	["У"] = "U",
	["у"] = "u",
	["Ф"] = "F",
	["ф"] = "f",
	["Х"] = "Kh",
	["х"] = "kh",
	["Ц"] = "Ts",
	["ц"] = "ts",
	["Ч"] = "Ch",
	["ч"] = "ch",
	["Ш"] = "Sh",
	["ш"] = "sh",
	["Щ"] = "Shch",
	["щ"] = "shch",
	["Ъ"] = "",
	["ъ"] = "",
	["Ы"] = "Y",
	["ы"] = "y",
	["Ь"] = "",
	["ь"] = "",
	["Э"] = "E",
	["э"] = "e",
	["Ю"] = "Yu",
	["ю"] = "yu",
	["Я"] = "Ya",
	["я"] = "ya"
}

local function Translate(str, mark)
	if not str then
		return ""
	end

	local mark = mark or "" --luacheck:ignore 412
	local tstr = ""
	local marked = false
	local i = 1

	while i <= string.len(str) do
		local c = str:sub(i, i)
		local b = string.byte(c)

		if b == 208 or b == 209 then
			if marked == false then
				tstr = tstr .. mark
				marked = true
			end
			c = str:sub(i + 1, i + 1)
			tstr = tstr .. (CyrToLat[string.char(b, string.byte(c))] or string.char(b, string.byte(c)))

			i = i + 2
		else
			if c == " " or c == "-" then
				marked = false
			end
			tstr = tstr .. c
			i = i + 1
		end
	end

	return tstr
end

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
    },
    translate = {
        name = "Convert Cyrillic to Latin",
        desc = "Convert Cyrillic to Latin",
        order = 1000,
        type = "toggle", width = "double",
        get = function()
            return PlexusStatusName.db.profile.unit_name.translate
        end,
        set = function()
            PlexusStatusName.db.profile.unit_name.translate = not PlexusStatusName.db.profile.unit_name.translate
            PlexusStatusName:UpdateAllUnits()
        end,
    },
    translatemark = {
        name = "Add '!' to translated names",
        desc = "Add '!' to translated names",
        order = 1001,
        type = "toggle", width = "double",
        get = function()
            return PlexusStatusName.db.profile.unit_name.translatemark
        end,
        set = function()
            PlexusStatusName.db.profile.unit_name.translatemark = not PlexusStatusName.db.profile.unit_name.translatemark
            PlexusStatusName:UpdateAllUnits()
        end,
    },
    usenicktag = {
        name = "Use NickTag",
        desc = "Use nickTag aka nick names for unit names.",
        order = 1002,
        type = "toggle", width = "double",
        get = function()
            return PlexusStatusName.db.profile.unit_name.usenicktag
        end,
        set = function()
            PlexusStatusName.db.profile.unit_name.usenicktag = not PlexusStatusName.db.profile.unit_name.usenicktag
            PlexusStatusName:UpdateAllUnits()
        end,
        hidden = function ()
            if NickTag then
                return false
            else
                return true
            end
        end,
    },
    setnicktag = {
        name = "Set NickTag",
        desc = "Set NickTag aka your nickname.",
        order = 1003,
        type = "input", width = "double",
        get = function()
            return PlexusStatusName.db.profile.unit_name.setnicktag
        end,
        set = function(_, v)
            local accepted, errortext = Plexus:SetNickname(v)
            if (not accepted) then
                DEFAULT_CHAT_FRAME:AddMessage("Error Setting NickTag: |cffFF0000" .. errortext .. "|r")
                Plexus:ResetPlayerPersona()
                --Plexus:SendPersona()
                PlexusStatusName:UpdateAllUnits()
            end
            if (accepted) then
                PlexusStatusName.db.profile.unit_name.setnicktag  = v
                Plexus:SetNickname(v)
                PlexusStatusName:UpdateAllUnits()
            end
        end,
        hidden = function ()
            if NickTag then
                return false
            else
                return true
            end
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
    if NickTag then
        NickTag.RegisterCallback(self, 'NickTag_Update', "UpdateAllUnits")
    end
    self:RegisterMessage("Plexus_ExtraUnitsChanged", "ExtraUnitsChanged")

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

function PlexusStatusName:ExtraUnitsChanged(message, unitid)
    self:Debug("UpdateUnit message: ", message)
    local guid = UnitGUID(unitid) or unitid
    PlexusStatusName:UpdateUnit(message, guid, unitid)
end

function PlexusStatusName:UpdateUnit(event, guid, unitid)
    self:Debug("UpdateUnit event: ", event)
    local settings = self.db.profile.unit_name
    if not guid then return end

    local name = (not Plexus:issecretvalue(guid) and PlexusRoster:GetNameByGUID(guid)) or Plexus:IsRetailWow() and UnitNameFromGUID(guid)
    if not name or not settings.enable then return end

    if not unitid then
        unitid = PlexusRoster:GetUnitidByGUID(guid) or unitid
    end
    local _, class
    if event ~= "Plexus_ExtraUnitsChanged" then
        _, class = UnitClass(unitid)
    end

    -- show player name instead of vehicle name
    local owner_unitid = PlexusRoster:GetOwnerUnitidByUnitid(unitid)
    if Plexus:IsRetailWow() then
        if owner_unitid and UnitHasVehicleUI(owner_unitid) then
            local owner_guid = UnitGUID(owner_unitid)
            name = PlexusRoster:GetNameByGUID(owner_guid)
        end
    end
    if Plexus:IsClassicWow() or Plexus:IsTBCWow() then
        if owner_unitid and UnitOnTaxi(owner_unitid) then
            local owner_guid = UnitGUID(owner_unitid)
            name = PlexusRoster:GetNameByGUID(owner_guid)
        end
    end

    if settings.translate then
        self:Debug("Cyrillic to Latin Enabled")
        if settings.translatemark then
            self:Debug("Translate with mark")
            name = Translate(name,"!")
        end
        if not settings.translatemark then
            self:Debug("Translate without mark")
            name = Translate(name)
        end
    end

    if settings.usenicktag then
        self:Debug("Use NickTag Enabled")
        name = Plexus:GetNickname(UnitName(unitid), nil, true)
        self:Debug(name)
        if name == "" then
            Plexus:ResetPlayerPersona()
            name = PlexusRoster:GetNameByGUID(guid)
            self:Debug("blank")
        end
        if name == nil then
            name = PlexusRoster:GetNameByGUID(guid)
        end
    end

    if Plexus.IsSpecialUnit[unitid] then
        self.core:SendStatusGained(unitid, "unit_name",
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
