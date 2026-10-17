--local zone = "Temple of Sethraliss"
local zoneid = 1038
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

PlexusStatusRaidDebuff:DebuffId(zoneid, 272657, 1, 6, 6, true) --Noxious Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 273274, 1, 6, 6, true) --Polarized Field
PlexusStatusRaidDebuff:DebuffId(zoneid, 268024, 1, 6, 6, true) --Pulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 264574, 1, 6, 6, true) --Power Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 272670, 1, 6, 6, true) --Shoot
PlexusStatusRaidDebuff:DebuffId(zoneid, 262046, 1, 6, 6, true) --Krolusk Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 269670, 1, 6, 6, true) --Empowerment
PlexusStatusRaidDebuff:DebuffId(zoneid, 279014, 1, 6, 6, true) --Cardiac Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 268061, 1, 6, 6, true) --Chain Lightning
PlexusStatusRaidDebuff:DebuffId(zoneid, 263573, 1, 6, 6, true) --Cyclone Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 264587, 1, 6, 6, true) --Head Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 263927, 1, 6, 6, true) --Toxic Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 264206, 1, 6, 6, true) --Burrow
PlexusStatusRaidDebuff:DebuffId(zoneid, 268703, 1, 6, 6, true) --Lightning Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 272699, 1, 6, 6, true) --Venomous Spit
PlexusStatusRaidDebuff:DebuffId(zoneid, 272696, 1, 6, 6, true) --Lightning in a Bottle
PlexusStatusRaidDebuff:DebuffId(zoneid, 267278, 1, 6, 6, true) --Electrocute
PlexusStatusRaidDebuff:DebuffId(zoneid, 272654, 1, 6, 6, true) --Head Butt
PlexusStatusRaidDebuff:DebuffId(zoneid, 268007, 1, 6, 6, true) --Heart Attack
PlexusStatusRaidDebuff:DebuffId(zoneid, 272655, 1, 6, 6, true) --Scouring Sand
PlexusStatusRaidDebuff:DebuffId(zoneid, 268993, 1, 6, 6, true) --Cheap Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 272658, 1, 6, 6, true) --Electrified Scales
PlexusStatusRaidDebuff:DebuffId(zoneid, 263778, 1, 6, 6, true) --Gale Force
PlexusStatusRaidDebuff:DebuffId(zoneid, 268008, 1, 6, 6, true) --Snake Charm
PlexusStatusRaidDebuff:DebuffId(zoneid, 255595, 1, 6, 6, true) --Chomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 208086, 1, 6, 6, true) --Colossus Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 270686, 1, 6, 6, true) --Typhus
PlexusStatusRaidDebuff:DebuffId(zoneid, 270017, 1, 6, 6, true) --Enforcing Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 273563, 1, 6, 6, true) --Neurotoxin

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

-- 8.3
PlexusStatusRaidDebuff:DebuffId(zoneid, 314411, 1, 6, 6, true) --Lingering Doubt
PlexusStatusRaidDebuff:DebuffId(zoneid, 314392, 1, 6, 6, true) --Vile Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 314592, 1, 6, 6, true) --Mind Flay
PlexusStatusRaidDebuff:DebuffId(zoneid, 314406, 1, 6, 6, true) --Crippling Pestilence
PlexusStatusRaidDebuff:DebuffId(zoneid, 314308, 1, 6, 6, true) --Spirit Breaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 314478, 1, 6, 6, true) --Cascading Terror
PlexusStatusRaidDebuff:DebuffId(zoneid, 314531, 1, 6, 6, true) --Tear Flesh
PlexusStatusRaidDebuff:DebuffId(zoneid, 313445, 1, 1, 1, true) --Ny'alotha Incursion

--Adderis and Aspix
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Adderis and Aspix")
PlexusStatusRaidDebuff:DebuffId(zoneid, 263371, 11, 6, 6, true)  --Conduction
PlexusStatusRaidDebuff:DebuffId(zoneid, 263257, 12, 6, 6, true)  --Static Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 263425, 13, 6, 6, true)  --Arc Dash
PlexusStatusRaidDebuff:DebuffId(zoneid, 263234, 14, 6, 6, true)  --Arcing Blade
--Merektha
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Merektha")
PlexusStatusRaidDebuff:DebuffId(zoneid, 267027, 21, 6, 6, true)  --Cytotoxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 263914, 22, 6, 6, true)  --Blinding Sand
PlexusStatusRaidDebuff:DebuffId(zoneid, 263958, 23, 6, 6, true)  --A Knot of Snakes
--Galvazzt
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Galvazzt")
PlexusStatusRaidDebuff:DebuffId(zoneid, 265973, 31, 6, 6, true)  --Galvanize
PlexusStatusRaidDebuff:DebuffId(zoneid, 266511, 32, 6, 6, true)  --Capacitance
PlexusStatusRaidDebuff:DebuffId(zoneid, 266512, 33, 6, 6, true)  --Consume Charge
--Avatar of Sethraliss
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Avatar of Sethraliss")
PlexusStatusRaidDebuff:DebuffId(zoneid, 269686, 41, 6, 6, true)  --Plague
PlexusStatusRaidDebuff:DebuffId(zoneid, 273677, 42, 6, 6, true)  --Taint
end)