--local zone = "The Vortex Pinnacle"
local zoneid = 325

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

_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 87759, 1, 6, 6, true) --Shockwave
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 87930, 1, 6, 6, true) --Charge
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88182, 1, 6, 6, true) --Lethargic Poison
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88171, 1, 6, 6, true) --Hurricane
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88314, 1, 6, 6, true) --Twisting Winds
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 87923, 1, 6, 6, true) --Wind Blast
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 86292, 1, 6, 6, true) --Cyclone Shield
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88075, 1, 6, 6, true) --Typhoon
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 87771, 1, 6, 6, true) --Crusader Strike
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88175, 1, 6, 6, true) --Asphyxiate
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 76622, 1, 6, 6, true) --Sunder Armor
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88282, 1, 6, 6, true) --Upwind of Altairus
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88010, 1, 6, 6, true) --Cyclone

--Grand Vizier Ertan
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Grand Vizier Ertan")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 86267, 11, 6, 6, true) -- Cyclone Shield
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 413158, 12, 6, 6, true) -- Cyclone Shield Fragment
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 413151, 13, 6, 6, true) -- Summon Tempest
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 411001, 14, 6, 6, true) -- Lethal Current

--Cyclone Shield

--Storm's Edge

--Altairus
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Altairus")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88286, 21, 5, 5) -- Downwind of Altairus
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88282, 22, 5, 5) -- Upwind of Altairus
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 413296, 23, 6, 6, true) -- Downburst
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 88308, 24, 6, 6, true) -- Chilling Breath
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 413331, 25, 6, 6, true) -- Biting Cold
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 413275, 26, 6, 6, true) -- Cold Front

--Asaad, Caliph of Zephyrs
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Asaad, Caliph of Zephyrs")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 86930, 31, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 87618, 32, 6, 6, true)