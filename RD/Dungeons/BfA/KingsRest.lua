--local zone = "Kings Rest"
local zoneid = 1004
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

PlexusStatusRaidDebuff:DebuffId(zoneid, 270931, 1, 6, 6, true) --Darkshot
PlexusStatusRaidDebuff:DebuffId(zoneid, 267874, 1, 6, 6, true) --Burning Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 274387, 1, 6, 6, true) --Absorbed in Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 270507, 1, 6, 6, true) --Poison Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 269932, 1, 6, 6, true) --Gust Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 277340, 1, 6, 6, true) --Unleashed Power
PlexusStatusRaidDebuff:DebuffId(zoneid, 270292, 1, 6, 6, true) --Purifying Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 267618, 1, 6, 6, true) --Drain Fluids
PlexusStatusRaidDebuff:DebuffId(zoneid, 271564, 1, 6, 6, true) --Embalming Fluid
PlexusStatusRaidDebuff:DebuffId(zoneid, 270499, 1, 6, 6, true) --Frost Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 270865, 1, 6, 6, true) --Hidden Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 268796, 1, 6, 6, true) --Impaling Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 266238, 1, 6, 6, true) --Shattered Defenses
PlexusStatusRaidDebuff:DebuffId(zoneid, 267273, 1, 6, 6, true) --Poison Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 270927, 1, 6, 6, true) --Bladestorm
PlexusStatusRaidDebuff:DebuffId(zoneid, 270868, 1, 6, 6, true) --Lingering Poison
PlexusStatusRaidDebuff:DebuffId(zoneid, 276031, 1, 6, 6, true) --Pit of Despair
PlexusStatusRaidDebuff:DebuffId(zoneid, 266191, 1, 6, 6, true) --Whirling Axe
PlexusStatusRaidDebuff:DebuffId(zoneid, 269369, 1, 6, 6, true) --Deathly Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 267763, 1, 6, 6, true) --Wretched Discharge
PlexusStatusRaidDebuff:DebuffId(zoneid, 270487, 1, 6, 6, true) --Severing Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 240447, 1, 6, 6, true) --Quake
PlexusStatusRaidDebuff:DebuffId(zoneid, 270492, 1, 6, 6, true) --Hex
PlexusStatusRaidDebuff:DebuffId(zoneid, 272388, 1, 6, 6, true) --Shadow Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 270920, 1, 6, 6, true) --Seduction
PlexusStatusRaidDebuff:DebuffId(zoneid, 270289, 1, 6, 6, true) --Purification Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 270003, 1, 6, 6, true) --Suppression Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 277225, 1, 6, 6, true) --Tormented Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 265914, 1, 6, 6, true) --Molten Gold
PlexusStatusRaidDebuff:DebuffId(zoneid, 115804, 1, 6, 6, true) --Mortal Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 270084, 1, 6, 6, true) --Axe Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 269936, 1, 6, 6, true) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 268419, 1, 6, 6, true) --Gale Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 271640, 1, 6, 6, true) --Dark Revelation
PlexusStatusRaidDebuff:DebuffId(zoneid, 277469, 1, 6, 6, true) --Focused Fire

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

--The Golden Serpent
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "The Golden Serpent")
PlexusStatusRaidDebuff:DebuffId(zoneid, 265773, 11, 6, 6, true)  --split gold
--Mchimba the Embalmer
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Mchimba the Embalmer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 267626, 21, 6, 6, true)  --Dessication
PlexusStatusRaidDebuff:DebuffId(zoneid, 267702, 22, 6, 6, true)  --Entomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 267764, 23, 6, 6, true)  --Struggle
--The Council of Tribes
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "The Council of Tribes")
PlexusStatusRaidDebuff:DebuffId(zoneid, 266237, 31, 6, 6, true)  --Debilitating Backhand
PlexusStatusRaidDebuff:DebuffId(zoneid, 266231, 32, 6, 6, true)  --Severing Axe
PlexusStatusRaidDebuff:DebuffId(zoneid, 267257, 33, 6, 6, true)  --Thundering Crash
--Dazar, The First King
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Dazar, The First King")
PlexusStatusRaidDebuff:DebuffId(zoneid, 268586, 41, 6, 6, true)  --Blade Combo
PlexusStatusRaidDebuff:DebuffId(zoneid, 268932, 42, 6, 6, true)  --Quaking Leap
end)