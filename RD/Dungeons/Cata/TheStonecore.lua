--local zone = "The Stonecore"
local zoneid = 324


local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

PlexusStatusRaidDebuff:DebuffId(zoneid, 81441, 1, 6, 6, true) --Shadowfury
PlexusStatusRaidDebuff:DebuffId(zoneid, 81440, 1, 6, 6, true) --Frostbolt Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 81508, 1, 6, 6, true) --Dust Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 81711, 1, 6, 6, true) --Fracture
PlexusStatusRaidDebuff:DebuffId(zoneid, 80221, 1, 6, 6, true) --Beat Down
PlexusStatusRaidDebuff:DebuffId(zoneid, 80913, 1, 6, 6, true) --Crystal Shards
PlexusStatusRaidDebuff:DebuffId(zoneid, 80151, 1, 6, 6, true) --Ignite
PlexusStatusRaidDebuff:DebuffId(zoneid, 81569, 1, 6, 6, true) --Spinning Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 80028, 1, 6, 6, true) --Rock Bore
PlexusStatusRaidDebuff:DebuffId(zoneid, 81442, 1, 6, 6, true) --Fear

--Corborus
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Corborus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 86881, 11, 6, 6, true)
--Crystal Shard
PlexusStatusRaidDebuff:DebuffId(zoneid, 82415, 12, 6, 6, true)
--Rock Borer
--Slabhide
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Slabhide")
--Lava Fissure
PlexusStatusRaidDebuff:DebuffId(zoneid, 80807, 21, 6, 6, true)
--Stalactite
PlexusStatusRaidDebuff:DebuffId(zoneid, 92265, 22, 6, 6, true)
--Ozruk
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Ozruk")
PlexusStatusRaidDebuff:DebuffId(zoneid, 78835, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 78859, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 92426, 33, 6, 6, true)
--High Priestess Azil
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "High Priestess Azil")
PlexusStatusRaidDebuff:DebuffId(zoneid, 79345, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 79351, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 42499, 43, 6, 6, true)