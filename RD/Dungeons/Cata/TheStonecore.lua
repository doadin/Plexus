--local zone = "The Stonecore"
local zoneid = 324


-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81441, 1, 6, 6, true) --Shadowfury
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81440, 1, 6, 6, true) --Frostbolt Volley
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81508, 1, 6, 6, true) --Dust Storm
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81711, 1, 6, 6, true) --Fracture
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 80221, 1, 6, 6, true) --Beat Down
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 80913, 1, 6, 6, true) --Crystal Shards
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 80151, 1, 6, 6, true) --Ignite
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81569, 1, 6, 6, true) --Spinning Slash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 80028, 1, 6, 6, true) --Rock Bore
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 81442, 1, 6, 6, true) --Fear

--Corborus
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Corborus")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 86881, 11, 6, 6, true)
--Crystal Shard
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 82415, 12, 6, 6, true)
--Rock Borer
--Slabhide
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Slabhide")
--Lava Fissure
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 80807, 21, 6, 6, true)
--Stalactite
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 92265, 22, 6, 6, true)
--Ozruk
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Ozruk")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 78835, 31, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 78859, 32, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 92426, 33, 6, 6, true)
--High Priestess Azil
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "High Priestess Azil")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 79345, 41, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 79351, 42, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 42499, 43, 6, 6, true)