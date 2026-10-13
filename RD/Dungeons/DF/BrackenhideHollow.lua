-- local zone = "Brackenhide Hollow"
local zoneid = 2096
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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 367521, 1, 6, 6, true) --Bone Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 368091, 1, 6, 6, true) --Infected Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 373899, 1, 6, 6, true) --Decaying Roots
PlexusStatusRaidDebuff:DebuffId(zoneid, 383087, 1, 6, 6, true) --Withering Contagion
PlexusStatusRaidDebuff:DebuffId(zoneid, 382723, 1, 6, 6, true) --Crushing Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 372711, 1, 6, 6, true) --Infuse Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 373943, 1, 6, 6, true) --Stomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 384575, 1, 6, 6, true) --Crippling Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 382787, 1, 6, 6, true) --Decay Claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 368299, 1, 6, 6, true) --Toxic Trap
PlexusStatusRaidDebuff:DebuffId(zoneid, 376149, 1, 6, 6, true) --Choking Rotcloud
PlexusStatusRaidDebuff:DebuffId(zoneid, 367481, 1, 6, 6, true) --Bloody Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 381835, 1, 6, 6, true) --Bladestorm
PlexusStatusRaidDebuff:DebuffId(zoneid, 375416, 1, 6, 6, true) --Bleeding
PlexusStatusRaidDebuff:DebuffId(zoneid, 385185, 1, 6, 6, true) --Disoriented

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Hackclaw's War-Band")
PlexusStatusRaidDebuff:DebuffId(zoneid, 378020, 101, 5, 5, true) --gash-frenzy
PlexusStatusRaidDebuff:DebuffId(zoneid, 381379, 102, 5, 5, true) --decayed-senses

PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Treemouth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 377864, 201, 5, 5, true) --infectious-spit
PlexusStatusRaidDebuff:DebuffId(zoneid, 378054, 202, 5, 5, true) --withering-away
PlexusStatusRaidDebuff:DebuffId(zoneid, 378022, 203, 5, 5, true) --consuming
PlexusStatusRaidDebuff:DebuffId(zoneid, 376933, 204, 5, 5, true) --grasping-vines

PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Gutshot")
PlexusStatusRaidDebuff:DebuffId(zoneid, 376997, 301, 5, 5, true) --savage-peck
PlexusStatusRaidDebuff:DebuffId(zoneid, 384425, 302, 5, 5, true) --Smell Like Meat
PlexusStatusRaidDebuff:DebuffId(zoneid, 385356, 303, 5, 5, true) --Ensnaring Trap

PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Decatriarch Wratheye")
PlexusStatusRaidDebuff:DebuffId(zoneid, 373896, 401, 5, 5, true) --withering-rot
PlexusStatusRaidDebuff:DebuffId(zoneid, 385361, 402, 5, 5, true) --Rotting Sickness
PlexusStatusRaidDebuff:DebuffId(zoneid, 373917, 403, 5, 5, true) --Decaystrike
