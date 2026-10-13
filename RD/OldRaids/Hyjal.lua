-- local zone = "Hyjal Summit"
local zoneid = 329
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Winterchill
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Rage Winterchill")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 31249, 11, 5, 5, true) --Ice Bolt

--Aneteron
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Anetheron")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 31306, 21, 5, 5) --Carrion Swarm
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 31298, 22, 5, 5, true) --Sleep

--Azgalor
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Azgalor")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 31347, 31, 5, 5, true) --Doom
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 31341, 32, 5, 5, true) --Unquenchable Flames
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 31344, 33, 5, 5, true) --Howl of Azgalor

--Achimonde
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Archimonde")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 31944, 41, 5, 5, true) --Doomfire
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 31972, 42, 5, 5) --Grip

