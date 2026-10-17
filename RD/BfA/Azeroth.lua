-- local zone = "Azeroth"
local zoneid = 947
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
-- Trash

-- T'zane
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "T'zane")
PlexusStatusRaidDebuff:DebuffId(zoneid, 261552, 11, 5, 5, true) -- Terror Wail
PlexusStatusRaidDebuff:DebuffId(zoneid, 261632, 12, 5, 5, true) -- Consuming Spirits

-- Ji'arak
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Ji'arak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 261509, 21, 5, 5, true) -- Clutch
PlexusStatusRaidDebuff:DebuffId(zoneid, 260908, 22, 5, 5) -- Storm Wing

-- Hailstone Construct
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Hailstone Construct")
PlexusStatusRaidDebuff:DebuffId(zoneid, 274891, 31, 5, 5) -- Glacial Breath

-- The Lion's Roar
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "The Lion's Roar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 271246, 41, 5, 5, true) -- Demolisher Cannon

-- Azurethos, The Winged Typhoon
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Azurethos")
PlexusStatusRaidDebuff:DebuffId(zoneid, 274839, 51, 5, 5, true) -- Azurethos' Fury

-- Warbringer Yenajz
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Warbringer Yenajz")
PlexusStatusRaidDebuff:DebuffId(zoneid, 274904, 61, 5, 5, true) -- Reality Tear
PlexusStatusRaidDebuff:DebuffId(zoneid, 274932, 62, 5, 5) -- Endless Abyss
PlexusStatusRaidDebuff:DebuffId(zoneid, 274842, 63, 5, 5) -- Void Nova

-- Dunegorger Kraulok
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Dunegorger Kraulok")
end)
