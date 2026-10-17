--local zone = "Grimrail Depot"
local zoneid = 606

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

PlexusStatusRaidDebuff:DebuffId(zoneid, 373552, 1, 6, 6, true) --Hypnosis Bat
PlexusStatusRaidDebuff:DebuffId(zoneid, 373429, 1, 6, 6, true, true) --Carrion Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 373391, 1, 6, 6, true) --Nightmare
PlexusStatusRaidDebuff:DebuffId(zoneid, 373744, 1, 6, 6, true) --Blood Siphon

--Trash

--Rocketspark and Borka
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Rocketspark and Borka")
PlexusStatusRaidDebuff:DebuffId(zoneid, 162500, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162407, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161091, 13, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161087, 14, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162617, 15, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161089, 16, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161092, 17, 6, 6, true)

--Nitrogg Thundertower
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Nitrogg Thundertower")
PlexusStatusRaidDebuff:DebuffId(zoneid, 163550, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163539, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 160681, 23, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 166570, 24, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 160702, 25, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 160703, 26, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163550, 27, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 160703, 28, 6, 6, true)

--Skylord Tovra
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Skylord Tovra")
PlexusStatusRaidDebuff:DebuffId(zoneid, 162066, 31, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162058, 32, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161588, 33, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161801, 34, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163447, 35, 6, 6, true)
end)