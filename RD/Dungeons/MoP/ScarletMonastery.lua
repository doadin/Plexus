--local zone = "Scarlet Monastery"
local zoneid = 435

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 42380, 1, 6, 6, true) --Conflagration
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 42514, 1, 6, 6, true) --Squash Soul

--Thalnos
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Thalnos")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 115144, 11, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 115289, 12, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 115297, 13, 6, 6, true)
--Brother Korloff
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Brother Korloff")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 113764, 21, 6, 6, true)
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 114460, 22, 6, 6, true)
--High Inquisitor Whitemane