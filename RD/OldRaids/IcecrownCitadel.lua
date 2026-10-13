-- local zone = "Icecrown Citadel"
local zoneid = 186
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--The Lower Spire
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70980, 1, 6, 5) --Web Wrap
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69483, 1, 6, 5, true) --Dark Reckoning
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69969, 1, 5, 5, true) --Curse of Doom

--The Plagueworks
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71089, 2, 5, 5, true) --Bubbling Pus
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71127, 2, 7, 5, true, true) --Mortal Wound
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71163, 2, 6, 5, true) --Devour Humanoid
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71103, 2, 6, 5) --Combobulating Spray
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71157, 2, 5, 5, false, true)--Infested Wound

--The Crimson Hall
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70645, 3, 9, 5, true, false, {r=1,g=0,b=0})  --Chains of Shadow
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70671, 3, 5, 5)-- Leeching Rot
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70432, 3, 6, 5, true) --Blood Sap
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70435, 3, 7, 5, true, true) --Rend Flesh

--Frostwing Hall
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71257, 4, 6, 5, true, true) --Barbaric Strike
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71252, 4, 5, 5, true) --Volley

_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71327, 4, 6, 5) -- Web
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 36922, 4, 5, 5, true) --Bellowing Roar

--Lord Marrowgar
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Lord Marrowgar")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70823, 11, 5, 5, true) --Coldflame
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69065, 12, 8, 5) --Impaled
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70835, 13, 5, 5) --Bone Storm

--Lady Deathwhisper
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Lady Deathwhisper")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72109, 21, 5, 5) --Death and Decay
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71289, 22, 9, 9, true) --Dominate Mind
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71204, 23, 4, 4, true, true) --Touch of Insignificance
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 67934, 24, 5, 5, true) --Frost Fever
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71237, 25, 5, 5, true, false, nil, true) --Curse of Torpor
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72491, 26, 5, 5, true) --Necrotic Strike

--Gunship Battle
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Icecrown Gunship Battle")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69651, 31, 5, 5, true) --Wounding Strike

--Deathbringer Saurfang
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Deathbringer Saurfang")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72293, 41, 6, 8, false, false, {r=1,g=0,b=0}) --Mark of the Fallen Champion
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72442, 42, 8, 5, true) --Boiling Blood
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72449, 43, 5, 5, true) --Rune of Blood
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72769, 44, 5, 5, true) --Scent of Blood (heroic)

--Rotface
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Rotface")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71224, 51, 5, 7, true) --Mutated Infection
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71215, 52, 5, 5) --Ooze Flood
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69774, 53, 5, 5) --Sticky Ooze

--Festergut
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Festergut")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69279, 61, 5, 5, true) --Gas Spore
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71218, 62, 5, 5, true) --Vile Gas
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72219, 63, 5, 5, true, true) --Gastric Bloat

--Proffessor
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Professor Putricide")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70341, 71, 5, 5, true) --Slime Puddle
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72549, 72, 5, 5, true) --Malleable Goo
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71278, 73, 5, 5, true) --Choking Gas Bomb
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70215, 74, 5, 5, true) --Gaseous Bloat
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70447, 75, 5, 5, true) --Volatile Ooze Adhesive
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72454, 76, 5, 5, true, true) --Mutated Plague
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70405, 77, 5, 5, false, false, {r=1, g=0, b=0}) --Mutated Transformation
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72856, 78, 6, 4, true) --Unbound Plague
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70953, 79, 4, 6, true, true, {r=0, g=0, b=1}) --Plague Sickness
--Blood Princes
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Blood Princes")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72796, 81, 7, 5, true) --Glittering Sparks
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71822, 82, 5, 7) --Shadow Resonance

--Blood-Queen Lana'thel
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "Blood-Queen Lana'thel")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70838, 91, 5, 5) --Blood Mirror
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72265, 92, 6, 5, true) --Delirious Slash
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71473, 93, 5, 7, true) --Essence of the Blood Queen
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71474, 94, 6, 5, true) --Frenzied Bloodthirst
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 73070, 95, 5, 5, true) --Incite Terror
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71340, 96, 7, 5) --Pact of the Darkfallen
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71265, 97, 6, 5) --Swarming Shadows
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70923, 98, 10, 10) --Uncontrollable Frenzy

--Valithria Dreamwalker
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Valithria Dreamwalker")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70873, 101, 1, 5, true, true) --Emerald Vigor
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71746, 102, 5, 5) --Column of Frost
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71741, 103, 4, 5) --Mana Void
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71738, 104, 7, 5, true, true) --Corrosion
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71733, 105, 6, 5, true) --Acid Burst
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71283, 106, 6, 5, true) --Gut Spray
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 71941, 107, 1, 5, true, true) --Twisted Nightmares

--Sindragosa
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 110, "Sindragosa")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69762, 111, 5, 5, true) --Unchained Magic
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70106, 112, 6, 5, true, true) --Chlled to the Bone
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69766, 113, 6, 5, true, true) --Instability
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70126, 114, 9, 5, true) --Frost Beacon
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70157, 115, 8, 5, true) --Ice Tomb
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70127, 116, 7, 5, false, true) --Mystic Buffet

--The Lich King
_G.PlexusStatusRaidDebuff:BossNameId(zoneid, 120, "The Lich King")
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70337, 121, 8, 5, true, true) --Necrotic plague
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72149, 122, 5, 5, true) --Shockwave
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 70541, 123, 7, 5) --Infest
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69242, 124, 5, 5, true) --Soul Shriek  -- 69200 Raging Spirit
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 69409, 125, 9, 5, true) --Soul Reaper
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 72762, 126, 5, 5) --Defile
_G.PlexusStatusRaidDebuff:DebuffId(zoneid, 68980, 127, 8, 5) --Harvest Soul

