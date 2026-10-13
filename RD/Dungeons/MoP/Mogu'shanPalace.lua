--local zone = "Mogu'shan Palace"
local zoneid = 453

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

PlexusStatusRaidDebuff:DebuffId(zoneid, 122962, 1, 6, 6, true) --Carnivorous Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 120562, 1, 6, 6, true) --Lightning Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 120560, 1, 6, 6, true) --Rake
PlexusStatusRaidDebuff:DebuffId(zoneid, 123648, 1, 6, 6, true) --Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 119573, 1, 6, 6, true) --Ring of Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 121185, 1, 6, 6, true) --Crunch Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 123647, 1, 6, 6, true) --Demoralizing Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 123646, 1, 6, 6, true) --Intimidation

--Trial of the King
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Trial of the King")
PlexusStatusRaidDebuff:DebuffId(zoneid, 119946, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 120100, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 17962, 13, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 120195, 14, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 123655, 15, 6, 6, true)
--Gekkan
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Gekkan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 118963, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 118903, 22, 6, 6, true)
--Xin the Weaponmaster
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Xin the Weaponmaster")
PlexusStatusRaidDebuff:DebuffId(zoneid, 119684, 31, 6, 6, true)