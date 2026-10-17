--local zone = "The Vortex Pinnacle"
local zoneid = 325

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

PlexusStatusRaidDebuff:DebuffId(zoneid, 87759, 1, 6, 6, true) --Shockwave
PlexusStatusRaidDebuff:DebuffId(zoneid, 87930, 1, 6, 6, true) --Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 88182, 1, 6, 6, true) --Lethargic Poison
PlexusStatusRaidDebuff:DebuffId(zoneid, 88171, 1, 6, 6, true) --Hurricane
PlexusStatusRaidDebuff:DebuffId(zoneid, 88314, 1, 6, 6, true) --Twisting Winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 87923, 1, 6, 6, true) --Wind Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 86292, 1, 6, 6, true) --Cyclone Shield
PlexusStatusRaidDebuff:DebuffId(zoneid, 88075, 1, 6, 6, true) --Typhoon
PlexusStatusRaidDebuff:DebuffId(zoneid, 87771, 1, 6, 6, true) --Crusader Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 88175, 1, 6, 6, true) --Asphyxiate
PlexusStatusRaidDebuff:DebuffId(zoneid, 76622, 1, 6, 6, true) --Sunder Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 88282, 1, 6, 6, true) --Upwind of Altairus
PlexusStatusRaidDebuff:DebuffId(zoneid, 88010, 1, 6, 6, true) --Cyclone

--Grand Vizier Ertan
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Grand Vizier Ertan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 86267, 11, 6, 6, true) -- Cyclone Shield
PlexusStatusRaidDebuff:DebuffId(zoneid, 413158, 12, 6, 6, true) -- Cyclone Shield Fragment
PlexusStatusRaidDebuff:DebuffId(zoneid, 413151, 13, 6, 6, true) -- Summon Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 411001, 14, 6, 6, true) -- Lethal Current

--Cyclone Shield

--Storm's Edge

--Altairus
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Altairus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 88286, 21, 5, 5) -- Downwind of Altairus
PlexusStatusRaidDebuff:DebuffId(zoneid, 88282, 22, 5, 5) -- Upwind of Altairus
PlexusStatusRaidDebuff:DebuffId(zoneid, 413296, 23, 6, 6, true) -- Downburst
PlexusStatusRaidDebuff:DebuffId(zoneid, 88308, 24, 6, 6, true) -- Chilling Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 413331, 25, 6, 6, true) -- Biting Cold
PlexusStatusRaidDebuff:DebuffId(zoneid, 413275, 26, 6, 6, true) -- Cold Front

--Asaad, Caliph of Zephyrs
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Asaad, Caliph of Zephyrs")
PlexusStatusRaidDebuff:DebuffId(zoneid, 86930, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 87618, 32, 6, 6, true)
end)