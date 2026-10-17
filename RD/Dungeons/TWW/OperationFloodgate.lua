-- local zone = "Operation: Floodgate"
local zoneid = 2387
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

-- Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 465120, 1, 5, 5, true) --Wind Up
PlexusStatusRaidDebuff:DebuffId(zoneid, 469811, 1, 5, 5, true) --Backwash
PlexusStatusRaidDebuff:DebuffId(zoneid, 472338, 1, 5, 5, true) --Surveyed Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 468672, 1, 5, 5, true) --Pinch
PlexusStatusRaidDebuff:DebuffId(zoneid, 1213803, 1, 5, 5, true) --Nailed
PlexusStatusRaidDebuff:DebuffId(zoneid, 1216858, 1, 5, 5, true) --Void Pulsar
PlexusStatusRaidDebuff:DebuffId(zoneid, 468680, 1, 5, 5, true) --Crabsplosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 474351, 1, 5, 5, true) --Shreddation Sawblade
PlexusStatusRaidDebuff:DebuffId(zoneid, 465830, 1, 5, 5, true) --Warp Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 469799, 1, 5, 5, true) --Overcharge
PlexusStatusRaidDebuff:DebuffId(zoneid, 462737, 1, 5, 5, true) --Black Blood Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 468631, 1, 5, 5, true) --Harpoon
PlexusStatusRaidDebuff:DebuffId(zoneid, 474388, 1, 5, 5, true) --Flamethrower
PlexusStatusRaidDebuff:DebuffId(zoneid, 462771, 1, 5, 5, true) --Surveying Beam

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

-- "Big M.O.M.M.A."
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Big M.O.M.M.A.")
PlexusStatusRaidDebuff:DebuffId(zoneid, 460156, 101, 5, 5, true) --Jumpstart
PlexusStatusRaidDebuff:DebuffId(zoneid, 473287, 102, 5, 5, true) --Excessive Electrification
PlexusStatusRaidDebuff:DebuffId(zoneid, 471585, 103, 5, 5, true) --Mobilize Mechadrones
PlexusStatusRaidDebuff:DebuffId(zoneid, 1214780, 104, 5, 5, true) --Maximum Distortion
PlexusStatusRaidDebuff:DebuffId(zoneid, 460393, 105, 5, 5, true) --Shoot
PlexusStatusRaidDebuff:DebuffId(zoneid, 472452, 106, 5, 5, true) --Doom Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 473351, 107, 5, 5, true) --Electrocrush
PlexusStatusRaidDebuff:DebuffId(zoneid, 473220, 108, 5, 5, true) --Sonic Boom
PlexusStatusRaidDebuff:DebuffId(zoneid, 469981, 109, 5, 5, true) --Kill-o-Block Barrier

-- "Demolition Duo"
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Demolition Duo")
PlexusStatusRaidDebuff:DebuffId(zoneid, 460867, 201, 5, 5, true) --Big Bada BOOM!
PlexusStatusRaidDebuff:DebuffId(zoneid, 460787, 202, 5, 5, true) --Deflagration
PlexusStatusRaidDebuff:DebuffId(zoneid, 472755, 203, 5, 5, true) --Shrapnel
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217653, 204, 5, 5, true) --B.B.B.F.G.
PlexusStatusRaidDebuff:DebuffId(zoneid, 460602, 205, 5, 5, true) --Quick Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 473690, 206, 5, 5, true) --Kinetic Explosive Gel
PlexusStatusRaidDebuff:DebuffId(zoneid, 459779, 207, 5, 5, true) --Barreling Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 459799, 208, 5, 5, true) --Wallop
PlexusStatusRaidDebuff:DebuffId(zoneid, 470090, 209, 5, 5, true) --Divided Duo

-- "Swampface"
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Swampface")
PlexusStatusRaidDebuff:DebuffId(zoneid, 470039, 301, 5, 5, true) --Razorchoke Vines
PlexusStatusRaidDebuff:DebuffId(zoneid, 473070, 302, 5, 5, true) --Awaken the Swamp
PlexusStatusRaidDebuff:DebuffId(zoneid, 473047, 303, 5, 5, true) --Skewering Root
PlexusStatusRaidDebuff:DebuffId(zoneid, 473052, 304, 5, 5, true) --Rushing Tide
PlexusStatusRaidDebuff:DebuffId(zoneid, 473112, 305, 5, 5, true) --Mudslide
PlexusStatusRaidDebuff:DebuffId(zoneid, 469478, 306, 5, 5, true) --Sludge Claws

-- "Geezle Gigazap"
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Geezle Gigazap")
PlexusStatusRaidDebuff:DebuffId(zoneid, 465456, 401, 5, 5, true) --Turbo Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 466088, 402, 5, 5, true) --Turbo Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 468276, 403, 5, 5, true) --Dam!
PlexusStatusRaidDebuff:DebuffId(zoneid, 468261, 404, 5, 5, true) --Dam Water
PlexusStatusRaidDebuff:DebuffId(zoneid, 468661, 405, 5, 5, true) --Shock Water
PlexusStatusRaidDebuff:DebuffId(zoneid, 468606, 406, 5, 5, true) --Dam Rubble
PlexusStatusRaidDebuff:DebuffId(zoneid, 468846, 407, 5, 5, true) --Leaping Sparks
PlexusStatusRaidDebuff:DebuffId(zoneid, 468812, 408, 5, 5, true) --Gigazap
PlexusStatusRaidDebuff:DebuffId(zoneid, 466197, 409, 5, 5, true) --Thunder Punch
end)