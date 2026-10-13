--local zone = "Scarlet Halls"
local zoneid = 431

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Houndmaster Braun
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Houndmaster Braun")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 114056, 11, 6, 6, true)
--Armsmaster Harlan
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Armsmaster Harlan")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 111216, 21, 6, 6, true)
--Flameweaver Kogler
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Flameweaver Kogler")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 113364, 31, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 113616, 32, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 113653, 33, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 11366, 34, 6, 6, true)