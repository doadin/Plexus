--local zone = "Operation: Mechagon"
local zoneid = 1490
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

--trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 295170, 1, 6, 6, true)  --Capacitor Discharge
PlexusStatusRaidDebuff:DebuffId(zoneid, 299572, 1, 6, 6, true)  --Shrink
PlexusStatusRaidDebuff:DebuffId(zoneid, 297283, 1, 6, 6, true)  --Cave In
PlexusStatusRaidDebuff:DebuffId(zoneid, 294180, 1, 6, 6, true)  --Flaming Refuse
PlexusStatusRaidDebuff:DebuffId(zoneid, 299502, 1, 6, 6, true)  --Nanoslicer
PlexusStatusRaidDebuff:DebuffId(zoneid, 296560, 1, 6, 6, true)  --Clinging Static
PlexusStatusRaidDebuff:DebuffId(zoneid, 301712, 1, 6, 6, true)  --Pounce
PlexusStatusRaidDebuff:DebuffId(zoneid, 299475, 1, 6, 6, true)  --B.O.R.K
PlexusStatusRaidDebuff:DebuffId(zoneid, 299438, 1, 6, 6, true)  --Sledgehammer
PlexusStatusRaidDebuff:DebuffId(zoneid, 293986, 1, 6, 6, true)  --Sonic Pulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 301299, 1, 6, 6, true)  --Furnace Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 300650, 1, 6, 6, true)  --Suffocating Smog
PlexusStatusRaidDebuff:DebuffId(zoneid, 293670, 1, 6, 6, true)  --Chainblade
PlexusStatusRaidDebuff:DebuffId(zoneid, 300659, 1, 6, 6, true)  --Consuming Slime
PlexusStatusRaidDebuff:DebuffId(zoneid, 300675, 1, 6, 6, true)  --Toxic Fog
PlexusStatusRaidDebuff:DebuffId(zoneid, 295130, 1, 6, 6, true)  --Neutralize Threat
PlexusStatusRaidDebuff:DebuffId(zoneid, 291974, 1, 6, 6, true)  --Obnoxious Monologue
PlexusStatusRaidDebuff:DebuffId(zoneid, 300436, 1, 6, 6, true)  --Grasping Hex
PlexusStatusRaidDebuff:DebuffId(zoneid, 300764, 1, 6, 6, true)  --Slimebolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 297257, 1, 6, 6, true)  --Electrical Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 293724, 1, 6, 6, true)  --Shield Generator
PlexusStatusRaidDebuff:DebuffId(zoneid, 294198, 1, 6, 6, true)  --Stealthy Steam Vent
PlexusStatusRaidDebuff:DebuffId(zoneid, 294195, 1, 6, 6, true)  --Arcing Zap
PlexusStatusRaidDebuff:DebuffId(zoneid, 373552, 1, 6, 6, true) --Hypnosis Bat
PlexusStatusRaidDebuff:DebuffId(zoneid, 373429, 1, 6, 6, true, true) --Carrion Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 373391, 1, 6, 6, true) --Nightmare
PlexusStatusRaidDebuff:DebuffId(zoneid, 373744, 1, 6, 6, true) --Blood Siphon
PlexusStatusRaidDebuff:DebuffId(zoneid, 1215411, 1, 6, 6, true) --Puncture
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217821, 1, 6, 6, true, true) --Fiery Jaws
PlexusStatusRaidDebuff:DebuffId(zoneid, 1216858, 1, 6, 6, true) --Void Pulsar
PlexusStatusRaidDebuff:DebuffId(zoneid, 1215412, 1, 6, 6, true) --Corrosive Gunk

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

--King Gobbamak
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "King Gobbamak")

--Gunker
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Gunker")
PlexusStatusRaidDebuff:DebuffId(zoneid, 298259, 21, 5, 5, true)  --Gooped

--Trixie & Naeno
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Trixie & Naeno")
PlexusStatusRaidDebuff:DebuffId(zoneid, 298669, 31, 5, 5, true)  --Taze
PlexusStatusRaidDebuff:DebuffId(zoneid, 302681, 32, 5, 5, true)  --Mega Taze
PlexusStatusRaidDebuff:DebuffId(zoneid, 298602, 33, 5, 5, true)  --Smoke Cloud

--HK-8 Aerial Oppression Unit
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "HK-8 Aerial Oppression Unit")
PlexusStatusRaidDebuff:DebuffId(zoneid, 295445, 41, 5, 5, true)  --Wreck
PlexusStatusRaidDebuff:DebuffId(zoneid, 302274, 42, 5, 5, true)  --Fulminating Zap
PlexusStatusRaidDebuff:DebuffId(zoneid, 296150, 43, 5, 5, true)  --Vent Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 296279, 44, 5, 5, true)  --Anti-Trespassing Teleport

--Tussle Tonks
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Tussle Tonks")
PlexusStatusRaidDebuff:DebuffId(zoneid, 282943, 51, 5, 5, true)  --Piston Smasher
PlexusStatusRaidDebuff:DebuffId(zoneid, 1216446, 52, 5, 5, true) --Electrical Storm

--K.U.-J.O.
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "K.U.-J.O.")
PlexusStatusRaidDebuff:DebuffId(zoneid, 291972, 61, 5, 5, true)  --Explosive Leap
PlexusStatusRaidDebuff:DebuffId(zoneid, 294929, 62, 5, 5, true)  --Blazing Chomp

--Machinist's Garden
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Machinist's Garden")
PlexusStatusRaidDebuff:DebuffId(zoneid, 285460, 71, 5, 5, true)  --Discom-BOMB-ulator
PlexusStatusRaidDebuff:DebuffId(zoneid, 285443, 72, 5, 5, true)  --\"Hidden\" Flame Cannon

--King Mechagon
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "King Mechagon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 291928, 81, 5, 5, true)  --Giga-Zap
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226680, 82, 5, 5, true) --Cutting Beam
end)

