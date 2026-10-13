--local zone = "Gate of the Setting Sun"
local zoneid = 440

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 106857, 1, 6, 6, true) --Blackout Drunk
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 107046, 1, 6, 6, true) --Water Strike
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 114291, 1, 6, 6, true) --Explosive Brew

--Ook-Ook
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Ook-Ook")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 106807, 11, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 107351, 12, 6, 6, true)
--Hoptallus
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Hoptallus")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 112992, 21, 6, 6, true)
--Yan-Zhu the Uncasked
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Yan-Zhu the Uncasked")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 114548, 31, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 106546, 32, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 106851, 33, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 114451, 34, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 115003, 35, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 114466, 36, 6, 6, true)