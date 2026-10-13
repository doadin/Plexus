-- local zone = "Blackwing Descent"
local zoneid = 285
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

-- It looks like Grid works by name, not by spell Id
-- So don't need to add all the different spell ids for the different difficulties

-- Trash
--Drakonid Slayer
PlexusStatusRaidDebuff:DebuffId(zoneid, 80390, 1, 6, 5) --Mortal Strike
-- Don't care about Blast Wave, it's just a slow
--Maimgor/Ivoroc
PlexusStatusRaidDebuff:DebuffId(zoneid, 80270, 1, 6, 5) --Shadowflame
PlexusStatusRaidDebuff:DebuffId(zoneid, 80145, 1, 6, 5) --Piercing Grip
--Spirit of Ironstar (spreads to other spirits when you kill Ironstar)
PlexusStatusRaidDebuff:DebuffId(zoneid, 80727, 1, 6, 5, true) --Execution Sentence
--Drakeadon Mongrel
PlexusStatusRaidDebuff:DebuffId(zoneid, 80345, 1, 6, 5) --Corrosive Acid
PlexusStatusRaidDebuff:DebuffId(zoneid, 80329, 1, 6, 5) --Time Lapse
-- Frost Burn is magic and alredy shows up
--Drakonid Drudge
PlexusStatusRaidDebuff:DebuffId(zoneid, 79630, 1, 6, 5) --Drakonid Rush
--Drakonid Chainwielder
PlexusStatusRaidDebuff:DebuffId(zoneid, 79589, 1, 6, 5) --Constricting Chains
PlexusStatusRaidDebuff:DebuffId(zoneid, 79580, 1, 6, 5) --Overhead Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 91910, 1, 7, 6) --Grievous Wound
--Golem Sentry
PlexusStatusRaidDebuff:DebuffId(zoneid, 81060, 1, 6, 5) --Flash Bomb
--Pyrecraw
PlexusStatusRaidDebuff:DebuffId(zoneid, 80127, 1, 4, 4, true, true) --Flame Buffet
--Nefarian
PlexusStatusRaidDebuff:DebuffId(zoneid, 79353, 1, 4, 4, true, true) --Shadow of Cowardice

--Curse of Mending shows up as a Curse (dispellable)
--Stormbolt shows up as Magic (dispellable)
--Burden of the Crown is a buff debuff
PlexusStatusRaidDebuff:DebuffId(zoneid, 80718, 1, 1, 1, false, false, 0, true) --Burden of the Crown
-- Don't show this either
PlexusStatusRaidDebuff:DebuffId(zoneid, 89798, 1, 1, 1, false, false, 0, true) --Master Adventurer Award

--Magmaw
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Magmaw")
PlexusStatusRaidDebuff:DebuffId(zoneid, 89773, 11, 5, 5) --Mangle
PlexusStatusRaidDebuff:DebuffId(zoneid, 78941, 12, 5, 5) --Parasitic Infection
PlexusStatusRaidDebuff:DebuffId(zoneid, 88287, 13, 5, 5) --Massive Crash
PlexusStatusRaidDebuff:DebuffId(zoneid, 78199, 14, 4, 4) --Sweltering Armor

--Omnitron Defense System
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Omnitron Defense System")
PlexusStatusRaidDebuff:DebuffId(zoneid, 79888, 21, 5, 5) --Lightning Conductor
PlexusStatusRaidDebuff:DebuffId(zoneid, 80161, 22, 5, 5) --Chemical Cloud
PlexusStatusRaidDebuff:DebuffId(zoneid, 80011, 23, 5, 5) --Soaked in Poison
PlexusStatusRaidDebuff:DebuffId(zoneid, 79505, 24, 5, 5) --Flamethrower
PlexusStatusRaidDebuff:DebuffId(zoneid, 80094, 25, 5, 5) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 79501, 26, 5, 5) --Acquiring Target
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 92053, 27, 5, 5) --Shadow Conductor
PlexusStatusRaidDebuff:DebuffId(zoneid, 92048, 28, 5, 5) --Shadow Infusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 92023, 29, 6, 6) --Encasing Shadows
-- Power Generator is good, don't need to watch it
PlexusStatusRaidDebuff:DebuffId(zoneid, 79629, 29, 1, 1, false, false, 0, true) --Power Generator
-- Overcharged Power Generator is good, don't need to watch it
PlexusStatusRaidDebuff:DebuffId(zoneid, 91858, 29, 1, 1, false, false, 0, true) --Overcharged Power Generator

--Chimaeron
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Chimaeron")
PlexusStatusRaidDebuff:DebuffId(zoneid, 89084, 31, 8, 8) --Low Health
PlexusStatusRaidDebuff:DebuffId(zoneid, 82890, 32, 5, 5) --Mortality
PlexusStatusRaidDebuff:DebuffId(zoneid, 82935, 33, 6, 6) --Caustic Slime
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 82881, 34, 7, 7, true, true) --Break
PlexusStatusRaidDebuff:DebuffId(zoneid, 91307, 35, 4, 4) --Mocking Shadows
-- Don't care about Finkle's Mixture
PlexusStatusRaidDebuff:DebuffId(zoneid, 82705, 36, 1, 1, false, false, 0, true) --Finkle's Mixture

--Atramedes
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Atramedes")
PlexusStatusRaidDebuff:DebuffId(zoneid, 78092, 41, 7, 7) --Tracking
PlexusStatusRaidDebuff:DebuffId(zoneid, 77982, 42, 4, 4, true, true) --Searing Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 78023, 43, 6, 6) --Roaring Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 78897, 44, 6, 6) --Noisy!
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 92685, 45, 6, 6) --Pestered!

--Maloriak
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Maloriak")
PlexusStatusRaidDebuff:DebuffId(zoneid, 78034, 51, 5, 5, true, true) --Rend 10-normal
PlexusStatusRaidDebuff:DebuffId(zoneid, 78225, 52, 6, 6) --Acid Nova 10-normal
PlexusStatusRaidDebuff:DebuffId(zoneid, 77615, 53, 5, 5) --Debilitating Slime 10-normal/25-normal
PlexusStatusRaidDebuff:DebuffId(zoneid, 77786, 54, 6, 6) --Consuming Flames 10-normal
PlexusStatusRaidDebuff:DebuffId(zoneid, 78617, 55, 6, 6) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 77760, 56, 6, 6) --Biting Chill
PlexusStatusRaidDebuff:DebuffId(zoneid, 77699, 57, 6, 6) --Flash Freeze 10-normal
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 92987, 58, 5, 5) --Dark Sludge 
PlexusStatusRaidDebuff:DebuffId(zoneid, 92982, 59, 7, 7) --Engulfing Darkness

--Nefarian
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Nefarian")
PlexusStatusRaidDebuff:DebuffId(zoneid, 81118, 81, 5, 5, true, true) --Magma 10-normal
PlexusStatusRaidDebuff:DebuffId(zoneid, 77827, 82, 5, 5) --Tail Lash 10-normal
-- Heroic
PlexusStatusRaidDebuff:DebuffId(zoneid, 79339, 83, 6, 6) --Explosive Cinders
PlexusStatusRaidDebuff:DebuffId(zoneid, 79318, 84, 6, 6) --Dominion

