--local zone = "Gate of the Setting Sun"
local zoneid = 398

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Peroth'arn
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Peroth'arn")
--Corrupting Touch
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 108141, 11, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 105544, 12, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 104905, 13, 6, 6, true)
--Easy Prey
--Queen Azshara
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Queen Azshara")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 103241, 21, 6, 6, true)
--Coldflame
--Firebomb
--Mannoroth and Varo'then
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Mannoroth and Varo'then")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 103888, 31, 6, 6, true)
--Aura of Immolation