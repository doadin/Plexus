-- local zone = "Priory of the Sacred Flame"
local zoneid = 2308
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 426964, 1, 5, 5, true) --Mortal Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 448787, 1, 5, 5, true) --Purification
PlexusStatusRaidDebuff:DebuffId(zoneid, 435165, 1, 5, 5, true) --Blazing Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 448492, 1, 5, 5, true) --Thunderclap
PlexusStatusRaidDebuff:DebuffId(zoneid, 424430, 1, 5, 5, true) --Consecration
PlexusStatusRaidDebuff:DebuffId(zoneid, 427635, 1, 5, 5, true) --Grievous Rip
PlexusStatusRaidDebuff:DebuffId(zoneid, 427621, 1, 5, 5, true) --Impale
PlexusStatusRaidDebuff:DebuffId(zoneid, 427473, 1, 5, 5, true) --Flamestrike
PlexusStatusRaidDebuff:DebuffId(zoneid, 451764, 1, 5, 5, true) --Radiant Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 453461, 1, 5, 5, true) --Caltrops

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

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Captain Dailcry")
PlexusStatusRaidDebuff:DebuffId(zoneid, 447439, 101, 5, 5, true) --Savage Mauling
PlexusStatusRaidDebuff:DebuffId(zoneid, 424419, 102, 5, 5, true) --Battle Cry
PlexusStatusRaidDebuff:DebuffId(zoneid, 447272, 103, 5, 5, true) --Hurl Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 424414, 104, 5, 5, true) --Pierce Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 424628, 105, 5, 5, true) --Strength in Numbers
PlexusStatusRaidDebuff:DebuffId(zoneid, 448385, 106, 5, 5, true) --Bound by Fate
PlexusStatusRaidDebuff:DebuffId(zoneid, 424621, 107, 5, 5, true) --Brutal Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 424423, 108, 5, 5, true) --Lunging Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 424431, 109, 5, 5, true) --Holy Radiance
PlexusStatusRaidDebuff:DebuffId(zoneid, 448515, 110, 5, 5, true) --Divine Judgment
PlexusStatusRaidDebuff:DebuffId(zoneid, 427583, 111, 5, 5, true) --Repentance
PlexusStatusRaidDebuff:DebuffId(zoneid, 424462, 112, 5, 5, true) --Ember Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 424420, 113, 5, 5, true) --Cinderblast
PlexusStatusRaidDebuff:DebuffId(zoneid, 424421, 114, 5, 5, true) --Fireball


PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Baron Braunpyke")
PlexusStatusRaidDebuff:DebuffId(zoneid, 422969, 201, 5, 5, true) --Vindictive Wrath
PlexusStatusRaidDebuff:DebuffId(zoneid, 423015, 202, 5, 5, true) --Castigator's Shield
PlexusStatusRaidDebuff:DebuffId(zoneid, 423019, 203, 5, 5, true) --Castigator's Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 423051, 204, 5, 5, true) --Burning Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 423062, 205, 5, 5, true) --Hammer of Purity
PlexusStatusRaidDebuff:DebuffId(zoneid, 446368, 206, 5, 5, true) --Sacred Pyre
PlexusStatusRaidDebuff:DebuffId(zoneid, 446403, 207, 5, 5, true, true) --Sacrificial Flame


PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Prioress Murrpray")
PlexusStatusRaidDebuff:DebuffId(zoneid, 423588, 301, 5, 5, true) --Barrier of Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 423665, 302, 5, 5, true) --Embrace the Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 425544, 303, 5, 5, true) --Purifying Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 423539, 304, 5, 5, true) --Inner Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 451606, 305, 5, 5, true) --Holy Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 423536, 306, 5, 5, true) --Holy Smite
PlexusStatusRaidDebuff:DebuffId(zoneid, 425556, 307, 5, 5, true) --Sanctified Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 428170, 308, 5, 5, true) --Blinding Light

