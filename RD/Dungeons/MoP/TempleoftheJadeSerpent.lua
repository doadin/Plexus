--local zone = "Temple of the Jade Serpent"
local zoneid = 429

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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 118714, 1, 6, 6, true) --Purified Water
PlexusStatusRaidDebuff:DebuffId(zoneid, 110125, 1, 6, 6, true) --Shattered Resolve
PlexusStatusRaidDebuff:DebuffId(zoneid, 128051, 1, 6, 6, true) --Serrated Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 114826, 1, 6, 6, true) --Songbird Serenade
PlexusStatusRaidDebuff:DebuffId(zoneid, 110099, 1, 6, 6, true) --Shadows of Doubt
PlexusStatusRaidDebuff:DebuffId(zoneid, 397911, 1, 6, 6, true) --Touch of Ruin
PlexusStatusRaidDebuff:DebuffId(zoneid, 397904, 1, 6, 6, true) --Setting Sun Kick
PlexusStatusRaidDebuff:DebuffId(zoneid, 397914, 1, 6, 6, true) --Defiling Mist
PlexusStatusRaidDebuff:DebuffId(zoneid, 397878, 1, 6, 6, true) --Tainted Ripple

--Wise Mari
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Wise Mari")
PlexusStatusRaidDebuff:DebuffId(zoneid, 115167, 11, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143459, 12, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 396874, 13, 6, 6, true) --Water Bubble Burst

--Lorewalker Stonestep

--Liu Flameheart
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Liu Flameheart")
PlexusStatusRaidDebuff:DebuffId(zoneid, 106823, 21, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 106841, 22, 6, 6, true)
PlexusStatusRaidDebuff:DebuffId(zoneid, 107045, 23, 6, 6, true)

--Sha of Doubt
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Sha of Doubt")
PlexusStatusRaidDebuff:DebuffId(zoneid, 106113, 31, 6, 6, true)
end)