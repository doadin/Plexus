-- local zone = "Dragon Soul"
local zoneid = 409
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

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash

--Stormbinder Adept
PlexusStatusRaidDebuff:DebuffId(zoneid, 109442, 1, 4, 4) --Tornado
--Lieutenant Shara
PlexusStatusRaidDebuff:DebuffId(zoneid, 109331, 1, 4, 4, true, true) --Shatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 109333, 1, 5, 5) --Frost Corruption (magic)
--Ancient Water Lord
PlexusStatusRaidDebuff:DebuffId(zoneid, 107801, 1, 4, 4) --Drenched
PlexusStatusRaidDebuff:DebuffId(zoneid, 107797, 1, 4, 4) --Flood
PlexusStatusRaidDebuff:DebuffId(zoneid, 107770, 1, 1, 1, false, false, 0, true) --Pure Water
--Earthen Destroyer
PlexusStatusRaidDebuff:DebuffId(zoneid, 107677, 1, 4, 4, true, true) --Dust Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 107629, 1, 5, 5) --Boulder Smash (magic)
--Stormborn Myrmidon
PlexusStatusRaidDebuff:DebuffId(zoneid, 109368, 1, 4, 4, true, true) --Spark
--Twilight Frost Evoker
PlexusStatusRaidDebuff:DebuffId(zoneid, 109423, 1, 5, 5) --Shackles of Ice (magic)
--Twilight Siege Captain
PlexusStatusRaidDebuff:DebuffId(zoneid, 108183, 1, 5, 5) --Twilight Submission (magic)

--Morchok
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Morchok")
PlexusStatusRaidDebuff:DebuffId(zoneid, 103687, 11, 4, 4, true, true) --Crush Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 103821, 12, 3, 3) --Earthen Vortex
PlexusStatusRaidDebuff:DebuffId(zoneid, 103785, 13, 6, 6) --Black Blood of the Earth
PlexusStatusRaidDebuff:DebuffId(zoneid, 103534, 14, 5, 5) --Danger (Red)
PlexusStatusRaidDebuff:DebuffId(zoneid, 103536, 15, 5, 5) --Warning (Yellow)
-- Don't need to show Safe people
PlexusStatusRaidDebuff:DebuffId(zoneid, 103541, 16, 5, 5, false, false, 0, true) --Safe (Blue)
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 109033, 17, 3, 3) --Stomp

--Warlord Zon'ozz
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Warlord Zon'ozz")
PlexusStatusRaidDebuff:DebuffId(zoneid, 104378, 21, 3, 3) --Black Blood of Go'rath
PlexusStatusRaidDebuff:DebuffId(zoneid, 103434, 22, 5, 5) --Disrupting Shadows (dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 108799, 23, 2, 2) --Black Blood Erruption

--Yor'sahj the Unsleeping
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Yor'sahj the Unsleeping")
PlexusStatusRaidDebuff:DebuffId(zoneid, 104849, 31, 3, 3, true, true) --Void Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 105171, 32, 4, 4, true, true) --Deep Corruption

--Hagara the Stormbinder
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Hagara the Stormbinder")
PlexusStatusRaidDebuff:DebuffId(zoneid, 105316, 41, 6, 6, true, true) --Ice Lance
PlexusStatusRaidDebuff:DebuffId(zoneid, 105465, 42, 6, 6) --Lightning Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 105369, 43, 5, 5) --Lightning Conduit
PlexusStatusRaidDebuff:DebuffId(zoneid, 105289, 44, 7, 7) --Shattered Ice (dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 105285, 45, 4, 4) --Target (next Ice Lance)
PlexusStatusRaidDebuff:DebuffId(zoneid, 104451, 46, 5, 5) --Ice Tomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 110317, 47, 3, 3) --Watery Entrenchment
PlexusStatusRaidDebuff:DebuffId(zoneid, 105314, 48, 3, 3) --Ice Wave
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 109325, 49, 7, 7) --Frostflake (dispellable)

--Ultraxion
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Ultraxion")
PlexusStatusRaidDebuff:DebuffId(zoneid, 105925, 51, 6, 6) --Fading Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 106108, 52, 5, 5) --Heroic Will
PlexusStatusRaidDebuff:DebuffId(zoneid, 105984, 53, 2, 2) --Timeloop
PlexusStatusRaidDebuff:DebuffId(zoneid, 105927, 54, 4, 4) --Faded Into Twilight
PlexusStatusRaidDebuff:DebuffId(zoneid, 106415, 55, 4, 4, true, true) --Twilight Burst
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 106498, 56, 3, 3) --Looming Darkness

--Warmaster Blackhorn
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Warmaster Blackhorn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 108043, 61, 4, 4, true, true) --Sunder Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 107558, 62, 3, 3, true, true) --Degeneration
PlexusStatusRaidDebuff:DebuffId(zoneid, 107567, 64, 3, 3, true, true) --Brutal Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 108046, 65, 5, 5) --Shockwave
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 109204, 66, 5, 5) -- Twilight Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 110214, 67, 6, 6) -- Consuming Shroud

--Spine of Deathwing
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Spine of Deathwing")
PlexusStatusRaidDebuff:DebuffId(zoneid, 105563, 71, 3, 3) --Grasping Tendrils
PlexusStatusRaidDebuff:DebuffId(zoneid, 105479, 72, 6, 6) --Searing Plasma
PlexusStatusRaidDebuff:DebuffId(zoneid, 105490, 73, 4, 4) --Fiery Grip
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 106005, 74, 1, 1, false, false, 0, true) --Degradation (disabled)
PlexusStatusRaidDebuff:DebuffId(zoneid, 106200, 75, 5, 5) --Blood Corruption: Earth
PlexusStatusRaidDebuff:DebuffId(zoneid, 106199, 76, 7, 7) --Blood Corruption: Death

--Madness of Deathwing
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Madness of Deathwing")
PlexusStatusRaidDebuff:DebuffId(zoneid, 105445, 81, 3, 3, true, true) --Blistering Heat
PlexusStatusRaidDebuff:DebuffId(zoneid, 105841, 82, 4, 4, true, true) --Degenerative Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 106385, 83, 5, 5, true, true) --Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 106730, 84, 5, 5, true, true) --Tetanus
PlexusStatusRaidDebuff:DebuffId(zoneid, 106444, 85, 5, 5, true, true) --Impale
PlexusStatusRaidDebuff:DebuffId(zoneid, 106794, 86, 6, 6) --Shrapnel (target)
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 108649, 87, 6, 6) --Corrupting Parasite
end)
