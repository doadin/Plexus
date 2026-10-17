--local zone = "Sanguine Depths"
local zoneid = 1693

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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 328453, 1, 5, 5) --Oppression
PlexusStatusRaidDebuff:DebuffId(zoneid, 317661, 1, 5, 5) --Insidious Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 328434, 1, 5, 5) --Intimidated
PlexusStatusRaidDebuff:DebuffId(zoneid, 317963, 1, 5, 5) --Burden of Knowledge
PlexusStatusRaidDebuff:DebuffId(zoneid, 327648, 1, 5, 5) --Internal Strife
PlexusStatusRaidDebuff:DebuffId(zoneid, 323744, 1, 5, 5) --Pounce
PlexusStatusRaidDebuff:DebuffId(zoneid, 328331, 1, 5, 5) --Forced Confession
PlexusStatusRaidDebuff:DebuffId(zoneid, 323739, 1, 5, 5) --Residual Impact

--Kin-Tara
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Kin-Tara")
PlexusStatusRaidDebuff:DebuffId(zoneid, 327481, 101, 5, 5) --Dark Lance
PlexusStatusRaidDebuff:DebuffId(zoneid, 331251, 102, 5, 5) --Deep Connection
PlexusStatusRaidDebuff:DebuffId(zoneid, 324662, 103, 5, 5) --Ionized Plasma

--Ventunax
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Ventunax")
PlexusStatusRaidDebuff:DebuffId(zoneid, 324154, 201, 5, 5) --Dark Stride

--Oryphrion
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Oryphrion")
PlexusStatusRaidDebuff:DebuffId(zoneid, 323195, 301, 5, 5) --Purifying Blast

--Devos, Paragon of Doubt
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Devos, Paragon of Doubt")
PlexusStatusRaidDebuff:DebuffId(zoneid, 322818, 401, 5, 5) --Lost Confidence
PlexusStatusRaidDebuff:DebuffId(zoneid, 322817, 402, 5, 5) --Lingering Doubt
end)