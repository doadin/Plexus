--local zone = "Mists of Tirna Scithe"
local zoneid = 1669

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

--Ingra Maloch
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Ingra Maloch")
PlexusStatusRaidDebuff:DebuffId(zoneid, 323146, 101, 5, 5) --Death Shroud
PlexusStatusRaidDebuff:DebuffId(zoneid, 328756, 102, 5, 5) --Repulsive Visage
PlexusStatusRaidDebuff:DebuffId(zoneid, 323250, 103, 5, 5) --Anima Puddle

--Mistcaller
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Mistcaller")
PlexusStatusRaidDebuff:DebuffId(zoneid, 321891, 201, 4, 4) --Freeze Tag Fixation
PlexusStatusRaidDebuff:DebuffId(zoneid, 321893, 202, 5, 5) --Freezing Burst

--Tred'ova
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Tred'ova")
PlexusStatusRaidDebuff:DebuffId(zoneid, 322563, 301, 5, 5) --Marked Prey
PlexusStatusRaidDebuff:DebuffId(zoneid, 322648, 302, 5, 5) --Mind Link
PlexusStatusRaidDebuff:DebuffId(zoneid, 326309, 303, 5, 5) --Decomposing Acid
