-- local zone = "Ara-Kara, City of Echoes"
local zoneid = 2449
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--Trash


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

--Azhiccar
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Azhiccar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217232, 101, 5, 5, true) --Devour
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217241, 102, 5, 5, true) --Feast
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217327, 103, 5, 5, true) --Invading Shriek
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231811, 104, 5, 5, true) --Uncontrolled
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217381, 105, 5, 5, true) --Engorge
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217436, 106, 5, 5, true) --Toxic Regurgitation
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217446, 107, 5, 5, true) --Digestive Spittle
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217664, 108, 5, 5, true) --Thrash

--Taah'bat and A'wazj
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Taah'bat and A'wazj")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219417, 201, 5, 5, true) --Beastmaster's Bond
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219700, 202, 5, 5, true) --Arcane Blitz
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219457, 203, 5, 5, true) --Incorporeal
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219731, 204, 5, 5, true) --Destabilized
PlexusStatusRaidDebuff:DebuffId(zoneid, 1220497, 205, 5, 5, true) --Arcane Overload
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227137, 206, 5, 5, true) --Warp Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219536, 207, 5, 5, true) --Binding Javelin
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219482, 208, 5, 5, true) --Rift Claws

--Soul-Scribe
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Soul-Scribe")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224793, 301, 5, 5, true) --Whispers of Fate
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224865, 302, 5, 5, true) --Fatebound
PlexusStatusRaidDebuff:DebuffId(zoneid, 1236703, 303, 5, 5, true) --Eternal Weave
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237184, 304, 5, 5, true) --Splinters of Fate
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225218, 305, 5, 5, true) --Dread of the Unknown
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226444, 306, 5, 5, true) --Wounded Fate
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225162, 307, 5, 5, true) --Ceremonial Dagger
PlexusStatusRaidDebuff:DebuffId(zoneid, 1242000, 308, 5, 5, true) --Echoes of Fate

