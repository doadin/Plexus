--local zone = "Plaguefall"
local zoneid = 1674

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

--Globgrog
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Globgrog")
PlexusStatusRaidDebuff:DebuffId(zoneid, 324652, 101, 5, 5) --Debilitating Plague
PlexusStatusRaidDebuff:DebuffId(zoneid, 326242, 102, 5, 5) --Slime Wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 330069, 103, 5, 5, nil, true) --Concentrated Plague

--Doctor Ickus
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Doctor Ickus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 330069, 201, 5, 5, nil, true) --Concentrated Plague
PlexusStatusRaidDebuff:DebuffId(zoneid, 329110, 202, 5, 5, nil, true) --Slime Injection
PlexusStatusRaidDebuff:DebuffId(zoneid, 322358, 203, 5, 5, nil, true) --Burning Strain
PlexusStatusRaidDebuff:DebuffId(zoneid, 322410, 204, 5, 5) --Withering Filth

--Domina Venomblade
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Domina Venomblade")
PlexusStatusRaidDebuff:DebuffId(zoneid, 333406, 301, 5, 5) --Assassinate
PlexusStatusRaidDebuff:DebuffId(zoneid, 325552, 302, 5, 5) --Cytotoxic Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 331818, 303, 5, 5) --Shadow Ambush
PlexusStatusRaidDebuff:DebuffId(zoneid, 332397, 304, 5, 5) --Shroudweb

--Stradama Margrave
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Stradama Margrave")
PlexusStatusRaidDebuff:DebuffId(zoneid, 331399, 401, 5, 5, nil, true) --Infectios Rain
PlexusStatusRaidDebuff:DebuffId(zoneid, 330135, 402, 5, 5) --Fount of Pestilence
