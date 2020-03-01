--[[--------------------------------------------------------------------
	Plexus
	Compact party and raid unit frames.
	Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
	Copyright (c) 2009-2018 Phanx <addons@phanx.net>
	All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
	Aggro.lua
	Plexus status module for aggro/threat.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local PlexusStatus = Plexus:GetModule("PlexusStatus")
local PlexusRoster = Plexus:GetModule("PlexusRoster")

local PlexusStatusAggro = Plexus:NewStatusModule("PlexusStatusAggro")
PlexusStatusAggro.menuName = L["Aggro"]

local libCTM
if Plexus:IsClassicWow() then
    libCTM = LibStub:GetLibrary("ThreatClassic-1.0", true)
end

local function getthreatcolor(status)
    if not Plexus:IsClassicWow() then
	    local r, g, b = GetThreatStatusColor(status)
	    return { r = r, g = g, b = b, a = 1 }
	end
	if Plexus:IsClassicWow() then
		function GetThreatStatusColor(status)
			if status == 1 then
				return 0, 0, 0, 0
			end
			if status == 2 then
				return 255, 255, 0, 1
			end
			if status == 3 then
				return 1, 0, 0, 1
		    end
		end
	    local r, g, b, a = GetThreatStatusColor(status)
	    return { r = r, g = g, b = b, a = a }
    end
end

PlexusStatusAggro.defaultDB = {
	alert_aggro = {
		text =  L["Aggro"],
		enable = true,
		color = { r = 1, g = 0, b = 0, a = 1 },
		priority = 75,
		range = false,
		threat = false,
		threatcolors = {
			[1] = getthreatcolor(1),
			[2] = getthreatcolor(2),
			[3] = getthreatcolor(3),
		},
		threattexts = {
			[1] = L["High"],
			[2] = L["Aggro"],
			[3] = L["Tank"]
		},
	},
}

PlexusStatusAggro.options = false

local function getstatuscolor(status)
	local color = PlexusStatusAggro.db.profile.alert_aggro.threatcolors[status]
	return color.r, color.g, color.b, color.a
end

local function setstatuscolor(status, r, g, b, a)
	local color = PlexusStatusAggro.db.profile.alert_aggro.threatcolors[status]
	color.r = r
	color.g = g
	color.b = b
	color.a = a or 1
end

local aggroDynamicOptions = {
	["threat_colors"] = {
		type = "group",
		dialogInline = true,
		name = L["Color"],
		order = 87,
		args = {
			["1"] = {
				type = "color",
				name = L["High Threat"],
				order = 100,
				width = "double",
				hasAlpha = true,
				get = function() return getstatuscolor(1) end,
				set = function(_, r, g, b, a) setstatuscolor(1, r, g, b, a) end,
			},
			["2"] = {
				type = "color",
				name = L["Aggro"],
				order = 101,
				width = "double",
				hasAlpha = true,
				get = function() return getstatuscolor(2) end,
				set = function(_, r, g, b, a) setstatuscolor(2, r, g, b, a) end,
			},
			["3"] = {
				type = "color",
				name = L["Tanking"],
				order = 102,
				width = "double",
				hasAlpha = true,
				get = function() return getstatuscolor(3) end,
				set = function(_, r, g, b, a) setstatuscolor(3, r, g, b, a) end,
			},
		},
	},
}

local function setupmenu()
	local args = PlexusStatus.options.args["alert_aggro"].args
	local threat = PlexusStatusAggro.db.profile.alert_aggro.threat

	if not aggroDynamicOptions.aggroColor then
		aggroDynamicOptions.aggroColor = args.color
	end

	if threat then
		args.color = nil
		args.threat_colors = aggroDynamicOptions.threat_colors
	else
		args.color = aggroDynamicOptions.aggroColor
		args.threat_colors = nil
	end
end

local aggroOptions = {
	threat = {
		type = "toggle",
		name = L["Threat levels"],
		desc = L["Show more detailed threat levels."],
		width = "full",
		get = function() return PlexusStatusAggro.db.profile.alert_aggro.threat end,
		set = function()
			PlexusStatusAggro.db.profile.alert_aggro.threat = not PlexusStatusAggro.db.profile.alert_aggro.threat
			PlexusStatusAggro.UpdateAllUnits(PlexusStatusAggro)
			setupmenu()
		end,
	},
}

function PlexusStatusAggro:PostInitialize()
	self:RegisterStatus("alert_aggro", L["Aggro"], aggroOptions, true)
	setupmenu()
end

function PlexusStatusAggro:OnStatusEnable(status)
	if status == "alert_aggro" then
        if not Plexus:IsClassicWow() then
		    self:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE", "UpdateUnit")
        end
		self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
        if Plexus:IsClassicWow() then
            assert(LibStub, "Aggro Status requires LibStub")
			assert(LibStub:GetLibrary("LibThreatClassic2"), "Aggro Status requires LibThreatClassic2(which should be included)")
			self:RegisterEvent("UNIT_COMBAT", "UNIT_COMBAT_A")
            self:RegisterEvent("UNIT_TARGET", "UpdateAllUnits")
            self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "UpdateAllUnits")
            libCTM = LibStub:GetLibrary("LibThreatClassic2")
			local function ThreatUpdated(event, guid)
				if guid then
					self:UpdateUnit("UpdateAllUnits", nil, guid)
			    end
	    	end       
            libCTM.RegisterCallback(self, "Activate", ThreatUpdated)
            libCTM.RegisterCallback(self, "Deactivate", ThreatUpdated)
			libCTM.RegisterCallback(self, "ThreatUpdated", ThreatUpdated)
			libCTM.RegisterCallback(self, "PartyChanged", ThreatUpdated)
			libCTM.RegisterCallback(self, "ThreatCleared", ThreatUpdated)
            libCTM:RequestActiveOnSolo(true)
        end
		self:UpdateAllUnits()
	end
end

function PlexusStatusAggro:OnStatusDisable(status)
	if status == "alert_aggro" then
        if not Plexus:IsClassicWow() then
		    self:UnregisterEvent("UNIT_THREAT_SITUATION_UPDATE")
        end
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        if Plexus:IsClassicWow() then
            self:UnregisterEvent("UNIT_TARGET")
            self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
            libCTM = LibStub:GetLibrary("ThreatClassic-1.0")   
            libCTM.UnregisterCallback(self, "Activate")
            libCTM.UnregisterCallback(self, "Deactivate")
			libCTM.UnregisterCallback(self, "ThreatUpdated")
			libCTM.UnregisterCallback(self, "PartyChanged")
			libCTM.UnregisterCallback(self, "ThreatCleared")
        end
		self.core:SendStatusLostAllUnits("alert_aggro")
	end
end

function PlexusStatusAggro:PostReset()
	setupmenu()
end

function PlexusStatusAggro:UpdateAllUnits()
	for guid, unit in PlexusRoster:IterateRoster() do
		self:UpdateUnit("UpdateAllUnits", unit)
	end
end
function PlexusStatusAggro:UNIT_COMBAT_A(event, unitTarget, flagText, amount, schoolMask)
	self:UpdateUnit(event, unitTarget)
end

------------------------------------------------------------------------

if not Plexus.IsClassicWow() then
local UnitGUID, UnitIsVisible, UnitThreatSituation
	 = UnitGUID, UnitIsVisible, UnitThreatSituation
end

if Plexus.IsClassicWow() then
local UnitGUID, UnitIsVisible, UnitExists, UnitIsEnemy, UnitIsUnit
	 = UnitGUID, UnitIsVisible, UnitExists, UnitIsEnemy, UnitIsUnit
local a,b,c,d,e,y,eUnit=0,0,nil
end

function PlexusStatusAggro:UpdateUnit(event, unit, guid)
	local guid = guid or unit and UnitGUID(unit)
	if not guid or not PlexusRoster:IsGUIDInRaid(guid) then return end -- sometimes unit can be nil or invalid, wtf?
    
    local status = 0
    if not Plexus.IsClassicWow() then
	    status = UnitIsVisible(unit) and UnitThreatSituation(unit) or 0
	else
		if not unit then return end
        if UnitExists(unit.."target") and UnitIsEnemy(unit, unit.."target") then
            if UnitIsUnit(unit, unit.."targettarget") then
                a,b,c,d,e=100
            else
                eUnit=unit.."target"
            end
        elseif UnitExists("target") and UnitIsEnemy("player", "target") then 
            if UnitIsUnit(unit, "playertargettarget") then
                a,b,c,d,e=100
            else
                eUnit="target"
            end
        elseif UnitExists("boss1") and UnitIsEnemy("player", "boss1") then 
            if UnitIsUnit(unit, "boss1target") then
                a,b,c,d,e=100
            else
                eUnit="boss1"
            end
        elseif UnitExists("boss2") and UnitIsEnemy("player", "boss2") then 
            if UnitIsUnit(unit, "boss2target") then
                a,b,c,d,e=100
            else
                eUnit="boss2"
            end
        end
        if eUnit then
            a, b, c, d, e = libCTM:UnitDetailedThreatSituation(unit, eUnit)
            y = libCTM:UnitThreatSituation(unit, eUnit)
            c=floor(c or 0)
            d=floor(d or 0)
            e=floor(e or 0)
            status = b
        elseif c == 0 then
            y = libCTM:UnitThreatSituation(unit, eUnit)
            status = y
        end
    end
    

	local settings = self.db.profile.alert_aggro
	local threat = settings.threat

	if status and ((threat and (status > 0)) or (status > 1)) then
		PlexusStatusAggro.core:SendStatusGained(guid, "alert_aggro",
			settings.priority,
			settings.range,
			(threat and settings.threatcolors[status] or settings.color),
			(threat and settings.threattexts[status] or settings.text),
			nil,
			nil,
			settings.icon)
	else
		PlexusStatusAggro.core:SendStatusLost(guid, "alert_aggro")
	end
end
