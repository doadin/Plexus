-- local zone = "Uldir"
local zoneid = 1148
local Plexus = _G.Plexus
local PlexusStatus = Plexus:GetModule("PlexusStatus")
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
WhenRaidDebuffReady(function()

-- Trash

-- Taloc
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Taloc")
PlexusStatusRaidDebuff:DebuffId(zoneid, 270290, 11, 5, 5) -- Blood Storms
PlexusStatusRaidDebuff:DebuffId(zoneid, 271222, 12, 5, 5, true) -- Plasma Discharge
PlexusStatusRaidDebuff:DebuffId(zoneid, 271296, 13, 5, 5, true) -- Cudgel of Gore

-- MOTHER
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "MOTHER")
PlexusStatusRaidDebuff:DebuffId(zoneid, 267787, 21, 5, 5, true, true) -- Sanitizing Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 268198, 22, 5, 5, true) -- Clinging Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 267821, 23, 5, 5) -- Defense Grids

-- Fetid Devourer
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Fetid Devourer")
PlexusStatusRaidDebuff:DebuffId(zoneid, 262313, 31, 5, 5, true, true) -- Malodorous Miasma
PlexusStatusRaidDebuff:DebuffId(zoneid, 262314, 32, 5, 5, true, true) -- Putrid Paroxysm

-- Zek'voz, herald of N'zoth
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Zek'voz")
PlexusStatusRaidDebuff:DebuffId(zoneid, 265264, 41, 5, 5, true, true) -- Void Lash
PlexusStatusRaidDebuff:DebuffId(zoneid, 265646, 42, 5, 5) -- Will of the Corruptor
PlexusStatusRaidDebuff:DebuffId(zoneid, 265360, 43, 5, 5, true) -- Roiling Deceit
PlexusStatusRaidDebuff:DebuffId(zoneid, 267334, 44, 5, 5) -- Orb of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 265662, 45, 5, 5) -- Corruptor's Pact
PlexusStatusRaidDebuff:DebuffId(zoneid, 265451, 46, 5, 5) -- Surging Darkness

-- Vectis
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Vectis")
PlexusStatusRaidDebuff:DebuffId(zoneid, 265129, 51, 6, 6, true) -- Omega Vector
PlexusStatusRaidDebuff:DebuffId(zoneid, 265127, 52, 5, 5, true, true) -- Lingering Infection
PlexusStatusRaidDebuff:DebuffId(zoneid, 265178, 53, 5, 5, true) -- Evolving Affliction
PlexusStatusRaidDebuff:DebuffId(zoneid, 265206, 54, 6, 6, true) -- Immunosuppression
PlexusStatusRaidDebuff:DebuffId(zoneid, 266948, 55, 5, 5, true) -- Plague Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 265212, 56, 6, 6, true) -- Gestate

-- Zul, Reborn
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Zul, Reborn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 274195, 61, 5, 5, false, true) -- Corrupted Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 274358, 62, 5, 5, true, true) -- Rupturing Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 274363, 63, 5, 5) -- Ruptured Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 273365, 64, 5, 5, true) -- Dark Revelation
PlexusStatusRaidDebuff:DebuffId(zoneid, 274271, 65, 6, 6) -- Deathwish

-- Mythrax the Unraveler
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Mythrax the Unraveler")
PlexusStatusRaidDebuff:DebuffId(zoneid, 272336, 71, 5, 5) -- Annihilation
PlexusStatusRaidDebuff:DebuffId(zoneid, 274113, 72, 5, 5) -- Obliteration Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 273282, 73, 6, 6, true) -- Essence Shear
PlexusStatusRaidDebuff:DebuffId(zoneid, 272536, 74, 6, 6, true) -- Imminent Ruin
PlexusStatusRaidDebuff:DebuffId(zoneid, 272407, 75, 6, 6) -- Oblivion Sphere

-- G'huun
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "G'huun")
PlexusStatusRaidDebuff:DebuffId(zoneid, 263372, 81, 5, 5) -- Power Matrices
PlexusStatusRaidDebuff:DebuffId(zoneid, 263503, 82, 5, 5) -- Reorigination Blasts
PlexusStatusRaidDebuff:DebuffId(zoneid, 267409, 83, 5, 5, true, true) -- Dark Bargain
PlexusStatusRaidDebuff:DebuffId(zoneid, 270447, 84, 5, 5, true, true) -- Growing Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 263236, 85, 5, 5, true) -- Blood Feast
PlexusStatusRaidDebuff:DebuffId(zoneid, 263334, 86, 5, 5, true, true) -- Putrid Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 267700, 87, 5, 5, true) -- Gaze of G'huun
end)