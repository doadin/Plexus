--local zone = "Scholomance"
local zoneid = 476

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Instructor Chillheart
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Instructor Chillheart")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 111631, 11, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 111610, 12, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 51498, 13, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 32860, 14, 6, 6, true)
--Jandice Barov
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Jandice Barov")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 114035, 21, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 113775, 22, 6, 6, true)
--Rattlegore
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Rattlegore")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 114007, 31, 6, 6, true)
--Lilian Voss
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Lilian Voss")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 111585, 41, 6, 6, true)
--Darkmaster Gandling
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Darkmaster Gandling")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 348, 51, 6, 6, true)