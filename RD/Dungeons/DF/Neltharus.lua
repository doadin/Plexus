-- local zone = "Neltharus"
local zoneid = 2080
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

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
PlexusStatusRaidDebuff:DebuffId(zoneid, 372971, 1, 6, 6, true) --Reverberating Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 373540, 1, 6, 6, true) --Binding Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 372570, 1, 6, 6, true) --Bold Ambush
PlexusStatusRaidDebuff:DebuffId(zoneid, 378818, 1, 6, 6, true) --Magma Conflagration
PlexusStatusRaidDebuff:DebuffId(zoneid, 372461, 1, 6, 6, true) --Imbued Magma
PlexusStatusRaidDebuff:DebuffId(zoneid, 384161, 1, 6, 6, true) --Mote of Combustion

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Chargath, Bane of Scales")
PlexusStatusRaidDebuff:DebuffId(zoneid, 374471, 101, 5, 5, true) --erupted-ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 374482, 102, 5, 5, true) --grounding-chain
PlexusStatusRaidDebuff:DebuffId(zoneid, 374482, 103, 5, 5, true) --dragon-strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 389059, 104, 5, 5, true) --Slag Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 396332, 105, 5, 5, true) --Fiery Focus
PlexusStatusRaidDebuff:DebuffId(zoneid, 373735, 106, 5, 5, true) --Dragon Strike

PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Forgemaster Gorek")
PlexusStatusRaidDebuff:DebuffId(zoneid, 381482, 201, 5, 5, true) --forgefire
PlexusStatusRaidDebuff:DebuffId(zoneid, 374842, 202, 5, 5, true) --Blazing Aegis
PlexusStatusRaidDebuff:DebuffId(zoneid, 374534, 203, 5, 5, true) --Heated Swings

PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Magmatusk")
PlexusStatusRaidDebuff:DebuffId(zoneid, 375890, 301, 5, 5, true) --magma-eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 374410, 302, 5, 5, true) --magma-tentacle

PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Warlord Sargha")
PlexusStatusRaidDebuff:DebuffId(zoneid, 377522, 401, 5, 5, true) --burning-pursuit
PlexusStatusRaidDebuff:DebuffId(zoneid, 376784, 402, 5, 5, true) --flame-vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 377018, 403, 5, 5, true) --molten-gold
PlexusStatusRaidDebuff:DebuffId(zoneid, 377022, 404, 5, 5, true) --hardened-gold
PlexusStatusRaidDebuff:DebuffId(zoneid, 377542, 405, 5, 5, true) --burning-ground