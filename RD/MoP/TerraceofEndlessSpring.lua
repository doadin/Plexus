-- local zone = "Terrace of Endless Spring"
local zoneid = 456
local Plexus = _G.Plexus
local PlexusStatusRaidDebuff = Plexus:GetModule("PlexusStatusRaidDebuff")

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

--Trash

-- Protectors trash
-- Apparition of Terror
PlexusStatusRaidDebuff:DebuffId(zoneid, 130115, 1, 6, 6) --Grip of Fear (dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 125758, 1, 6, 6) --Overwhelming Fear (dispellable/interruptable)
-- Night Terror
PlexusStatusRaidDebuff:DebuffId(zoneid, 125760, 1, 5, 5, true, true) --Enveloping Darkness  (dispellable)

--Protector Kaolan
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Protector Kaolan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 117519, 11, 2, 2) --Touch of Sha (dot)
PlexusStatusRaidDebuff:DebuffId(zoneid, 111850, 12, 6, 6) --Lightning Prison: Targeted
PlexusStatusRaidDebuff:DebuffId(zoneid, 117436, 13, 6, 6) --Lightning Prison: Stunned
PlexusStatusRaidDebuff:DebuffId(zoneid, 118191, 14, 5, 5, true, true) --Corrupted Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 118091, 15, 4, 4, true, true) --Defiled Ground: Stacks
PlexusStatusRaidDebuff:DebuffId(zoneid, 117235, 16, 1, 1) --Purified (buff from Corrupted Waters)
PlexusStatusRaidDebuff:DebuffId(zoneid, 117283, 17, 1, 1) --Cleansing Waters (buff from Cleansing Waters, don't dispell off players, dispel off enemy targets)
PlexusStatusRaidDebuff:DebuffId(zoneid, 117353, 18, 3, 3, true, true) -- Overwhelming Corruption (stacking dot) - if an Elder is killed last

--Tsulong
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Tsulong")
PlexusStatusRaidDebuff:DebuffId(zoneid, 122768, 21, 2, 2, true, true) --Dread Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 122777, 22, 6, 6) --Nightmares (dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 122752, 23, 3, 3, true, true) --Shadow Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 122789, 24, 1, 1) --Sunbeam
PlexusStatusRaidDebuff:DebuffId(zoneid, 123012, 25, 6, 6) --Terrorize: 5% (dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 123011, 26, 6, 6) --Terrorize: 10% (dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 123036, 27, 5, 5) --Fright (dispellable)
PlexusStatusRaidDebuff:DebuffId(zoneid, 122858, 28, 2, 2) --Bathed in Light

--Lei Shi
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Lei Shi")
PlexusStatusRaidDebuff:DebuffId(zoneid, 123121, 31, 4, 4, true, true) --Spray (tank stacks)
PlexusStatusRaidDebuff:DebuffId(zoneid, 123705, 32, 3, 3, true, true) --Scary Fog ?

--Sha of Fear
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Sha of Fear")
PlexusStatusRaidDebuff:DebuffId(zoneid, 119414, 41, 6, 6) --Breath of Fear
PlexusStatusRaidDebuff:DebuffId(zoneid, 129147, 42, 3, 3) --Onimous Cackle
PlexusStatusRaidDebuff:DebuffId(zoneid, 119983, 43, 6, 6, true, true) --Dread Spray
PlexusStatusRaidDebuff:DebuffId(zoneid, 120669, 44, 3, 3) --Naked and Afraid
PlexusStatusRaidDebuff:DebuffId(zoneid, 75683, 45, 6, 6) --Waterspout
PlexusStatusRaidDebuff:DebuffId(zoneid, 120629, 46, 3, 3) --Huddle in Terror
PlexusStatusRaidDebuff:DebuffId(zoneid, 120394, 47, 6, 6) --Eternal Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 129189, 48, 3, 4) --Sha Globe
PlexusStatusRaidDebuff:DebuffId(zoneid, 119086, 49, 4, 4) --Penetrating Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 119775, 50, 6, 6) --Reaching Attack

