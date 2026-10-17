--local zone = "Halls of Stone
local zoneid = 140

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

PlexusStatusRaidDebuff:DebuffId(zoneid, 46202, 1, 6, 6, true) --Pierce Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 50895, 1, 6, 6, true) --Lightning Tether
PlexusStatusRaidDebuff:DebuffId(zoneid, 50761, 1, 6, 6, true) --Pillar of Woe
PlexusStatusRaidDebuff:DebuffId(zoneid, 50834, 1, 6, 6, true) --Static Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 50841, 1, 6, 6, true) --Lightning Ring
PlexusStatusRaidDebuff:DebuffId(zoneid, 51491, 1, 6, 6, true) --Unrelenting Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 51496, 1, 6, 6, true) --Chiseling Ray
PlexusStatusRaidDebuff:DebuffId(zoneid, 50760, 1, 6, 6, true) --Shock of Sorrow
end)