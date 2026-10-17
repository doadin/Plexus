--local zone = "Heart of Fear"
local zoneid = 474
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

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash

-- Imperial Vizier Zor'lok trash
-- Sra'thik Shield Master
PlexusStatusRaidDebuff:DebuffId(zoneid, 123417, 1, 1, 1, true, true) --Dismantled Armor (armor)
-- Kor'thik Slicer
PlexusStatusRaidDebuff:DebuffId(zoneid, 123422, 1, 1, 1) -- Arterial Bleeding (dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 123434, 1, 2, 2) -- Gouge Throat (silence)
-- Set'thik Swiftblade
PlexusStatusRaidDebuff:DebuffId(zoneid, 123436, 1, 1, 1) -- Riposte (disarm)
-- Set'thik Fanatic
PlexusStatusRaidDebuff:DebuffId(zoneid, 123497, 1, 1, 1) -- Gale Force Winds (slows casting)

-- Blade Lord Ta'yak trash
-- Instructor Kli'thak
PlexusStatusRaidDebuff:DebuffId(zoneid, 123180, 2, 1, 1) --Wind Step (dot)
-- Sra'thik Shield Master
PlexusStatusRaidDebuff:DebuffId(zoneid, 123420, 2, 2, 2) --Stunning Strike (stun)

-- Amber-Shaper trash
-- Amber-Ridden Mushan
PlexusStatusRaidDebuff:DebuffId(zoneid, 125081, 5, 1, 1) --Slam (stun)
-- Amber Searsting
PlexusStatusRaidDebuff:DebuffId(zoneid, 125490, 5, 1, 1) --Burning Sting (dot)
-- Kor'thik Fleshrender
PlexusStatusRaidDebuff:DebuffId(zoneid, 126901, 5, 2, 2, true, true) --Mortal Rend (tank, stackable healing debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 126912, 5, 6, 6) --Grievous Whirl (dot removed when target healed to 90%)

-- Grand Empress Trash
-- Kor'thik Warsinger
PlexusStatusRaidDebuff:DebuffId(zoneid, 125907, 6, 1, 1) --Cry Havoc

--Imperial Vizier Zor'lok
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Imperial Vizier Zor'lok")
PlexusStatusRaidDebuff:DebuffId(zoneid, 122761, 11, 4, 4) --Exhale
PlexusStatusRaidDebuff:DebuffId(zoneid, 123812, 12, 1, 1) --Pheromones of Zeal
PlexusStatusRaidDebuff:DebuffId(zoneid, 122740, 13, 6, 6) --Convert (MC)
PlexusStatusRaidDebuff:DebuffId(zoneid, 122706, 14, 3, 3) --Noise Cancelling (AMZ)

--Blade Lord Ta'yak
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Blade Lord Ta'yak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 123474, 21, 1, 1, true, true) --Overwhelming Assault (tank stacks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 122949, 22, 6, 6) --Unseen Strike (group up on target)
PlexusStatusRaidDebuff:DebuffId(zoneid, 124783, 23, 4, 4) --Storm Unleashed
PlexusStatusRaidDebuff:DebuffId(zoneid, 123180, 24, 5, 5) --Windstep
--PlexusStatusRaidDebuff:DebuffId(zoneid, 123600, 24, 5, 5) --Storm Unleashed?

--Garalon
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Garalon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 122835, 31, 5, 5) --Pheromones (fixate/dot/passable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 123081, 32, 6, 6, true, true) --Pungency (Pheromones stacks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 122774, 33, 2, 2) --Crush (knocked down)
PlexusStatusRaidDebuff:DebuffId(zoneid, 123423, 34, 1, 1) --Weak Points (damage increase)
--PlexusStatusRaidDebuff:DebuffId(zoneid, 123120, 33, 4, 4) --Pheromone Trail

--Wind Lord Mel'jarak
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Wind Lord Mel'jarak")
-- Sra-thik Amber-Trappers
PlexusStatusRaidDebuff:DebuffId(zoneid, 121881, 41, 6, 6) --Amber Prison
PlexusStatusRaidDebuff:DebuffId(zoneid, 122055, 42, 1, 1) --Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 122064, 43, 3, 3, true, true) --Corrosive Resin
-- Kor'thik Elite Blademaster
PlexusStatusRaidDebuff:DebuffId(zoneid, 123963, 44, 7, 7) --Kor'thik Strike

--Amber-Shaper Un'sok
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Amber-Shaper Un'sok")
PlexusStatusRaidDebuff:DebuffId(zoneid, 121949, 51, 6, 6) --Parasitic Growth
PlexusStatusRaidDebuff:DebuffId(zoneid, 122784, 52, 3, 3) --Reshape Life
--PlexusStatusRaidDebuff:DebuffId(zoneid, 122504, 54, 5, 5) --Burning Amber (not a debuff)

--Grand Empress Shek'zeer
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Grand Empress Shek'zeer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 123707, 61, 5, 5, true, true) --Eyes of the Empress (tank stacks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 125390, 62, 6, 6) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 123788, 63, 5, 5) --Cry of Terror (debuff that causes AoE)
PlexusStatusRaidDebuff:DebuffId(zoneid, 124097, 64, 4, 4) --Sticky Resin
PlexusStatusRaidDebuff:DebuffId(zoneid, 123184, 65, 7, 7) --Dissonance Field (unhealable)
--PlexusStatusRaidDebuff:DebuffId(zoneid, 125824, 65, 3, 3) --Trapped!
PlexusStatusRaidDebuff:DebuffId(zoneid, 124777, 66, 4, 4) --Poison Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 124821, 67, 3, 3) --Poison-Drenched Armor
--PlexusStatusRaidDebuff:DebuffId(zoneid, 124827, 68, 1, 1) --Poison Fumes Is actually a buff
PlexusStatusRaidDebuff:DebuffId(zoneid, 124849, 69, 6, 6) --Consuming Terror (fear, dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 124863, 70, 6, 6) --Visions of Demise (fear/AoE, dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 124862, 71, 5, 5) --Visions of Demise: Target
PlexusStatusRaidDebuff:DebuffId(zoneid, 123845, 72, 5, 5) --Heart of Fear: Chosen
PlexusStatusRaidDebuff:DebuffId(zoneid, 123846, 73, 5, 5) --Heart of Fear: Lure
PlexusStatusRaidDebuff:DebuffId(zoneid, 125283, 74, 1, 1) --Sha Corruption
end)
