-- local zone = "Vault of the Incarnates"
local zoneid = 2119
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

-- "Eranog"
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Eranog")
PlexusStatusRaidDebuff:DebuffId(zoneid, 370597, 101, 5, 5, true) --kill-order
PlexusStatusRaidDebuff:DebuffId(zoneid, 371059, 102, 5, 5, true) --melting-armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 371955, 103, 5, 5, true) --rising-heat
PlexusStatusRaidDebuff:DebuffId(zoneid, 370410, 104, 5, 5, true) --pulsing-flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 394906, 105, 6, 6, true, true) -- Burning Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 396023, 106, 5, 5, true, true) -- Incinerating Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 390715, 107, 6, 6, true) -- Flamerift
PlexusStatusRaidDebuff:DebuffId(zoneid, 370648, 108, 5, 5) -- Lava Flow

-- "Terros"
PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Terros")
PlexusStatusRaidDebuff:DebuffId(zoneid, 376276, 201, 5, 5, true) --concussive-slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 382776, 202, 5, 5, true) --awakened-earth
PlexusStatusRaidDebuff:DebuffId(zoneid, 381576, 203, 5, 5, true) --seismic-assault
PlexusStatusRaidDebuff:DebuffId(zoneid, 382458, 204, 5, 5) -- Resonant Aftermath
PlexusStatusRaidDebuff:DebuffId(zoneid, 386352, 205, 6, 6, true) -- Rock Blast

-- "The Primal Council"
PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "The Primal Council")
PlexusStatusRaidDebuff:DebuffId(zoneid, 371591, 301, 5, 5, true) --frost-tomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 371857, 302, 5, 5, true) --shivering-lance
PlexusStatusRaidDebuff:DebuffId(zoneid, 371624, 303, 5, 5, true) --conductive-mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 372056, 304, 5, 5, true) --crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 374792, 305, 5, 5, true) --faultline
PlexusStatusRaidDebuff:DebuffId(zoneid, 372027, 306, 5, 5, true) --slashing-blaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 375091, 307, 7, 7, true) -- Meteor Axe
PlexusStatusRaidDebuff:DebuffId(zoneid, 371836, 308, 5, 5, false, true) -- Primal Blizzard
PlexusStatusRaidDebuff:DebuffId(zoneid, 371514, 309, 5, 5) -- Scorched Ground

-- "Sennarth, the Cold Breath"
PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Sennarth, the Cold Breath")
PlexusStatusRaidDebuff:DebuffId(zoneid, 372736, 401, 5, 5, true) --permafrost
PlexusStatusRaidDebuff:DebuffId(zoneid, 372648, 402, 5, 5, true) --pervasive-cold
PlexusStatusRaidDebuff:DebuffId(zoneid, 373817, 403, 5, 5, true) --chilling-aura
PlexusStatusRaidDebuff:DebuffId(zoneid, 372129, 404, 5, 5, true) --web-blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 372044, 405, 5, 5, true) --wrapped-in-webs
PlexusStatusRaidDebuff:DebuffId(zoneid, 372082, 406, 5, 5, true) --enveloping-webs
PlexusStatusRaidDebuff:DebuffId(zoneid, 371976, 407, 5, 5, true) --chilling-blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 372030, 408, 5, 5, true) --sticky-webbing
PlexusStatusRaidDebuff:DebuffId(zoneid, 372055, 409, 5, 5, true) --icy-ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 372055, 410, 5, 5) -- Icy Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 373048, 411, 6, 6, true) -- Suffocating Webs

-- "Dathea, Ascended"
PlexusStatusRaidDebuff:BossNameId(zoneid, 500, "Dathea, Ascended")
PlexusStatusRaidDebuff:DebuffId(zoneid, 378095, 501, 5, 5, true) --crushing-atmosphere
PlexusStatusRaidDebuff:DebuffId(zoneid, 377819, 502, 5, 5, true) --lingering-slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 374900, 503, 5, 5, true) --microburst
PlexusStatusRaidDebuff:DebuffId(zoneid, 376802, 504, 5, 5, true) --razor-winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 375580, 505, 5, 5, true) --zephyr-slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 390449, 506, 5, 5, true, true) -- Thunderbolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 391686, 507, 6, 6, false, true) -- Conductive Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 388290, 508, 5, 5, true) -- Cyclone

-- "Kurog Grimtotem"
PlexusStatusRaidDebuff:BossNameId(zoneid, 600, "Kurog Grimtotem")
PlexusStatusRaidDebuff:DebuffId(zoneid, 374864, 601, 5, 5, true) --primal-break
PlexusStatusRaidDebuff:DebuffId(zoneid, 372158, 602, 5, 5, true) --sundering-strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 373681, 603, 5, 5, true) --biting-chill
PlexusStatusRaidDebuff:DebuffId(zoneid, 373487, 604, 5, 5, true) --lightning-crash
PlexusStatusRaidDebuff:DebuffId(zoneid, 372514, 605, 5, 5, true) --frost-bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 372517, 606, 5, 5, true) --frozen-solid
PlexusStatusRaidDebuff:DebuffId(zoneid, 377780, 607, 5, 5, true) --skeletal-fractures
PlexusStatusRaidDebuff:DebuffId(zoneid, 374623, 608, 5, 5, true) --frost-binds
PlexusStatusRaidDebuff:DebuffId(zoneid, 374554, 609, 5, 5, true) --lava-pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 391022, 610, 5, 5, true) -- Frigid Torrent
PlexusStatusRaidDebuff:DebuffId(zoneid, 391056, 611, 6, 6) -- Enveloping Earth
PlexusStatusRaidDebuff:DebuffId(zoneid, 396109, 612, 5, 5, false, true) -- Frost Dominance
PlexusStatusRaidDebuff:DebuffId(zoneid, 396106, 613, 5, 5, false, true) -- Flame Dominance
PlexusStatusRaidDebuff:DebuffId(zoneid, 396085, 614, 5, 5, false, true) -- Earth Dominance
PlexusStatusRaidDebuff:DebuffId(zoneid, 396113, 615, 5, 5, false, true) -- Storm Dominance
PlexusStatusRaidDebuff:DebuffId(zoneid, 374554, 616, 5, 5) -- Magma Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 376063, 617, 5, 5, true) -- Flame Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 391696, 618, 5, 5, true) -- Lethal Current
PlexusStatusRaidDebuff:DebuffId(zoneid, 374023, 619, 5, 5, true) -- Searing Carnage
PlexusStatusRaidDebuff:DebuffId(zoneid, 372458, 620, 6, 6, true) -- Absolute Zero
PlexusStatusRaidDebuff:DebuffId(zoneid, 390920, 621, 5, 5, true) -- Shocking Burst

-- "Broodkeeper Diurna"
PlexusStatusRaidDebuff:BossNameId(zoneid, 700, "Broodkeeper Diurna")
PlexusStatusRaidDebuff:DebuffId(zoneid, 378782, 701, 5, 5, true) --mortal-wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 375829, 702, 5, 5, true) --clutchwatchers-rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 378787, 703, 5, 5, true) --crushing-stoneclaws
PlexusStatusRaidDebuff:DebuffId(zoneid, 375871, 704, 5, 5, true) --wildfire
PlexusStatusRaidDebuff:DebuffId(zoneid, 376266, 705, 5, 5, true) --burrowing-strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 375575, 706, 5, 5, true) --flame-sentry
PlexusStatusRaidDebuff:DebuffId(zoneid, 375475, 707, 5, 5, true) --rending-bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 375457, 708, 5, 5, true) --chilling-tantrum
PlexusStatusRaidDebuff:DebuffId(zoneid, 375653, 709, 5, 5, true) --static-jolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 376392, 710, 5, 5, true) --disoriented
PlexusStatusRaidDebuff:DebuffId(zoneid, 375876, 711, 5, 5, true) --icy-shards
PlexusStatusRaidDebuff:DebuffId(zoneid, 375430, 712, 5, 5, true) --sever-tendon
PlexusStatusRaidDebuff:DebuffId(zoneid, 375889, 713, 5, 5) -- Greatstaff's Wrath
PlexusStatusRaidDebuff:DebuffId(zoneid, 380483, 714, 5, 5) -- Empowered Greatstaff's Wrath
PlexusStatusRaidDebuff:DebuffId(zoneid, 388717, 715, 6, 6) -- Icy Shroud
PlexusStatusRaidDebuff:DebuffId(zoneid, 375620, 716, 6, 6, true) -- Ionizing Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 388920, 717, 6, 6) -- Frozen Shroud
PlexusStatusRaidDebuff:DebuffId(zoneid, 375487, 718, 6, 6, true) -- Cauterizing Flashflames
PlexusStatusRaidDebuff:DebuffId(zoneid, 376260, 719, 5, 5, true, true) -- Tremors
PlexusStatusRaidDebuff:DebuffId(zoneid, 375716, 720, 5, 5, true, true) -- Ice Barrage

-- "Raszageth the Storm-Eater"
PlexusStatusRaidDebuff:BossNameId(zoneid, 800, "Raszageth the Storm-Eater")
PlexusStatusRaidDebuff:DebuffId(zoneid, 381615, 801, 5, 5, true) --static-charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 377594, 802, 5, 5, true) --lightning-breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 381249, 803, 5, 5, true) --electrifying-presence
PlexusStatusRaidDebuff:DebuffId(zoneid, 395906, 804, 5, 5, true) -- Electrified Jaws
PlexusStatusRaidDebuff:DebuffId(zoneid, 391285, 805, 6, 6, true, true) -- Thunderstruck Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 388115, 806, 5, 5) -- Lightning Devastation
PlexusStatusRaidDebuff:DebuffId(zoneid, 394576, 807, 5, 5, true) -- Positive Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 394579, 808, 5, 5, true) -- Negative Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 394582, 809, 5, 5) -- Focused Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 394583, 810, 6, 6) -- Scattered Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 377467, 811, 5, 5, true) -- Fulminating Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 390911, 812, 5, 5, true) -- Lingering Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 395929, 813, 5, 5) -- Storm's Spite
PlexusStatusRaidDebuff:DebuffId(zoneid, 377662, 814, 5, 5) -- Static Field
PlexusStatusRaidDebuff:DebuffId(zoneid, 388659, 815, 6, 6, true) -- Tempest Wing
PlexusStatusRaidDebuff:DebuffId(zoneid, 377612, 816, 5, 5, true) -- Hurricane Wing
PlexusStatusRaidDebuff:DebuffId(zoneid, 381442, 817, 5, 5, true) -- Lightning Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 390763, 818, 7, 7, true) -- Thunderous Energy
PlexusStatusRaidDebuff:DebuffId(zoneid, 380573, 819, 5, 5, true) -- Ball Lightning
end)