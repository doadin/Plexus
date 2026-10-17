--local zone = "Scarlet Monastery"
local zoneid = 435

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

PlexusStatusRaidDebuff:DebuffId(zoneid, 42380, 1, 6, 6, true) --Conflagration
PlexusStatusRaidDebuff:DebuffId(zoneid, 42514, 1, 6, 6, true) --Squash Soul

--Thalnos
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Thalnos")
PlexusStatusRaidDebuff:DebuffId(zoneid, 115144, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 115289, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 115297, 13, 6, 6, true)
--Brother Korloff
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Brother Korloff")
PlexusStatusRaidDebuff:DebuffId(zoneid, 113764, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 114460, 22, 6, 6, true)
--High Inquisitor Whitemane
end)