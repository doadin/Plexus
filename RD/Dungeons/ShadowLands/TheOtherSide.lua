--local zone = "De Other Side"
local zoneid = 1679

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

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
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Hakkar the Soulflayer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 322746, 101, 5, 5) --Corrupted Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 328987, 102, 5, 5) --Zealous
PlexusStatusRaidDebuff:DebuffId(zoneid, 323118, 103, 5, 5, nil, true) --Blood Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 323569, 104, 5, 5) --Spilled Essence

--The Manastorms
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "The Manastorms")
PlexusStatusRaidDebuff:DebuffId(zoneid, 320147, 201, 5, 5, nil, true) --Bleeding
PlexusStatusRaidDebuff:DebuffId(zoneid, 320786, 202, 5, 5, nil, true) --Power Overwhelming
PlexusStatusRaidDebuff:DebuffId(zoneid, 320008, 203, 4, 4) --Frostbolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 323877, 204, 5, 5) --Echo Finger Laser X-treme
PlexusStatusRaidDebuff:DebuffId(zoneid, 320144, 205, 5, 5) --Buzz-Saw
PlexusStatusRaidDebuff:DebuffId(zoneid, 320142, 206, 5, 5, nil, true) --Diabolical Dooooooom!
PlexusStatusRaidDebuff:DebuffId(zoneid, 324010, 207, 5, 5) --Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 320132, 208, 5, 5) --Shadowfury

--Dealer Xy'exa
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Dealer Xy'exa")
PlexusStatusRaidDebuff:DebuffId(zoneid, 323692, 301, 4, 4) --Arcane Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 323687, 302, 5, 5) --Arcane Lightning
PlexusStatusRaidDebuff:DebuffId(zoneid, 342961, 303, 5, 5) --Localized Explosive Contrivance
PlexusStatusRaidDebuff:DebuffId(zoneid, 320232, 304, 5, 5) --Explosive Contrivance

--Mueh'zala
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Mueh'zala")
PlexusStatusRaidDebuff:DebuffId(zoneid, 325725, 401, 4, 4) --Cosmic Artifice
PlexusStatusRaidDebuff:DebuffId(zoneid, 334913, 402, 5, 5, nil, true) --Master of Death
PlexusStatusRaidDebuff:DebuffId(zoneid, 327649, 403, 4, 4) --Crushed Soul
