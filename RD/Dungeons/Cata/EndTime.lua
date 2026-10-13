--local zone = "End Time"
local zoneid = 404

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

PlexusStatusRaidDebuff:DebuffId(zoneid, 102066, 1, 6, 6, true) --Flesh Rip
PlexusStatusRaidDebuff:DebuffId(zoneid, 101984, 1, 6, 6, true) --Distortion Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 102414, 1, 6, 6, true) --Dark Moonlight
PlexusStatusRaidDebuff:DebuffId(zoneid, 277373, 1, 6, 6, true) --Massive Glaive
PlexusStatusRaidDebuff:DebuffId(zoneid, 101619, 1, 6, 6, true) --Magma
PlexusStatusRaidDebuff:DebuffId(zoneid, 102057, 1, 6, 6, true) --Scorched
PlexusStatusRaidDebuff:DebuffId(zoneid, 109952, 1, 6, 6, true) --Cadaver Toss
PlexusStatusRaidDebuff:DebuffId(zoneid, 108589, 1, 6, 6, true) --Tail Sweep
PlexusStatusRaidDebuff:DebuffId(zoneid, 101840, 1, 6, 6, true) --Molten Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 102158, 1, 6, 6, true) --Sear Flesh
PlexusStatusRaidDebuff:DebuffId(zoneid, 102132, 1, 6, 6, true) --Break Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 102600, 1, 6, 6, true) --Temporal Vortex

--Echo of Baine
--Echo of Jaina
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Echo of Jaina")
PlexusStatusRaidDebuff:DebuffId(zoneid, 101339, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 101810, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 101809, 13, 6, 6, true)
--Echo of Sylvanas
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Echo of Sylvanas")
--Wracking Pain
PlexusStatusRaidDebuff:DebuffId(zoneid, 101412, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 101411, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 101401, 23, 6, 6, true)
--Echo of Tyrande
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Echo of Tyrande")
--Dark Moonlight
PlexusStatusRaidDebuff:DebuffId(zoneid, 102151, 31, 6, 6, true)
--Piercing Gaze of Elune
PlexusStatusRaidDebuff:DebuffId(zoneid, 102241, 32, 6, 6, true)
--Murozond
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Murozond")
PlexusStatusRaidDebuff:DebuffId(zoneid, 102381, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 102569, 42, 6, 6, true)