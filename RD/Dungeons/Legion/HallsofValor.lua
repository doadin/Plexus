--local zone = "Halls of Valor"
local zoneid = 704

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
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 199050, 1, 6, 6, true) --Mortal Hew
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 199652, 1, 6, 6, true) --Sever
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 198944, 1, 6, 6, true) --Breach Armor
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 215430, 1, 6, 6, true) --Thunderstrike
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 199674, 1, 6, 6, true) --Wicked Dagger
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 199818, 1, 6, 6, true) --Crackle
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 198959, 1, 6, 6, true) --Etch
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 193702, 1, 6, 6, true) --Infernal Flames

--Hymdall
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Hymdall")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 193092, 11, 6, 6, true) --Bloodletting Sweep


--Hyrja
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Hyrja")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 154415, 21, 6, 6, true)


--Fenryr
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Fenryr")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 196497, 31, 6, 6, true) --Ravenous Leap


--God-King Skovald
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "God-King Skovald")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 156829, 41, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 193660, 41, 6, 6, true) --Felblaze Rush

--Odyn
--_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Odyn")
--_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 156829, 51, 6, 6, true)
