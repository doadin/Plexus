--local zone = "Cathedral of Eternal Night"
local zoneid = 846

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

--Zuraal the Ascended
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Zuraal the Ascended")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 244588, 11, 6, 6, false, true)  --Void Sludge


--Saprish
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Saprish")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 246026, 21, 6, 6, true) --Void Trap


--Viceroy Nezhar
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Viceroy Nezhar")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 244916, 31, 6, 6, false, true) --Void Lashing


--L'ura
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "L'ura")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 245289, 41, 6, 6, true) --Void Blast
