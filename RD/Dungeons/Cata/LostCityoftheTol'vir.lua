--local zone = "Gate of the Setting Sun"
local zoneid = 277

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--General Husam
--Lockmaw
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Lockmaw")
--Viscous Poison
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81642, 11, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81690, 12, 6, 6, true)
--Vicious Bite
--Paralytic Blow Dart
--Smoke Bomb
--Dragon's Breath
--High Prophet Barim
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "High Prophet Barim")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 82622, 21, 6, 6, true)
--Heaven's Fury
--Blaze of the Heavens
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81947, 22, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 82139, 23, 6, 6, true)
--Wail of Darkness
--Siamat
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Siamat")
--Lightning Nova
--Lightning Charge
--Tempest Storm
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 83066, 31, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 83089, 32, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 84982, 33, 6, 6, true)