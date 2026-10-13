--local zone = "Throne of the Tides"
local zoneid = 323

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
PlexusStatusRaidDebuff:DebuffId(zoneid, 426660, 1, 6, 6, true) --Razor Jaws
PlexusStatusRaidDebuff:DebuffId(zoneid, 426663, 1, 6, 6, true) --Ravenous Pursuit
PlexusStatusRaidDebuff:DebuffId(zoneid, 76820 , 1, 6, 6, true) --Hex
PlexusStatusRaidDebuff:DebuffId(zoneid, 428542, 1, 6, 6, true) --Crushing Depths
PlexusStatusRaidDebuff:DebuffId(zoneid, 426741, 1, 6, 6, true) --Shellbreaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 426727, 1, 6, 6, true) --Acid Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 426688, 1, 6, 6, true) --Volatile Acid
PlexusStatusRaidDebuff:DebuffId(zoneid, 75992 , 1, 6, 6, true) --Lightning Surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 426681, 1, 6, 6, true) --Electric Jaws
PlexusStatusRaidDebuff:DebuffId(zoneid, 426783, 1, 6, 6, true) --Mind Flay
PlexusStatusRaidDebuff:DebuffId(zoneid, 426808, 1, 6, 6, true) --Null Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 76516 , 1, 6, 6, true) --Poisoned Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 76363 , 1, 6, 6, true) --Wave of Corruption

--Lady Naz'jar
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Lady Naz'jar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 76001, 11, 6, 6, true) -- Fungal Spores
PlexusStatusRaidDebuff:DebuffId(zoneid, 80564, 12, 6, 6, true) -- Fungal Spores
PlexusStatusRaidDebuff:DebuffId(zoneid, 428103, 13, 6, 6, true) -- Frostbolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 429263, 14, 6, 6, true) --Shock Blast
--Water Vortexes
--Commander Ulthok, the Festering Prince
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Commander Ulthok, the Festering Prince")
PlexusStatusRaidDebuff:DebuffId(zoneid, 76026, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 76047, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 76094, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 427670, 24, 6, 6, true) -- Crushing Claw
PlexusStatusRaidDebuff:DebuffId(zoneid, 427668, 25, 6, 6, true) -- Festering Shockwave
PlexusStatusRaidDebuff:DebuffId(zoneid, 427559, 26, 6, 6, true) -- Bubbling Ooze
--Mindbender Ghur'sha
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Mindbender Ghur'sha")
PlexusStatusRaidDebuff:DebuffId(zoneid, 76234, 31, 6, 6, true) -- Mind Fog
PlexusStatusRaidDebuff:DebuffId(zoneid, 76339, 32, 6, 6, true) -- Unrelenting Agony
PlexusStatusRaidDebuff:DebuffId(zoneid, 76207, 33, 6, 6, true) -- Enslave
PlexusStatusRaidDebuff:DebuffId(zoneid, 429172, 34, 6, 6, true) -- Terrifying Vision
PlexusStatusRaidDebuff:DebuffId(zoneid, 429051, 35, 6, 6, true) -- Earthfury
PlexusStatusRaidDebuff:DebuffId(zoneid, 429048, 36, 6, 6, true) -- Flame Shock
--Ozumat
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Ozumat")
PlexusStatusRaidDebuff:DebuffId(zoneid, 428403, 41, 6, 6, true) -- Grimy
PlexusStatusRaidDebuff:DebuffId(zoneid, 428404, 42, 6, 6, true) -- Blotting Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 428868, 43, 6, 6, true) -- Putrid Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 428407, 44, 6, 6, true) -- Blotting Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 83672, 45, 5, 5, true) -- Blight of Ozumat