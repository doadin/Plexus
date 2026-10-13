--local zone = "Maw of Souls"
local zoneid = 706

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--M+
PlexusStatusRaidDebuff:DebuffId(zoneid, 240447, 1, 6, 6, true) --Quake
PlexusStatusRaidDebuff:DebuffId(zoneid, 240559, 1, 6, 6, true, true) --Grievous Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 209858, 1, 6, 6, true, true) --Necrotic Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 240443, 1, 6, 6, true, true) --Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 226512, 1, 6, 6, true) --Sanguine Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 409492, 1, 6, 6, true, true) --Afflicted Cry
PlexusStatusRaidDebuff:DebuffId(zoneid, 408805, 1, 6, 6, true) --Destabilize
PlexusStatusRaidDebuff:DebuffId(zoneid, 408556, 1, 6, 6, true) --Entangled
PlexusStatusRaidDebuff:DebuffId(zoneid, 440313, 1, 6, 6, true) --Devouring Rift

--Trash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 194674, 1, 6, 6, true) --Barbed Spear
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200208, 1, 6, 6, true) --Brackwater Blast
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 195279, 1, 6, 6, true) --Bind
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 185539, 1, 6, 6, true) --Rapid Rupture
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 194640, 1, 6, 6, true) --Curse of Hope
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 198374, 1, 6, 6, true) --Hamstring
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 225778, 1, 6, 6, true) --Backlash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 194099, 1, 6, 6, true) --Bile Breath
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 199185, 1, 6, 6, true) --Ravenous Bite
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 198944, 1, 6, 6, true) --Breach Armor
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 194102, 1, 6, 6, true) --Poisonous Sludge
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 194657, 1, 6, 6, true) --Soul Siphon
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 201566, 1, 6, 6, true) --Swirling Muck

--Ymiron, the Fallen King
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Ymiron, the Fallen King")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 153480, 11, 6, 6, true)


--Harbaron
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Harbaron")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 194327, 21, 6, 6, true) --Fragment
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 194235, 22, 6, 6, true) --Nether Rip


--Helya
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Helya")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 197262, 31, 6, 6, true) --Taint of the Sea
