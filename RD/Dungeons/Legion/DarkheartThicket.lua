--local zone = "Darkheart Thicket"
local zoneid = 733

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
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200580, 1, 6, 6, true) --Maddening Roar
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200642, 1, 6, 6, true) --Despair
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 225484, 1, 6, 6, true) --Grievous Rip
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 201365, 1, 6, 6, true) --Darksoul Drain
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 204243, 1, 6, 6, true) --Tormenting Eye
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 198904, 1, 6, 6, true) --Poison Spear
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 199063, 1, 6, 6, true) --Strangling Roots
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 204246, 1, 6, 6, true) --Tormenting Fear
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 225568, 1, 6, 6, true) --Curse of Isolation
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200684, 1, 6, 6, true) -- Nightmare Toxin          
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 218759, 1, 6, 6, true) -- Corruption Pool    
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 201839, 1, 6, 6, true) -- Curse of Isolation 
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 201902, 1, 6, 6, true) --Scorching Shot
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200771, 1, 6, 6, true) --Propelling Charge
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200631, 1, 6, 6, true) --Unnerving Screech

--Archdruid Glaidalis
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Archdruid Glaidalis")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 196376, 11, 6, 6, true) --Grievous Tear
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 198408, 12, 6, 6, true) --Nightfall
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 198376, 13, 6, 6, true) -- primal-rampage
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 198477, 14, 6, 6, true) -- Fixate	


--Oakheart
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Oakheart")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 204667, 21, 6, 6, true) --Nightmare Breath
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 204611, 22, 6, 6, true) --Crushing Grip
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 204574, 23, 6, 6, true) -- strangling-roots
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 204666, 24, 6, 6, true) -- shattered-earth


--Dresaron
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Dresaron")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 220855, 31, 6, 6, true) --Down Draft
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 191326, 32, 6, 6, true) --Breath of Corruption
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 199460, 33, 6, 6, true) -- falling-rocks
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 199389, 34, 6, 6, true) -- earthshaking-roar

--Shade of Xavius
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Shade of Xavius")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200289, 41, 6, 6, true) --Growing Paranoia
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200238, 42, 6, 6, true) --Feed on the Weak
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200182, 43, 6, 6, true) --Festering Rip
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200273, 44, 6, 6, true) -- Cowardice
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200243, 45, 6, 6, true) -- Waking Nightmare
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 204502, 46, 6, 6, true) -- apocalyptic-nightmare
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200111, 47, 6, 6, true) -- apocalyptic-fire
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 200329, 48, 6, 6, true) --Overwhelming Terror
