-- local zone = "Icecrown Citadel"
local zoneid = 186
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

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--The Lower Spire
PlexusStatusRaidDebuff:DebuffId(zoneid, 70980, 1, 6, 5) --Web Wrap
PlexusStatusRaidDebuff:DebuffId(zoneid, 69483, 1, 6, 5, true) --Dark Reckoning
PlexusStatusRaidDebuff:DebuffId(zoneid, 69969, 1, 5, 5, true) --Curse of Doom

--The Plagueworks
PlexusStatusRaidDebuff:DebuffId(zoneid, 71089, 2, 5, 5, true) --Bubbling Pus
PlexusStatusRaidDebuff:DebuffId(zoneid, 71127, 2, 7, 5, true, true) --Mortal Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 71163, 2, 6, 5, true) --Devour Humanoid
PlexusStatusRaidDebuff:DebuffId(zoneid, 71103, 2, 6, 5) --Combobulating Spray
PlexusStatusRaidDebuff:DebuffId(zoneid, 71157, 2, 5, 5, false, true)--Infested Wound

--The Crimson Hall
PlexusStatusRaidDebuff:DebuffId(zoneid, 70645, 3, 9, 5, true, false, {r=1,g=0,b=0})  --Chains of Shadow
PlexusStatusRaidDebuff:DebuffId(zoneid, 70671, 3, 5, 5)-- Leeching Rot
PlexusStatusRaidDebuff:DebuffId(zoneid, 70432, 3, 6, 5, true) --Blood Sap
PlexusStatusRaidDebuff:DebuffId(zoneid, 70435, 3, 7, 5, true, true) --Rend Flesh

--Frostwing Hall
PlexusStatusRaidDebuff:DebuffId(zoneid, 71257, 4, 6, 5, true, true) --Barbaric Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 71252, 4, 5, 5, true) --Volley

PlexusStatusRaidDebuff:DebuffId(zoneid, 71327, 4, 6, 5) -- Web
PlexusStatusRaidDebuff:DebuffId(zoneid, 36922, 4, 5, 5, true) --Bellowing Roar

--Lord Marrowgar
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Lord Marrowgar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 70823, 11, 5, 5, true) --Coldflame
PlexusStatusRaidDebuff:DebuffId(zoneid, 69065, 12, 8, 5) --Impaled
PlexusStatusRaidDebuff:DebuffId(zoneid, 70835, 13, 5, 5) --Bone Storm

--Lady Deathwhisper
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Lady Deathwhisper")
PlexusStatusRaidDebuff:DebuffId(zoneid, 72109, 21, 5, 5) --Death and Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 71289, 22, 9, 9, true) --Dominate Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 71204, 23, 4, 4, true, true) --Touch of Insignificance
PlexusStatusRaidDebuff:DebuffId(zoneid, 67934, 24, 5, 5, true) --Frost Fever
PlexusStatusRaidDebuff:DebuffId(zoneid, 71237, 25, 5, 5, true, false, nil, true) --Curse of Torpor
PlexusStatusRaidDebuff:DebuffId(zoneid, 72491, 26, 5, 5, true) --Necrotic Strike

--Gunship Battle
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Icecrown Gunship Battle")
PlexusStatusRaidDebuff:DebuffId(zoneid, 69651, 31, 5, 5, true) --Wounding Strike

--Deathbringer Saurfang
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Deathbringer Saurfang")
PlexusStatusRaidDebuff:DebuffId(zoneid, 72293, 41, 6, 8, false, false, {r=1,g=0,b=0}) --Mark of the Fallen Champion
PlexusStatusRaidDebuff:DebuffId(zoneid, 72442, 42, 8, 5, true) --Boiling Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 72449, 43, 5, 5, true) --Rune of Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 72769, 44, 5, 5, true) --Scent of Blood (heroic)

--Rotface
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Rotface")
PlexusStatusRaidDebuff:DebuffId(zoneid, 71224, 51, 5, 7, true) --Mutated Infection
PlexusStatusRaidDebuff:DebuffId(zoneid, 71215, 52, 5, 5) --Ooze Flood
PlexusStatusRaidDebuff:DebuffId(zoneid, 69774, 53, 5, 5) --Sticky Ooze

--Festergut
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Festergut")
PlexusStatusRaidDebuff:DebuffId(zoneid, 69279, 61, 5, 5, true) --Gas Spore
PlexusStatusRaidDebuff:DebuffId(zoneid, 71218, 62, 5, 5, true) --Vile Gas
PlexusStatusRaidDebuff:DebuffId(zoneid, 72219, 63, 5, 5, true, true) --Gastric Bloat

--Proffessor
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Professor Putricide")
PlexusStatusRaidDebuff:DebuffId(zoneid, 70341, 71, 5, 5, true) --Slime Puddle
PlexusStatusRaidDebuff:DebuffId(zoneid, 72549, 72, 5, 5, true) --Malleable Goo
PlexusStatusRaidDebuff:DebuffId(zoneid, 71278, 73, 5, 5, true) --Choking Gas Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 70215, 74, 5, 5, true) --Gaseous Bloat
PlexusStatusRaidDebuff:DebuffId(zoneid, 70447, 75, 5, 5, true) --Volatile Ooze Adhesive
PlexusStatusRaidDebuff:DebuffId(zoneid, 72454, 76, 5, 5, true, true) --Mutated Plague
PlexusStatusRaidDebuff:DebuffId(zoneid, 70405, 77, 5, 5, false, false, {r=1, g=0, b=0}) --Mutated Transformation
PlexusStatusRaidDebuff:DebuffId(zoneid, 72856, 78, 6, 4, true) --Unbound Plague
PlexusStatusRaidDebuff:DebuffId(zoneid, 70953, 79, 4, 6, true, true, {r=0, g=0, b=1}) --Plague Sickness
--Blood Princes
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Blood Princes")
PlexusStatusRaidDebuff:DebuffId(zoneid, 72796, 81, 7, 5, true) --Glittering Sparks
PlexusStatusRaidDebuff:DebuffId(zoneid, 71822, 82, 5, 7) --Shadow Resonance

--Blood-Queen Lana'thel
PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "Blood-Queen Lana'thel")
PlexusStatusRaidDebuff:DebuffId(zoneid, 70838, 91, 5, 5) --Blood Mirror
PlexusStatusRaidDebuff:DebuffId(zoneid, 72265, 92, 6, 5, true) --Delirious Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 71473, 93, 5, 7, true) --Essence of the Blood Queen
PlexusStatusRaidDebuff:DebuffId(zoneid, 71474, 94, 6, 5, true) --Frenzied Bloodthirst
PlexusStatusRaidDebuff:DebuffId(zoneid, 73070, 95, 5, 5, true) --Incite Terror
PlexusStatusRaidDebuff:DebuffId(zoneid, 71340, 96, 7, 5) --Pact of the Darkfallen
PlexusStatusRaidDebuff:DebuffId(zoneid, 71265, 97, 6, 5) --Swarming Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 70923, 98, 10, 10) --Uncontrollable Frenzy

--Valithria Dreamwalker
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Valithria Dreamwalker")
PlexusStatusRaidDebuff:DebuffId(zoneid, 70873, 101, 1, 5, true, true) --Emerald Vigor
PlexusStatusRaidDebuff:DebuffId(zoneid, 71746, 102, 5, 5) --Column of Frost
PlexusStatusRaidDebuff:DebuffId(zoneid, 71741, 103, 4, 5) --Mana Void
PlexusStatusRaidDebuff:DebuffId(zoneid, 71738, 104, 7, 5, true, true) --Corrosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 71733, 105, 6, 5, true) --Acid Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 71283, 106, 6, 5, true) --Gut Spray
PlexusStatusRaidDebuff:DebuffId(zoneid, 71941, 107, 1, 5, true, true) --Twisted Nightmares

--Sindragosa
PlexusStatusRaidDebuff:BossNameId(zoneid, 110, "Sindragosa")
PlexusStatusRaidDebuff:DebuffId(zoneid, 69762, 111, 5, 5, true) --Unchained Magic
PlexusStatusRaidDebuff:DebuffId(zoneid, 70106, 112, 6, 5, true, true) --Chlled to the Bone
PlexusStatusRaidDebuff:DebuffId(zoneid, 69766, 113, 6, 5, true, true) --Instability
PlexusStatusRaidDebuff:DebuffId(zoneid, 70126, 114, 9, 5, true) --Frost Beacon
PlexusStatusRaidDebuff:DebuffId(zoneid, 70157, 115, 8, 5, true) --Ice Tomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 70127, 116, 7, 5, false, true) --Mystic Buffet

--The Lich King
PlexusStatusRaidDebuff:BossNameId(zoneid, 120, "The Lich King")
PlexusStatusRaidDebuff:DebuffId(zoneid, 70337, 121, 8, 5, true, true) --Necrotic plague
PlexusStatusRaidDebuff:DebuffId(zoneid, 72149, 122, 5, 5, true) --Shockwave
PlexusStatusRaidDebuff:DebuffId(zoneid, 70541, 123, 7, 5) --Infest
PlexusStatusRaidDebuff:DebuffId(zoneid, 69242, 124, 5, 5, true) --Soul Shriek  -- 69200 Raging Spirit
PlexusStatusRaidDebuff:DebuffId(zoneid, 69409, 125, 9, 5, true) --Soul Reaper
PlexusStatusRaidDebuff:DebuffId(zoneid, 72762, 126, 5, 5) --Defile
PlexusStatusRaidDebuff:DebuffId(zoneid, 68980, 127, 8, 5) --Harvest Soul
end)
