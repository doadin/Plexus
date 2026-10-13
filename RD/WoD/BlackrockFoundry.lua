--local zone = "Blackrock Foundry"
local zoneid = 597
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--zoneid, debuffID, order, icon_priority, colorpriority, timer, stackable, color, defaultdisable, noicon
--true, true is for stackable

-- Trash

-- Slagworks/Black Forge trash
-- Orgron Hauler
PlexusStatusRaidDebuff:DebuffId(zoneid, 175752, 1, 3, 3, true) -- Slag Breath (frontal cone debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 175765, 1, 4, 4, true) -- Overhead Smash (tank debuff)
-- Workshop Guardian
PlexusStatusRaidDebuff:DebuffId(zoneid, 175624, 1, 5, 5, false, true) -- Grievous Mortal Wounds (stacking healing debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 175643, 1, 4, 4) -- Spinning Blade (dot, standing in)
-- Iron Flame Binder
-- Iron Slag-Shaper
PlexusStatusRaidDebuff:DebuffId(zoneid, 175603, 1, 4, 4, true) -- Gripping Slag (AoE dot, root)
-- Ironworker
PlexusStatusRaidDebuff:DebuffId(zoneid, 175668, 1, 3, 3, true) -- Hammer Throw (dam increase)
-- Slagshop Brute
-- Slagshop Worker
PlexusStatusRaidDebuff:DebuffId(zoneid, 175987, 1, 3, 3, true, true) -- Puncture Wound (stacking dot)

-- Oregorger trash (Depository)
-- Darkshard Acidback
PlexusStatusRaidDebuff:DebuffId(zoneid, 159686, 1, 4, 4) -- Acidback Puddle (dot, standing in)
-- Darkshard Gnasher
PlexusStatusRaidDebuff:DebuffId(zoneid, 159632, 1, 5, 5, true) -- Insatiable Hunger (fixate)
PlexusStatusRaidDebuff:DebuffId(zoneid, 159520, 1, 2, 2, true) -- Shattering Charge (stun)
-- Darkshard Crystalback
PlexusStatusRaidDebuff:DebuffId(zoneid, 159939, 1, 3, 3, true, true) -- Acidmaw (stacking debuff)

-- Hans'gar and Franzok trash (Slagmill Press)
-- Blackrock Enforcer
PlexusStatusRaidDebuff:DebuffId(zoneid, 160260, 1, 4, 4) -- Fire Bomb (dot, standing in)
PlexusStatusRaidDebuff:DebuffId(zoneid, 160109, 1, 1, 1, true) -- Intimidation (damage reduction)
-- Blackrock Forge Specialist

-- Beastlord Darmac trash (Breaking Grounds)
-- Iron Assembly Warden
PlexusStatusRaidDebuff:DebuffId(zoneid, 162516, 1, 4, 4, true) -- Whirling Steel (dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162508, 1, 2, 2, true) -- Shield Slam (stun)
-- Iron Marksman
PlexusStatusRaidDebuff:DebuffId(zoneid, 162748, 1, 2, 2, true) -- Scatter Shot (disorient)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162757, 1, 1, 1, true) -- Ice Trap (attack speed/movement debuff)
-- Thunderlord Beast-Tender
PlexusStatusRaidDebuff:DebuffId(zoneid, 162663, 1, 4, 4) -- Electrical Storm (dot, standing in)
-- Ornery Ironhoof
PlexusStatusRaidDebuff:DebuffId(zoneid, 162672, 1, 4, 4, true) -- Goring Swipe (dot)
-- Stubborn Ironhoof
-- Markog Aba'dir

-- Gruul trash
-- Gronnling Labroer
-- Iron Journeyman
-- Karnor the Cruel (mini-boss)
PlexusStatusRaidDebuff:DebuffId(zoneid, 188189, 1, 6, 6, true) -- Fel Poison (dot, dispellable)

-- Burning Font trash
-- Enchanted Armament
-- Iron Flametwister
-- Iron Journeyman (duplicate)
-- Iron Taskmaster
PlexusStatusRaidDebuff:DebuffId(zoneid, 163126, 1, 6, 6, true) -- Bonk (tank disorient)
-- Iron Smith

-- Flamebender Ka'graz trash
-- Mol'dana Two-Blade (mini-boss)
PlexusStatusRaidDebuff:DebuffId(zoneid, 177855, 1, 4, 4, true) -- Ember in the Wind (AoE dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 177891, 1, 2, 2, true, true) -- Rising Flame Kick (tank dot)

-- Operator Thogar trash
-- same trash as during the boss fight, trash is listed under the boss
-- Exhaust vent
PlexusStatusRaidDebuff:DebuffId(zoneid, 174773, 1, 6, 6) -- Exhaust Fumes (dot, standing on)

-- The Blast Furnace trash
-- Slag Behemoth
PlexusStatusRaidDebuff:DebuffId(zoneid, 156345, 1, 6, 6, true) -- Ignite (player explodes)

-- Kromog trash
-- just one pack of Burning Font trash between Flamebender and Kromog

-- The Iron Maidens trash
-- Aquatic Technician
-- Iron Dockworker
-- Iron Earthbinder
-- Iron Mauler
-- Iron Cleaver
PlexusStatusRaidDebuff:DebuffId(zoneid, 171537, 1, 4, 4, true) -- Reaping Whirl (dot)

-- Blackhand trash
-- Flame Jets
PlexusStatusRaidDebuff:DebuffId(zoneid, 175577, 1, 4, 4) -- Flame Jets (dot, standing in)
-- Forgemistress Flamehand
-- Burning is duplicate to Operator Thogar ability
PlexusStatusRaidDebuff:DebuffId(zoneid, 175583, 1, 5, 5, true) -- Living Blaze (AoE dot, dam nearby players)

-- Unknown trash
-- Fungal Spores (debuff that is a buff?)
PlexusStatusRaidDebuff:DebuffId(zoneid, 174704, 1, 1, 1, true, false, 0, true) -- Fungal Spores (disabled)

-- PlexusStatusRaidDebuff versions over 6.11 can handle displaying this debuff
PlexusStatusRaidDebuff:DebuffId(zoneid, 163714, 1, 1, 1, true) -- Exhaustion (root)

-- Bosses

-- Oregorger
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Oregorger")
PlexusStatusRaidDebuff:DebuffId(zoneid, 173471, 11, 5, 5, true) -- Acid Maw (dot, nondispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156297, 12, 6, 6, true) -- Acid Torrent (tank debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156374, 13, 2, 2, true) -- Explosive Shard (stun)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155900, 14, 2, 2, true) -- Rolling Fury (knocked down)
-- Retched Blackrock
PlexusStatusRaidDebuff:DebuffId(zoneid, 156203, 15, 5, 5) -- Retched Blackrock (standing in pool?)

-- Hans'gar and Franzok 
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Hans'gar and Franzok")
-- both have these abilities
PlexusStatusRaidDebuff:DebuffId(zoneid, 157853, 21, 2, 2, true) -- Aftershock (dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156938, 22, 6, 6) -- Crippling Suplex (picked up)
PlexusStatusRaidDebuff:DebuffId(zoneid, 157139, 23, 6, 6, true) -- Shattered Vertebrae (increase dam)
-- Searing Plates
PlexusStatusRaidDebuff:DebuffId(zoneid, 161570, 24, 5, 5) -- Searing Plates (standing on)
-- Grill
PlexusStatusRaidDebuff:DebuffId(zoneid, 155818, 24, 5, 5) -- Scorching Burns (standing on)

-- Beastlord Darmac
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Beastlord Darmac")
-- Phase 1
PlexusStatusRaidDebuff:DebuffId(zoneid, 154960, 31, 6, 6) -- Pinned Down (stun, dot)
-- Cruelfang
PlexusStatusRaidDebuff:DebuffId(zoneid, 155061, 32, 4, 4, true, true) -- Rend and Tear (dot, increase dam, stacks)
-- Dreadwing
PlexusStatusRaidDebuff:DebuffId(zoneid, 154989, 33, 5, 5, true) -- Inferno Breath (dot, dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154981, 34, 6, 6, true) -- Conflagration (AoE dot, dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155030, 35, 4, 4, true, true) -- Seared Flesh (tank dot, stacks)
-- Ironcrusher
PlexusStatusRaidDebuff:DebuffId(zoneid, 155236, 36, 4, 4, true, true) -- Crush Armor (tank stacking debuff)
-- Phase 3
PlexusStatusRaidDebuff:DebuffId(zoneid, 155499, 37, 5, 5, true) -- Superheated Shrapnel (dot, dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155657, 38, 6, 6) -- Flame Infusion (standing in fire)
-- Mythic
-- Faultline
PlexusStatusRaidDebuff:DebuffId(zoneid, 159044, 39, 2, 2, true) -- Epicenter (standing in, movement debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162276, 40, 1, 1, true) -- Unsteady
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 155222, 41, 6, 6) --TANTRUM (not a debuff)

-- Gruul
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Gruul")
PlexusStatusRaidDebuff:DebuffId(zoneid, 155080, 51, 3, 3, true) -- Inferno Slice (dot, nondispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162322, 52, 2, 2, true, true) -- Inferno Strike (tank debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155078, 53, 4, 4, true, true) -- Overwhelming Blows (tank debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 173192, 54, 6, 6) -- Cave In
PlexusStatusRaidDebuff:DebuffId(zoneid, 155323, 55, 5, 5) -- Petrifying Slam (knockback flying)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155330, 56, 5, 5, true, true) -- Petrify (movement, petrify)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155506, 57, 5, 5, true) -- Petrified
-- Mythic
PlexusStatusRaidDebuff:DebuffId(zoneid, 165298, 58, 4, 4, true) -- Flare (debuff, nondispellable)

-- Flamebender Ka'graz
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Flamebender Ka'graz")
PlexusStatusRaidDebuff:DebuffId(zoneid, 155277, 61, 5, 5, true) -- Blazing Radiance (AoE dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 163284, 62, 4, 4, true, true) -- Rising Flames (tank dot, stacks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 154932, 63, 6, 6, true) -- Molten Torrent (split damage)
-- Lava Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 155314, 64, 3, 3) -- Lava Slash (standing in, not high damage)
-- Cinder Wolf
PlexusStatusRaidDebuff:DebuffId(zoneid, 154952, 65, 5, 5, true) -- Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 155074, 66, 3, 3, true, true) -- Charring Breath (stacking debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155049, 67, 4, 4, true, true) -- Singe (dot, dispellable)
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 162293, 68, 5, 5) --EMPOWEREDARMAMENT -- not a debuff
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 155493, 68, 5, 5) --FIRESTORM -- not a debuff
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 163633, 68, 5, 5) --MAGMAMONSOON -- not a debuff

-- Operator Thogar 
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Operator Thogar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 155921, 71, 3, 3, true, true) -- Enkindle (stacking tank dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 165195, 72, 6, 6) -- Prototype Pulse Grenade (standing in)
PlexusStatusRaidDebuff:DebuffId(zoneid, 164380, 73, 5, 5, true, true) -- Burning (stacking dot, dispellable)
-- Iron Raider
PlexusStatusRaidDebuff:DebuffId(zoneid, 155701, 74, 2, 2, true) -- Serrated Slash (dot)
-- Grom'kar Firemender
PlexusStatusRaidDebuff:DebuffId(zoneid, 156310, 75, 4, 4) -- Lava Shock (dot, dispellable)
-- Cauterizing Bolt is an offensive dispel
-- Iron Gunnery Sergeants
PlexusStatusRaidDebuff:DebuffId(zoneid, 159481, 76, 6, 6, true) -- Delayed Siege Bomb (targetted)
-- Iron Crack-Shots
-- Grom'kar Men-at-Arms

-- The Blast Furnace
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "The Blast Furnace")
-- Heart of the Mountain
PlexusStatusRaidDebuff:DebuffId(zoneid, 155240, 81, 3, 3, false, true) -- Tempered (tank debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155242, 82, 4, 4, true, true) -- Heat (stacking tank dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 155225, 83, 5, 5, true) -- Melt (create void zone)
-- Furnace Engineer
PlexusStatusRaidDebuff:DebuffId(zoneid, 155192, 84, 5, 5, true) -- Bomb (carrying the bomb)
-- Foreman Feldspar
PlexusStatusRaidDebuff:DebuffId(zoneid, 156934, 85, 6, 6, true) -- Rupture (create void zone)
PlexusStatusRaidDebuff:DebuffId(zoneid, 158246, 86, 1, 1) -- Hot Blooded (dot from being near)
-- Firecaller
PlexusStatusRaidDebuff:DebuffId(zoneid, 176121, 87, 4, 4, true) -- Volatile Fire (player explodes)
-- Slag Elemental
PlexusStatusRaidDebuff:DebuffId(zoneid, 155196, 88, 4, 4) -- Fixate
-- Slag Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 155743, 89, 6, 6) -- Slag Pool (standing in)
-- Unknown
PlexusStatusRaidDebuff:DebuffId(zoneid, 175104, 90, 6, 6) -- Melt Armor (is this for this boss?)
-- Bellows Operator
-- Security Guard
-- Primal Elementalist

-- Kromog
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Kromog")
PlexusStatusRaidDebuff:DebuffId(zoneid, 157059, 101, 2, 2) -- Rune of Grasping Earth (dot until killed)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156766, 102, 4, 4, true, true) -- Warped Armor (stacking tank debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 161839, 103, 3, 3, true) -- Rune of Crushing Earth (stun, non-dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156844, 104, 6, 6, true) -- Stone Breath (dot, no one in melee)

-- The Iron Maidens
PlexusStatusRaidDebuff:BossNameId(zoneid, 110, "The Iron Maidens")
-- Admiral Gar'an
PlexusStatusRaidDebuff:DebuffId(zoneid, 164271, 111, 6, 6, true) -- Penetraing Shot (target, damage split)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156631, 112, 4, 4, true) -- Rapid Fire (target, damage)
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 159585, 120, 5, 5) --DEPLOYTURRET - not a debuff
-- Enforcer Sorka
PlexusStatusRaidDebuff:DebuffId(zoneid, 158315, 113, 5, 5) -- Dark Hunt (target, teleport to)
PlexusStatusRaidDebuff:DebuffId(zoneid, 170395, 114, 2, 2) -- Sorka's Prey (dam increase)
-- Marak the Blooded
PlexusStatusRaidDebuff:DebuffId(zoneid, 159724, 115, 6, 6, true) -- Blood Ritual (target, cone dam)
PlexusStatusRaidDebuff:DebuffId(zoneid, 170405, 116, 2, 2) -- Marak's  Bloodcalling (dam increase)
PlexusStatusRaidDebuff:DebuffId(zoneid, 158010, 117, 5, 5, true) -- Bloodsoaked Heartseeker (target, bounce damage)
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 156601, 113, 6, 6) --SANGUINESTRIKES -- not a debuff
-- Gorak
PlexusStatusRaidDebuff:DebuffId(zoneid, 158692, 118, 1, 1, true) -- Deadly Throw (movement)
-- Iron Eviscerator
PlexusStatusRaidDebuff:DebuffId(zoneid, 158702, 119, 5, 5, true) -- Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 158686, 120, 3, 3, true) -- Expose Armor (dam increase)
-- Uk'urogg
PlexusStatusRaidDebuff:DebuffId(zoneid, 158683, 121, 6, 6) -- Corrupted Blood (standing in)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156214, 122, 5, 5, false, true) -- Convulsive Shadows (dot dispellable, dam per stack dispelled)
-- Dominator Turret
PlexusStatusRaidDebuff:DebuffId(zoneid, 158601, 123, 3, 3, true, true) -- Dominator Blast (stacking dot, non-dispellable)
-- Mythic
-- Swirling Vortex
PlexusStatusRaidDebuff:DebuffId(zoneid, 160436, 124, 1, 1, true) -- Swirling Vortex (stun)

-- Blackhand
PlexusStatusRaidDebuff:BossNameId(zoneid, 130, "Blackhand")
PlexusStatusRaidDebuff:DebuffId(zoneid, 156096, 131, 6, 6, true) -- Marked for Death (targetted by Impaling Throw)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156743, 132, 4, 4, true, true) -- Impaled (dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156047, 133, 2, 2, true) -- Slagged (dam increase)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156401, 134, 4, 4, true, true) -- Molten Slag (dot, nondispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156404, 135, 3, 3, true, true) -- Burned (stacking debuff)
PlexusStatusRaidDebuff:DebuffId(zoneid, 158054, 136, 5, 5) -- Massive Shattering Smash (tank dot, dam split)
PlexusStatusRaidDebuff:DebuffId(zoneid, 157354, 137, 2, 2, true) -- Broken Bones (tank stun)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156888, 138, 1, 1) -- Overheated (phase 3)
PlexusStatusRaidDebuff:DebuffId(zoneid, 157000, 139, 5, 5, true) -- Attach Slag Bombs (player explodes)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156999, 140, 5, 5, true) -- Throw Slag Bombs (player explodes)
-- Siegemaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 156653, 141, 6, 6, true) -- Fixate
-- Blaze (from Siegemaker)
PlexusStatusRaidDebuff:DebuffId(zoneid, 162490, 142, 5, 5) -- Blaze (standing in)
PlexusStatusRaidDebuff:DebuffId(zoneid, 156604, 143, 3, 3, true) -- Burning (dot from Blaze)
-- Iron Sentry
PlexusStatusRaidDebuff:DebuffId(zoneid, 156772, 144, 3, 3, true, true) -- Incendiary Shot (stacking debuff)
-- Mythic
PlexusStatusRaidDebuff:DebuffId(zoneid, 162498, 145, 6, 6, true, true) -- Burning Cinders (stacking dot, dispellable)

