-- local zone = "The Nokhud Offensive"
local zoneid = 2093
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

--"Trash"
PlexusStatusRaidDebuff:DebuffId(zoneid, 384134, 1, 5, 5, true) -- Pierce
PlexusStatusRaidDebuff:DebuffId(zoneid, 381692, 1, 5, 5, true) -- Swift Stab
PlexusStatusRaidDebuff:DebuffId(zoneid, 334610, 1, 5, 5, true) -- Hunt Prey
PlexusStatusRaidDebuff:DebuffId(zoneid, 384336, 1, 5, 5, true) -- War Stomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 384492, 1, 5, 5, true) -- Hunter's Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 386025, 1, 5, 5, true) -- Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 386912, 1, 5, 5, true) -- Stormsurge Cloud
PlexusStatusRaidDebuff:DebuffId(zoneid, 388801, 1, 5, 5, true) -- Mortal Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 387615, 1, 5, 5, true) -- Grasp of the Dead
PlexusStatusRaidDebuff:DebuffId(zoneid, 387616, 1, 5, 5, true) -- Grasp of the Dead
PlexusStatusRaidDebuff:DebuffId(zoneid, 381530, 1, 5, 5, true) -- Storm Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 373395, 1, 5, 5, true) -- Bloodcurdling Shout
PlexusStatusRaidDebuff:DebuffId(zoneid, 387629, 1, 5, 5, true) -- Rotting Wind
PlexusStatusRaidDebuff:DebuffId(zoneid, 395035, 1, 5, 5, true) -- Shatter Soul

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "The Raging Tempest")
PlexusStatusRaidDebuff:DebuffId(zoneid, 384185, 101, 5, 5, true) -- Lightning Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 386916, 102, 5, 5, true) -- The Raging Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 382628, 103, 5, 5, true) -- Surge of Power

PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Teera and Maruuk")
PlexusStatusRaidDebuff:DebuffId(zoneid, 392151, 201, 5, 5, true) -- Gale Arrow
PlexusStatusRaidDebuff:DebuffId(zoneid, 395669, 202, 5, 5, true) -- Aftershock

PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Balakar Khan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 375937, 301, 5, 5, true) -- Rending Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 376634, 302, 5, 5, true) -- Iron Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 393421, 303, 5, 5, true) -- Quake
PlexusStatusRaidDebuff:DebuffId(zoneid, 376730, 304, 5, 5, true) -- Stormwinds
PlexusStatusRaidDebuff:DebuffId(zoneid, 376827, 305, 5, 5, true) -- Conductive Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 376864, 306, 5, 5, true) -- Static Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 376894, 307, 5, 5, true) -- Crackling Upheaval
PlexusStatusRaidDebuff:DebuffId(zoneid, 376899, 308, 5, 5, true) -- Crackling Cloud
