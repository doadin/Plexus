-- local zone = "Firelands"
local zoneid = 367
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

--en_zone, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon

--Trash
--Flamewaker Forward Guard
PlexusStatusRaidDebuff:DebuffId(zoneid, 76622, 1, 4, 4, true, true) --Sunder Armor
PlexusStatusRaidDebuff:DebuffId(zoneid, 99610, 1, 5, 5) --Shockwave
--Flamewaker Pathfinder
PlexusStatusRaidDebuff:DebuffId(zoneid, 99695, 1, 4, 4) --Flaming Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 99800, 1, 4, 4) --Ensnare
--Flamewaker Cauterizer
--PlexusStatusRaidDebuff:DebuffId(zoneid, 99625, 1, 4, 4) --Conflagration (Magic/dispellable)
--Flamewaker Centurion
PlexusStatusRaidDebuff:DebuffId(zoneid, 16856, 1, 4, 4) --Mortal Strike
--Fire Scorpion
PlexusStatusRaidDebuff:DebuffId(zoneid, 99993, 1, 4, 4, true, true) --Fiery Blood
--Molten Lord
PlexusStatusRaidDebuff:DebuffId(zoneid, 100767, 1, 4, 4, true, true) --Melt Armor
--Ancient Core Hound
--PlexusStatusRaidDebuff:DebuffId(zoneid, 99692, 1, 4, 4) --Terrifying Roar (Magic/dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 99693, 1, 4, 4) --Dinner Time
-- Unstable Magma
PlexusStatusRaidDebuff:DebuffId(zoneid, 100549, 1, 4, 4) --Lava Surge
-- Hell Hound
PlexusStatusRaidDebuff:DebuffId(zoneid, 100057, 1, 4, 4, true, true) --Rend Flesh
-- Inferno Hawk
PlexusStatusRaidDebuff:DebuffId(zoneid, 99762, 1, 1, 1, false, false, 0, true) --Flames of the Firehawk
-- Unbound Pyrelord
PlexusStatusRaidDebuff:DebuffId(zoneid, 101166, 1, 4, 4) --Ignite
-- Flamewaker Subjugator
PlexusStatusRaidDebuff:DebuffId(zoneid, 100526, 1, 4, 4, true, true) --Blistering Wound
-- Harbinger of Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 100095, 1, 4, 4) --Fieroclast Barrage
-- Druid of the Flame
-- Add Reckless Leap and Sunfire and put Reckless Leap higher priority
-- so that you can dispell stuns before dots
PlexusStatusRaidDebuff:DebuffId(zoneid, 99646, 1, 5, 5) --Reckless Leap (Magic/dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 99626, 1, 4, 4) --Sunfire (Magic/dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 99650, 1, 4, 4, true, true) --Reactive flames
--Magma
PlexusStatusRaidDebuff:DebuffId(zoneid, 97151, 1, 4, 4, true, true) --Magma
-- Soul Burn is dispelable magic
-- Tormented Protector (Legendary Quest)
PlexusStatusRaidDebuff:DebuffId(zoneid, 100274, 1, 1, 1, false, false, 0, true) --Blessed Defender of Nordrassil
-- Volcanus (Legendary Quest)
PlexusStatusRaidDebuff:DebuffId(zoneid, 100324, 1, 4, 4) --Molten Fixation

--Beth'tilac
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Beth'tilac")
PlexusStatusRaidDebuff:DebuffId(zoneid, 99506, 11, 5, 5, true, true) --The Widow's Kiss
--Cinderweb Drone
PlexusStatusRaidDebuff:DebuffId(zoneid, 49026, 12, 6, 6) --Fixate (Heroic)
--Cinderweb Spinner
PlexusStatusRaidDebuff:DebuffId(zoneid, 97202, 13, 5, 5) --Fiery Web Spin
--Cinderweb Spiderling
PlexusStatusRaidDebuff:DebuffId(zoneid, 97079, 14, 4, 4) --Seeping Venom
--Cinderweb Broodling (Heroic)
--Also cast fixate, same one as above?
-- Upstairs
PlexusStatusRaidDebuff:DebuffId(zoneid, 100048, 15, 3, 3) --Fiery Web Silk

--Lord Rhyolith
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Lord Rhyolith")
PlexusStatusRaidDebuff:DebuffId(zoneid, 98492, 21, 5, 5, true, true) --Eruption

--Alysrazor
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Alysrazor")
PlexusStatusRaidDebuff:DebuffId(zoneid, 101729, 31, 5, 5, true, true) --Blazing Claw
PlexusStatusRaidDebuff:DebuffId(zoneid, 100094, 32, 4, 4, true, true) --Fieroblast
PlexusStatusRaidDebuff:DebuffId(zoneid, 99389, 33, 3, 3) --Imprinted
PlexusStatusRaidDebuff:DebuffId(zoneid, 99308, 34, 6, 6) --Gushing Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 100640, 35, 6, 6, true, true) --Harsh Winds
PlexusStatusRaidDebuff:DebuffId(zoneid, 100555, 36, 6, 6) --Smouldering Roots
PlexusStatusRaidDebuff:DebuffId(zoneid, 99275, 37, 6, 6) --Molten Boulder
--Do we want to show these?
PlexusStatusRaidDebuff:DebuffId(zoneid, 99461, 38, 4, 4, true, true) --Blazing Power
--PlexusStatusRaidDebuff:DebuffId(zoneid, 98734, 32, 4, 4, true, true) --Molten Feather
--PlexusStatusRaidDebuff:DebuffId(zoneid, 98619, 32, 4, 4) --Wings of Flame
--PlexusStatusRaidDebuff:DebuffId(zoneid, 100029, 32, 4, 4, true, true) --Alysra's Razor

--Shannox
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Shannox")
PlexusStatusRaidDebuff:DebuffId(zoneid, 99936, 41, 5, 5, true, true) --Jagged Tear
PlexusStatusRaidDebuff:DebuffId(zoneid, 99837, 42, 7, 7) --Crystal Prison Trap Effect
PlexusStatusRaidDebuff:DebuffId(zoneid, 101208, 43, 4, 4) --Immolation Trap
PlexusStatusRaidDebuff:DebuffId(zoneid, 99840, 44, 4, 4) --Magma Rupture
-- Riplimp
-- PlexusStatusRaidDebuff:DebuffId(zoneid, 99937, 41, 5, 5, true, true) --Jagged Tear
-- Rageface
PlexusStatusRaidDebuff:DebuffId(zoneid, 99947, 45, 6, 6) --Face Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 100415, 46, 5, 5) --Rage

--Baleroc
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Baleroc")
PlexusStatusRaidDebuff:DebuffId(zoneid, 99252, 51, 5, 5, true, true) --Blaze of Glory
PlexusStatusRaidDebuff:DebuffId(zoneid, 99256, 52, 5, 5, true, true) --Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 99403, 53, 6, 6) --Tormented
PlexusStatusRaidDebuff:DebuffId(zoneid, 99516, 54, 7, 7) --Countdown
PlexusStatusRaidDebuff:DebuffId(zoneid, 99353, 55, 7, 7) --Decimating Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 100908, 56, 6, 6, true, true) --Fiery Torment
-- These don't show up currently because they are buffs
PlexusStatusRaidDebuff:DebuffId(zoneid, 99262, 57, 4, 4, true, true) --Vital Spark
PlexusStatusRaidDebuff:DebuffId(zoneid, 99263, 58, 4, 4, true, true) --Vital Flame

--Majordomo Staghelm
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Majordomo Staghelm")
PlexusStatusRaidDebuff:DebuffId(zoneid, 98535, 61, 5, 5, true, true) --Leaping Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 98443, 62, 6, 6) --Fiery Cyclone
PlexusStatusRaidDebuff:DebuffId(zoneid, 98450, 63, 5, 5) --Searing Seeds
--Burning Orbs
PlexusStatusRaidDebuff:DebuffId(zoneid, 100210, 65, 6, 6, true, true) --Burning Orb
-- ?
PlexusStatusRaidDebuff:DebuffId(zoneid, 96993, 64, 5, 5) --Stay Withdrawn?

--Ragnaros
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Ragnaros")
PlexusStatusRaidDebuff:DebuffId(zoneid, 99399, 71, 6, 6, true, true) --Burning Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 100293, 72, 7, 7) --Lava Wave
PlexusStatusRaidDebuff:DebuffId(zoneid, 100238, 73, 4, 4, true, true) --Magma Trap Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 98313, 74, 4, 4, true, true) --Magma Blast
--Heroic Phase 4
PlexusStatusRaidDebuff:DebuffId(zoneid, 100941, 75, 4, 4) --Dreadflame
PlexusStatusRaidDebuff:DebuffId(zoneid, 100594, 75, 4, 4, true, true) --Superheated
--Lava Scion
PlexusStatusRaidDebuff:DebuffId(zoneid, 100460, 76, 6, 6) --Blazing Heat
--Son of Flame
--Lava
PlexusStatusRaidDebuff:DebuffId(zoneid, 98981, 77, 5, 5) --Lava Bolt
--Molten Elemental
--Living Meteor
PlexusStatusRaidDebuff:DebuffId(zoneid, 100249, 78, 5, 5, true, true) --Combustion
--Molten Wyrms
PlexusStatusRaidDebuff:DebuffId(zoneid, 99613, 79, 6, 6, true, true) --Molten Blast

