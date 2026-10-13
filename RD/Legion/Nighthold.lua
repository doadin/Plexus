--local zone = "The Nighthold"
local zoneid = 764
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- Skorpyron
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Skorpyron")
-- Crystalline Scorpid
PlexusStatusRaidDebuff:DebuffId(zoneid, 204766, 11, 5, 5, false, true) -- Energy Surge (non-dispellable, stacks) (DMG + Debuff)
-- Chromatic Exoskeleton
PlexusStatusRaidDebuff:DebuffId(zoneid, 214657, 12, 5, 5) -- Acidic Fragments (non-dispellable) (DMG + Debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 214662, 13, 5, 5) -- Volatile Fragments (non-dispellable) (DMG + Debuff)
-- Arcanoslash
PlexusStatusRaidDebuff:DebuffId(zoneid, 211659, 14, 5, 5, true, true) -- Arcane Tether (non-dispellable, stacks) (Stacking Ground AoE)

PlexusStatusRaidDebuff:DebuffId(zoneid, 204471, 15, 5, 5) -- Focused Blast (non-dispellable) (Frontal Cone AoE)

-- Chronomatic Anomaly
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Chronomatic Anomaly")
PlexusStatusRaidDebuff:DebuffId(zoneid, 206607, 21, 5, 5, false, true) -- Chronometric Particles (non-dispellable, stacks) (Stacking DoT)
PlexusStatusRaidDebuff:DebuffId(zoneid, 206609, 22, 5, 5) -- Time Release (non-dispellable) (heal absorb)
PlexusStatusRaidDebuff:DebuffId(zoneid, 206617, 23, 5, 5, true, false) -- Time Bomb (non-dispellable) (Not a Debuff?)
PlexusStatusRaidDebuff:DebuffId(zoneid, 212099, 24, 5, 5) -- Temporal Charge (non-dispellable) (DoT)

-- Trilliax
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Trilliax")
PlexusStatusRaidDebuff:DebuffId(zoneid, 206482, 31, 5, 5) -- Arcane Seepage (non-dispellable) (Ground AoE)
-- The Cleaner
PlexusStatusRaidDebuff:DebuffId(zoneid, 206788, 32, 6, 6, false, true) -- Toxic Slice (non-dispellable) (DMG + Debuff Stacking DoT)
PlexusStatusRaidDebuff:DebuffId(zoneid, 214573, 32, 5, 5, false, true) -- Stuffed (non-dispellable)

-- Spellblade Aluriel
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Spellblade Aluriel")
-- Chamion of Blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 212492, 41, 5, 5) -- Annihilate (non-dispellable) (DMG + Tank Debuff)
-- Master of Frost
PlexusStatusRaidDebuff:DebuffId(zoneid, 212587, 42, 7, 7, true, false) -- Mark of Frost (non-dispellable) (DMG + Increase DMG taken per stack explodes if two people with it get close)
PlexusStatusRaidDebuff:DebuffId(zoneid, 212647, 43, 6, 6, false, true) -- Frostbitten (non-dispellable, Stacks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 212736, 44, 5, 5) -- Pool of Frost (Ground AOE)
PlexusStatusRaidDebuff:DebuffId(zoneid, 213083, 45, 5, 5, true, false) -- Frozen Tempest (non-dispellable) (DoT)
-- Master of Fire 
PlexusStatusRaidDebuff:DebuffId(zoneid, 213166, 46, 7, 7, true, true) -- Searing Brand (non-dispellable, Stacks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 213278, 47, 5, 5) -- Burning Ground (Ground AOE)
-- Master of the Arcane
PlexusStatusRaidDebuff:DebuffId(zoneid, 213504, 48, 5, 5) -- Arcane Fog (Ground AOE)
-- Fel Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 230414, 49, 5, 5) -- Fel Stomp (Ground AOE)

-- Tichondrius
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Tichondrius")
-- Stage One
PlexusStatusRaidDebuff:DebuffId(zoneid, 206480, 51, 5, 5, true, false) -- Carrion Plague (non-dispellable) (DoT)
PlexusStatusRaidDebuff:DebuffId(zoneid, 213238, 52, 5, 5, true, false) -- Seeker Swarm (non-dispellable) (DMG + Adds Carrion Plague DoT)
PlexusStatusRaidDebuff:DebuffId(zoneid, 212795, 53, 5, 5) -- Brand of Argus (non-dispellable) (Explodes if players clump)
PlexusStatusRaidDebuff:DebuffId(zoneid, 208230, 54, 5, 5) -- Feast of Blood (non-dispellable) (Increases DMG Taken)
-- The Nightborne Felsworn Spellguard
PlexusStatusRaidDebuff:DebuffId(zoneid, 216024, 55, 5, 5, false, true) -- Volatile Wound (non-dispellable, Stacks) (DMG + Increases Future DMG Taken)
-- The Legion Sightless Watcher
PlexusStatusRaidDebuff:DebuffId(zoneid, 216040, 56, 5, 5, true, false) -- Burning Soul (dispellable) (DMG + Mana Drain + Explode on Dispell)

-- Krosus
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Krosus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 208203, 61, 5, 5) -- Isolated Rage (non-dispellable) (Ground AoE Not Avoidable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 206677, 62, 5, 5, true, true) -- Searing Brand (non-dispellable, Stacks)

-- High Botanist Tel'arn
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "High Botanist Tel'arn")
--Arcanist Tel'arn
PlexusStatusRaidDebuff:DebuffId(zoneid, 218502, 71, 5, 5, false, true) -- Recursive Strikes (non-dispellable, stacks) (Increases DMG Taken)
-- Naturalist Tel'arn
PlexusStatusRaidDebuff:DebuffId(zoneid, 219049, 72, 5, 5, false, true) -- Toxic Spores (non-dispellable) (Ground AoE)
PlexusStatusRaidDebuff:DebuffId(zoneid, 218424, 73, 5, 5, false, true) -- Parasitic Fetter (dispellable) (Root + Increaseing DMG)
PlexusStatusRaidDebuff:DebuffId(zoneid, 218809, 74, 5, 5, true, false) -- Call of Night

-- Star Augur Etraeus
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Star Augur Etraeus")
-- Stage Two
PlexusStatusRaidDebuff:DebuffId(zoneid, 206585, 81, 5, 5, false, true) -- Absolute Zero (non-dispellable, stacks) (DMG + Dispellable by Player Clump That then causes Chill)
PlexusStatusRaidDebuff:DebuffId(zoneid, 206936, 82, 5, 5, true) -- Icy Ejection (non-dispellable, stacks) (DoT + Slow-to-Stun)
-- Stage Three
PlexusStatusRaidDebuff:DebuffId(zoneid, 206388, 83, 5, 5, false, true) -- Felburst (non-dispellable, stacks) (DMG + DoT)
PlexusStatusRaidDebuff:DebuffId(zoneid, 205649, 84, 5, 5, false, true) -- Fel Ejection (non-dispellable, stacks) (DMG + DoT)
-- Stage Four
PlexusStatusRaidDebuff:DebuffId(zoneid, 206965, 85, 5, 5, true, false) -- Voidburst (non-dispellable) (DoT)
PlexusStatusRaidDebuff:DebuffId(zoneid, 207143, 86, 5, 5) -- Void Ejection (non-dispellable) (DMG + DoT)

-- Grand Magistrix Elisande
PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "Grand Magistrix Elisande")
-- Stage Three
PlexusStatusRaidDebuff:DebuffId(zoneid, 211258, 91, 5, 5, true, false) -- Permeliative Torment (non-dispellable) (DoT)
PlexusStatusRaidDebuff:DebuffId(zoneid, 209598, 92, 5, 5, true, false) -- Conflexive Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 209971, 93, 5, 5, true, false) -- Ablative Pulse

-- Gul'dan
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Gul'dan")
-- Stage One
-- Inquisitor Vethriz
PlexusStatusRaidDebuff:DebuffId(zoneid, 212568, 101, 5, 5, true, false) -- Drain (dispellable) (Life Steal)
-- D'zorykx the Trapper
PlexusStatusRaidDebuff:DebuffId(zoneid, 206883, 102, 5, 5, false, true) -- Soul Vortex (non-dispellable, stacks) (AoE DMG + DoT)
-- Gul'dan
PlexusStatusRaidDebuff:DebuffId(zoneid, 206222, 103, 5, 5) -- Bonds of Fel (non-dispellable) (chain + Slow + Explosion when seperated)
PlexusStatusRaidDebuff:DebuffId(zoneid, 206221, 104, 5, 5) -- Empowered Bonds of Fel (non-dispellable) (chain + Slow + Explosion when seperated)
-- Dreadlords of the Twisting Nether
PlexusStatusRaidDebuff:DebuffId(zoneid, 208672, 105, 5, 5) -- Carrion Wave (non-dispellable) (AoE DMG + Sleep)
-- Gul'dan
PlexusStatusRaidDebuff:DebuffId(zoneid, 208903, 106, 5, 5) -- Burning Claws (non-dispellable) (ground AoE)
PlexusStatusRaidDebuff:DebuffId(zoneid, 208802, 107, 5, 5, false, true) -- Soul Corrosion (non-dispellable) (DMG + DoT)

