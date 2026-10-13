-- local zone = "Halls of Infusion"
local zoneid = 2082
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
PlexusStatusRaidDebuff:DebuffId(zoneid, 374020, 1, 5, 5, true) -- containment-beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 393444, 1, 5, 5, true) -- gushing-wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 374706, 1, 5, 5, true) -- pyretic-burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 374149, 1, 5, 5, true) -- tailwind
PlexusStatusRaidDebuff:DebuffId(zoneid, 374615, 1, 5, 5, true) -- cheap-shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 374563, 1, 5, 5, true) -- dazzle
PlexusStatusRaidDebuff:DebuffId(zoneid, 374724, 1, 5, 5, true) -- molten-subduction

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Watcher Irideus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 384524, 101, 5, 5, true) -- titanic-fist
PlexusStatusRaidDebuff:DebuffId(zoneid, 383935, 102, 5, 5, true) -- spark-volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 389179, 103, 5, 5, true) -- power-overload
PlexusStatusRaidDebuff:DebuffId(zoneid, 389181, 104, 5, 5, true) -- power-field

PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Gulping Goliath")
PlexusStatusRaidDebuff:DebuffId(zoneid, 374389, 201, 5, 5, true) -- gulp-swog-toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 385551, 202, 5, 5, true) -- gulp
PlexusStatusRaidDebuff:DebuffId(zoneid, 385451, 203, 5, 5, true) -- toxic-effluvia

PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Khajin the Unyielding")
PlexusStatusRaidDebuff:DebuffId(zoneid, 385963, 301, 5, 5, true) -- frost-shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 386741, 302, 5, 5, true) -- polar-winds

PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Primal Tsunami")
PlexusStatusRaidDebuff:DebuffId(zoneid, 387359, 401, 5, 5, true) -- waterlogged
PlexusStatusRaidDebuff:DebuffId(zoneid, 387571, 402, 5, 5, true) -- focused-deluge
