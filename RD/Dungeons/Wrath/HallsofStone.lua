--local zone = "Halls of Stone
local zoneid = 140

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 46202, 1, 6, 6, true) --Pierce Armor
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 50895, 1, 6, 6, true) --Lightning Tether
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 50761, 1, 6, 6, true) --Pillar of Woe
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 50834, 1, 6, 6, true) --Static Charge
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 50841, 1, 6, 6, true) --Lightning Ring
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 51491, 1, 6, 6, true) --Unrelenting Strike
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 51496, 1, 6, 6, true) --Chiseling Ray
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 50760, 1, 6, 6, true) --Shock of Sorrow