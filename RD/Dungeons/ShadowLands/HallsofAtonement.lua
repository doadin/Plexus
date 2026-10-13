--local zone = "Halls of Atonement"
local zoneid = 1663

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 1235766, 1, 6, 6, true, true) --Mortal Strike

--Halkias, the Sin-Stained Goliath
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Halkias, the Sin-Stained Goliath")
PlexusStatusRaidDebuff:DebuffId(zoneid, 323001, 101, 5, 5) --Glass Shards
PlexusStatusRaidDebuff:DebuffId(zoneid, 339237, 102, 5, 5) --Sinlight Visions

--Echelon
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Echelon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 344874, 201, 5, 5) --Shattered
PlexusStatusRaidDebuff:DebuffId(zoneid, 319603, 202, 5, 5) --Curse of Stone
PlexusStatusRaidDebuff:DebuffId(zoneid, 319611, 203, 4, 4) --Turned to Stone
PlexusStatusRaidDebuff:DebuffId(zoneid, 319703, 204, 5, 5) --Blood Torrent

--High Adjudicator Aleez
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "High Adjudicator Aleez")
PlexusStatusRaidDebuff:DebuffId(zoneid, 323650, 301, 4, 4) --Haunting Fixation

--Lord Chamberlain
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Lord Chamberlain")
PlexusStatusRaidDebuff:DebuffId(zoneid, 323437, 401, 5, 5, nil, true) --Stigma of Pride
PlexusStatusRaidDebuff:DebuffId(zoneid, 335338, 402, 5, 5) --Ritual of Woe
