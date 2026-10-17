-- local zone = "Manaforge Omega"
local zoneid = 2460
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

-- "Plexus Sentinel"
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Plexus Sentinel")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1218148, 101, 5, 5, true) --Phase Blink
PlexusStatusRaidDebuff:DebuffId(zoneid, 1217649, 102, 5, 5, true) --Arcanomatrix Atomizer
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219223, 103, 5, 5, true) --Atomize
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219248, 104, 5, 5, true) --Arcane Radiation
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227794, 105, 5, 5, true) --Arcane Lightning
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234733, 106, 5, 5, true) --Cleanse the Chamber
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219532, 107, 5, 5, true) --Eradicating Salvo
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219450, 108, 5, 5, true) --Manifest Matrices
PlexusStatusRaidDebuff:DebuffId(zoneid, 1218626, 109, 5, 5, true) --Displacement Matrix
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219354, 110, 5, 5, true) --Potent Mana Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219263, 111, 5, 5, true) --Obliteration Arcanocannon
PlexusStatusRaidDebuff:DebuffId(zoneid, 1223364, 112, 5, 5, true) --Powered Automaton
PlexusStatusRaidDebuff:DebuffId(zoneid, 1220489, 113, 5, 5, true) --Protocol: Purge
PlexusStatusRaidDebuff:DebuffId(zoneid, 1218669, 114, 5, 5, true) --Energy Cutter
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233110, 115, 5, 5, true) --Purging Lightning
PlexusStatusRaidDebuff:DebuffId(zoneid, 1219471, 116, 5, 5, true) --Expulsion Zone
PlexusStatusRaidDebuff:DebuffId(zoneid, 1235816, 117, 5, 5, true) --Energy Overload

--"Loom'ithar"
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Loom'ithar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237272, 201, 5, 5, true) --Lair Weaving
PlexusStatusRaidDebuff:DebuffId(zoneid, 1238502, 202, 5, 5, true) --Woven Ward
PlexusStatusRaidDebuff:DebuffId(zoneid, 1247672, 203, 5, 5, true) --Infusion Pylons
PlexusStatusRaidDebuff:DebuffId(zoneid, 1247029, 204, 5, 5, true) --Excess Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 1247045, 205, 5, 5, true) --Hyper Infusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226315, 206, 5, 5, true) --Infusion Tether
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226366, 207, 5, 5, true) --Living Silk
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226721, 208, 5, 5, true) --Silken Snare
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226395, 209, 5, 5, true) --Overinfusion Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226867, 210, 5, 5, true) --Primal Spellstorm
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231408, 211, 5, 5, true) --Arcane Overflow
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227263, 212, 5, 5, true) --Piercing Strand
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231403, 213, 5, 5, true) --Silk Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228059, 214, 5, 5, true) --Unbound Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243771, 215, 5, 5, true) --Arcane Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227782, 216, 5, 5, true) --Arcane Outrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227226, 217, 5, 5, true) --Writhing Wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 1242303, 218, 5, 5, true) --Writhing Swathe

--"Soulbinder Naazindhri"
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Soulbinder Naazindhri")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225582, 301, 5, 5, true) --Soul Calling
PlexusStatusRaidDebuff:DebuffId(zoneid, 1239988, 302, 5, 5, true) --Soulweave
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227048, 303, 5, 5, true) --Voidblade Ambush
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227052, 304, 5, 5, true) --Void Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 1242018, 305, 5, 5, true) --Void Resonance
PlexusStatusRaidDebuff:DebuffId(zoneid, 1235576, 306, 5, 5, true) --Phase Blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227848, 307, 5, 5, true) --Essence Implosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227276, 308, 5, 5, true) --Soulfray Annihilation
PlexusStatusRaidDebuff:DebuffId(zoneid, 1246530, 309, 5, 5, true) --Arcane Sigils
PlexusStatusRaidDebuff:DebuffId(zoneid, 1246775, 310, 5, 5, true) --Shatterpulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 1223859, 311, 5, 5, true) --Arcane Expulsion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1242086, 312, 5, 5, true) --Arcane Energy
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225616, 313, 5, 5, true) --Soulfire Convergence
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226827, 314, 5, 5, true) --Soulrend Orb
PlexusStatusRaidDebuff:DebuffId(zoneid, 1240754, 315, 5, 5, true) --Spellburn
PlexusStatusRaidDebuff:DebuffId(zoneid, 1241100, 316, 5, 5, true) --Mystic Lash

--"Forgeweaver Araz"
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Forgeweaver Araz")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231720, 401, 5, 5, true) --Invoke Collector
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228214, 402, 5, 5, true) --Astral Harvest
PlexusStatusRaidDebuff:DebuffId(zoneid, 1236207, 403, 5, 5, true) --Astral Surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237322, 404, 5, 5, true) --Prime Sequence
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228103, 405, 5, 5, true) --Arcane Siphon
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231726, 406, 5, 5, true) --Arcane Barrier
PlexusStatusRaidDebuff:DebuffId(zoneid, 1248171, 407, 5, 5, true) --Void Tear
PlexusStatusRaidDebuff:DebuffId(zoneid, 1245640, 408, 5, 5, true) --Power Manifested
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228218, 409, 5, 5, true) --Arcane Obliteration
PlexusStatusRaidDebuff:DebuffId(zoneid, 1238867, 410, 5, 5, true) --Echoing Invocation
PlexusStatusRaidDebuff:DebuffId(zoneid, 1238874, 411, 5, 5, true) --Echoing Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228454, 412, 5, 5, true) --Mark of Power
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228219, 413, 5, 5, true) --Astral Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228188, 414, 5, 5, true) --Silencing Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228502, 415, 5, 5, true) --Overwhelming Power
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227631, 416, 5, 5, true) --Arcane Expulsion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1248009, 417, 5, 5, true) --Dark Terminus
PlexusStatusRaidDebuff:DebuffId(zoneid, 1240705, 418, 5, 5, true) --Astral Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232409, 419, 5, 5, true) --Unstable Surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234328, 420, 5, 5, true) --Photon Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226260, 421, 5, 5, true) --Arcane Convergence
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243272, 422, 5, 5, true) --Containment Breach
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232738, 423, 5, 5, true) --Hardened Shell
PlexusStatusRaidDebuff:DebuffId(zoneid, 1238266, 424, 5, 5, true) --Ramping Power
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233415, 425, 5, 5, true) --Mana Splinter
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232412, 426, 5, 5, true) --Focusing Iris
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233076, 427, 5, 5, true) --Dark Singularity
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233074, 428, 5, 5, true) --Crushing Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243901, 429, 5, 5, true) --Void Harvest
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243641, 430, 5, 5, true) --Void Surge
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232221, 431, 5, 5, true) --Death Throes

--"The Soul Hunters"
PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "The Soul Hunters")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1222232, 501, 5, 5, true, true) --Devourer's Ire
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234565, 502, 5, 5, true) --Consume
PlexusStatusRaidDebuff:DebuffId(zoneid, 1222310, 503, 5, 5, true) --Unending Hunger
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227355, 504, 5, 5, true) --Voidstep
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227685, 505, 5, 5, true) --Hungering Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 1235045, 506, 5, 5, true) --Encroaching Oblivion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1245743, 507, 5, 5, true) --Eradicate
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227809, 508, 5, 5, true) --The Hunt
PlexusStatusRaidDebuff:DebuffId(zoneid, 1247415, 509, 5, 5, true) --Weakened Prey
PlexusStatusRaidDebuff:DebuffId(zoneid, 1241306, 510, 5, 5, true) --Blade Dance
PlexusStatusRaidDebuff:DebuffId(zoneid, 1218103, 511, 5, 5, true) --Eye Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 1221490, 512, 5, 5, true) --Fel-Singed
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225127, 513, 5, 5, true) --Felblade
PlexusStatusRaidDebuff:DebuffId(zoneid, 1223725, 514, 5, 5, true) --Fel Inferno
PlexusStatusRaidDebuff:DebuffId(zoneid, 1241833, 515, 5, 5, true) --Fracture
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226493, 516, 5, 5, true) --Shattered Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 1241917, 517, 5, 5, true) --Frailty
PlexusStatusRaidDebuff:DebuffId(zoneid, 1242259, 518, 5, 5, true) --Spirit Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 1242284, 519, 5, 5, true) --Soulcrush
PlexusStatusRaidDebuff:DebuffId(zoneid, 1242304, 520, 5, 5, true) --Expulsed Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 1240891, 521, 5, 5, true) --Sigil of Chains
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225154, 522, 5, 5, true) --Immolation Aura
PlexusStatusRaidDebuff:DebuffId(zoneid, 1249198, 523, 5, 5, true) --Unstable Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233093, 524, 5, 5, true) --Collapsing Star
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233105, 525, 5, 5, true) --Dark Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233968, 526, 5, 5, true) --Event Horizon
PlexusStatusRaidDebuff:DebuffId(zoneid, 1245978, 527, 5, 5, true) --Soul Tether
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233863, 528, 5, 5, true) --Fel Rush
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227113, 529, 5, 5, true) --Infernal Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227117, 530, 5, 5, true) --Fel Devastation
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233381, 531, 5, 5, true) --Withering Flames

--"Fractillus"
PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "Fractillus")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233657, 601, 5, 5, true) --Nether Prism
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226089, 602, 5, 5, true) --Crystal Nexus
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232130, 603, 5, 5, true) --Nexus Shrapnel
PlexusStatusRaidDebuff:DebuffId(zoneid, 1236784, 604, 5, 5, true) --Brittle Nexus
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232760, 605, 5, 5, true) --Crystal Lacerations
PlexusStatusRaidDebuff:DebuffId(zoneid, 1236785, 606, 5, 5, true) --Void-Infused Nexus
PlexusStatusRaidDebuff:DebuffId(zoneid, 1247424, 607, 5, 5, true) --Null Consumption
PlexusStatusRaidDebuff:DebuffId(zoneid, 1247495, 608, 5, 5, true) --Null Explosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233917, 609, 5, 5, true) --Crystaline Overcharge
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224414, 610, 5, 5, true) --Crystalline Shockwave
PlexusStatusRaidDebuff:DebuffId(zoneid, 1220394, 611, 5, 5, true) --Shattering Backhand
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227373, 612, 5, 5, true) --Shattershell
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227378, 613, 5, 5, true) --Crystal Encasement
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231871, 614, 5, 5, true) --Shockwave Slam

--"Nexus-King Salhadaar"
PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "Nexus-King Salhadaar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224731, 701, 5, 5, true) --Decree: Oath-Bound
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224767, 702, 5, 5, true) --King's Thrall
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224764, 703, 5, 5, true) --Oath-Breaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224906, 704, 5, 5, true) --Invoke the Oath
PlexusStatusRaidDebuff:DebuffId(zoneid, 1238975, 705, 5, 5, true) --Vengeful Oath
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224776, 706, 5, 5, true) --Subjugation Rule
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224787, 707, 5, 5, true) --Conquer
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224812, 708, 5, 5, true) --Vanquish
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227529, 709, 5, 5, true) --Banishment
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224822, 710, 5, 5, true) --Tyranny
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225099, 711, 5, 5, true) --Fractal Images
PlexusStatusRaidDebuff:DebuffId(zoneid, 1247215, 712, 5, 5, true) --Fractal Claw
PlexusStatusRaidDebuff:DebuffId(zoneid, 1224827, 713, 5, 5, true) --Behead
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231097, 714, 5, 5, true) --Cosmic Rip
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227330, 715, 5, 5, true) --Besiege
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227891, 716, 5, 5, true) --Coalesce Voidwing
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228113, 717, 5, 5, true) --Netherbreaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228163, 718, 5, 5, true) --Dimension Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234539, 719, 5, 5, true) --Dimension Glare
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234529, 720, 5, 5, true) --Cosmic Maw
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228065, 721, 5, 5, true) --Rally the Shadowguard
PlexusStatusRaidDebuff:DebuffId(zoneid, 1230302, 722, 5, 5, true) --Self-Destruct
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232399, 723, 5, 5, true) --Dread Mortar
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237105, 724, 5, 5, true) --Twilight Barrier
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228075, 725, 5, 5, true) --Nexus Beams
PlexusStatusRaidDebuff:DebuffId(zoneid, 1230261, 726, 5, 5, true) --Netherblast
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237107, 727, 5, 5, true) --Twilight Massacre
PlexusStatusRaidDebuff:DebuffId(zoneid, 1250044, 728, 5, 5, true) --Taking Aim
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228053, 729, 5, 5, true) --Reap
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232327, 730, 5, 5, true) --Seal the Forge
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228284, 731, 5, 5, true) --Royal Ward
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228265, 732, 5, 5, true) --King's Hunger
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226648, 733, 5, 5, true) --Galactic Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 1248137, 734, 5, 5, true) --Dark Star
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225444, 735, 5, 5, true) --Atomized
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225645, 736, 5, 5, true) --Twilight Spikes
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226384, 737, 5, 5, true) --Dark Orbit
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226879, 738, 5, 5, true) --Stars Collide
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234906, 739, 5, 5, true) --Nexus Collapse
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226362, 740, 5, 5, true) --Twilight Scar
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226417, 741, 5, 5, true) --Starshattered
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226347, 742, 5, 5, true) --Starkiller Swing
PlexusStatusRaidDebuff:DebuffId(zoneid, 1226042, 743, 5, 5, true) --Starkiller Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 1225634, 744, 5, 5, true) --World in Twilight

--"Dimensius, the All-Devouring"
PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Dimensius, the All-Devouring")
PlexusStatusRaidDebuff:DebuffId(zoneid, 1229327, 801, 5, 5, true) --Oblivion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1230087, 802, 5, 5, true) --Massive Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231005, 803, 5, 5, true) --Fission
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228206, 804, 5, 5, true) --Excess Mass
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228207, 805, 5, 5, true) --Collective Gravity
PlexusStatusRaidDebuff:DebuffId(zoneid, 1230168, 806, 5, 5, true) --Mortal Fragility
PlexusStatusRaidDebuff:DebuffId(zoneid, 1248240, 807, 5, 5, true) --Infinite Possibilities
PlexusStatusRaidDebuff:DebuffId(zoneid, 1229038, 808, 5, 5, true) --Devour
PlexusStatusRaidDebuff:DebuffId(zoneid, 1229674, 809, 5, 5, true) --Growing Hunger
PlexusStatusRaidDebuff:DebuffId(zoneid, 1230979, 810, 5, 5, true) --Dark Matter
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231002, 811, 5, 5, true) --Dark Energy
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243690, 812, 5, 5, true) --Shattered Space
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243704, 813, 5, 5, true) --Antimatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243699, 814, 5, 5, true) --Spatial Fragment
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243577, 815, 5, 5, true) --Reverse Gravity
PlexusStatusRaidDebuff:DebuffId(zoneid, 1243609, 816, 5, 5, true) --Airborne
PlexusStatusRaidDebuff:DebuffId(zoneid, 1250614, 817, 5, 5, true) --Anomalous Force
PlexusStatusRaidDebuff:DebuffId(zoneid, 1227665, 818, 5, 5, true) --Fists of the Voidlord
PlexusStatusRaidDebuff:DebuffId(zoneid, 1228367, 819, 5, 5, true) --Cosmic Radiation
PlexusStatusRaidDebuff:DebuffId(zoneid, 1235114, 820, 5, 5, true) --Soaring Reshii
PlexusStatusRaidDebuff:DebuffId(zoneid, 1235467, 821, 5, 5, true) --Umbral Gate
PlexusStatusRaidDebuff:DebuffId(zoneid, 1241188, 822, 5, 5, true) --Endless Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237080, 823, 5, 5, true) --Broken World
PlexusStatusRaidDebuff:DebuffId(zoneid, 1235490, 824, 5, 5, true) --Astrophysical Jet
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232987, 825, 5, 5, true) --Black Hole
PlexusStatusRaidDebuff:DebuffId(zoneid, 1230674, 826, 5, 5, true) --Spaghettification
PlexusStatusRaidDebuff:DebuffId(zoneid, 1246930, 827, 5, 5, true) --Stellar Core
PlexusStatusRaidDebuff:DebuffId(zoneid, 1246948, 828, 5, 5, true) --Shooting Star
PlexusStatusRaidDebuff:DebuffId(zoneid, 1238765, 829, 5, 5, true) --Extinction
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237319, 830, 5, 5, true) --Gamma Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234242, 831, 5, 5, true) --Gravitational Distortion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234243, 832, 5, 5, true) --Crushing Gravity
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234251, 833, 5, 5, true) --Crushed
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234244, 834, 5, 5, true) --Inverse Gravity
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237690, 835, 5, 5, true) --Eclipse
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237694, 836, 5, 5, true) --Mass Ejection
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237696, 837, 5, 5, true) --Debris Field
PlexusStatusRaidDebuff:DebuffId(zoneid, 1249423, 838, 5, 5, true) --Mass Destruction
PlexusStatusRaidDebuff:DebuffId(zoneid, 1239262, 839, 5, 5, true) --Conqueror's Cross
PlexusStatusRaidDebuff:DebuffId(zoneid, 1239270, 840, 5, 5, true) --Voidwarding
PlexusStatusRaidDebuff:DebuffId(zoneid, 1246537, 841, 5, 5, true) --Entropic Unity
PlexusStatusRaidDebuff:DebuffId(zoneid, 1246541, 842, 5, 5, true) --Null Binding
PlexusStatusRaidDebuff:DebuffId(zoneid, 1249248, 843, 5, 5, true) --Boundless
PlexusStatusRaidDebuff:DebuffId(zoneid, 1246143, 844, 5, 5, true) --Touch of Oblivion
PlexusStatusRaidDebuff:DebuffId(zoneid, 1237695, 845, 5, 5, true) --Stardust Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 1249454, 846, 5, 5, true) --Starshard Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 1254385, 847, 5, 5, true) --Starshard
PlexusStatusRaidDebuff:DebuffId(zoneid, 1254384, 848, 5, 5, true) --Star Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 1245292, 849, 5, 5, true) --Destabilized
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233292, 850, 5, 5, true) --Accretion Disk
PlexusStatusRaidDebuff:DebuffId(zoneid, 1231716, 851, 5, 5, true) --Extinguish The Stars
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232394, 852, 5, 5, true) --Gravity Well
PlexusStatusRaidDebuff:DebuffId(zoneid, 1248479, 853, 5, 5, true) --Stellar Overload
PlexusStatusRaidDebuff:DebuffId(zoneid, 1233557, 854, 5, 5, true) --Density
PlexusStatusRaidDebuff:DebuffId(zoneid, 1232973, 855, 5, 5, true) --Supernova
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234052, 856, 5, 5, true) --Darkened Sky
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234054, 857, 5, 5, true) --Shadowquake
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234263, 858, 5, 5, true) --Cosmic Collapse
PlexusStatusRaidDebuff:DebuffId(zoneid, 1234266, 859, 5, 5, true) --Cosmic Fragility
PlexusStatusRaidDebuff:DebuffId(zoneid, 1250055, 860, 5, 5, true) --Voidgrasp
end)