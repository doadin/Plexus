--local zone = "Gate of the Setting Sun"
local zoneid = 458

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Vizier Jin'bak
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Vizier Jin'bak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 120593, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 119941, 12, 6, 6, true)
--Commander Vo'jak
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Commander Vo'jak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 120778, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 120200, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 120789, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 120759, 24, 6, 6, true)
--General Pa'valak
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "General Pa'valak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 124283, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 119875, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 119388, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 117631, 34, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 119840, 35, 6, 6, true)
--Wing Leader Ner'onok
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Wing Leader Ner'onok")
PlexusStatusRaidDebuff:DebuffId(zoneid, 121442, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 121447, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 121284, 43, 6, 6, true)