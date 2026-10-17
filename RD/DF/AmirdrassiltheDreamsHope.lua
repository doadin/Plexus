-- local zone = "Amirdrassil, the Dream's Hope"
local zoneid = 2232
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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 418720, 1, 5, 5, true) --Polymorph Bomb"
PlexusStatusRaidDebuff:DebuffId(zoneid, 427299, 1, 5, 5, true) --Flash Fire"
PlexusStatusRaidDebuff:DebuffId(zoneid, 424808, 1, 5, 5, true) --Lunar Blaze"
PlexusStatusRaidDebuff:DebuffId(zoneid, 425573, 1, 5, 5, true) --Entangling Roots"
PlexusStatusRaidDebuff:DebuffId(zoneid, 424771, 1, 5, 5, true) --Burning Wrath"
PlexusStatusRaidDebuff:DebuffId(zoneid, 421298, 1, 5, 5, true) --Constricting Thicket"
PlexusStatusRaidDebuff:DebuffId(zoneid, 421031, 1, 5, 5, true) --Song of the Dragon"
PlexusStatusRaidDebuff:DebuffId(zoneid, 422466, 1, 5, 5, true) --Shadow Spines"
PlexusStatusRaidDebuff:DebuffId(zoneid, 425528, 1, 5, 5, true) --Lasher Toxin"
PlexusStatusRaidDebuff:DebuffId(zoneid, 421407, 1, 5, 5, true) --Searing Ash"
PlexusStatusRaidDebuff:DebuffId(zoneid, 427306, 1, 5, 5, true) --Encased in Ash"
PlexusStatusRaidDebuff:DebuffId(zoneid, 426536, 1, 5, 5, true) --Seed of Life"
PlexusStatusRaidDebuff:DebuffId(zoneid, 419485, 1, 5, 5, true) --Nature's Bulwark"
PlexusStatusRaidDebuff:DebuffId(zoneid, 426390, 1, 5, 5, true) --Corrosive Pollen"
PlexusStatusRaidDebuff:DebuffId(zoneid, 420714, 1, 5, 5, true) --Noxious Blossom"
PlexusStatusRaidDebuff:DebuffId(zoneid, 426387, 1, 5, 5, true) --Scorching Bramblethorn"
PlexusStatusRaidDebuff:DebuffId(zoneid, 421470, 1, 5, 5, true) --Fire Whirl"
PlexusStatusRaidDebuff:DebuffId(zoneid, 425658, 1, 5, 5, true) --Podling Toxin"
PlexusStatusRaidDebuff:DebuffId(zoneid, 414777, 1, 5, 5, true) --Piercing Torment"
PlexusStatusRaidDebuff:DebuffId(zoneid, 421024, 1, 5, 5, true) --Emerald Winds"
PlexusStatusRaidDebuff:DebuffId(zoneid, 427297, 1, 5, 5, true) --Flame Surge"
PlexusStatusRaidDebuff:DebuffId(zoneid, 425388, 1, 5, 5, true) --Inferno Heart"
PlexusStatusRaidDebuff:DebuffId(zoneid, 418520, 1, 5, 5, true) --Blistering Splinters"
PlexusStatusRaidDebuff:DebuffId(zoneid, 425035, 1, 5, 5, true) --Horrifying Roar"
PlexusStatusRaidDebuff:DebuffId(zoneid, 428360, 1, 5, 5, true) --Melting Stomp"
PlexusStatusRaidDebuff:DebuffId(zoneid, 423494, 1, 5, 5, true) --Tidal Blaze"
PlexusStatusRaidDebuff:DebuffId(zoneid, 428345, 1, 5, 5, true) --Molten Claws"
PlexusStatusRaidDebuff:DebuffId(zoneid, 421594, 1, 5, 5, true) --Smoldering Suffocation"
PlexusStatusRaidDebuff:DebuffId(zoneid, 423195, 1, 5, 5, true) --Inflorescence"
PlexusStatusRaidDebuff:DebuffId(zoneid, 424646, 1, 5, 5, true) --Burning Claws"
PlexusStatusRaidDebuff:DebuffId(zoneid, 429798, 1, 5, 5, true) --Verdant Rend"
PlexusStatusRaidDebuff:DebuffId(zoneid, 420858, 1, 5, 5, true) --Poisonous Javelin"
PlexusStatusRaidDebuff:DebuffId(zoneid, 428077, 1, 5, 5, true) --Dream Walk"
PlexusStatusRaidDebuff:DebuffId(zoneid, 425093, 1, 5, 5, true) --Shadowflame Residue"
PlexusStatusRaidDebuff:DebuffId(zoneid, 425300, 1, 5, 5, true) --Shadowflame Bomb"
PlexusStatusRaidDebuff:DebuffId(zoneid, 426574, 1, 5, 5, true) --Bile Spit"

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Gnarlroot")
PlexusStatusRaidDebuff:DebuffId(zoneid, 421971, 101, 5, 5, true) --Controlled Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 422023, 102, 5, 5, true) --Shadow-Scorched Earth
PlexusStatusRaidDebuff:DebuffId(zoneid, 422026, 103, 5, 5, true) --Tortured Scream
PlexusStatusRaidDebuff:DebuffId(zoneid, 421038, 104, 5, 5, true) --Ember-Charred
PlexusStatusRaidDebuff:DebuffId(zoneid, 426548, 105, 5, 5, true) --Searing Bramble
PlexusStatusRaidDebuff:DebuffId(zoneid, 421840, 106, 5, 5, true) --Uprooted Agony
PlexusStatusRaidDebuff:DebuffId(zoneid, 422053, 107, 5, 5, true) --Shadow Spines*
PlexusStatusRaidDebuff:DebuffId(zoneid, 425816, 108, 5, 5, true) --Blazing Pollen*
PlexusStatusRaidDebuff:DebuffId(zoneid, 425819, 109, 5, 5, true) --Flaming Sap*
PlexusStatusRaidDebuff:DebuffId(zoneid, 424352, 110, 5, 5, true) --Dreadfire Barrage*
PlexusStatusRaidDebuff:DebuffId(zoneid, 424970, 111, 5, 5, true) --Toxic Loam

PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Igira the Cruel")
PlexusStatusRaidDebuff:DebuffId(zoneid, 414340, 201, 5, 5, true) --Drenched Blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 414770, 202, 5, 5, true) --Blistering Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 414367, 203, 5, 5, true) --Gathering Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 419462, 204, 5, 5, true) --Flesh Mortification
PlexusStatusRaidDebuff:DebuffId(zoneid, 423715, 205, 5, 5, true) --Searing Sparks
PlexusStatusRaidDebuff:DebuffId(zoneid, 416056, 206, 5, 5, true) --Umbral Destruction
PlexusStatusRaidDebuff:DebuffId(zoneid, 429277, 207, 5, 5, true) --Brutalized
PlexusStatusRaidDebuff:DebuffId(zoneid, 426017, 208, 5, 5, true) --Vital Rupture
PlexusStatusRaidDebuff:DebuffId(zoneid, 422776, 209, 5, 5, true) --Marked for Torment*
PlexusStatusRaidDebuff:DebuffId(zoneid, 415624, 210, 5, 5, true) --Heart Stopper*
PlexusStatusRaidDebuff:DebuffId(zoneid, 414425, 211, 5, 5, true) --Blistering Spear*

PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Volcoross")
PlexusStatusRaidDebuff:DebuffId(zoneid, 421082, 301, 5, 5, true) --Hellboil
PlexusStatusRaidDebuff:DebuffId(zoneid, 427201, 302, 5, 5, true) --Coiling Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 423494, 303, 5, 5, true) --Tidal Blaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 419054, 304, 5, 5, true) --Molten Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 421284, 305, 5, 5, true) --Coiling Flames*
PlexusStatusRaidDebuff:DebuffId(zoneid, 420934, 306, 5, 5, true) --Flood of the Firelands*
PlexusStatusRaidDebuff:DebuffId(zoneid, 421672, 307, 5, 5, true) --Serpent's Fury*

PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Council of Dreams")
PlexusStatusRaidDebuff:DebuffId(zoneid, 420856, 401, 5, 5, true) --Poisonous Javelin
PlexusStatusRaidDebuff:DebuffId(zoneid, 421292, 402, 5, 5, true) --Constricting Thicket
PlexusStatusRaidDebuff:DebuffId(zoneid, 426390, 403, 5, 5, true) --Corrosive Pollen
PlexusStatusRaidDebuff:DebuffId(zoneid, 421032, 404, 5, 5, true) --Captivating Finale
PlexusStatusRaidDebuff:DebuffId(zoneid, 418720, 405, 5, 5, true) --Polymorph Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 427602, 406, 5, 5, true) --Hungry
PlexusStatusRaidDebuff:DebuffId(zoneid, 427010, 407, 5, 5, true) --Satiated
PlexusStatusRaidDebuff:DebuffId(zoneid, 420409, 408, 5, 5, true) --Quack!
PlexusStatusRaidDebuff:DebuffId(zoneid, 424269, 409, 5, 5, true) --Slippery
PlexusStatusRaidDebuff:DebuffId(zoneid, 421024, 410, 5, 5, true) --Emerald Winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 423551, 411, 5, 5, true) --Whimsical Gust
PlexusStatusRaidDebuff:DebuffId(zoneid, 420671, 412, 5, 5, true) --Noxious Blossom*
PlexusStatusRaidDebuff:DebuffId(zoneid, 421020, 413, 5, 5, true) --Agonizing Claws*
PlexusStatusRaidDebuff:DebuffId(zoneid, 420937, 414, 5, 5, true) --Relentless Barrage*
PlexusStatusRaidDebuff:DebuffId(zoneid, 423522, 415, 5, 5, true) --Unstable Venom*
PlexusStatusRaidDebuff:DebuffId(zoneid, 420948, 415, 5, 5, true) --Barreling Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 421022, 415, 5, 5, true) --Agonizing Claws

PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Larodar, Keeper of the Flame")
PlexusStatusRaidDebuff:DebuffId(zoneid, 425889, 501, 5, 5, true) --Igniting Growth
PlexusStatusRaidDebuff:DebuffId(zoneid, 425531, 502, 5, 5, true) --Dream Fatigue
PlexusStatusRaidDebuff:DebuffId(zoneid, 418522, 503, 5, 5, true) --Blistering Splinters
PlexusStatusRaidDebuff:DebuffId(zoneid, 426387, 504, 5, 5, true) --Scorching Bramblethorn
PlexusStatusRaidDebuff:DebuffId(zoneid, 419485, 505, 5, 5, true) --Nature's Bulwark+
PlexusStatusRaidDebuff:DebuffId(zoneid, 423719, 506, 5, 5, true) --Nature's Fury
PlexusStatusRaidDebuff:DebuffId(zoneid, 429032, 507, 5, 5, true) --Everlasting Blaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 427306, 508, 5, 5, true) --Encased in Ash
PlexusStatusRaidDebuff:DebuffId(zoneid, 427343, 509, 5, 5, true) --Fire Whirl
PlexusStatusRaidDebuff:DebuffId(zoneid, 421594, 510, 5, 5, true) --Smoldering Suffocation
PlexusStatusRaidDebuff:DebuffId(zoneid, 428946, 511, 5, 5, true) --Ashen Asphyxiation
PlexusStatusRaidDebuff:DebuffId(zoneid, 421323, 512, 5, 5, true) --Searing Ash
PlexusStatusRaidDebuff:DebuffId(zoneid, 423610, 512, 5, 5, true) --Consuming Flame

PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "Nymue, Weaver of the Cycle")
PlexusStatusRaidDebuff:DebuffId(zoneid, 429785, 601, 5, 5, true) --Impending Loom
PlexusStatusRaidDebuff:DebuffId(zoneid, 430563, 602, 6, 6, true) --Ephemeral Flora
PlexusStatusRaidDebuff:DebuffId(zoneid, 430485, 603, 5, 5, true) --Reclamation
PlexusStatusRaidDebuff:DebuffId(zoneid, 425357, 604, 6, 6, true) --Surging Growth
PlexusStatusRaidDebuff:DebuffId(zoneid, 420907, 605, 5, 5, true) --Viridian Rain
PlexusStatusRaidDebuff:DebuffId(zoneid, 423195, 606, 5, 5, true) --Inflorescence+
PlexusStatusRaidDebuff:DebuffId(zoneid, 428273, 607, 5, 5, true) --Woven Resonance?
PlexusStatusRaidDebuff:DebuffId(zoneid, 423369, 608, 5, 5, true) --Barrier Blossom
PlexusStatusRaidDebuff:DebuffId(zoneid, 421368, 609, 5, 5, true) --Unravel
PlexusStatusRaidDebuff:DebuffId(zoneid, 428479, 610, 5, 5, true) --Lucid Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 423842, 611, 5, 5, true) --Verdant Rend
PlexusStatusRaidDebuff:DebuffId(zoneid, 418423, 612, 5, 5, true) --Verdant Matrix*
PlexusStatusRaidDebuff:DebuffId(zoneid, 420846, 613, 5, 5, true) --Continuum*
PlexusStatusRaidDebuff:DebuffId(zoneid, 428012, 614, 5, 5, true) --Lucid Miasma*
PlexusStatusRaidDebuff:DebuffId(zoneid, 427721, 615, 5, 5, true) --Weaver's Burden

PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "Smolderon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 421656, 701, 5, 5, true) --Cauterizing Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 421643, 702, 5, 5, true) --Emberscar's Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 430325, 703, 5, 5, true) --Inferno
PlexusStatusRaidDebuff:DebuffId(zoneid, 421532, 704, 5, 5, true) --Smoldering Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 421858, 705, 5, 5, true) --Ignited Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 421455, 706, 5, 5, true) --Overheated*
PlexusStatusRaidDebuff:DebuffId(zoneid, 422577, 707, 5, 5, true) --Searing Aftermath*
PlexusStatusRaidDebuff:DebuffId(zoneid, 426018, 708, 5, 5, true) --Seeking Inferno*
PlexusStatusRaidDebuff:DebuffId(zoneid, 420950, 709, 5, 5, true) --Blistering Heat*
PlexusStatusRaidDebuff:DebuffId(zoneid, 425574, 710, 5, 5, true) --Lingering Burn*

PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Tindral Sageswift, Seer of the Flame")
PlexusStatusRaidDebuff:DebuffId(zoneid, 424495, 801, 5, 5, true) --Mass Entanglement
PlexusStatusRaidDebuff:DebuffId(zoneid, 424581, 802, 5, 5, true) --Fiery Growth
PlexusStatusRaidDebuff:DebuffId(zoneid, 424499, 803, 5, 5, true) --Scorching Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 424582, 804, 5, 5, true) --Lingering Cinder
PlexusStatusRaidDebuff:DebuffId(zoneid, 422000, 805, 5, 5, true) --Searing Wrath
PlexusStatusRaidDebuff:DebuffId(zoneid, 427297, 806, 5, 5, true) --Flame Surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 425657, 807, 5, 5, true) --Fallen Feather
PlexusStatusRaidDebuff:DebuffId(zoneid, 429166, 808, 5, 5, true) --Astral Heat
PlexusStatusRaidDebuff:DebuffId(zoneid, 424579, 809, 5, 5, true) --Suppressive Ember
PlexusStatusRaidDebuff:DebuffId(zoneid, 430583, 810, 5, 5, true) --Germinating Aura
PlexusStatusRaidDebuff:DebuffId(zoneid, 424258, 811, 5, 5, true) --Dream Essence+
PlexusStatusRaidDebuff:DebuffId(zoneid, 429740, 812, 5, 5, true) --Pulsing Heat+
PlexusStatusRaidDebuff:DebuffId(zoneid, 421884, 813, 5, 5, true) --Emerald Gale+
PlexusStatusRaidDebuff:DebuffId(zoneid, 422509, 814, 5, 5, true) --Empowered Feather+
PlexusStatusRaidDebuff:DebuffId(zoneid, 426687, 815, 5, 5, true) --Poisonous Mushroom*
PlexusStatusRaidDebuff:DebuffId(zoneid, 421398, 816, 5, 5, true) --Fire Beam*
PlexusStatusRaidDebuff:DebuffId(zoneid, 424665, 817, 5, 5, true) --Seed of Flame*
PlexusStatusRaidDebuff:DebuffId(zoneid, 422325, 818, 5, 5, true) --Flaming Tree*
PlexusStatusRaidDebuff:DebuffId(zoneid, 424578, 819, 5, 5, true) -- Blazing Mushroom
PlexusStatusRaidDebuff:DebuffId(zoneid, 427928, 820, 5, 5, true) -- Flaming Germination

PlexusStatusRaidDebuff:BossNameId(zoneid, 900, "Fyrakk the Blazing")
PlexusStatusRaidDebuff:DebuffId(zoneid, 425483, 901, 5, 5, true) --Incinerated
PlexusStatusRaidDebuff:DebuffId(zoneid, 417807, 902, 5, 5, true) --Aflame
PlexusStatusRaidDebuff:DebuffId(zoneid, 417443, 903, 5, 5, true) --Fyr'alath's Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 429903, 904, 5, 5, true) --Flamebound
PlexusStatusRaidDebuff:DebuffId(zoneid, 429906, 905, 5, 5, true) --Shadowbound
PlexusStatusRaidDebuff:DebuffId(zoneid, 419123, 906, 5, 5, true) --Flamefall
PlexusStatusRaidDebuff:DebuffId(zoneid, 423601, 907, 5, 5, true) --Seed of Amirdrassil+
PlexusStatusRaidDebuff:DebuffId(zoneid, 423717, 908, 5, 5, true) --Bloom+
PlexusStatusRaidDebuff:DebuffId(zoneid, 430048, 909, 5, 5, true) --Corrupted Seed
PlexusStatusRaidDebuff:DebuffId(zoneid, 430045, 910, 5, 5, true) --Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 426368, 911, 5, 5, true) --Darkflame Cleave*
PlexusStatusRaidDebuff:DebuffId(zoneid, 417455, 912, 5, 5, true) --Dream Rend*
PlexusStatusRaidDebuff:DebuffId(zoneid, 410223, 913, 5, 5, true) --Shadowflame Breath*
PlexusStatusRaidDebuff:DebuffId(zoneid, 429866, 914, 5, 5, true) --Shadowflame Eruption*
PlexusStatusRaidDebuff:DebuffId(zoneid, 422836, 915, 5, 5, true) --Burning Scales*
PlexusStatusRaidDebuff:DebuffId(zoneid, 428971, 916, 5, 5, true) --Molten Eruption*
PlexusStatusRaidDebuff:DebuffId(zoneid, 428400, 917, 5, 5, true) --Exploding Core*
PlexusStatusRaidDebuff:DebuffId(zoneid, 428968, 918, 5, 5, true) --Shadow Cage*
PlexusStatusRaidDebuff:DebuffId(zoneid, 422524, 919, 5, 5, true) --Shadowflame Devastation*
PlexusStatusRaidDebuff:DebuffId(zoneid, 430051, 920, 5, 5, true) --Searing Screams*
PlexusStatusRaidDebuff:DebuffId(zoneid, 422837, 921, 5, 5, true) --Apocalypse Roar*
PlexusStatusRaidDebuff:DebuffId(zoneid, 425492, 922, 5, 5, true) --Infernal Maw*
end)