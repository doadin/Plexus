-- local zone = "Throne of the Four Winds"
local zoneid = 328
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

--Conclave of Wind
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Conclave of Wind")
PlexusStatusRaidDebuff:DebuffId(zoneid, 84645, 11, 5, 5, true, true) --Wind Chill
PlexusStatusRaidDebuff:DebuffId(zoneid, 86111, 12, 6, 6, true, true) --Ice Patch
PlexusStatusRaidDebuff:DebuffId(zoneid, 86082, 13, 7, 7) --Permafrost
PlexusStatusRaidDebuff:DebuffId(zoneid, 86481, 14, 7, 7) --Hurricane
PlexusStatusRaidDebuff:DebuffId(zoneid, 86282, 15, 7, 7, true, true) --Toxic Spores
PlexusStatusRaidDebuff:DebuffId(zoneid, 85573, 16, 8, 8) --Deafening Winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 85576, 17, 8, 8) --Withering Winds
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 93057, 18, 7, 7, true, true) --Slicing Gale

--Al'Akir
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Al'Akir")
PlexusStatusRaidDebuff:DebuffId(zoneid, 88301, 21, 5, 5) --Acid Rain
PlexusStatusRaidDebuff:DebuffId(zoneid, 87873, 22, 6, 6) --Static Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 88427, 23, 6, 6) --Electrocute
PlexusStatusRaidDebuff:DebuffId(zoneid, 89666, 24, 6, 6) --Lightning Rod
PlexusStatusRaidDebuff:DebuffId(zoneid, 89668, 25, 6, 6) --Lightning Rod
PlexusStatusRaidDebuff:DebuffId(zoneid, 87856, 25, 6, 6) --Squall Line
end)
