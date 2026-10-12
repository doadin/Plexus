--[[--------------------------------------------------------------------
    Plexus
    Compact party and raid unit frames.
    Copyright (c) 2006-2009 Kyle Smith (Pastamancer)
    Copyright (c) 2009-2018 Phanx <addons@phanx.net>
    Copyright (c) 2018-2026 Doadin <doadinaddons@gmail.com>
    All rights reserved. See the accompanying LICENSE file for details.
------------------------------------------------------------------------
    Ping.lua
    Plexus status module for raid target icons.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L

local Roster = Plexus:GetModule("PlexusRoster")

local PlexusStatusPing = Plexus:NewStatusModule("PlexusStatusPing")
PlexusStatusPing.menuName = L["Ping"]
PlexusStatusPing.options = false

PlexusStatusPing.defaultDB = {
    ping = {
        enable = true,
        priority = 50,
        color = {},
        icon = {},
        text = {},
    }
}

local Ping_Enabled = false
local cache = {}
local textures = {}

do
	local GetAtlasInfo = C_Texture.GetAtlasInfo
	local function st(msg)
		local d = GetAtlasInfo("Ping_Chat_"..msg) or GetAtlasInfo("Ping_Wheel_Icon_"..msg) or GetAtlasInfo("Ping_Frame_"..msg)
		textures[msg] = { msg, d.file, d.leftTexCoord, d.rightTexCoord, d.topTexCoord, d.bottomTexCoord }
	end
	st("Warning"); st("Assist"); st("Attack"); st("OnMyWay"); st("NonThreat"); st("Threat")
end

local function ShowPingEvent(icon, msg)
	if Ping_Enabled then
		local parent = icon:GetParent()
		local unit = parent and parent.unit
		if unit and Plexus:canaccessvalue(unit) then
			cache[unit] = textures[msg]
			PlexusStatusPing:UpdateUnit(unit, textures[msg], true)
		end
	end
end

local function ClearPingEvent(icon)
	if Ping_Enabled then
		local parent = icon:GetParent()
		local unit = parent and parent.unit
		if unit and Plexus:canaccessvalue(unit) then
			cache[unit] = nil
			PlexusStatusPing:UpdateUnit(unit, nil, false)
		end
	end
end

local function HookFrame(frame)
	if frame then
		local icon = frame.pingIconFrame
		if icon and not icon.__plexusHooked then
			local ok, err = pcall(icon.IsForbidden, icon)
			if ok and not err then
				hooksecurefunc(icon, "ShowPing", ShowPingEvent)
				hooksecurefunc(icon, "ClearPing", ClearPingEvent)
				icon.__plexusHooked = true
			end
		end
	end
end

function PlexusStatusPing:PostInitialize()
    self:Debug("PostInitialize")
    self:RegisterStatus("ping", L["Ping"], nil, true)
end

function PlexusStatusPing:OnStatusEnable(status)
    self:Debug("OnStatusEnable", status)
    --self:RegisterEvent("UNIT_PING_PIN_ADDED", "UpdateAllUnits")
    --self:RegisterEvent("UNIT_PING_PIN_REMOVED", "UpdateAllUnits")
	local _G, format = _G, string.format
	for i=1,5 do HookFrame(_G["CompactPartyFrameMember"..i]) end
	for g=1,8 do for i=1,5 do HookFrame(_G[format("CompactRaidGroup%dMember%d",g,i)]) end; end
	hooksecurefunc("CompactUnitFrame_UpdateUnitEvents", HookFrame)
	Ping_Enabled = true
end

function PlexusStatusPing:OnStatusDisable(status)
    self:Debug("OnStatusDisable", status)
    --self:UnregisterEvent("UNIT_PING_PIN_ADDED")
    --self:UnregisterEvent("UNIT_PING_PIN_REMOVED")
	Ping_Enabled = false
end

--function PlexusStatusPing:UpdateAllUnits(event, ...)
--    self:Debug("UpdateAllUnits", event, ...)
--    local guid, uiTextureKit = ...;
--    local settings = self.db.profile.ping
--end

function PlexusStatusPing:UpdateUnit(unit, texture, gained)
    self:Debug("UpdateUnit", unit, texture)
    local settings = self.db.profile.ping
	local guid = UnitGUID(unit)
	if gained and texture then
        self.core:SendStatusGained(guid, "ping",
            settings.priority,
            nil,
            nil, -- color
            nil, -- text
            nil,
            nil,
            texture[2],
            GetTime(), -- start
            5, -- duration
            nil,
            {left = texture[3], right = texture[4], top = texture[5], bottom = texture[6]}
        )
	else
        self.core:SendStatusLost(guid, "ping")
	end
end
