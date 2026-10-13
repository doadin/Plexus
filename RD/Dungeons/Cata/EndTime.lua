--local zone = "End Time"
local zoneid = 404

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Flesh Rip
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101984, 1, 6, 6, true) --Distortion Bomb
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102414, 1, 6, 6, true) --Dark Moonlight
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 277373, 1, 6, 6, true) --Massive Glaive
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101619, 1, 6, 6, true) --Magma
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102057, 1, 6, 6, true) --Scorched
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 109952, 1, 6, 6, true) --Cadaver Toss
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 108589, 1, 6, 6, true) --Tail Sweep
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101840, 1, 6, 6, true) --Molten Blast
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102158, 1, 6, 6, true) --Sear Flesh
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102132, 1, 6, 6, true) --Break Armor
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102600, 1, 6, 6, true) --Temporal Vortex

--Echo of Baine
--Echo of Jaina
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Echo of Jaina")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101339, 11, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101810, 12, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101809, 13, 6, 6, true)
--Echo of Sylvanas
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Echo of Sylvanas")
--Wracking Pain
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101412, 21, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101411, 22, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 101401, 23, 6, 6, true)
--Echo of Tyrande
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Echo of Tyrande")
--Dark Moonlight
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102151, 31, 6, 6, true)
--Piercing Gaze of Elune
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102241, 32, 6, 6, true)
--Murozond
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Murozond")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102381, 41, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 102569, 42, 6, 6, true)