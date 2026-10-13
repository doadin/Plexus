--local zone = "Court of Stars"
local zoneid = 761

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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 214692, 1, 6, 6, true) --Shadow Bolt Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 211464, 1, 6, 6, true) --Fel Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 211473, 1, 6, 6, true) --Shadow Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 207981, 1, 6, 6, true) --Disintegration Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 211391, 1, 6, 6, true) --Felblaze Puddle
PlexusStatusRaidDebuff:DebuffId(zoneid, 209036, 1, 6, 6, true) --Throw Torch
PlexusStatusRaidDebuff:DebuffId(zoneid, 209378, 1, 6, 6, true) --Whirling Blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 214690, 1, 6, 6, true) --Cripple
PlexusStatusRaidDebuff:DebuffId(zoneid, 209512, 1, 6, 6, true) --Disrupting Energy
PlexusStatusRaidDebuff:DebuffId(zoneid, 209516, 1, 6, 6, true) --Mana Fang
PlexusStatusRaidDebuff:DebuffId(zoneid, 209413, 1, 6, 6, true) --Suppress
PlexusStatusRaidDebuff:DebuffId(zoneid, 209027, 1, 6, 6, true) -- Quelling Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 209404, 1, 6, 6, true) -- Seal Magic
PlexusStatusRaidDebuff:DebuffId(zoneid, 234965, 1, 6, 6, true) -- Boorish Behavior
PlexusStatusRaidDebuff:DebuffId(zoneid, 214688, 1, 6, 6, true) -- Carrion Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 211470, 1, 6, 6, true) -- Bewitch
PlexusStatusRaidDebuff:DebuffId(zoneid, 397907, 1, 6, 6, true) -- Impending Doom
PlexusStatusRaidDebuff:DebuffId(zoneid, 373552, 1, 6, 6, true) -- Hypnosis Bat
PlexusStatusRaidDebuff:DebuffId(zoneid, 373607, 1, 6, 6, true) -- Shadowy Barrier
PlexusStatusRaidDebuff:DebuffId(zoneid, 373570, 1, 6, 6, true) -- Hypnosis
PlexusStatusRaidDebuff:DebuffId(zoneid, 212773, 1, 6, 6, true) -- Subdue

--Patrol Captain Gerdo
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Patrol Captain Gerdo")
PlexusStatusRaidDebuff:DebuffId(zoneid, 207261, 11, 6, 6, true) -- resonant-slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 207278, 12, 6, 6, true) --Arcane Lockdown


--Talixae Flamewreath
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Talixae Flamewreath")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 154415, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 208165, 21, 6, 6, true) -- withering-soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 211457, 22, 6, 6, true) -- infernal-eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 207906, 23, 6, 6, true) -- burning-intensity


--Advisor Melandrus
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Advisor Melandrus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 209667, 31, 6, 6, true) --Blade Surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 209676, 32, 6, 6, true) -- slicing-maelstrom
PlexusStatusRaidDebuff:DebuffId(zoneid, 224333, 33, 6, 6, true) -- enveloping-winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 209628, 34, 6, 6, true) -- piercing-gale
