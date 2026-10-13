--local zone = "Mana-Tombs"
local zoneid = 272

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

PlexusStatusRaidDebuff:DebuffId(zoneid, 25602, 1, 6, 6, true) --Faerie Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 34942, 1, 6, 6, true) --Shadow Word: Pain
PlexusStatusRaidDebuff:DebuffId(zoneid, 33865, 1, 6, 6, true) --Singe
PlexusStatusRaidDebuff:DebuffId(zoneid, 37668, 1, 6, 6, true) --Immolate
PlexusStatusRaidDebuff:DebuffId(zoneid, 13323, 1, 6, 6, true) --Polymorph
PlexusStatusRaidDebuff:DebuffId(zoneid, 34925, 1, 6, 6, true) --Curse of Impotence
PlexusStatusRaidDebuff:DebuffId(zoneid, 33919, 1, 6, 6, true) --Earthquake
PlexusStatusRaidDebuff:DebuffId(zoneid, 25603, 1, 6, 6, true) --Slow
PlexusStatusRaidDebuff:DebuffId(zoneid, 34940, 1, 6, 6, true) --Gouge
PlexusStatusRaidDebuff:DebuffId(zoneid, 32315, 1, 6, 6, true) --Soul Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 32361, 1, 6, 6, true) --Crystal Prison
PlexusStatusRaidDebuff:DebuffId(zoneid, 34922, 1, 6, 6, true) --Shadows Embrace
PlexusStatusRaidDebuff:DebuffId(zoneid, 38065, 1, 6, 6, true) --Death Coil
PlexusStatusRaidDebuff:DebuffId(zoneid, 38064, 1, 6, 6, true) --Blast Wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 32365, 1, 6, 6, true) --Frost Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 39332, 1, 6, 6, true) --Phantom Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 32364, 1, 6, 6, true) --Frostbolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 22911, 1, 6, 6, true) --Charge