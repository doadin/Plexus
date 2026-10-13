-- local zone = "Aberrus, the Shadowed Crucible"
local zoneid = 2166
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- "Kazzara, the Hellforged"
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Kazzara, the Hellforged")
PlexusStatusRaidDebuff:DebuffId(zoneid, 400432, 101, 5, 5, true) --hellbeam
PlexusStatusRaidDebuff:DebuffId(zoneid, 403326, 102, 5, 5, true) --wings-of-extinction
PlexusStatusRaidDebuff:DebuffId(zoneid, 404744, 103, 5, 5, true) --terror-claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 407196, 104, 5, 5, true) --dread-rifts

-- "The Amalgamation Chamber"
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "The Amalgamation Chamber")
PlexusStatusRaidDebuff:DebuffId(zoneid, 401809, 201, 5, 5, true) -- corrupting-shadow
PlexusStatusRaidDebuff:DebuffId(zoneid, 402617, 202, 5, 5, true) -- blazing-heat
PlexusStatusRaidDebuff:DebuffId(zoneid, 406780, 203, 5, 5, true) -- shadowflame-contamination
PlexusStatusRaidDebuff:DebuffId(zoneid, 405641, 204, 5, 5, true) -- blistering-twilight
PlexusStatusRaidDebuff:DebuffId(zoneid, 408219, 205, 5, 5, true) -- convergent-eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 405914, 206, 5, 5, true) -- withering-vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 405016, 207, 5, 5, true) -- umbral-detonation

-- "The Forgotten Experiments"
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "The Forgotten Experiments")
PlexusStatusRaidDebuff:DebuffId(zoneid, 406358, 301, 5, 5, true) --rending-charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 406305, 302, 5, 5, true) --infused-strikes
PlexusStatusRaidDebuff:DebuffId(zoneid, 405042, 303, 5, 5, true) --unstable-essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 405383, 304, 5, 5, true) --violent-eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 407617, 305, 5, 5, true) --temporal-anomaly
PlexusStatusRaidDebuff:DebuffId(zoneid, 405391, 306, 5, 5, true) --disintegrate

-- "Assault of the Zaqali"
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Assault of the Zaqali")
PlexusStatusRaidDebuff:DebuffId(zoneid, 404687, 401, 5, 5, true) --barrier-backfire
PlexusStatusRaidDebuff:DebuffId(zoneid, 398938, 402, 5, 5, true) --devastating-leap
PlexusStatusRaidDebuff:DebuffId(zoneid, 401258, 403, 5, 5, true) --heavy-cudgel
PlexusStatusRaidDebuff:DebuffId(zoneid, 397383, 404, 5, 5, true) --molten-barrier
PlexusStatusRaidDebuff:DebuffId(zoneid, 401401, 405, 5, 5, true) --blazing-spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 408624, 406, 5, 5, true) --scorching-roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 401867, 407, 5, 5, true) --volcanic-shield
PlexusStatusRaidDebuff:DebuffId(zoneid, 404687, 408, 5, 5, true) --barrier-backfire

-- "Rashok, the Elder"
PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Rashok, the Elder")
PlexusStatusRaidDebuff:DebuffId(zoneid, 405316, 501, 5, 5, true) --ancient-fury
PlexusStatusRaidDebuff:DebuffId(zoneid, 406851, 502, 5, 5, true) --doom-flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 403543, 503, 5, 5, true) --lava-wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 401419, 504, 5, 5, true) --elders-conduit

-- "The Vigilant Steward, Zskarn"
PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "The Vigilant Steward, Zskarn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 405462, 601, 5, 5, true) --dragonfire-traps
PlexusStatusRaidDebuff:DebuffId(zoneid, 404955, 602, 5, 5, true) --shrapnel-bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 404007, 603, 5, 5, true) --unstable-embers
PlexusStatusRaidDebuff:DebuffId(zoneid, 403978, 604, 5, 5, true) --blast-wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 404942, 605, 5, 5, true) --searing-claws

-- "Magmorax"
PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "Magmorax")
PlexusStatusRaidDebuff:DebuffId(zoneid, 408359, 701, 5, 5, true) --catastrophic-eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 402989, 702, 5, 5, true) --molten-spittle
PlexusStatusRaidDebuff:DebuffId(zoneid, 409853, 703, 5, 5, true) --igniting-roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 401348, 704, 5, 5, true) --incinerating-maws

-- "Echo of Neltharion"
PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Echo of Neltharion")
PlexusStatusRaidDebuff:DebuffId(zoneid, 401022, 801, 5, 5, true) --calamitous-strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 403057, 802, 5, 5, true) --surrender-to-corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 407793, 803, 5, 5, true) --sunder-shadow
PlexusStatusRaidDebuff:DebuffId(zoneid, 407917, 804, 5, 5, true) --ebon-destruction
PlexusStatusRaidDebuff:DebuffId(zoneid, 401825, 805, 5, 5, true) --shatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 410972, 806, 5, 5, true) --corruption

-- "Scalecommander Sarkareth"
PlexusStatusRaidDebuff:BossNameId(zoneid, 900, "Scalecommander Sarkareth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 401951, 901, 5, 5, true) --oblivion
PlexusStatusRaidDebuff:DebuffId(zoneid, 401215, 902, 5, 5, true) --emptiness-between-stars
PlexusStatusRaidDebuff:DebuffId(zoneid, 413070, 903, 5, 5, true) --destabilize
PlexusStatusRaidDebuff:DebuffId(zoneid, 407576, 904, 5, 5, true) --astral-flare
PlexusStatusRaidDebuff:DebuffId(zoneid, 401383, 905, 5, 5, true) --oppressing-howl
PlexusStatusRaidDebuff:DebuffId(zoneid, 410247, 906, 5, 5, true) --echoing-howl
PlexusStatusRaidDebuff:DebuffId(zoneid, 401819, 907, 5, 5, true) --glittering-surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 401905, 908, 5, 5, true) --dazzled
PlexusStatusRaidDebuff:DebuffId(zoneid, 406989, 909, 5, 5, true) --burning-ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 401525, 910, 5, 5, true) --scorching-detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 401718, 911, 5, 5, true) --disintegrated
PlexusStatusRaidDebuff:DebuffId(zoneid, 402051, 912, 5, 5, true) --searing-breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 402052, 913, 5, 5, true) --seared
PlexusStatusRaidDebuff:DebuffId(zoneid, 402746, 914, 5, 5, true) --drifting-embers
PlexusStatusRaidDebuff:DebuffId(zoneid, 401325, 915, 5, 5, true) --burning-claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 404154, 916, 5, 5, true) --void-surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 404218, 917, 5, 5, true) --void-fracture
PlexusStatusRaidDebuff:DebuffId(zoneid, 404769, 918, 5, 5, true) --empty-strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 404288, 919, 5, 5, true) --infinite-duress
PlexusStatusRaidDebuff:DebuffId(zoneid, 404269, 920, 5, 5, true) --ebon-might
PlexusStatusRaidDebuff:DebuffId(zoneid, 403497, 921, 5, 5, true) --astral-formation
PlexusStatusRaidDebuff:DebuffId(zoneid, 413106, 922, 5, 5, true) --void-might
PlexusStatusRaidDebuff:DebuffId(zoneid, 408431, 923, 6, 6, true) --void-slash
