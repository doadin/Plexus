--local zone = "Sanguine Depths"
local zoneid = 1675

local Plexus = _G.Plexus
local PlexusStatus = Plexus:GetModule("PlexusStatus")
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
WhenRaidDebuffReady(function()

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

--Kryxis the Voracious
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Kryxis the Voracious")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 340880, 11, 5, 5) --Prideful

--Executor Tarvold
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Executor Tarvold")
PlexusStatusRaidDebuff:DebuffId(zoneid, 328494, 201, 5, 5) --Sintouched Anima
PlexusStatusRaidDebuff:DebuffId(zoneid, 322554, 202, 5, 5) --Castigate
PlexusStatusRaidDebuff:DebuffId(zoneid, 323573, 203, 5, 5) --Residue

--Grand Protector Beryllia
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Grand Protector Beryllia")
PlexusStatusRaidDebuff:DebuffId(zoneid, 328593, 301, 5, 5) --Agonize
PlexusStatusRaidDebuff:DebuffId(zoneid, 325885, 302, 5, 5) --Anguished Cries
PlexusStatusRaidDebuff:DebuffId(zoneid, 325254, 303, 5, 5) --Iron Spikes

--General Kaal
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "General Kaal")
PlexusStatusRaidDebuff:DebuffId(zoneid, 331415, 401, 5, 5) --Wicked Gash
PlexusStatusRaidDebuff:DebuffId(zoneid, 323845, 402, 5, 5) --Wicked Rush
end)
