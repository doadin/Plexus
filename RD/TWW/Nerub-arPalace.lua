-- local zone = "Nerub-ar Palace"
local zoneid = 2292
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- "Ulgrax the Devourer"
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Ulgrax the Devourer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 434776, 101, 5, 5, true) --Carnivorous Contest
PlexusStatusRaidDebuff:DebuffId(zoneid, 440904, 102, 5, 5, true) --Devour
PlexusStatusRaidDebuff:DebuffId(zoneid, 455847, 103, 5, 5, true) --Battered and Bruised
PlexusStatusRaidDebuff:DebuffId(zoneid, 440849, 104, 5, 5, true) --Contemptful Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 441451, 105, 5, 5, true) --Stalker's Webbing
PlexusStatusRaidDebuff:DebuffId(zoneid, 439419, 106, 5, 5, true) --Stalker's Netting
PlexusStatusRaidDebuff:DebuffId(zoneid, 455831, 107, 5, 5, true) --Hardened Netting
PlexusStatusRaidDebuff:DebuffId(zoneid, 435138, 108, 5, 5, true) --Digestive Acid
PlexusStatusRaidDebuff:DebuffId(zoneid, 435136, 109, 5, 5, true) --Venomous Lash
PlexusStatusRaidDebuff:DebuffId(zoneid, 434697, 110, 5, 5, true) --Brutal Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 434705, 111, 5, 5, true) --Tenderized
PlexusStatusRaidDebuff:DebuffId(zoneid, 435341, 112, 5, 5, true) --Hulking Crash
PlexusStatusRaidDebuff:DebuffId(zoneid, 440177, 113, 5, 5, true) --Ready to Feed
PlexusStatusRaidDebuff:DebuffId(zoneid, 438012, 114, 5, 5, true) --Hungering Bellows
PlexusStatusRaidDebuff:DebuffId(zoneid, 438041, 115, 5, 5, true) --Insatiable Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 436255, 116, 5, 5, true) --Juggernaut Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 439037, 117, 5, 5, true) --Disembowel
PlexusStatusRaidDebuff:DebuffId(zoneid, 438657, 118, 5, 5, true) --Chunky Viscera
PlexusStatusRaidDebuff:DebuffId(zoneid, 438324, 119, 5, 5, true) --Feed
PlexusStatusRaidDebuff:DebuffId(zoneid, 455870, 120, 5, 5, true) --Bioactive Spines
PlexusStatusRaidDebuff:DebuffId(zoneid, 443842, 121, 5, 5, true) --Swallowing Darkness

-- "The Bloodbound Horror"
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "The Bloodbound Horror")
PlexusStatusRaidDebuff:DebuffId(zoneid, 444363, 201, 5, 5, true) --Gruesome Disgorge
PlexusStatusRaidDebuff:DebuffId(zoneid, 462306, 202, 5, 5, true) --The Unseeming
PlexusStatusRaidDebuff:DebuffId(zoneid, 451288, 203, 5, 5, true) --Black Bulwark
PlexusStatusRaidDebuff:DebuffId(zoneid, 445016, 204, 5, 5, true) --Spectral Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 445174, 205, 5, 5, true) --Manifest Horror
PlexusStatusRaidDebuff:DebuffId(zoneid, 445257, 206, 5, 5, true) --Blood Pact
PlexusStatusRaidDebuff:DebuffId(zoneid, 445570, 207, 5, 5, true) --Unseeming Blight
PlexusStatusRaidDebuff:DebuffId(zoneid, 452237, 208, 5, 5, true) --Bloodcurdle
PlexusStatusRaidDebuff:DebuffId(zoneid, 445936, 209, 5, 5, true) --Spewing Hemorrhage
PlexusStatusRaidDebuff:DebuffId(zoneid, 442530, 210, 5, 5, true) --Goresplatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 461876, 211, 5, 5, true) --Seeping Transfusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 443305, 212, 5, 5, true) --Crimson Rain
PlexusStatusRaidDebuff:DebuffId(zoneid, 443042, 213, 5, 5, true) --Grasp From Beyond
PlexusStatusRaidDebuff:DebuffId(zoneid, 438696, 214, 5, 5, true) --Black Sepsis

-- "Sikran, Captain of the Sureki"
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Sikran, Captain of the Sureki")
PlexusStatusRaidDebuff:DebuffId(zoneid, 433475, 301, 5, 5, true) --Phase Blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 458272, 302, 5, 5, true) --Cosmic Simulacrum
PlexusStatusRaidDebuff:DebuffId(zoneid, 459273, 303, 5, 5, true) --Cosmic Shards
PlexusStatusRaidDebuff:DebuffId(zoneid, 459785, 304, 5, 5, true) --Cosmic Residue
PlexusStatusRaidDebuff:DebuffId(zoneid, 461401, 305, 5, 5, true) --Collapsing Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 442428, 306, 5, 5, true) --Decimate
PlexusStatusRaidDebuff:DebuffId(zoneid, 456420, 307, 5, 5, true) --Shattering Sweep
PlexusStatusRaidDebuff:DebuffId(zoneid, 439511, 308, 5, 5, true) --Captain's Flourish
PlexusStatusRaidDebuff:DebuffId(zoneid, 435401, 309, 5, 5, true) --Expose
PlexusStatusRaidDebuff:DebuffId(zoneid, 432969, 310, 5, 5, true) --Phase Lunge
PlexusStatusRaidDebuff:DebuffId(zoneid, 439559, 311, 5, 5, true) --Rain of Arrows


-- "Rasha'nan"
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Rasha'nan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 439789, 401, 5, 5, true) --Rolling Acid
PlexusStatusRaidDebuff:DebuffId(zoneid, 439785, 402, 5, 5, true) --Corrosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 439787, 403, 5, 5, true) --Acidic Stupor
PlexusStatusRaidDebuff:DebuffId(zoneid, 439776, 404, 5, 5, true) --Acid Pools
PlexusStatusRaidDebuff:DebuffId(zoneid, 439784, 405, 5, 5, true) --Spinneret's Strands
PlexusStatusRaidDebuff:DebuffId(zoneid, 439778, 406, 5, 5, true) --Spinneret's Websnap
PlexusStatusRaidDebuff:DebuffId(zoneid, 460789, 407, 5, 5, true) --Tacky Threads
PlexusStatusRaidDebuff:DebuffId(zoneid, 439780, 408, 5, 5, true) --Sticky Webs
PlexusStatusRaidDebuff:DebuffId(zoneid, 439815, 409, 5, 5, true) --Infested Spawn
PlexusStatusRaidDebuff:DebuffId(zoneid, 455287, 410, 5, 5, true) --Infested Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 454989, 411, 5, 5, true) --Enveloping Webs
PlexusStatusRaidDebuff:DebuffId(zoneid, 444687, 412, 5, 5, true) --Savage Assault
PlexusStatusRaidDebuff:DebuffId(zoneid, 458067, 413, 5, 5, true) --Savage Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 439795, 414, 5, 5, true) --Web Reave
PlexusStatusRaidDebuff:DebuffId(zoneid, 439811, 415, 5, 5, true) --Erosive Spray
PlexusStatusRaidDebuff:DebuffId(zoneid, 440193, 416, 5, 5, true) --Lingering Erosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 452806, 417, 5, 5, true) --Acidic Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 457877, 418, 5, 5, true) --Acidic Carapace
PlexusStatusRaidDebuff:DebuffId(zoneid, 444094, 419, 5, 5, true) --Caustic Hail
PlexusStatusRaidDebuff:DebuffId(zoneid, 439792, 420, 5, 5, true) --Tacky Burst

-- "Broodtwister Ovi'nax"
PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Broodtwister Ovi'nax")
PlexusStatusRaidDebuff:DebuffId(zoneid, 442526, 501, 5, 5, true) --Experimental Dosage
PlexusStatusRaidDebuff:DebuffId(zoneid, 446694, 502, 5, 5, true) --Mutation: Necrotic
PlexusStatusRaidDebuff:DebuffId(zoneid, 438807, 503, 5, 5, true) --Vicious Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 458212, 504, 5, 5, true) --Necrotic Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 446690, 505, 5, 5, true) --Mutation: Ravenous
PlexusStatusRaidDebuff:DebuffId(zoneid, 446700, 506, 5, 5, true) --Poison Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 442263, 507, 5, 5, true) --Mutation: Accelerated
PlexusStatusRaidDebuff:DebuffId(zoneid, 442251, 508, 5, 5, true) --Fixate
PlexusStatusRaidDebuff:DebuffId(zoneid, 442257, 509, 5, 5, true) --Infest
PlexusStatusRaidDebuff:DebuffId(zoneid, 442430, 510, 5, 5, true) --Ingest Black Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 450362, 511, 5, 5, true) --Unstable Infusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 441612, 512, 5, 5, true) --Vile Discharge
PlexusStatusRaidDebuff:DebuffId(zoneid, 452802, 513, 5, 5, true) --Catalyze Mutation
PlexusStatusRaidDebuff:DebuffId(zoneid, 442799, 514, 5, 5, true) --Sanguine Overflow
PlexusStatusRaidDebuff:DebuffId(zoneid, 450661, 515, 5, 5, true) --Caustic Reaction
PlexusStatusRaidDebuff:DebuffId(zoneid, 446349, 516, 5, 5, true) --Sticky Web
PlexusStatusRaidDebuff:DebuffId(zoneid, 446351, 517, 5, 5, true) --Web Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 441362, 518, 5, 5, true) --Volatile Concoction

-- "Nexus-Princess Ky'veza"
PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "Nexus-Princess Ky'veza")
PlexusStatusRaidDebuff:DebuffId(zoneid, 436867, 601, 5, 5, true) --Assassination
PlexusStatusRaidDebuff:DebuffId(zoneid, 437343, 602, 5, 5, true) --Queensbane
PlexusStatusRaidDebuff:DebuffId(zoneid, 439409, 603, 5, 5, true) --Dark Viscera
PlexusStatusRaidDebuff:DebuffId(zoneid, 437620, 604, 5, 5, true) --Nether Rift
PlexusStatusRaidDebuff:DebuffId(zoneid, 437786, 605, 5, 5, true) --Atomized
PlexusStatusRaidDebuff:DebuffId(zoneid, 439576, 606, 5, 5, true) --Nexus Daggers
PlexusStatusRaidDebuff:DebuffId(zoneid, 436950, 607, 5, 5, true) --Stalking Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 448364, 608, 5, 5, true) --Death Masks
PlexusStatusRaidDebuff:DebuffId(zoneid, 447174, 609, 5, 5, true) --Death Cloak
PlexusStatusRaidDebuff:DebuffId(zoneid, 438245, 610, 5, 5, true) --Twilight Massacre
PlexusStatusRaidDebuff:DebuffId(zoneid, 436749, 611, 5, 5, true) --Reaper
PlexusStatusRaidDebuff:DebuffId(zoneid, 440377, 612, 5, 5, true) --Void Shredders
PlexusStatusRaidDebuff:DebuffId(zoneid, 440576, 613, 5, 5, true) --Chasmal Gash
PlexusStatusRaidDebuff:DebuffId(zoneid, 435414, 614, 5, 5, true) --Starless Night
PlexusStatusRaidDebuff:DebuffId(zoneid, 442278, 615, 5, 5, true) --Eternal Night
PlexusStatusRaidDebuff:DebuffId(zoneid, 435486, 616, 5, 5, true) --Regicide
PlexusStatusRaidDebuff:DebuffId(zoneid, 434645, 617, 5, 5, true) --Eclipse

-- "The Silken Court"
PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "The Silken Court")
PlexusStatusRaidDebuff:DebuffId(zoneid, 455796, 701, 5, 5, true) --Whispers of The Silken Court
PlexusStatusRaidDebuff:DebuffId(zoneid, 455849, 702, 5, 5, true) --Mark of Paranoia
PlexusStatusRaidDebuff:DebuffId(zoneid, 460357, 703, 5, 5, true) --Mote of Overwrought Paranoia
PlexusStatusRaidDebuff:DebuffId(zoneid, 460359, 704, 5, 5, true) --Void Degeneration
PlexusStatusRaidDebuff:DebuffId(zoneid, 455850, 705, 5, 5, true) --Mark of Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 460263, 706, 5, 5, true) --Mote of Unrelenting Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 460281, 707, 5, 5, true) --Burning Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 455863, 708, 5, 5, true) --Mark of Death
PlexusStatusRaidDebuff:DebuffId(zoneid, 455363, 709, 5, 5, true) --Queen's Proclamation
PlexusStatusRaidDebuff:DebuffId(zoneid, 440158, 710, 5, 5, true) --Reckless Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 460360, 711, 5, 5, true) --Burrowed Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 438801, 712, 5, 5, true) --Call of the Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 438706, 713, 5, 5, true) --Harden Carapace
PlexusStatusRaidDebuff:DebuffId(zoneid, 438773, 714, 5, 5, true) --Shattered Shell
PlexusStatusRaidDebuff:DebuffId(zoneid, 455080, 715, 5, 5, true) --Scarab Lord's Perseverance
PlexusStatusRaidDebuff:DebuffId(zoneid, 440504, 716, 5, 5, true) --Impaling Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 449857, 717, 5, 5, true) --Impaled
PlexusStatusRaidDebuff:DebuffId(zoneid, 438218, 718, 5, 5, true) --Piercing Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 439992, 719, 5, 5, true) --Web Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 440001, 720, 5, 5, true) --Binding Webs
PlexusStatusRaidDebuff:DebuffId(zoneid, 440179, 721, 5, 5, true) --Entangled
PlexusStatusRaidDebuff:DebuffId(zoneid, 438656, 722, 5, 5, true) --Venomous Rain
PlexusStatusRaidDebuff:DebuffId(zoneid, 450045, 723, 5, 5, true) --Skittering Leap
PlexusStatusRaidDebuff:DebuffId(zoneid, 438200, 724, 5, 5, true) --Poison Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 450980, 725, 5, 5, true) --Shatter Existence
PlexusStatusRaidDebuff:DebuffId(zoneid, 460600, 726, 5, 5, true) --Entropic Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 463461, 727, 5, 5, true) --Entropic Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 438677, 728, 5, 5, true) --Stinging Swarm
PlexusStatusRaidDebuff:DebuffId(zoneid, 449993, 729, 5, 5, true) --Stinging Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 456235, 730, 5, 5, true) --Stinging Delirium
PlexusStatusRaidDebuff:DebuffId(zoneid, 438355, 731, 5, 5, true) --Cataclysmic Entropy
PlexusStatusRaidDebuff:DebuffId(zoneid, 441634, 732, 5, 5, true) --Web Vortex
PlexusStatusRaidDebuff:DebuffId(zoneid, 450129, 733, 5, 5, true) --Entropic Desolation
PlexusStatusRaidDebuff:DebuffId(zoneid, 441782, 734, 5, 5, true) --Strands of Reality
PlexusStatusRaidDebuff:DebuffId(zoneid, 450483, 735, 5, 5, true) --Void Step
PlexusStatusRaidDebuff:DebuffId(zoneid, 441772, 736, 5, 5, true) --Void Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 451277, 737, 5, 5, true) --Spike Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 460364, 738, 5, 5, true) --Seismic Upheaval
PlexusStatusRaidDebuff:DebuffId(zoneid, 463464, 739, 5, 5, true) --Seismic Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 443092, 740, 5, 5, true) --Spike Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 443063, 741, 5, 5, true) --Unleashed Swarm

-- "Queen Ansurek"
PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Queen Ansurek")
PlexusStatusRaidDebuff:DebuffId(zoneid, 437592, 801, 5, 5, true) --Reactive Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 438846, 802, 5, 5, true) --Reactive Froth
PlexusStatusRaidDebuff:DebuffId(zoneid, 451278, 803, 5, 5, true) --Concentrated Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 464628, 804, 5, 5, true) --Reaction Trauma
PlexusStatusRaidDebuff:DebuffId(zoneid, 464638, 805, 5, 5, true) --Frothy Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 464643, 806, 5, 5, true) --Lingering Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 460133, 807, 5, 5, true) --Toxic Reaction
PlexusStatusRaidDebuff:DebuffId(zoneid, 438481, 808, 5, 5, true) --Toxic Waves
PlexusStatusRaidDebuff:DebuffId(zoneid, 437078, 809, 5, 5, true) --Acid
PlexusStatusRaidDebuff:DebuffId(zoneid, 437417, 810, 5, 5, true) --Venom Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 441556, 811, 5, 5, true) --Reaction Vapor
PlexusStatusRaidDebuff:DebuffId(zoneid, 439814, 812, 5, 5, true) --Silken Tomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 441958, 813, 5, 5, true) --Grasping Silk
PlexusStatusRaidDebuff:DebuffId(zoneid, 440899, 814, 5, 5, true) --Liquefy
PlexusStatusRaidDebuff:DebuffId(zoneid, 441084, 815, 5, 5, true) --Acid Explosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 437093, 816, 5, 5, true) --Feast
PlexusStatusRaidDebuff:DebuffId(zoneid, 439299, 817, 5, 5, true) --Web Blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 440607, 818, 5, 5, true) --Acrid Presence
PlexusStatusRaidDebuff:DebuffId(zoneid, 447076, 819, 5, 5, true) --Predation
PlexusStatusRaidDebuff:DebuffId(zoneid, 447170, 820, 5, 5, true) --Predation Threads
PlexusStatusRaidDebuff:DebuffId(zoneid, 447456, 821, 5, 5, true) --Paralyzing Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 451607, 822, 5, 5, true) --Paralyzing Waves
PlexusStatusRaidDebuff:DebuffId(zoneid, 447411, 823, 5, 5, true) --Wrest
PlexusStatusRaidDebuff:DebuffId(zoneid, 447240, 824, 5, 5, true) --Devour
PlexusStatusRaidDebuff:DebuffId(zoneid, 460366, 825, 5, 5, true) --Shadowgate
PlexusStatusRaidDebuff:DebuffId(zoneid, 464056, 826, 5, 5, true) --Gloom Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 447983, 827, 5, 5, true) --Gloom Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 443403, 828, 5, 5, true) --Gloom
PlexusStatusRaidDebuff:DebuffId(zoneid, 460218, 829, 5, 5, true) --Shadowy Distortion
PlexusStatusRaidDebuff:DebuffId(zoneid, 448660, 830, 5, 5, true) --Acid Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 449940, 831, 5, 5, true) --Acidic Apocalypse
PlexusStatusRaidDebuff:DebuffId(zoneid, 447950, 832, 5, 5, true) --Shadowblast
PlexusStatusRaidDebuff:DebuffId(zoneid, 447999, 833, 5, 5, true) --Radiating Gloom
PlexusStatusRaidDebuff:DebuffId(zoneid, 448176, 834, 5, 5, true) --Gloom Orbs
PlexusStatusRaidDebuff:DebuffId(zoneid, 448046, 835, 5, 5, true) --Gloom Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 448300, 836, 5, 5, true) --Echoing Connection
PlexusStatusRaidDebuff:DebuffId(zoneid, 448488, 837, 5, 5, true) --Worshipper's Protection
PlexusStatusRaidDebuff:DebuffId(zoneid, 462541, 838, 5, 5, true) --Cosmic Rupture
PlexusStatusRaidDebuff:DebuffId(zoneid, 464799, 839, 5, 5, true) --Lingering Fallout
PlexusStatusRaidDebuff:DebuffId(zoneid, 462564, 840, 5, 5, true) --Cosmic Fallout
PlexusStatusRaidDebuff:DebuffId(zoneid, 448458, 841, 5, 5, true) --Cosmic Apocalypse
PlexusStatusRaidDebuff:DebuffId(zoneid, 448147, 842, 5, 5, true) --Oust
PlexusStatusRaidDebuff:DebuffId(zoneid, 460315, 843, 5, 5, true) --Ousting Fragments
PlexusStatusRaidDebuff:DebuffId(zoneid, 451600, 844, 5, 5, true) --Expulsion Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 455374, 845, 5, 5, true) --Dark Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 449235, 846, 5, 5, true) --Caustic Fangs
PlexusStatusRaidDebuff:DebuffId(zoneid, 443888, 847, 5, 5, true) --Abyssal Infusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 443915, 848, 5, 5, true) --Abyssal Conduit
PlexusStatusRaidDebuff:DebuffId(zoneid, 455387, 849, 5, 5, true) --Abyssal Reverberation
PlexusStatusRaidDebuff:DebuffId(zoneid, 444507, 850, 5, 5, true) --Conduit Ejections
PlexusStatusRaidDebuff:DebuffId(zoneid, 444502, 851, 5, 5, true) --Conduit Collapse
PlexusStatusRaidDebuff:DebuffId(zoneid, 445422, 852, 5, 5, true) --Frothing Gluttony
PlexusStatusRaidDebuff:DebuffId(zoneid, 445623, 853, 5, 5, true) --Glutton Threads
PlexusStatusRaidDebuff:DebuffId(zoneid, 445877, 854, 5, 5, true) --Froth Vapor
PlexusStatusRaidDebuff:DebuffId(zoneid, 461408, 855, 5, 5, true) --Consume
PlexusStatusRaidDebuff:DebuffId(zoneid, 444829, 856, 5, 5, true) --Queen's Summons
PlexusStatusRaidDebuff:DebuffId(zoneid, 445152, 857, 5, 5, true) --Acolyte's Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 446012, 858, 5, 5, true) --Essence Scarred
PlexusStatusRaidDebuff:DebuffId(zoneid, 445013, 859, 5, 5, true) --Dark Barrier
PlexusStatusRaidDebuff:DebuffId(zoneid, 445021, 860, 5, 5, true) --Null Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 438976, 861, 5, 5, true) --Royal Condemnation
PlexusStatusRaidDebuff:DebuffId(zoneid, 441865, 862, 5, 5, true) --Royal Shackles
PlexusStatusRaidDebuff:DebuffId(zoneid, 441872, 863, 5, 5, true) --Royal Cocoon
PlexusStatusRaidDebuff:DebuffId(zoneid, 443325, 864, 5, 5, true) --Infest
PlexusStatusRaidDebuff:DebuffId(zoneid, 443667, 865, 5, 5, true) --Infested Gloomburst
PlexusStatusRaidDebuff:DebuffId(zoneid, 443720, 866, 5, 5, true) --Gloom Hatchling
PlexusStatusRaidDebuff:DebuffId(zoneid, 443336, 867, 5, 5, true) --Gorge
PlexusStatusRaidDebuff:DebuffId(zoneid, 443396, 868, 5, 5, true) --Gloom Splatter
PlexusStatusRaidDebuff:DebuffId(zoneid, 445268, 869, 5, 5, true) --Dreadful Presence
PlexusStatusRaidDebuff:DebuffId(zoneid, 451832, 870, 5, 5, true) --Cataclysmic Evolution
