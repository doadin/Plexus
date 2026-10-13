-- local zone = "The Stonevault"
local zoneid = 2341
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 449455, 1, 5, 5, true) -- Howling Fear
PlexusStatusRaidDebuff:DebuffId(zoneid, 429545, 1, 5, 5, true) -- Censoring gear
PlexusStatusRaidDebuff:DebuffId(zoneid, 448975, 1, 5, 5, true) -- Shield Stampede
PlexusStatusRaidDebuff:DebuffId(zoneid, 425027, 1, 5, 5, true) -- Seismic Wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 426308, 1, 5, 5, true) -- Void Infection
PlexusStatusRaidDebuff:DebuffId(zoneid, 427361, 1, 5, 5, true) -- Fracture
PlexusStatusRaidDebuff:DebuffId(zoneid, 428887, 1, 5, 5, true) -- Smashed
PlexusStatusRaidDebuff:DebuffId(zoneid, 449154, 1, 5, 5, true) -- Molten Mortar
PlexusStatusRaidDebuff:DebuffId(zoneid, 445207, 1, 5, 5, true) -- Piercing Wail
PlexusStatusRaidDebuff:DebuffId(zoneid, 464879, 1, 5, 5, true) -- Concussive Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 425974, 1, 5, 5, true) -- Ground Pound

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

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "E.D.N.A.")
PlexusStatusRaidDebuff:DebuffId(zoneid, 424903, 101, 5, 5, true) --Volatile Spike
PlexusStatusRaidDebuff:DebuffId(zoneid, 424805, 102, 5, 5, true) --Refracting Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 424879, 103, 5, 5, true) --Earth Shatterer
PlexusStatusRaidDebuff:DebuffId(zoneid, 424888, 104, 5, 5, true) --Seismic Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 424889, 105, 5, 5, true) --Seismic Reverberation
PlexusStatusRaidDebuff:DebuffId(zoneid, 424893, 106, 5, 5, true) --Stone Shield


PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Skarmorak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 423200, 201, 5, 5, true) --Fortified Shell
PlexusStatusRaidDebuff:DebuffId(zoneid, 423324, 202, 5, 5, true) --Void Discharge
PlexusStatusRaidDebuff:DebuffId(zoneid, 422233, 203, 5, 5, true) --Crystalline Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 443494, 204, 5, 5, true) --Crystalline Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 423538, 205, 5, 5, true) --Unstable Crash
PlexusStatusRaidDebuff:DebuffId(zoneid, 443405, 206, 5, 5, true) --Unstable Fragments
PlexusStatusRaidDebuff:DebuffId(zoneid, 435813, 207, 5, 5, true) --Unstable Energy


PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Master Machinists")
PlexusStatusRaidDebuff:DebuffId(zoneid, 439577, 301, 5, 5, true) --Silenced Speaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 443954, 302, 5, 5, true) --Exhaust Vents
PlexusStatusRaidDebuff:DebuffId(zoneid, 429999, 303, 5, 5, true) --Flaming Scrap
PlexusStatusRaidDebuff:DebuffId(zoneid, 428202, 304, 5, 5, true) --Scrap Song
PlexusStatusRaidDebuff:DebuffId(zoneid, 428547, 305, 5, 5, true) --Scrap Cube
PlexusStatusRaidDebuff:DebuffId(zoneid, 428161, 306, 5, 5, true) --Molten Metal
PlexusStatusRaidDebuff:DebuffId(zoneid, 428508, 307, 5, 5, true) --Blazing Crescendo
PlexusStatusRaidDebuff:DebuffId(zoneid, 464392, 308, 5, 5, true) --Blazing Shrapnel
PlexusStatusRaidDebuff:DebuffId(zoneid, 463057, 309, 5, 5, true) --Magma Wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 428711, 310, 5, 5, true) --Igneous Hammer
PlexusStatusRaidDebuff:DebuffId(zoneid, 428120, 311, 5, 5, true) --Lava Cannon


PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Void Speaker Eirich")
PlexusStatusRaidDebuff:DebuffId(zoneid, 427315, 401, 5, 5, true) --Void Rift
PlexusStatusRaidDebuff:DebuffId(zoneid, 427329, 402, 5, 5, true) --Void Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 427854, 403, 5, 5, true) --Entropic Reckoning
PlexusStatusRaidDebuff:DebuffId(zoneid, 457465, 404, 5, 5, true) --Entropy
PlexusStatusRaidDebuff:DebuffId(zoneid, 427869, 405, 5, 5, true) --Unbridled Void

