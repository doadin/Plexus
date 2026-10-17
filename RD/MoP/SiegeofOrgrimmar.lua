--local zone = "Siege of Orgrimmar"
local zoneid = 557
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
--true, true is for stackable

--Trash

-- Gates of Orgrimmar
-- Dragonmaw Bonecrusher
PlexusStatusRaidDebuff:DebuffId(zoneid, 147200, 1, 2, 2) -- Fracture (DoT/Stun)
-- Kor'kron Demolisher
PlexusStatusRaidDebuff:DebuffId(zoneid, 148311, 1, 2, 2) -- Bombard (Knocked down)
-- Lieutenant Krugruk
PlexusStatusRaidDebuff:DebuffId(zoneid, 147683, 1, 2, 2) -- Thunder Clap (Magic)

-- Valley of Strength
-- Mokvar the Treasurer
PlexusStatusRaidDebuff:DebuffId(zoneid, 145553, 1, 2, 2) -- Bribe (Mind Control)
-- Kor'kron Overseer
PlexusStatusRaidDebuff:DebuffId(zoneid, 15708, 1, 2, 2) -- Mortal Strike
-- Kor'kron Shadowmage
PlexusStatusRaidDebuff:DebuffId(zoneid, 145551, 1, 2, 2) -- Shadowflame (Magic)

-- Vault of Y'Shaar
-- Lingering Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 149207, 1, 2, 2) -- Corrupted Touch (Magic, damage when dispelled)

-- Scarred Vale
-- Rook Stonetoe
PlexusStatusRaidDebuff:DebuffId(zoneid, 144396, 1, 2, 2) -- Vengeful Strikes (DoT/Stun)

-- The Menagerie
--  Enraged Mushan Beast
PlexusStatusRaidDebuff:DebuffId(zoneid, 148136, 1, 2, 2) -- Lacerating Bite

-- Immerseus
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Immerseus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 143297, 11, 5, 5) --Sha Splash
PlexusStatusRaidDebuff:DebuffId(zoneid, 143459, 12, 4, 4, true, true) --Sha Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 143524, 13, 4, 4, true, true) --Purified Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 143286, 14, 4, 4) --Seeping Sha
PlexusStatusRaidDebuff:DebuffId(zoneid, 143413, 15, 3, 3) --Swirl
PlexusStatusRaidDebuff:DebuffId(zoneid, 143411, 16, 3, 3) --Swirl
PlexusStatusRaidDebuff:DebuffId(zoneid, 143436, 17, 2, 2, true, true) --Corrosive Blast (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143579, 18, 3, 3, true, true) --Sha Corruption (Heroic Only)

-- Fallen Protectors
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Fallen Protectors")
PlexusStatusRaidDebuff:DebuffId(zoneid, 143239, 21, 4, 4) --Noxious Poison
PlexusStatusRaidDebuff:DebuffId(zoneid, 144176, 22, 2, 2, true, true) --Lingering Anguish
PlexusStatusRaidDebuff:DebuffId(zoneid, 143023, 23, 3, 3) --Corrupted Brew
PlexusStatusRaidDebuff:DebuffId(zoneid, 143301, 24, 2, 2) --Gouge
PlexusStatusRaidDebuff:DebuffId(zoneid, 143564, 25, 3, 3) --Meditative Field
PlexusStatusRaidDebuff:DebuffId(zoneid, 143010, 26, 3, 3) --Corruptive Kick
PlexusStatusRaidDebuff:DebuffId(zoneid, 143434, 27, 6, 6) --Shadow Word:Bane (Dispell)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143840, 28, 6, 6) --Mark of Anguish
PlexusStatusRaidDebuff:DebuffId(zoneid, 143959, 29, 4, 4) --Defiled Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 143423, 30, 6, 6) --Sha Sear
PlexusStatusRaidDebuff:DebuffId(zoneid, 143292, 31, 5, 5) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 144176, 32, 5, 5, true, true) --Shadow Weakness
PlexusStatusRaidDebuff:DebuffId(zoneid, 147383, 33, 4, 4) --Debilitation (Heroic Only)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143198, 34, 2, 2) --Garrote

-- Norushen
PlexusStatusRaidDebuff:BossNameId(zoneid, 35, "Norushen")
PlexusStatusRaidDebuff:DebuffId(zoneid, 146124, 36, 2, 2, true, true) --Self Doubt (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 146324, 37, 4, 4, true, true) --Jealousy
PlexusStatusRaidDebuff:DebuffId(zoneid, 144639, 38, 6, 6) --Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 144850, 39, 5, 5) --Test of Reliance
PlexusStatusRaidDebuff:DebuffId(zoneid, 145861, 40, 6, 6) --Self-Absorbed (Dispell)
PlexusStatusRaidDebuff:DebuffId(zoneid, 144851, 41, 2, 2) --Test of Confiidence (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 146703, 42, 3, 3) --Bottomless Pit
PlexusStatusRaidDebuff:DebuffId(zoneid, 144514, 43, 6, 6) --Lingering Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 144849, 44, 4, 4) --Test of Serenity
PlexusStatusRaidDebuff:DebuffId(zoneid, 145725, 45, 3, 3) --Despair

-- Sha of Pride
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Sha of Pride")
PlexusStatusRaidDebuff:DebuffId(zoneid, 144358, 51, 2, 2) --Wounded Pride (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 144843, 52, 3, 3) --Overcome
PlexusStatusRaidDebuff:DebuffId(zoneid, 146594, 53, 4, 4) --Gift of the Titans
PlexusStatusRaidDebuff:DebuffId(zoneid, 144351, 54, 6, 6, true, true) --Mark of Arrogance
PlexusStatusRaidDebuff:DebuffId(zoneid, 144364, 55, 4, 4) --Power of the Titans
PlexusStatusRaidDebuff:DebuffId(zoneid, 146822, 56, 6, 6) --Projection
PlexusStatusRaidDebuff:DebuffId(zoneid, 146817, 57, 5, 5) --Aura of Pride
PlexusStatusRaidDebuff:DebuffId(zoneid, 144774, 58, 2, 2) --Reaching Attacks (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 144636, 59, 5, 5) --Corrupted Prison
PlexusStatusRaidDebuff:DebuffId(zoneid, 144574, 60, 6, 6) --Corrupted Prison
PlexusStatusRaidDebuff:DebuffId(zoneid, 145215, 61, 4, 4) --Banishment (Heroic)
PlexusStatusRaidDebuff:DebuffId(zoneid, 147207, 62, 4, 4) --Weakened Resolve (Heroic)
PlexusStatusRaidDebuff:DebuffId(zoneid, 144574, 60, 6, 6) --Corrupted Prison
PlexusStatusRaidDebuff:DebuffId(zoneid, 144574, 60, 6, 6) --Corrupted Prison


-- Galakras
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Galakras")
PlexusStatusRaidDebuff:DebuffId(zoneid, 146765, 71, 5, 5) --Flame Arrows
PlexusStatusRaidDebuff:DebuffId(zoneid, 147705, 72, 5, 5) --Poison Cloud
PlexusStatusRaidDebuff:DebuffId(zoneid, 146902, 73, 2, 2) --Poison Tipped blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 147068, 74, 2, 2) --Flames of Galakrond

-- Iron Juggernaut
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Iron Juggernaut")
PlexusStatusRaidDebuff:DebuffId(zoneid, 144467, 81, 2, 2, true, true) --Ignite Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 144459, 82, 5, 5) --Laser Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 144498, 83, 5, 5) --Napalm Oil
PlexusStatusRaidDebuff:DebuffId(zoneid, 144918, 84, 5, 5) --Cutter Laser
PlexusStatusRaidDebuff:DebuffId(zoneid, 146325, 84, 6, 6) --Cutter Laser Target

-- Kor'kron Dark Shaman
PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "Kor'kron Dark Shaman")
PlexusStatusRaidDebuff:DebuffId(zoneid, 144089, 91, 6, 6) --Toxic Mist
PlexusStatusRaidDebuff:DebuffId(zoneid, 144215, 92, 2, 2) --Froststorm Strike (Tank only)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143990, 93, 2, 2) --Foul Geyser (Tank only)
PlexusStatusRaidDebuff:DebuffId(zoneid, 144304, 94, 2, 2) --Rend
PlexusStatusRaidDebuff:DebuffId(zoneid, 144330, 95, 6, 6) --Iron Prison (Heroic)

-- General Nazgrim
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "General Nazgrim")
PlexusStatusRaidDebuff:DebuffId(zoneid, 143638, 101, 6, 6) --Bonecracker
PlexusStatusRaidDebuff:DebuffId(zoneid, 143480, 102, 5, 5) --Assassin's Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 143431, 103, 6, 6) --Magistrike (Dispell)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143494, 104, 2, 2, true, true) --Sundering Blow (Tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143882, 105, 5, 5) --Hunter's Mark

-- Malkorok
PlexusStatusRaidDebuff:BossNameId(zoneid, 110, "Malkorok")
PlexusStatusRaidDebuff:DebuffId(zoneid, 142990, 111, 6, 6, true, true) --Fatal Strike (Tank debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 142913, 112, 5, 5) --Displaced Energy (Dispell)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143919, 113, 3, 3) --Languish (Heroic)
PlexusStatusRaidDebuff:DebuffId(zoneid, 142861, 114, 2, 2) --Ancient Miasma
PlexusStatusRaidDebuff:DebuffId(zoneid, 142863, 115, 4, 4) --Weak Ancient Barrier - Red
PlexusStatusRaidDebuff:DebuffId(zoneid, 142864, 116, 4, 4) --Ancient Barrier - Orange
PlexusStatusRaidDebuff:DebuffId(zoneid, 142865, 117, 4, 4) --Strong Ancient Barrier - Green

-- Spoils of Pandaria
PlexusStatusRaidDebuff:BossNameId(zoneid, 120, "Spoils of Pandaria")
PlexusStatusRaidDebuff:DebuffId(zoneid, 145685, 121, 2, 2) --Unstable Defensive System
PlexusStatusRaidDebuff:DebuffId(zoneid, 144853, 122, 3, 3, true, true) --Carnivorous Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 145987, 123, 5, 5) --Set to Blow
PlexusStatusRaidDebuff:DebuffId(zoneid, 145218, 124, 4, 4, true, true) --Harden Flesh
PlexusStatusRaidDebuff:DebuffId(zoneid, 145230, 125, 1, 1) --Forbidden Magic
PlexusStatusRaidDebuff:DebuffId(zoneid, 146217, 126, 4, 4) --Keg Toss
PlexusStatusRaidDebuff:DebuffId(zoneid, 146235, 127, 4, 4) --Breath of Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 145523, 128, 4, 4) --Animated Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 142983, 129, 6, 6) --Torment (the new Wrack)
PlexusStatusRaidDebuff:DebuffId(zoneid, 145715, 130, 3, 3) --Blazing Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 145747, 131, 5, 5) --Bubbling Amber
PlexusStatusRaidDebuff:DebuffId(zoneid, 146289, 132, 4, 4) --Mass Paralysis

-- Thok the Bloodthirsty
PlexusStatusRaidDebuff:BossNameId(zoneid, 140, "Thok the Bloodthirsty")
PlexusStatusRaidDebuff:DebuffId(zoneid, 143766, 141, 2, 2, true, true) --Panic (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143773, 142, 2, 2, true, true) --Freezing Breath (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143452, 143, 1, 1) --Bloodied
PlexusStatusRaidDebuff:DebuffId(zoneid, 146589, 144, 5, 5) --Skeleton Key (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143445, 145, 6, 6) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 143791, 146, 5, 5) --Corrosive Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 143777, 147, 3, 3) --Frozen Solid (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143780, 148, 4, 4, true, true) --Acid Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 143800, 149, 5, 5, true, true) --Icy Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 143428, 150, 4, 4) --Tail Lash
PlexusStatusRaidDebuff:DebuffId(zoneid, 143784, 151, 2, 2) --Burning Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 143767, 152, 1, 1) --Scorching Breath
-- This is good, don't need to show it
PlexusStatusRaidDebuff:DebuffId(zoneid, 144115, 153, 1, 1, false, false, 0, true) --Flame Coating

-- Siegecrafter Blackfuse
PlexusStatusRaidDebuff:BossNameId(zoneid, 160, "Siegecrafter Blackfuse")
PlexusStatusRaidDebuff:DebuffId(zoneid, 144236, 161, 4, 4) --Pattern Recognition
PlexusStatusRaidDebuff:DebuffId(zoneid, 144466, 162, 5, 5) --Magnetic Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 143385, 163, 2, 2, true, true) --Electrostatic Charge (tank)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143856, 164, 6, 6, true, true) --Superheated

-- Paragons of the Klaxxi
PlexusStatusRaidDebuff:BossNameId(zoneid, 170, "Paragons of the Klaxxi")
PlexusStatusRaidDebuff:DebuffId(zoneid, 143617, 171, 5, 5, true, true) --Blue Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 143701, 172, 5, 5) --Whirling (stun)
PlexusStatusRaidDebuff:DebuffId(zoneid, 143702, 173, 5, 5) --Whirling
PlexusStatusRaidDebuff:DebuffId(zoneid, 142808, 174, 6, 6) --Fiery Edge
PlexusStatusRaidDebuff:DebuffId(zoneid, 143609, 175, 5, 5, true, true) --Yellow Sword
PlexusStatusRaidDebuff:DebuffId(zoneid, 143610, 176, 5, 5, true, true) --Red Drum
PlexusStatusRaidDebuff:DebuffId(zoneid, 142931, 177, 2, 2, true, true) --Exposed Veins
PlexusStatusRaidDebuff:DebuffId(zoneid, 143619, 178, 5, 5, true, true) --Yellow Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 143735, 179, 6, 6) --Caustic Amber
PlexusStatusRaidDebuff:DebuffId(zoneid, 146452, 180, 5, 5) --Resonating Amber
PlexusStatusRaidDebuff:DebuffId(zoneid, 142929, 181, 2, 2, true, true) --Tenderizing Strikes
PlexusStatusRaidDebuff:DebuffId(zoneid, 142797, 182, 5, 5) --Noxious Vapors
PlexusStatusRaidDebuff:DebuffId(zoneid, 143939, 183, 5, 5) --Gouge
PlexusStatusRaidDebuff:DebuffId(zoneid, 143275, 184, 2, 2, true, true) --Hewn
PlexusStatusRaidDebuff:DebuffId(zoneid, 143768, 185, 2, 2) --Sonic Projection
PlexusStatusRaidDebuff:DebuffId(zoneid, 142532, 186, 6, 6) --Toxin: Blue
PlexusStatusRaidDebuff:DebuffId(zoneid, 142534, 187, 6, 6) --Toxin: Yellow
PlexusStatusRaidDebuff:DebuffId(zoneid, 143279, 188, 2, 2, true, true) --Genetic Alteration
PlexusStatusRaidDebuff:DebuffId(zoneid, 143339, 189, 6, 6, true, true) --Injection
PlexusStatusRaidDebuff:DebuffId(zoneid, 142649, 190, 4, 4) --Devour
PlexusStatusRaidDebuff:DebuffId(zoneid, 146556, 191, 6, 6) --Pierce
PlexusStatusRaidDebuff:DebuffId(zoneid, 142671, 192, 6, 6) --Mesmerize
PlexusStatusRaidDebuff:DebuffId(zoneid, 143979, 193, 2, 2, true, true) --Vicious Assault
PlexusStatusRaidDebuff:DebuffId(zoneid, 143607, 194, 5, 5, true, true) --Blue Sword
PlexusStatusRaidDebuff:DebuffId(zoneid, 143614, 195, 5, 5, true, true) --Yellow Drum
PlexusStatusRaidDebuff:DebuffId(zoneid, 143612, 196, 5, 5, true, true) --Blue Drum
PlexusStatusRaidDebuff:DebuffId(zoneid, 142533, 197, 6, 6) --Toxin: Red
PlexusStatusRaidDebuff:DebuffId(zoneid, 143615, 198, 5, 5, true, true) --Red Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 143974, 199, 2, 2) --Shield Bash (tanks)

-- Garrosh Hellscream
PlexusStatusRaidDebuff:BossNameId(zoneid, 210, "Garrosh Hellscream")
PlexusStatusRaidDebuff:DebuffId(zoneid, 144582, 211, 4, 4) --Hamstring
PlexusStatusRaidDebuff:DebuffId(zoneid, 144954, 212, 4, 4) --Realm of Y'Shaarj
PlexusStatusRaidDebuff:DebuffId(zoneid, 145183, 213, 2, 2, true, true) --Gripping Despair (tanks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 144762, 214, 4, 4) --Desecrated
PlexusStatusRaidDebuff:DebuffId(zoneid, 145071, 215, 5, 5) --Touch of Y'Sharrj
PlexusStatusRaidDebuff:DebuffId(zoneid, 148718, 216, 4, 4) --Fire Pit
end)
