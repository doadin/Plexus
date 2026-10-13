--local zone = "Black Rook Hold"
local zoneid = 751

local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--M+
PlexusStatusRaidDebuff:DebuffId(zoneid, 240447, 1, 6, 6, true) --Quake
PlexusStatusRaidDebuff:DebuffId(zoneid, 240559, 1, 6, 6, true, true) --Grievous Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 209858, 1, 6, 6, true, true) --Necrotic Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 240443, 1, 6, 6, true, true) --Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 226512, 1, 6, 6, true) --Sanguine Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 409492, 1, 6, 6, true, true) --Afflicted Cry
PlexusStatusRaidDebuff:DebuffId(zoneid, 408805, 1, 6, 6, true) --Destabilize
PlexusStatusRaidDebuff:DebuffId(zoneid, 408556, 1, 6, 6, true) --Entangled
PlexusStatusRaidDebuff:DebuffId(zoneid, 440313, 1, 6, 6, true) --Devouring Rift

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 226512, 1, 6, 6, true) --Sanguine Ichor
PlexusStatusRaidDebuff:DebuffId(zoneid, 225963, 1, 6, 6, true) --Bloodthirsty Leap
PlexusStatusRaidDebuff:DebuffId(zoneid, 225909, 1, 6, 6, true) --Soul Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 214002, 1, 6, 6, true) --Raven's Dive
PlexusStatusRaidDebuff:DebuffId(zoneid, 200261, 1, 6, 6, true) --Bonebreaking Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 200084, 1, 6, 6, true) --Soul Blade
PlexusStatusRaidDebuff:DebuffId(zoneid, 204896, 1, 6, 6, true) --Drain Life
PlexusStatusRaidDebuff:DebuffId(zoneid, 203163, 1, 6, 6, true) --Sic Bats!
PlexusStatusRaidDebuff:DebuffId(zoneid, 197974, 1, 6, 6, true) --Bonecrushing Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 225732, 1, 6, 6, true) --Strike Down

--Amalgam of Souls
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Amalgam of Souls")
PlexusStatusRaidDebuff:DebuffId(zoneid, 194956, 11, 6, 6, true) -- reap-soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 195254, 12, 6, 6, true) -- swirling-scythe
PlexusStatusRaidDebuff:DebuffId(zoneid, 194966, 13, 6, 6, true) -- soul-echoes


--Illysanna Ravencrest
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Illysanna Ravencrest")
PlexusStatusRaidDebuff:DebuffId(zoneid, 197521, 21, 6, 6, true) -- Blazing Trail
PlexusStatusRaidDebuff:DebuffId(zoneid, 197418, 22, 6, 6, true) -- vengeful-shear
PlexusStatusRaidDebuff:DebuffId(zoneid, 197546, 23, 6, 6, true) -- brutal-glaive
PlexusStatusRaidDebuff:DebuffId(zoneid, 197687, 24, 6, 6, true) -- eye-beams
PlexusStatusRaidDebuff:DebuffId(zoneid, 197821, 25, 6, 6, true) -- felblazed-ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 197484, 26, 6, 6, true) -- dark-rush


--Smashspite the Hateful
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Smashspite the Hateful")
PlexusStatusRaidDebuff:DebuffId(zoneid, 224188, 31, 6, 6, true) -- Hateful Charge*
PlexusStatusRaidDebuff:DebuffId(zoneid, 198079, 32, 6, 6, true) -- Hateful Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 198245, 33, 6, 6, true) -- brutal-haymaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 198073, 34, 6, 6, true) -- earthshaking-stomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 198446, 35, 6, 6, true) -- fel-vomit
PlexusStatusRaidDebuff:DebuffId(zoneid, 198501, 36, 6, 6, true) -- fel-vomitus


--Lord Kur'talos Ravencrest
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Lord Kur'talos Ravencrest")
PlexusStatusRaidDebuff:DebuffId(zoneid, 201733, 41, 6, 6, true) -- Stinging Swarm*
PlexusStatusRaidDebuff:DebuffId(zoneid, 198820, 42, 6, 6, true) -- dark-blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 199143, 43, 6, 6, true) -- cloud-of-hypnosis
PlexusStatusRaidDebuff:DebuffId(zoneid, 198635, 44, 6, 6, true) -- Unerring Shear
PlexusStatusRaidDebuff:DebuffId(zoneid, 199368, 45, 6, 6, true) -- Legacy of the Ravencrest
PlexusStatusRaidDebuff:DebuffId(zoneid, 199168, 46, 6, 6, true) -- Itchy
PlexusStatusRaidDebuff:DebuffId(zoneid, 202019, 47, 6, 6, true) -- Shadow Bolt Volley

--Latosius
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Latosius")
PlexusStatusRaidDebuff:DebuffId(zoneid, 201733, 51, 6, 6, true) --Stinging Swarm
