--local zone = "Violet Hold"
local zoneid = 732

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

--Shivermaw
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Shivermaw")
PlexusStatusRaidDebuff:DebuffId(zoneid, 201379, 11, 6, 6, true) --Frost Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 201672, 12, 6, 6, true) --Relentless Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 201960, 13, 6, 6, true) --Ice Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 202037, 14, 6, 6, true) --Frozen


--Blood-Princess Thal'ena
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Blood-Princess Thal'ena")
PlexusStatusRaidDebuff:DebuffId(zoneid, 202779, 21, 6, 6, true) --Essence of the Blood Princess
PlexusStatusRaidDebuff:DebuffId(zoneid, 202792, 22, 6, 6, true) --Frenzied Bloodthirst


--Festerface
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Festerface")
PlexusStatusRaidDebuff:DebuffId(zoneid, 202266, 31, 6, 6, true) --Icky Goo
PlexusStatusRaidDebuff:DebuffId(zoneid, 201753, 32, 6, 6, true) --Necrotic Aura


--Millificent Manastorm
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Millificent Manastorm")
PlexusStatusRaidDebuff:DebuffId(zoneid, 201159, 41, 6, 6, true) --Delta Finger Laser X-treme
PlexusStatusRaidDebuff:DebuffId(zoneid, 202310, 42, 6, 6, true) --Hyper Zap-o-matic Ultimate Mark III

--Mindflayer Kaahrj
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Mindflayer Kaahrj")
PlexusStatusRaidDebuff:DebuffId(zoneid, 201146, 51, 6, 6, true) --Hysteria
PlexusStatusRaidDebuff:DebuffId(zoneid, 197783, 52, 6, 6, true) --Shadow Crash
PlexusStatusRaidDebuff:DebuffId(zoneid, 201172, 53, 6, 6, true) --Eternal Darkness

--Anub-esset
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Anub-esset")
PlexusStatusRaidDebuff:DebuffId(zoneid, 202217, 61, 6, 6, true) --Mandible Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 202341, 62, 6, 6, true) --Impale

--Sael-orn
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Sael-orn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 202306, 71, 6, 6, true) --Creeping Slaughter
PlexusStatusRaidDebuff:DebuffId(zoneid, 202414, 72, 6, 6, true) --Venom Spray
PlexusStatusRaidDebuff:DebuffId(zoneid, 210505, 73, 6, 6, true) --Toxic Blood

--Fel Lord Betrug
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Fel Lord Betrug")
PlexusStatusRaidDebuff:DebuffId(zoneid, 202361, 81, 6, 6, true) --Execution
PlexusStatusRaidDebuff:DebuffId(zoneid, 210879, 82, 6, 6, true) --Seed of Destruction
end)