--local zone = "Theater of Pain"
local zoneid = 1683

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Trash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320679, 1, 6, 6, true) --Charge
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 342675, 1, 6, 6, true) --Bone Spear
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 330810, 1, 6, 6, true) --Bind Soul
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 333299, 1, 6, 6, true) --Curse of Desolation
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 331288, 1, 6, 6, true) --Colossus Smash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 330532, 1, 6, 6, true) --Jagged Quarrel
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 330700, 1, 6, 6, true) --Decaying Blight
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 330725, 1, 6, 6, true) --Shadow Vulnerability
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 333861, 1, 6, 6, true) --Ricocheting Blade
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 341949, 1, 6, 6, true) --Withering Blight
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 330592, 1, 6, 6, true) --Vile Eruption
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 333845, 1, 6, 6, true) --Unbalancing Blow
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 1216858, 1, 6, 6, true) --Void Pulsar

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

--An Affront of Challengers
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "An Affront of Challengers")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 333231, 101, 5, 5) --Searing Death
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 326892, 102, 5, 5) --Fixate
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320069, 103, 5, 5) --Mortal Strike
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 333540, 104, 5, 5) --Opportunity Strikes
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320248, 105, 5, 5) --Genetic Alteration
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320180, 106, 5, 5) --Noxious Spores
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 1217138, 107, 5, 5, true) --Necrotic Bolt
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 1215600, 108, 5, 5, true) --Withering Touch
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 1215741, 109, 5, 5, true) --Mighty Smash

--Gorechop
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Gorechop")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323406, 201, 5, 5) --Jagged Gash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323130, 202, 5, 5) --Coagulating Ooze
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 321768, 203, 4, 4) --On the Hook
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323750, 204, 5, 5) --Vile Gas

--Xav the Unfallen
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Xav the Unfallen")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 331606, 301, 4, 4) --Oppressive Banner
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 320102, 302, 4, 4) --Blood and Glory
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 332670, 303, 4, 4) --Glorious Combat

--Kul'tharok"
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Kul'tharok")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 319567, 401, 5, 5) --Grasping Hands
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 319626, 402, 5, 5) --Phantasmal Parasite
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 319539, 403, 5, 5) --Soulless
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 474114, 404, 5, 5, true) --Draw Soul
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 1223240, 405, 5, 5, true) --Death Spiral
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 1223804, 406, 5, 5, true) --Well of Darkness
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 1225377, 407, 5, 5, true) --Necrotic Eruption

--Mordretha, the Endless Empress
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Mordretha, the Endless Empress")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323825, 501, 5, 5) --Grasping Rift
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 324449, 502, 5, 5) --Manifest Death
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 323831, 503, 5, 5) --Death Grasp
