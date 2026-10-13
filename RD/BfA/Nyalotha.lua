-- local zone = "Ny'alotha"
local zoneid = 1581
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 1, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 316959, 1, 5, 5, true) --Devouring Acid
PlexusStatusRaidDebuff:DebuffId(zoneid, 311019, 1, 5, 5, true) --Weakening Blow
PlexusStatusRaidDebuff:DebuffId(zoneid, 317149, 1, 5, 5, true) --Gastric Fluids
PlexusStatusRaidDebuff:DebuffId(zoneid, 311122, 1, 5, 5, true) --Jagged Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 313977, 1, 5, 5, true) --Curse of the Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 314905, 1, 5, 5, true, true) --Shadow Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 311508, 1, 5, 5, true) --Clot Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 307044, 1, 5, 5, true) --Nightmare Antibody
PlexusStatusRaidDebuff:DebuffId(zoneid, 313951, 1, 5, 5, true, true) --Reaping Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 318788, 1, 5, 5, true) --Corrupted Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 310830, 1, 4, 4, true) --Disorienting Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 314850, 1, 5, 5, true) --Expanding Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 318409, 1, 6, 6, true) --Discordant Whispers
PlexusStatusRaidDebuff:DebuffId(zoneid, 311116, 1, 6, 6, true) --Reverberating Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 314847, 1, 6, 6, true, true) --Decapitate
PlexusStatusRaidDebuff:DebuffId(zoneid, 314430, 1, 5, 5, true) --Lingering Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 316677, 1, 5, 5, true) --Germinating Parasite
PlexusStatusRaidDebuff:DebuffId(zoneid, 316506, 1, 5, 5, true) --Heartpiercer Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 311182, 1, 5, 5, true) --Void Shear
PlexusStatusRaidDebuff:DebuffId(zoneid, 281721, 1, 5, 5, true, true) --Vile Bile
PlexusStatusRaidDebuff:DebuffId(zoneid, 316951, 1, 5, 5, true) --Voracious Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 311552, 1, 5, 5, true) --Fear the Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 315932, 1, 5, 5, true) --Brutal Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 313938, 1, 5, 5, true) --Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 307019, 1, 5, 5, true) --Void Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 311041, 1, 5, 5, true) --Drive to Madness
PlexusStatusRaidDebuff:DebuffId(zoneid, 309704, 1, 5, 5, true) --Caustic Coating
PlexusStatusRaidDebuff:DebuffId(zoneid, 315013, 1, 5, 5, true) --Bursting Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 307359, 1, 5, 5, true) --Despair
PlexusStatusRaidDebuff:DebuffId(zoneid, 311097, 1, 5, 5, true) --Condensing Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 315000, 1, 5, 5, true) --Shadow Chisel
PlexusStatusRaidDebuff:DebuffId(zoneid, 298514, 1, 5, 5, true) --Aqiri Mind Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 307020, 1, 5, 5, true) --Twilight Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 306981, 1, 5, 5, true) --Gift of the Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 315311, 1, 5, 5, true) --Ravage
PlexusStatusRaidDebuff:DebuffId(zoneid, 314347, 1, 5, 5, true) --Noxious Choke   
PlexusStatusRaidDebuff:DebuffId(zoneid, 314188, 1, 5, 5, true) --Mind Flay      
PlexusStatusRaidDebuff:DebuffId(zoneid, 313672, 1, 5, 5, true) --Acid Pool       
PlexusStatusRaidDebuff:DebuffId(zoneid, 307053, 1, 5, 5, true) --Lava Pools     
PlexusStatusRaidDebuff:DebuffId(zoneid, 314451, 1, 5, 5, true) --Leeching Bite   
PlexusStatusRaidDebuff:DebuffId(zoneid, 313460, 1, 5, 5, true) --Nullification    
PlexusStatusRaidDebuff:DebuffId(zoneid, 311362, 1, 5, 5, true) --Rising Heat     
PlexusStatusRaidDebuff:DebuffId(zoneid, 314593, 1, 5, 5, true) --Mind-Numbing Toxin

-- Wrathion
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Wrathion")
PlexusStatusRaidDebuff:DebuffId(zoneid, 306015, 11, 5, 5, true, true) --Searing Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 12, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 318391, 13, 5, 5, true) --Great Worm's Foul Stench
PlexusStatusRaidDebuff:DebuffId(zoneid, 306163, 14, 5, 5, true) --Incineration
PlexusStatusRaidDebuff:DebuffId(zoneid, 313959, 15, 5, 5, true) --Scorching Blister
PlexusStatusRaidDebuff:DebuffId(zoneid, 307013, 16, 5, 5, true, true) --Burning Madness

-- Maut
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Maut")
PlexusStatusRaidDebuff:DebuffId(zoneid, 307399, 21, 5, 5, true, true) --Shadow Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 22, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 310611, 23, 5, 5, true) --Forbidden Mana
PlexusStatusRaidDebuff:DebuffId(zoneid, 307586, 24, 5, 5, true) --Devoured Abyss
PlexusStatusRaidDebuff:DebuffId(zoneid, 307806, 25, 5, 5, true) --Devour Magic
PlexusStatusRaidDebuff:DebuffId(zoneid, 308158, 26, 5, 5, true) --Consuming Shadows

-- Prophet Skitra
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Prophet Skitra")
PlexusStatusRaidDebuff:DebuffId(zoneid, 308059, 31, 5, 5, true, true) --Shadow Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 32, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 307785, 33, 5, 5, true) --Twisted Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 307784, 34, 5, 5, true) --Clouded Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 309652, 35, 5, 5, true) --Illusionary Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 309657, 36, 5, 5, true, true) --Dark Ritual
PlexusStatusRaidDebuff:DebuffId(zoneid, 307950, 36, 5, 5, true) --Shred Psyche

-- Shad'har the Insatiable
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Shad'har the Insatiable")
PlexusStatusRaidDebuff:DebuffId(zoneid, 312590, 41, 5, 5, true) --Bitten Hand
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 42, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 306934, 43, 5, 5, true) --Entropic Mantle
PlexusStatusRaidDebuff:DebuffId(zoneid, 307358, 44, 5, 5, true) --Debilitating Spit
PlexusStatusRaidDebuff:DebuffId(zoneid, 307471, 45, 5, 5, true) --Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 307472, 46, 5, 5, true, true) --Dissolve
PlexusStatusRaidDebuff:DebuffId(zoneid, 306932, 47, 5, 5, true) --Noxious Mantle
PlexusStatusRaidDebuff:DebuffId(zoneid, 318078, 48, 5, 5, true) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 308177, 49, 5, 5, true) --Entropic Buildup
PlexusStatusRaidDebuff:DebuffId(zoneid, 306448, 50, 5, 5, true) --Umbral Mantle
PlexusStatusRaidDebuff:DebuffId(zoneid, 306930, 51, 5, 5, true) --Entropic Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 309704, 52, 5, 5, true) --Caustic Coating
PlexusStatusRaidDebuff:DebuffId(zoneid, 306928, 53, 5, 5, true) --Umbral Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 306929, 54, 5, 5, true) --Bubbling Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 314736, 55, 5, 5, true) --Bubbling Overflow

-- Dark Inquisitor Xanesh
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Dark Inquisitor Xanesh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 311551, 61, 5, 5, true) --Abyssal Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 62, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 312406, 63, 5, 5, true) --Voidwoken
PlexusStatusRaidDebuff:DebuffId(zoneid, 306311, 64, 5, 5, true) --Soul Flay

-- Vexiona
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Vexiona")
PlexusStatusRaidDebuff:DebuffId(zoneid, 307019, 71, 5, 5, true, true) --Void Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 72, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 307284, 73, 5, 5, true) --Terrifying Presence
PlexusStatusRaidDebuff:DebuffId(zoneid, 307343, 74, 5, 5, true) --Shadowy Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 306981, 75, 5, 5, true) --Gift of the Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 307359, 76, 5, 5, true) --Despair
PlexusStatusRaidDebuff:DebuffId(zoneid, 307020, 77, 5, 5, true) --Twilight Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 307250, 78, 5, 5, true) --Twilight Decimator
PlexusStatusRaidDebuff:DebuffId(zoneid, 307645, 79, 5, 5, true) --Heart of Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 315769, 80, 5, 5, true) --Decimation

-- The Hivemind
PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "The Hivemind")
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 91, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 313461, 92, 5, 5, true) --Corrosion

-- Ra-den the Despoiled
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Ra-den the Despoiled")
PlexusStatusRaidDebuff:DebuffId(zoneid, 306819, 101, 5, 5, true) --Nullifying Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 102, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 310022, 103, 5, 5, true) --Charged Bonds
PlexusStatusRaidDebuff:DebuffId(zoneid, 306184, 104, 5, 5, true) --Unleashed Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 313227, 105, 5, 5, true) --Decaying Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 310022, 106, 5, 5, true) --Charged Bonds
PlexusStatusRaidDebuff:DebuffId(zoneid, 306273, 107, 5, 5, true, true) --Unstable Vita
PlexusStatusRaidDebuff:DebuffId(zoneid, 309777, 108, 5, 5, true) --Void Defilement

-- Drest'agath
PlexusStatusRaidDebuff:BossNameId(zoneid, 110, "Drest'agath")
PlexusStatusRaidDebuff:DebuffId(zoneid, 308377, 111, 5, 5, true) --Void Infused Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 112, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 310309, 113, 5, 5, true) --Volatile Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 310277, 114, 5, 5, true) --Volatile Seed
PlexusStatusRaidDebuff:DebuffId(zoneid, 310358, 115, 5, 5, true) --Mutterings of Insanity
PlexusStatusRaidDebuff:DebuffId(zoneid, 310361, 116, 5, 5, true) --Unleashed Insanity
PlexusStatusRaidDebuff:DebuffId(zoneid, 310406, 117, 5, 5, true) --Void Glare

-- Il'gynoth, Corruption Reborn
PlexusStatusRaidDebuff:BossNameId(zoneid, 120, "Il'gynoth, Corruption Reborn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 315094, 121, 5, 5, true) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 122, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 309961, 123, 5, 5, true) --Eye of N'Zoth
PlexusStatusRaidDebuff:DebuffId(zoneid, 312486, 124, 5, 5, true, true) --Recurring Nightmare
PlexusStatusRaidDebuff:DebuffId(zoneid, 310322, 125, 5, 5, true) --Morass of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 311159, 126, 5, 5, true) --Cursed Blood

-- Carapace of N'Zoth
PlexusStatusRaidDebuff:BossNameId(zoneid, 130, "Carapace of N'Zoth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 307044, 131, 5, 5, true, true) --Nightmare Antibody
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 132, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 315954, 133, 5, 5, true) --Black Scar
PlexusStatusRaidDebuff:DebuffId(zoneid, 313364, 134, 5, 5, true) --Mental Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 307061, 135, 5, 5, true) --Mycelial Growth
PlexusStatusRaidDebuff:DebuffId(zoneid, 306973, 136, 5, 5, true) --Madness Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 306984, 137, 5, 5, true) --Insanity Bomb

-- N'Zoth the Corruptor
PlexusStatusRaidDebuff:BossNameId(zoneid, 140, "N'Zoth the Corruptor")
PlexusStatusRaidDebuff:DebuffId(zoneid, 308996, 141, 5, 5, true) --Servant of N'Zoth
PlexusStatusRaidDebuff:DebuffId(zoneid, 315161, 142, 5, 5, true) --Eye of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 313400, 143, 5, 5, true) --Corrupted Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 313609, 144, 5, 5, true) --Gift of N'Zoth
PlexusStatusRaidDebuff:DebuffId(zoneid, 316542, 145, 5, 5, true) --Paranoia
PlexusStatusRaidDebuff:DebuffId(zoneid, 316711, 146, 5, 5, true) --Mindwrack
PlexusStatusRaidDebuff:DebuffId(zoneid, 309991, 147, 5, 5, true) --Anguish
PlexusStatusRaidDebuff:DebuffId(zoneid, 313610, 148, 5, 5, true) --Mental Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 310042, 149, 5, 5, true) --Tumultuous Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 309698, 150, 5, 5, true) --Void Lash
PlexusStatusRaidDebuff:DebuffId(zoneid, 302565, 151, 5, 5, true) --Conductive Ink
PlexusStatusRaidDebuff:DebuffId(zoneid, 310073, 152, 5, 5, true) --Mindgrasp
PlexusStatusRaidDebuff:DebuffId(zoneid, 313793, 153, 5, 5, true) --Flames of Insanity
PlexusStatusRaidDebuff:DebuffId(zoneid, 313663, 153, 5, 5, true) --Psyche Shredder

