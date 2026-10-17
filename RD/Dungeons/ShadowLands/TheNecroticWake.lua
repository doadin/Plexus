--local zone = "The Necrotic Wake"
local zoneid = 1666

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

--Blightbone
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Blightbone")
PlexusStatusRaidDebuff:DebuffId(zoneid, 320717, 101, 5, 5) --Blood Hunger
PlexusStatusRaidDebuff:DebuffId(zoneid, 320596, 102, 5, 5) --Heaving Retch
PlexusStatusRaidDebuff:DebuffId(zoneid, 320646, 103, 5, 5) --Fetid Gas

--Amarth, the Harvester
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Amarth, the Harvester")
PlexusStatusRaidDebuff:DebuffId(zoneid, 320170, 201, 5, 5) --Necrotic Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 328664, 202, 5, 5, nil, true) --Chilled
PlexusStatusRaidDebuff:DebuffId(zoneid, 333492, 203, 5, 5) --Necrotic Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 333489, 204, 5, 5) --Necrotic Breath

--Surgeon Stitchflesh
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Surgeon Stitchflesh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 333485, 301, 5, 5) --Disease Cloud
PlexusStatusRaidDebuff:DebuffId(zoneid, 320200, 302, 5, 5) --Stitchneedle
PlexusStatusRaidDebuff:DebuffId(zoneid, 322681, 303, 5, 5) --Meat Hook
PlexusStatusRaidDebuff:DebuffId(zoneid, 343556, 304, 5, 5) --Morbid Fixation
PlexusStatusRaidDebuff:DebuffId(zoneid, 320366, 305, 5, 5) --Embalming Ichor

--Nalthor the Rimebinder
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Nalthor the Rimebinder")
PlexusStatusRaidDebuff:DebuffId(zoneid, 328181, 401, 4, 4) --Frigid Cold
PlexusStatusRaidDebuff:DebuffId(zoneid, 321755, 402, 5, 5, nil, true) --Icebound Aegis
PlexusStatusRaidDebuff:DebuffId(zoneid, 320784, 403, 4, 4) --Comet Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 320788, 404, 5, 5) --Frozen Binds
PlexusStatusRaidDebuff:DebuffId(zoneid, 322274, 405, 5, 5) --Enfeeble
PlexusStatusRaidDebuff:DebuffId(zoneid, 328212, 406, 5, 5) --Razorshard Ice
end)