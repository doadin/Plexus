-- local zone = "Kun-Lai Summit"
local zoneid = 379
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

--Sha of Anger
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Sha of Anger")
PlexusStatusRaidDebuff:DebuffId(zoneid, 119626, 11, 3, 3) --Aggressive Behavior [NOTE: this is the MC]
PlexusStatusRaidDebuff:DebuffId(zoneid, 119488, 12, 3, 3) --Unleashed Wrath [NOTE: Must heal these people. Lots of shadow dmg]
PlexusStatusRaidDebuff:DebuffId(zoneid, 119610, 13, 3, 3) --Bitter Thoughts (Silence) [NOTE: There are 2 spell IDs in the logs for Bitter Thoughts. which one will Blizzard go with?]
PlexusStatusRaidDebuff:DebuffId(zoneid, 119601, 14, 3, 3) --Bitter Thoughts (Silence) [NOTE: There are 2 spell IDs in the logs for Bitter Thoughts. which one will Blizzard go with?]
end)
