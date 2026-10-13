--local zone = "Court of Stars"
local zoneid = 761

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

--Trash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 214692, 1, 6, 6, true) --Shadow Bolt Volley
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211464, 1, 6, 6, true) --Fel Detonation
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211473, 1, 6, 6, true) --Shadow Slash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 207981, 1, 6, 6, true) --Disintegration Beam
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211391, 1, 6, 6, true) --Felblaze Puddle
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209036, 1, 6, 6, true) --Throw Torch
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209378, 1, 6, 6, true) --Whirling Blades
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 214690, 1, 6, 6, true) --Cripple
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209512, 1, 6, 6, true) --Disrupting Energy
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209516, 1, 6, 6, true) --Mana Fang
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209413, 1, 6, 6, true) --Suppress
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209027, 1, 6, 6, true) -- Quelling Strike
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209404, 1, 6, 6, true) -- Seal Magic
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 234965, 1, 6, 6, true) -- Boorish Behavior
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 214688, 1, 6, 6, true) -- Carrion Swarm
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211470, 1, 6, 6, true) -- Bewitch
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 397907, 1, 6, 6, true) -- Impending Doom
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 373552, 1, 6, 6, true) -- Hypnosis Bat
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 373607, 1, 6, 6, true) -- Shadowy Barrier
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 373570, 1, 6, 6, true) -- Hypnosis
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 212773, 1, 6, 6, true) -- Subdue

--Patrol Captain Gerdo
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Patrol Captain Gerdo")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 207261, 11, 6, 6, true) -- resonant-slash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 207278, 12, 6, 6, true) --Arcane Lockdown


--Talixae Flamewreath
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Talixae Flamewreath")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 154415, 21, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 208165, 21, 6, 6, true) -- withering-soul
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 211457, 22, 6, 6, true) -- infernal-eruption
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 207906, 23, 6, 6, true) -- burning-intensity


--Advisor Melandrus
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Advisor Melandrus")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209667, 31, 6, 6, true) --Blade Surge
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209676, 32, 6, 6, true) -- slicing-maelstrom
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 224333, 33, 6, 6, true) -- enveloping-winds
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 209628, 34, 6, 6, true) -- piercing-gale
