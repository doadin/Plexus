--local zone = "Tol Dagor"
local zoneid = 974
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

--trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 258313, 1, 6, 6, true)  --Handcuff
PlexusStatusRaidDebuff:DebuffId(zoneid, 258938, 1, 6, 6, true)  --Inner Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 258864, 1, 6, 6, true)  --Suppression Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 185857, 1, 6, 6, true)  --Shoot
PlexusStatusRaidDebuff:DebuffId(zoneid, 224125, 1, 6, 6, true)  --Molten Weapon
PlexusStatusRaidDebuff:DebuffId(zoneid, 258150, 1, 6, 6, true)  --Salt Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 257793, 1, 6, 6, true)  --Smoke Powder
PlexusStatusRaidDebuff:DebuffId(zoneid, 265889, 1, 6, 6, true)  --Torch Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 256105, 1, 6, 6, true)  --Explosive Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 258917, 1, 6, 6, true)  --Righteous Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 258128, 1, 6, 6, true)  --Debilitating Shout
PlexusStatusRaidDebuff:DebuffId(zoneid, 259711, 1, 6, 6, true)  --Lockdown
PlexusStatusRaidDebuff:DebuffId(zoneid, 257777, 1, 6, 6, true)  --Crippling Shiv
PlexusStatusRaidDebuff:DebuffId(zoneid, 272620, 1, 6, 6, true)  --Throw Rock
PlexusStatusRaidDebuff:DebuffId(zoneid, 265271, 1, 6, 6, true) --Sewer Slime
PlexusStatusRaidDebuff:DebuffId(zoneid, 258134, 1, 6, 6, true) --Makeshift Shiv
PlexusStatusRaidDebuff:DebuffId(zoneid, 258058, 1, 6, 6, true) --Squeeze
PlexusStatusRaidDebuff:DebuffId(zoneid, 258079, 1, 6, 6, true) --Massive Chomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 256200, 1, 6, 6, true) --Heartstopper Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 260016, 1, 6, 6, true) --Itchy Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 224729, 1, 6, 6, true) --Bursting Shot

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

--The Sand Queen
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "The Sand Queen")
PlexusStatusRaidDebuff:DebuffId(zoneid, 259975, 11, 6, 6, true)  --Enrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 257119, 12, 6, 6, true)  --Sand Trap
--Jes Howlis
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Jes Howlis")
PlexusStatusRaidDebuff:DebuffId(zoneid, 257785, 21, 6, 6, true)  --Flashing Daggers
PlexusStatusRaidDebuff:DebuffId(zoneid, 257956, 22, 6, 6, true)  --Motivated
PlexusStatusRaidDebuff:DebuffId(zoneid, 257791, 23, 6, 6, true) --Howling Fear
PlexusStatusRaidDebuff:DebuffId(zoneid, 260067, 24, 6, 6, true) --Vicious Mauling
--Knight Captain Valyri
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Knight Captain Valyri")
PlexusStatusRaidDebuff:DebuffId(zoneid, 256710, 31, 6, 6, true)  --Burning Arsenal
PlexusStatusRaidDebuff:DebuffId(zoneid, 257033, 32, 6, 6, true)  --Fuselighter
PlexusStatusRaidDebuff:DebuffId(zoneid, 256976, 33, 6, 6, true)  --Ignition
PlexusStatusRaidDebuff:DebuffId(zoneid, 256955, 34, 6, 6, true)  --Cinderflame
PlexusStatusRaidDebuff:DebuffId(zoneid, 257028, 35, 6, 6, true)  --Fuselighter
--Overseer Korgus
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Overseer Korgus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 256201, 41, 6, 6, true, true)  --Incendiary Rounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 256044, 42, 6, 6, true)  --Deadeye
PlexusStatusRaidDebuff:DebuffId(zoneid, 263345, 43, 6, 6, true)  --Massive Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 256083, 44, 6, 6, true)  --Cross Ignition
end)