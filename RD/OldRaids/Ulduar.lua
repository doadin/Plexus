-- local zone = "Ulduar"
local zoneid = 147
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 63612, 2, 5, 5, true, true) --Lightning Brand
PlexusStatusRaidDebuff:DebuffId(zoneid, 63615, 3, 10, 5, true, true) --Ravage Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 63169, 6, 5, 5, true, true) --Petrify Joints

--Razorscale
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Razorscale")
PlexusStatusRaidDebuff:DebuffId(zoneid, 64771, 11, 5, 5, true) --Fuse Armor

--Ignis the Furnace Master
PlexusStatusRaidDebuff:BossNameId(zoneid, 15, "Ignis the Furnace Master")
PlexusStatusRaidDebuff:DebuffId(zoneid, 62548, 16, 5, 5, true) --Scorch
PlexusStatusRaidDebuff:DebuffId(zoneid, 62680, 17, 5, 5) --Flame Jet
PlexusStatusRaidDebuff:DebuffId(zoneid, 62717, 18, 6, 5, true) --Slag Pot

--XT-002
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "XT-002 Deconstructor")
PlexusStatusRaidDebuff:DebuffId(zoneid, 63024, 21, 5, 5, true) --Gravity Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 63018, 22, 5, 5, true) --Light Bomb

--The Assembly of Iron
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "The Iron Council")
PlexusStatusRaidDebuff:DebuffId(zoneid, 61888, 31, 5, 5, true) --Overwhelming Power
PlexusStatusRaidDebuff:DebuffId(zoneid, 62269, 32, 6, 5) --Rune of Death
PlexusStatusRaidDebuff:DebuffId(zoneid, 61903, 33, 5, 5) --Fusion Punch
PlexusStatusRaidDebuff:DebuffId(zoneid, 61912, 34, 5, 5, true) --Static Disruption

--Kologarn
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Kologarn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 64290, 41, 5, 5, true) --Stone Grip
PlexusStatusRaidDebuff:DebuffId(zoneid, 63355, 42, 10, 5, true, true) --Crunch Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 62055, 43, 5, 5, false, true) --Brittle Skin

--Hodir
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Hodir")
PlexusStatusRaidDebuff:DebuffId(zoneid, 62469, 51, 5, 5) --Freeze
PlexusStatusRaidDebuff:DebuffId(zoneid, 61969, 52, 10, 5) --Flash Freeze
PlexusStatusRaidDebuff:DebuffId(zoneid, 62188, 53, 5, 5, false, true, nil, true) --Biting Cold

--Thorim
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Thorim")
PlexusStatusRaidDebuff:DebuffId(zoneid, 62042, 61, 5, 5) --Stormhammer
PlexusStatusRaidDebuff:DebuffId(zoneid, 62130, 62, 10, 5, true) --Unbalancing Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 62526, 63, 5, 5, true) --Rune Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 62470, 64, 5, 5, false, false, nil, true) --Deafening Thunder
PlexusStatusRaidDebuff:DebuffId(zoneid, 62331, 65, 5, 5) --Impale

--Freya
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Freya")
PlexusStatusRaidDebuff:DebuffId(zoneid, 62589, 71, 5, 5, true) --Nature's Fury
PlexusStatusRaidDebuff:DebuffId(zoneid, 62861, 73, 5, 5) --Iron Roots

--Mimiron
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Mimiron")
PlexusStatusRaidDebuff:DebuffId(zoneid, 63666, 81, 5, 5, true) --Napalm Shell
PlexusStatusRaidDebuff:DebuffId(zoneid, 62997, 82, 5, 5, true) --Plasma Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 64668, 83, 5, 5) --Magnetic Field

--General Vezax
PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "General Vezax")
PlexusStatusRaidDebuff:DebuffId(zoneid, 63276, 91, 10, 5, true) --Mark of the Faceless
PlexusStatusRaidDebuff:DebuffId(zoneid, 63322, 92, 5, 5, false, true) --Saronite Vapors

--Yogg-Saron
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Yogg-Saron")
PlexusStatusRaidDebuff:DebuffId(zoneid, 63134, 101, 10, 5, true) --Sara's Bless
PlexusStatusRaidDebuff:DebuffId(zoneid, 63138, 102, 5, 10, true, false, {r=1,g=0,b=0}) --Sara's Fevor
PlexusStatusRaidDebuff:DebuffId(zoneid, 63830, 103, 5, 5, true) --Malady of the Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 63802, 104, 5, 5) --Brain Link(Heroic)
PlexusStatusRaidDebuff:DebuffId(zoneid, 63042, 105, 5, 5, true) --Dominate Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 64156, 106, 5, 7) --Apathy
PlexusStatusRaidDebuff:DebuffId(zoneid, 64153, 107, 5, 7) --Black Plague
PlexusStatusRaidDebuff:DebuffId(zoneid, 64157, 108, 5, 7) --Curse of Doom
PlexusStatusRaidDebuff:DebuffId(zoneid, 64152, 109, 5, 7) --Draining Poison (Heroic)
PlexusStatusRaidDebuff:DebuffId(zoneid, 64125, 110, 10, 5) --Squeeze
PlexusStatusRaidDebuff:DebuffId(zoneid, 63050, 111, 5, 5, false, false, nil, true) --Sanity

--Algalon
PlexusStatusRaidDebuff:BossNameId(zoneid, 120, "Algalon the Observer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 64412, 121, 5, 5, true, true) --Phase Punch

