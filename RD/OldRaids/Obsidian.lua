-- local zone = "The Obsidian Sanctum"
local zoneid = 155
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 39647, 1, 5, 5) --Curse of Mending
PlexusStatusRaidDebuff:DebuffId(zoneid, 58936, 2, 5, 5) --Rain of Fire

--Sartharion
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Sartharion")
PlexusStatusRaidDebuff:DebuffId(zoneid, 60708, 11, 10, 5, false, true) --Fade Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 57491, 12, 5, 5, true, false) --Flame Tsunami

