--local zone = "The Arcway"
local zoneid = 749

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
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 210645, 1, 6, 6, true) --Arcanic Bane
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211756, 1, 6, 6, true) --Searing Wound
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 226269, 1, 6, 6, true) --Torment
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211125, 1, 6, 6, true) --Parallel Dimension
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211000, 1, 6, 6, true) --Nether Wound
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211543, 1, 6, 6, true) --Devour
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 202156, 1, 6, 6, true) --Corrosion
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 210750, 1, 6, 6, true) --Collapsing Rift
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 210684, 1, 6, 6, true) --Siphon Essence
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 203592, 1, 6, 6, true) --Black Plague
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 202232, 1, 6, 6, true) --Consume
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 194006, 1, 6, 6, true) --Ooze Puddle

--Corstilax
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Corstilax")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 196074, 11, 6, 6, true) --Suppression Protocol
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 195804, 12, 6, 6, true) --Quarantine
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 220500, 13, 6, 6, true) --Destabilized Orb


--Ivanyr
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Ivanyr")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 196562, 21, 6, 6, true) --Volatile Magic


--General Xakal
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "General Xakal")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 153234, 31, 6, 6, true)


--Nal'tira
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Nal'tira")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200284, 41, 6, 6, true) --Tangled Web
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200040, 42, 6, 6, true) --Nether Venom

--Advisor Vandros
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Advisor Vandros")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 203914, 51, 6, 6, true) --Banished In Time
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 203139, 52, 6, 6, true) --Force Nova
