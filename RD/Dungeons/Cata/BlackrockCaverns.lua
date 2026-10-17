--local zone = "Gate of the Setting Sun"
local zoneid = 283

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

--Rom'ogg Bonecrusher
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Rom'ogg Bonecrusher")
PlexusStatusRaidDebuff:DebuffId(zoneid, 75272, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75539, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75571, 13, 6, 6, true)
--Corla, Herald of Twilight
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Corla, Herald of Twilight")
PlexusStatusRaidDebuff:DebuffId(zoneid, 75610, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 75823, 22, 6, 6, true)
--Force Blast
--Gravity Strike
--Grievous Whirl
--Karsh Steelbender
--Beauty
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Beauty")
PlexusStatusRaidDebuff:DebuffId(zoneid, 76028, 31, 6, 6, true)
--Lava Drool
--Little Big Flame Breath
--Ascendant Lord Obsidius
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Ascendant Lord Obsidius")
PlexusStatusRaidDebuff:DebuffId(zoneid, 76185, 41, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 76188, 42, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 76186, 43, 6, 6, true)
--Crepuscular Veil
end)