--local zone = "De Other Side"
local zoneid = 1679

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

--Hakkar the Soulflayer
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Hakkar the Soulflayer")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 322746, 101, 5, 5) --Corrupted Blood
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 328987, 102, 5, 5) --Zealous
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323118, 103, 5, 5, nil, true) --Blood Barrage
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323569, 104, 5, 5) --Spilled Essence

--The Manastorms
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "The Manastorms")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320147, 201, 5, 5, nil, true) --Bleeding
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320786, 202, 5, 5, nil, true) --Power Overwhelming
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320008, 203, 4, 4) --Frostbolt
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323877, 204, 5, 5) --Echo Finger Laser X-treme
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320144, 205, 5, 5) --Buzz-Saw
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320142, 206, 5, 5, nil, true) --Diabolical Dooooooom!
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 324010, 207, 5, 5) --Eruption
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320132, 208, 5, 5) --Shadowfury

--Dealer Xy'exa
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Dealer Xy'exa")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323692, 301, 4, 4) --Arcane Vulnerability
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323687, 302, 5, 5) --Arcane Lightning
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 342961, 303, 5, 5) --Localized Explosive Contrivance
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320232, 304, 5, 5) --Explosive Contrivance

--Mueh'zala
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Mueh'zala")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 325725, 401, 4, 4) --Cosmic Artifice
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 334913, 402, 5, 5, nil, true) --Master of Death
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 327649, 403, 4, 4) --Crushed Soul
