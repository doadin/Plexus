--[[--------------------------------------------------------------------
	Plexus
	Compact party and raid unit frames.
	Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
	Copyright (c) 2009-2018 Phanx <addons@phanx.net>
	All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
	Stagger.lua
	Plexus status module for Monk Stagger.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local PlexusRoster = Plexus:GetModule("PlexusRoster")
local PlexusStatus = Plexus:GetModule("PlexusStatus")

local PlexusStatusStagger = Plexus:NewStatusModule("PlexusStatusStagger")
PlexusStatusStagger.menuName = L["Stagger"]
PlexusStatusStagger.options = false
PlexusStatusStagger.defaultDB = {
	alert_stagger = {
		enable = true,
		colors = {
			light = { r = 0, g = 1, b = 0, a = 1 },
			moderate = { r = 1, g = 1, b = 0, a = 1 },
			heavy = { r = 1, g = 0, b = 0, a = 1 },
		},
		priority = 75,
		range = false,
	},
}

local spellID_severity = {
	[124273] = "heavy",
	[124274] = "moderate",
	[124275] = "light",
}

local monks = {}

local function getstaggercolor(severity)
	local color = PlexusStatusStagger.db.profile.alert_stagger.colors[severity]
	return color.r, color.g, color.b, color.a
end

local function setstaggercolor(severity, r, g, b, a)
	local color = PlexusStatusStagger.db.profile.alert_stagger.colors[severity]
	color.r = r
	color.g = g
	color.b = b
	color.a = a or 1
	PlexusStatus:SendMessage("Plexus_ColorsChanged")
end

local staggerOptions = {
	stagger_color = {
		type = "group",
		dialogInline = true,
		name = L["Stagger colors"],
		order = 80,
		args = {
			light = {
				type = "color",
				name = L["Light Stagger"],
				desc = L["Color for Light Stagger."],
				order = 100,
				hasAlpha = true,
				get = function () return getstaggercolor("light") end,
				set = function (_, r, g, b, a) setstaggercolor("light", r, g, b, a) end,
			},
			moderate = {
				type = "color",
				name = L["Moderate Stagger"],
				desc = L["Color for Moderate Stagger."],
				order = 101,
				hasAlpha = true,
				get = function () return getstaggercolor("moderate") end,
				set = function (_, r, g, b, a) setstaggercolor("moderate", r, g, b, a) end,
			},
			heavy = {
				type = "color",
				name = L["Heavy Stagger"],
				desc = L["Color for Heavy Stagger."],
				order = 102,
				hasAlpha = true,
				get = function () return getstaggercolor("heavy") end,
				set = function (_, r, g, b, a) setstaggercolor("heavy", r, g, b, a) end,
			},
		},
	},
	color = false,
}

function PlexusStatusStagger:PostInitialize()
	self:RegisterStatus("alert_stagger", L["Stagger"], staggerOptions, true)

	local options = PlexusStatus.options.args["alert_stagger"]
	options.desc = format(L["Status: %s\n\nSeverity of Stagger on Monk tanks"], options.name)
end

function PlexusStatusStagger:OnStatusEnable(status)
	if status == "alert_stagger" then
		self:RegisterMessage("Plexus_UnitJoined")
		self:RegisterMessage("Plexus_UnitLeft")
		self:RegisterEvent("UNIT_AURA", "UpdateUnit")
		self:RegisterEvent("UNIT_NAME_UPDATE", "UpdateName")
		for guid, unitid in PlexusRoster:IterateRoster() do
			local _, class = UnitClass(unitid)
			if class == "MONK" then
				monks[guid] = true
			end
		end
		self:UpdateAllUnits()
	end
end

function PlexusStatusStagger:OnStatusDisable(status)
	if status == "alert_stagger" then
		self:UnregisterMessage("Plexus_UnitJoined")
		self:UnregisterMessage("Plexus_UnitLeft")
		self:UnregisterEvent("UNIT_AURA")
		self:UnregisterEvent("UNIT_NAME_UPDATE")
		wipe(monks)
		self.core:SendStatusLostAllUnits("alert_stagger")
	end
end

function PlexusStatusStagger:Plexus_UnitJoined(event, guid, unitid)
	local _, class = UnitClass(unitid)
	if class == "MONK" then
		monks[guid] = true
		self:UpdateUnit(event, unitid)
	end
end

function PlexusStatusStagger:Plexus_UnitLeft(event, guid)
	monks[guid] = nil
end

function PlexusStatusStagger:UpdateName(event, unitid)
	local _, class = UnitClass(unitid)
	if class == "MONK" then
		local guid = UnitGUID(unitid)
		if PlexusRoster:IsGUIDInGroup(guid) and not monks[guid] then
			monks[guid] = true
			self:UpdateUnit(event, unitid)
		end
	end
end

function PlexusStatusStagger:UpdateAllUnits()
	for guid, unitid in PlexusRoster:IterateRoster() do
		self:UpdateUnit("UpdateAllUnits", unitid)
	end
end

function PlexusStatusStagger:UpdateUnit(event, unitid)
	local guid = UnitGUID(unitid)
	if monks[guid] then
		for i = 1, 40 do
			local name, icon, spellID, _
			name, icon, _, _, _, _, _, _, _, spellID = UnitDebuff(unitid, i)

			if not name then
				break
			end

			local severity = spellID_severity[spellID]
			if severity then
				local settings = self.db.profile.alert_stagger
				local color = severity and settings.colors[severity]
				return self.core:SendStatusGained(guid,
													"alert_stagger",
													settings.priority,
													settings.range,
													color,
													name,
													nil,
													nil,
													icon)
			end
		end
	end
	self.core:SendStatusLost(guid, "alert_stagger")
end
