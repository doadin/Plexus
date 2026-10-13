-- local zone = "Karazhan"
local zoneid = 350
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Moroes
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Moroes")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 37066, 11, 5, 5) --Garrote

--Maiden
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Maiden of Virtue")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 29522, 21, 5, 5) --Holy Fire
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 29511, 22, 5, 5) --Repentance

--Opera : Bigbad wolf
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "The Big Bad Wolf")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 30753, 31, 5, 5, true) --Red riding hood

--Illhoof
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Terestian Illhoof")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 30115, 41, 5, 5) --Sacrifice

--Malche
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Prince Malchezaar")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 30843, 51, 5, 5) --Enfeeble

