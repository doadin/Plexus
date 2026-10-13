--local zone = "Gate of the Setting Sun"
local zoneid = 437

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Saboteur Kip'tilak
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Saboteur Kip'tilak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 107268, 11, 6, 6, true)

--Striker Ga'dok
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Striker Ga'dok")
PlexusStatusRaidDebuff:DebuffId(zoneid, 106934, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 107047, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 116297, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 115458, 24, 6, 6, true)
--Commander Ri'mok
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Commander Ri'mok")
PlexusStatusRaidDebuff:DebuffId(zoneid, 107120, 31, 6, 6, true) --Viscous Fluid
--Raigonn
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Raigonn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 107275, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 111600, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 111723, 43, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 111725, 44, 6, 6, true)