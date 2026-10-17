--local zone = "Halls of Stone
local zoneid = 133

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

PlexusStatusRaidDebuff:DebuffId(zoneid, 9791, 1, 6, 6, true) --Head Crack
PlexusStatusRaidDebuff:DebuffId(zoneid, 35570, 1, 6, 6, true) --Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 42972, 1, 6, 6, true) --Blind
PlexusStatusRaidDebuff:DebuffId(zoneid, 42702, 1, 6, 6, true) --Decrepify
PlexusStatusRaidDebuff:DebuffId(zoneid, 16244, 1, 6, 6, true) --Demoralizing Shout
PlexusStatusRaidDebuff:DebuffId(zoneid, 43931, 1, 6, 6, true) --Rend
PlexusStatusRaidDebuff:DebuffId(zoneid, 43936, 1, 6, 6, true) --Knockdown Spin
PlexusStatusRaidDebuff:DebuffId(zoneid, 48400, 1, 6, 6, true) --Frost Tomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 43650, 1, 6, 6, true) --Debilitate
PlexusStatusRaidDebuff:DebuffId(zoneid, 42723, 1, 6, 6, true) --Dark Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 15572, 1, 6, 6, true) --Sunder Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 43757, 1, 6, 6, true) --Burning Brand
PlexusStatusRaidDebuff:DebuffId(zoneid, 22427, 1, 6, 6, true) --Concussion Blow
end)