--[[--------------------------------------------------------------------
	Plexus
	Compact party and raid unit frames.
	Copyright (c) 2021 Doadin <doadinaddons@gmail.com>
	All rights reserved. See the accompanying LICENSE file for details.
	https://github.com/doadin/Plexus
------------------------------------------------------------------------
	VoiceComm.lua
	PlexusStatus module for showing who's speaking over the in-game voice comm system.
----------------------------------------------------------------------]]

local _, Plexus = ...
local L = Plexus.L
local Roster = Plexus:GetModule("PlexusRoster")

local PlexusStatusVoiceComm = Plexus:NewStatusModule("PlexusStatusVoiceComm")
PlexusStatusVoiceComm.menuName = L["Voice Chat"]
PlexusStatusVoiceComm.options = false

PlexusStatusVoiceComm.defaultDB = {
	alert_voice = {
		text =  L["Talking"],
		enable = false,
		color = { r = 0.5, g = 1.0, b = 0.5, a = 1.0 },
		priority = 50,
		range = false,
		icon = "Interface\\Common\\VoiceChat-Speaker-Small",
	},
}

function PlexusStatusVoiceComm:PostInitialize()
	self:RegisterStatus("alert_voice", L["Voice Chat"], nil, true)
end

function PlexusStatusVoiceComm:OnStatusEnable(status)
	if status == "alert_voice" then
		self:RegisterEvent("VOICE_CHAT_CHANNEL_MEMBER_SPEAKING_STATE_CHANGED")
		--self:RegisterEvent("VOICE_CHAT_CHANNEL_MEMBER_GUID_UPDATED")
		self:RegisterMessage("Plexus_RosterUpdated", "UpdateAllUnits")
	end
end

function PlexusStatusVoiceComm:OnStatusDisable(status)
	if status == "alert_voice" then
		self:UnregisterEvent("VOICE_CHAT_CHANNEL_MEMBER_SPEAKING_STATE_CHANGED")
		--self:UnregisterEvent("VOICE_CHAT_CHANNEL_MEMBER_GUID_UPDATED")
		self:UnregisterMessage("Plexus_RosterUpdated")
		self.core:SendStatusLostAllUnits("alert_voice")
	end
end

function PlexusStatusVoiceComm:VOICE_CHAT_CHANNEL_MEMBER_SPEAKING_STATE_CHANGED(event, memberID, channelID, isSpeaking)
    local guid = C_VoiceChat.GetMemberGUID(memberID, channelID)
	local settings = self.db.profile.alert_voice

	if isSpeaking then
	    self.core:SendStatusGained(
	    	guid,
	    	"alert_voice",
	    	settings.priority,
	    	settings.range,
	    	settings.color,
	    	settings.text,
	    	nil,
	    	nil,
	    	settings.icon)
	else
		self.core:SendStatusLost(guid, "alert_voice")
	end

end

