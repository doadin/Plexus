--local zone = "The Seat of the Triumvirate"
local zoneid = 903

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

--Zuraal the Ascended
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Zuraal the Ascended")
PlexusStatusRaidDebuff:DebuffId(zoneid, 244588, 11, 6, 6, false, true)  --Void Sludge


--Saprish
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Saprish")
PlexusStatusRaidDebuff:DebuffId(zoneid, 246026, 21, 6, 6, true) --Void Trap


--Viceroy Nezhar
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Viceroy Nezhar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 244916, 31, 6, 6, false, true) --Void Lashing
PlexusStatusRaidDebuff:DebuffId(zoneid, 244906, 32, 7, 7) --Collapsing Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 246324, 33, 6, 6, true) --Entropic Force


--L'ura
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "L'ura")
PlexusStatusRaidDebuff:DebuffId(zoneid, 245289, 41, 6, 6, true) --Void Blast
end)