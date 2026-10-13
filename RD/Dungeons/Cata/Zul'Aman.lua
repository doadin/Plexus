--local zone = "Gate of the Setting Sun"
local zoneid = 333

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Akil'zon
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Akil'zon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 44008, 11, 6, 6, true)
--Plucked
PlexusStatusRaidDebuff:DebuffId(zoneid, 43648, 12, 6, 6, true)
--Nalorakk
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Nalorakk")
PlexusStatusRaidDebuff:DebuffId(zoneid, 42402, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 42397, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 42395, 23, 6, 6, true)
--Jan'alai
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Jan'alai")
PlexusStatusRaidDebuff:DebuffId(zoneid, 43140, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 97497, 32, 6, 6, true)
--Halazzi
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Halazzi")
PlexusStatusRaidDebuff:DebuffId(zoneid, 43303, 41, 6, 6, true)
--Shred Armor
--Fixate
--Lightning
--Hex Lord Malacrass
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Hex Lord Malacrass")
--Venom Spit
--Psychic Wail
PlexusStatusRaidDebuff:DebuffId(zoneid, 43382, 51, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43383, 52, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 61601, 53, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 61603, 54, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43545, 55, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43444, 56, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43447, 57, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43426, 58, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43428, 59, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43429, 60, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43432, 61, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 97642, 62, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 97643, 63, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 97644, 64, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43461, 65, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43439, 66, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43522, 67, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43441, 68, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 127734, 69, 6, 6, true)
--Daakara
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Daakara")
PlexusStatusRaidDebuff:DebuffId(zoneid, 43093, 81, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 42402, 82, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43095, 83, 6, 6, true)
--Feral Swipe
PlexusStatusRaidDebuff:DebuffId(zoneid, 43153, 84, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43150, 85, 6, 6, true)
--Lightning
PlexusStatusRaidDebuff:DebuffId(zoneid, 43140, 86, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 97497, 87, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 44090, 88, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 43213, 89, 6, 6, true)
--Pillar of Fire