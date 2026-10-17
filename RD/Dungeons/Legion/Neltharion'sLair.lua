--local zone = "Neltharion's Lair"
local zoneid = 731

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

--Whole Dungeon/Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 200154, 1, 6, 6, true) -- Burning Hatred
PlexusStatusRaidDebuff:DebuffId(zoneid, 202231, 1, 6, 6, true) -- Leech
PlexusStatusRaidDebuff:DebuffId(zoneid, 192800, 1, 6, 6, true) -- Choking Dust
PlexusStatusRaidDebuff:DebuffId(zoneid, 193639, 1, 6, 6, true) -- Bone Chomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 188494, 1, 6, 6, true) -- Rancid Maw
PlexusStatusRaidDebuff:DebuffId(zoneid, 193941, 1, 6, 6, true) -- Impaling Shard
PlexusStatusRaidDebuff:DebuffId(zoneid, 183465, 1, 6, 6, true) -- Viscid Bile
PlexusStatusRaidDebuff:DebuffId(zoneid, 202181, 1, 6, 6, true) -- Stone Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 193585, 1, 6, 6, true) -- Bound
PlexusStatusRaidDebuff:DebuffId(zoneid, 226388, 1, 6, 6, true) -- Rancid Ooze

--Rokmora
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Rokmora")
PlexusStatusRaidDebuff:DebuffId(zoneid, 215898, 11, 6, 6, true) -- Crystalline Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 192799, 12, 6, 6, true) -- Choking Dust

--Ularogg Cragshaper
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Ularogg Cragshaper")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 196562, 21, 6, 6, true) -- Volatile Magic
PlexusStatusRaidDebuff:DebuffId(zoneid, 198496, 21, 6, 6, true) -- Sunder

--Naraxas
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Naraxas")
PlexusStatusRaidDebuff:DebuffId(zoneid, 217851, 31, 6, 6, true) -- Toxic Retch
PlexusStatusRaidDebuff:DebuffId(zoneid, 199178, 32, 6, 6, true) -- Spiked Tongue
PlexusStatusRaidDebuff:DebuffId(zoneid, 205549, 33, 6, 6, true) -- Rancid Maw

--Dargrul
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Dargrul")
--PlexusStatusRaidDebuff:DebuffId(zoneid, 200284, 41, 6, 6, true) --Tangled Web
PlexusStatusRaidDebuff:DebuffId(zoneid, 200732, 41, 6, 6, true) -- Molten Crash
PlexusStatusRaidDebuff:DebuffId(zoneid, 200404, 42, 6, 6, true) -- Magma Wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 200154, 43, 6, 6, true) -- Burning Hatred
PlexusStatusRaidDebuff:DebuffId(zoneid, 201953, 44, 6, 6, true) -- Crystal Spike
end)
