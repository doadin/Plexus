--local zone = "The Nexus"
local zoneid = 129

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

PlexusStatusRaidDebuff:DebuffId(zoneid, 60067, 1, 6, 6, true) --Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 47731, 1, 6, 6, true) --Critter
PlexusStatusRaidDebuff:DebuffId(zoneid, 57091, 1, 6, 6, true) --Crystalfire Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 56775, 1, 6, 6, true) --Frostbolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 13323, 1, 6, 6, true) --Polymorph
PlexusStatusRaidDebuff:DebuffId(zoneid, 48053, 1, 6, 6, true) --Ensnare
PlexusStatusRaidDebuff:DebuffId(zoneid, 56776, 1, 6, 6, true) --Arcane Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 56777, 1, 6, 6, true) --Silence
PlexusStatusRaidDebuff:DebuffId(zoneid, 29882, 1, 6, 6, true) --Loose Mana
PlexusStatusRaidDebuff:DebuffId(zoneid, 47700, 1, 6, 6, true) --Crystal Freeze
PlexusStatusRaidDebuff:DebuffId(zoneid, 47736, 1, 6, 6, true) --Time Stop
PlexusStatusRaidDebuff:DebuffId(zoneid, 55041, 1, 6, 6, true) --Freezing Trap Effect
PlexusStatusRaidDebuff:DebuffId(zoneid, 56933, 1, 6, 6, true) --Incendiary Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 48095, 1, 6, 6, true) --Intense Cold
PlexusStatusRaidDebuff:DebuffId(zoneid, 57050, 1, 6, 6, true) --Crystal Chains
PlexusStatusRaidDebuff:DebuffId(zoneid, 29544, 1, 6, 6, true) --Frightening Shout
PlexusStatusRaidDebuff:DebuffId(zoneid, 50132, 1, 6, 6, true) --Draw Magic
PlexusStatusRaidDebuff:DebuffId(zoneid, 30849, 1, 6, 6, true) --Spell Lock
PlexusStatusRaidDebuff:DebuffId(zoneid, 56860, 1, 6, 6, true) --Magic Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 48179, 1, 6, 6, true) --Crystallize
PlexusStatusRaidDebuff:DebuffId(zoneid, 57063, 1, 6, 6, true) --Arcane Attraction
PlexusStatusRaidDebuff:DebuffId(zoneid, 30633, 1, 6, 6, true) --Thunderclap
PlexusStatusRaidDebuff:DebuffId(zoneid, 47779, 1, 6, 6, true) --Arcane Torrent
PlexusStatusRaidDebuff:DebuffId(zoneid, 38384, 1, 6, 6, true) --Cone of Cold
PlexusStatusRaidDebuff:DebuffId(zoneid, 61556, 1, 6, 6, true) --Tangle