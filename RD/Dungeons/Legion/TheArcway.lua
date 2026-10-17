--local zone = "The Arcway"
local zoneid = 749

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = PlexusStatus:GetModule("PlexusStatusRaidDebuff", true)
local function WhenRaidDebuffReady(callback)
    if PlexusStatusRaidDebuff and PlexusStatusRaidDebuff.options then
        callback(PlexusStatusRaidDebuff)
        return
    end
    C_Timer.After(1, function()
        if PlexusStatusRaidDebuff and PlexusStatusRaidDebuff.options then
            callback(PlexusStatusRaidDebuff)
        end
    end)
end
WhenRaidDebuffReady(function(PlexusStatusRaidDebuff)

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
PlexusStatusRaidDebuff:DebuffId(zoneid, 210645, 1, 6, 6, true) --Arcanic Bane
PlexusStatusRaidDebuff:DebuffId(zoneid, 211756, 1, 6, 6, true) --Searing Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 226269, 1, 6, 6, true) --Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 211125, 1, 6, 6, true) --Parallel Dimension
PlexusStatusRaidDebuff:DebuffId(zoneid, 211000, 1, 6, 6, true) --Nether Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 211543, 1, 6, 6, true) --Devour
PlexusStatusRaidDebuff:DebuffId(zoneid, 202156, 1, 6, 6, true) --Corrosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 210750, 1, 6, 6, true) --Collapsing Rift
PlexusStatusRaidDebuff:DebuffId(zoneid, 210684, 1, 6, 6, true) --Siphon Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 203592, 1, 6, 6, true) --Black Plague
PlexusStatusRaidDebuff:DebuffId(zoneid, 202232, 1, 6, 6, true) --Consume
PlexusStatusRaidDebuff:DebuffId(zoneid, 194006, 1, 6, 6, true) --Ooze Puddle

--Corstilax
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Corstilax")
PlexusStatusRaidDebuff:DebuffId(zoneid, 196074, 11, 6, 6, true) --Suppression Protocol
PlexusStatusRaidDebuff:DebuffId(zoneid, 195804, 12, 6, 6, true) --Quarantine
PlexusStatusRaidDebuff:DebuffId(zoneid, 220500, 13, 6, 6, true) --Destabilized Orb


--Ivanyr
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Ivanyr")
PlexusStatusRaidDebuff:DebuffId(zoneid, 196562, 21, 6, 6, true) --Volatile Magic


--General Xakal
--PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "General Xakal")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 153234, 31, 6, 6, true)


--Nal'tira
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Nal'tira")
PlexusStatusRaidDebuff:DebuffId(zoneid, 200284, 41, 6, 6, true) --Tangled Web
PlexusStatusRaidDebuff:DebuffId(zoneid, 200040, 42, 6, 6, true) --Nether Venom

--Advisor Vandros
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Advisor Vandros")
PlexusStatusRaidDebuff:DebuffId(zoneid, 203914, 51, 6, 6, true) --Banished In Time
PlexusStatusRaidDebuff:DebuffId(zoneid, 203139, 52, 6, 6, true) --Force Nova
end)