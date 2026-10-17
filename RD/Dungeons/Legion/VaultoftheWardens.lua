--local zone = "Vault of the Wardens"
local zoneid = 710

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
PlexusStatusRaidDebuff:DebuffId(zoneid, 193164, 1, 6, 6, true) --Gift of the Doomsayer
PlexusStatusRaidDebuff:DebuffId(zoneid, 193956, 1, 6, 6, true) --Barbed Web
PlexusStatusRaidDebuff:DebuffId(zoneid, 194064, 1, 6, 6, true) --A Mother's Love
PlexusStatusRaidDebuff:DebuffId(zoneid, 202615, 1, 6, 6, true) --Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 193607, 1, 6, 6, true) --Double Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 193069, 1, 6, 6, true) --Nightmares
PlexusStatusRaidDebuff:DebuffId(zoneid, 206019, 1, 6, 6, true) --Corrupted Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 210202, 1, 6, 6, true) --Foul Stench
PlexusStatusRaidDebuff:DebuffId(zoneid, 202658, 1, 6, 6, true) --Drain
PlexusStatusRaidDebuff:DebuffId(zoneid, 193969, 1, 6, 6, true) --Razors
PlexusStatusRaidDebuff:DebuffId(zoneid, 202608, 1, 6, 6, true) --Anguished Souls

--Tirathon Saltheril
--PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Tirathon Saltheril")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 153480, 11, 6, 6, true)


--Inquisitor Tormentorum
--PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Inquisitor Tormentorum")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 154415, 21, 6, 6, true)


--Glazer
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Glazer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 202046, 31, 6, 6, true) --Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 194942, 32, 6, 6, true) --Lingering Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 215478, 33, 6, 6, true) --Fired Up


--Ash'Golm
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Ash'Golm")
PlexusStatusRaidDebuff:DebuffId(zoneid, 192519, 41, 6, 6, true) --Lava

--Cordana Felsong
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Cordana Felsong")
PlexusStatusRaidDebuff:DebuffId(zoneid, 213395, 51, 6, 6, true) --Deepening Shadows
end)