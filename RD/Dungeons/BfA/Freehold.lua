--local zone = "Freehold"
local zoneid = 936
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

PlexusStatusRaidDebuff:DebuffId(zoneid, 257460, 1, 6, 6, true) --Fiery Debris
PlexusStatusRaidDebuff:DebuffId(zoneid, 272374, 1, 6, 6, true) --Whirlpool of Blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 276061, 1, 6, 6, true) --Boulder Throw
PlexusStatusRaidDebuff:DebuffId(zoneid, 281420, 1, 6, 6, true) --Water Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 257274, 1, 6, 6, true) --Vile Coating
PlexusStatusRaidDebuff:DebuffId(zoneid, 257437, 1, 6, 6, true) --Poisoning Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 257314, 1, 6, 6, true) --Black Powder Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 257478, 1, 6, 6, true) --Crippling Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 281329, 1, 6, 6, true) --Trade Wind's Vigor
PlexusStatusRaidDebuff:DebuffId(zoneid, 274400, 1, 6, 6, true) --Duelist Dash
PlexusStatusRaidDebuff:DebuffId(zoneid, 257308, 1, 6, 6, true) --Flaming Shrapnel
PlexusStatusRaidDebuff:DebuffId(zoneid, 257871, 1, 6, 6, true) --Blade Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 257908, 1, 6, 6, true) --Oiled Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 256363, 1, 6, 6, true) --Ripper Punch
PlexusStatusRaidDebuff:DebuffId(zoneid, 257949, 1, 6, 6, true) --Slippery
PlexusStatusRaidDebuff:DebuffId(zoneid, 274507, 1, 6, 6, true) --Slippery Suds
PlexusStatusRaidDebuff:DebuffId(zoneid, 258875, 1, 6, 6, true) --Blackout Barrel
PlexusStatusRaidDebuff:DebuffId(zoneid, 268440, 1, 6, 6, true) --Shoot
PlexusStatusRaidDebuff:DebuffId(zoneid, 256594, 1, 6, 6, true) --Barrel Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 257775, 1, 6, 6, true) --Plague Step
PlexusStatusRaidDebuff:DebuffId(zoneid, 258199, 1, 6, 6, true) --Ground Shatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 257739, 1, 6, 6, true) --Blind Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 257747, 1, 6, 6, true) --Earth Shaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 257784, 1, 6, 6, true) --Frost Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 257732, 1, 6, 6, true) --Shattering Bellow
PlexusStatusRaidDebuff:DebuffId(zoneid, 258352, 1, 6, 6, true) --Grapeshot
PlexusStatusRaidDebuff:DebuffId(zoneid, 258323, 1, 6, 6, true) --Infected Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 257426, 1, 6, 6, true) --Brutal Backhand
PlexusStatusRaidDebuff:DebuffId(zoneid, 257757, 1, 6, 6, true) --Goin' Bananas
PlexusStatusRaidDebuff:DebuffId(zoneid, 267523, 1, 6, 6, true) --Cutting Surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 274389, 1, 6, 6, true) --Rat Traps
PlexusStatusRaidDebuff:DebuffId(zoneid, 258779, 1, 6, 6, true) --Sea Spout
PlexusStatusRaidDebuff:DebuffId(zoneid, 265056, 1, 6, 6, true) --Invigorating Freehold Brew
PlexusStatusRaidDebuff:DebuffId(zoneid, 272197, 1, 6, 6, true) --Shadow Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 265799, 1, 6, 6, true) --Electrical Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 265085, 1, 6, 6, true) --Confidence-Boosting Freehold Brew
PlexusStatusRaidDebuff:DebuffId(zoneid, 113746, 1, 6, 6, true) --Mystic Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 268283, 1, 6, 6, true) --Obscured Vision
PlexusStatusRaidDebuff:DebuffId(zoneid, 272554, 1, 6, 6, true) --Bloody Mess
PlexusStatusRaidDebuff:DebuffId(zoneid, 265681, 1, 6, 6, true) --Drowning Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 278467, 1, 6, 6, true) --Caustic Freehold Brew
PlexusStatusRaidDebuff:DebuffId(zoneid, 274555, 1, 6, 6, true) --Scabrous Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 34914, 1, 6, 6, true) --Vampiric Touch
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

--Skycap'n Kragg
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Skycap'n Kragg")
PlexusStatusRaidDebuff:DebuffId(zoneid, 256106, 11, 6, 6, true) --Azerite Powder Shot
--Council o'Captains
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Council o'Captains")
PlexusStatusRaidDebuff:DebuffId(zoneid, 265979, 21, 6, 6, true) --Powder Shot
--Ring of Booty
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Ring of Booty")
PlexusStatusRaidDebuff:DebuffId(zoneid, 256706, 31, 6, 6, true) --Rearm
PlexusStatusRaidDebuff:DebuffId(zoneid, 256552, 32, 6, 6, true) --Flailing Shark
--Harlan Sweete
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Harlan Sweete")
PlexusStatusRaidDebuff:DebuffId(zoneid, 257305, 41, 6, 6, true) --Cannon Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 413131, 42, 6, 6, true) --Whirling Dagger
end)