--local zone = "Gate of the Setting Sun"
local zoneid = 398

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

--Peroth'arn
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Peroth'arn")
--Corrupting Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 108141, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 105544, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 104905, 13, 6, 6, true)
--Easy Prey
--Queen Azshara
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Queen Azshara")
PlexusStatusRaidDebuff:DebuffId(zoneid, 103241, 21, 6, 6, true)
--Coldflame
--Firebomb
--Mannoroth and Varo'then
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Mannoroth and Varo'then")
PlexusStatusRaidDebuff:DebuffId(zoneid, 103888, 31, 6, 6, true)
--Aura of Immolation
end)