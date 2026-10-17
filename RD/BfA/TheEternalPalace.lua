-- local zone = "The Eternal Palace"
local zoneid = 1512
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

PlexusStatusRaidDebuff:DebuffId(zoneid, 299705, 1, 5, 5, true) --Dark Passage
PlexusStatusRaidDebuff:DebuffId(zoneid, 303550, 1, 5, 5, true) --Frost Bolt Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 300743, 1, 5, 5, true) --Void Touched
PlexusStatusRaidDebuff:DebuffId(zoneid, 118905, 1, 5, 5, true) --Static Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 304771, 1, 5, 5, true) --Queen's Disgust
PlexusStatusRaidDebuff:DebuffId(zoneid, 295822, 1, 5, 5, true) --Conductive Pulse

-- Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 303298, 1, 5, 5, true) --Hunter's Quarry
PlexusStatusRaidDebuff:DebuffId(zoneid, 303296, 1, 5, 5, true) --Poison-Dipped Arrow
PlexusStatusRaidDebuff:DebuffId(zoneid, 304245, 1, 5, 5, true) --Toxic Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 301968, 1, 4, 4, true) --Bioluminescence
PlexusStatusRaidDebuff:DebuffId(zoneid, 304189, 1, 5, 5, true) --Frostbolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 303316, 1, 6, 6, true) --Hindering Resonance
PlexusStatusRaidDebuff:DebuffId(zoneid, 292127, 1, 6, 6, true) --Darkest Depths
PlexusStatusRaidDebuff:DebuffId(zoneid, 304026, 1, 6, 6, true) --Arcane Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 304297, 1, 5, 5, true) --Disgusting Mucus
PlexusStatusRaidDebuff:DebuffId(zoneid, 302989, 1, 5, 5, true) --Briny Bubble
PlexusStatusRaidDebuff:DebuffId(zoneid, 302992, 1, 5, 5, true) --Briny Bubble
PlexusStatusRaidDebuff:DebuffId(zoneid, 304027, 1, 5, 5, true) --Arcane Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 295779, 1, 5, 5, true) --Aqua Lance
PlexusStatusRaidDebuff:DebuffId(zoneid, 292307, 1, 5, 5, true) --Gaze from Below
PlexusStatusRaidDebuff:DebuffId(zoneid, 298459, 1, 5, 5, true) --Amniotic Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 300244, 1, 5, 5, true) --Raging Rapids
PlexusStatusRaidDebuff:DebuffId(zoneid, 303630, 1, 5, 5, true) --Explosive Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 303422, 1, 5, 5, true) --Blizzard
PlexusStatusRaidDebuff:DebuffId(zoneid, 303625, 1, 5, 5, true) --Aura of Suffering
PlexusStatusRaidDebuff:DebuffId(zoneid, 303747, 1, 5, 5, true) --Ice Tomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 303373, 1, 5, 5, true) --Toxic Bolt Volley
PlexusStatusRaidDebuff:DebuffId(zoneid, 304765, 1, 5, 5, true) --Filth
PlexusStatusRaidDebuff:DebuffId(zoneid, 303382, 1, 5, 5, true) --Venom Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 303619, 1, 5, 5, true) --Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 303501, 1, 5, 5, true) --Rending Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 303958, 1, 5, 5, true) --Nightmare Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 6136, 1, 5, 5, true) --Chilled
PlexusStatusRaidDebuff:DebuffId(zoneid, 303942, 1, 5, 5, true) --Coalesced Nightmares
PlexusStatusRaidDebuff:DebuffId(zoneid, 303913, 1, 5, 5, true) --Lingering Soul

-- Abyssal Commander Sivara
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Abyssal Commander Sivara")
PlexusStatusRaidDebuff:DebuffId(zoneid, 294715, 11, 5, 5, true, true) --Toxic Brand
PlexusStatusRaidDebuff:DebuffId(zoneid, 294711, 12, 5, 5, true, true) --Frost Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 300705, 13, 5, 5, true, true) --Septic Taint
PlexusStatusRaidDebuff:DebuffId(zoneid, 300701, 14, 5, 5, true, true) --Rimefrost
PlexusStatusRaidDebuff:DebuffId(zoneid, 294847, 15, 5, 5, true) --Unstable Mixture
PlexusStatusRaidDebuff:DebuffId(zoneid, 295348, 16, 5, 5, true) --Overflowing Chill
PlexusStatusRaidDebuff:DebuffId(zoneid, 295421, 17, 5, 5, true) --Overflowing Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 300961, 18, 5, 5, true) --Frozen Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 300962, 19, 5, 5, true) --Septic Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 300883, 20, 5, 5, true) --Inversion Sickness
PlexusStatusRaidDebuff:DebuffId(zoneid, 300882, 21, 5, 5, true) --Inversion Sickness
PlexusStatusRaidDebuff:DebuffId(zoneid, 295705, 22, 5, 5, true) --Toxic Bolt
PlexusStatusRaidDebuff:DebuffId(zoneid, 295704, 23, 5, 5, true) --Frost Bolt

-- Radiance of Azshara
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Radiance of Azshara")
PlexusStatusRaidDebuff:DebuffId(zoneid, 296566, 31, 5, 5, true) --Tide Fist
PlexusStatusRaidDebuff:DebuffId(zoneid, 296737, 32, 5, 5, true) --Arcane Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 295920, 33, 5, 5, true) --Ancient Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 296746, 34, 5, 5, true) --Arcane Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 299152, 35, 5, 5, true) --Waterlogged


-- Blackwater Behemoth
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Blackwater Behemoth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 292138, 41, 5, 5, true) --Radiant Biomass
PlexusStatusRaidDebuff:DebuffId(zoneid, 292133, 42, 5, 5, true) --Bioluminescence
PlexusStatusRaidDebuff:DebuffId(zoneid, 292127, 43, 5, 5, true) --Darkest Depths
PlexusStatusRaidDebuff:DebuffId(zoneid, 292167, 44, 5, 5, true) --Toxic Spine
PlexusStatusRaidDebuff:DebuffId(zoneid, 292307, 45, 5, 5, true) --Gaze from Below
PlexusStatusRaidDebuff:DebuffId(zoneid, 305085, 46, 5, 5, true) --Slipstream
PlexusStatusRaidDebuff:DebuffId(zoneid, 298595, 47, 5, 5, true) --Glowing Stinger


-- Lady Ashvane
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Lady Ashvane")
PlexusStatusRaidDebuff:DebuffId(zoneid, 296725, 61, 5, 5, true) --Barnacle Bash
PlexusStatusRaidDebuff:DebuffId(zoneid, 296693, 62, 5, 5, true) --Waterlogged
PlexusStatusRaidDebuff:DebuffId(zoneid, 302992, 63, 5, 5, true) --Briny Bubble
PlexusStatusRaidDebuff:DebuffId(zoneid, 296752, 64, 5, 5, true) --Cutting Coral
PlexusStatusRaidDebuff:DebuffId(zoneid, 296942, 65, 5, 5, true) --Arcing Azerite
PlexusStatusRaidDebuff:DebuffId(zoneid, 296939, 66, 5, 5, true) --Arcing Azerite
PlexusStatusRaidDebuff:DebuffId(zoneid, 296938, 67, 5, 5, true) --Arcing Azerite
PlexusStatusRaidDebuff:DebuffId(zoneid, 296941, 68, 5, 5, true) --Arcing Azerite
PlexusStatusRaidDebuff:DebuffId(zoneid, 296940, 69, 5, 5, true) --Arcing Azerite
PlexusStatusRaidDebuff:DebuffId(zoneid, 296943, 70, 5, 5, true) --Arcing Azerite
PlexusStatusRaidDebuff:DebuffId(zoneid, 302989, 71, 5, 5, true) --Briny Bubble


-- Orgozoa
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Orgozoa")
PlexusStatusRaidDebuff:DebuffId(zoneid, 298156, 81, 5, 5, true, true) --Desensitizing Sting
PlexusStatusRaidDebuff:DebuffId(zoneid, 298306, 82, 5, 5, true) --Incubation Fluid
PlexusStatusRaidDebuff:DebuffId(zoneid, 296101, 83, 5, 5, true) --Rewind

-- The Queen's Court
PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "The Queen's Court")
PlexusStatusRaidDebuff:DebuffId(zoneid, 301830, 91, 5, 5, true) --Pashmar's Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 296851, 92, 5, 5, true) --Fanatical Verdict
PlexusStatusRaidDebuff:DebuffId(zoneid, 300545, 93, 5, 5, true) --Mighty Rupture
PlexusStatusRaidDebuff:DebuffId(zoneid, 297585, 94, 5, 5, true) --Obey or Suffer
PlexusStatusRaidDebuff:DebuffId(zoneid, 304409, 95, 5, 5, true) --Repeat Performance
PlexusStatusRaidDebuff:DebuffId(zoneid, 304128, 96, 5, 5, true) --Deferred Sentence
PlexusStatusRaidDebuff:DebuffId(zoneid, 303188, 97, 5, 5, true) --In Formation

-- Za'qul
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Za'qul")
PlexusStatusRaidDebuff:DebuffId(zoneid, 296018, 101, 5, 5, true) --Manic Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 303619, 102, 5, 5, true) --Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 293509, 103, 5, 5, true) --Manifest Nightmares
PlexusStatusRaidDebuff:DebuffId(zoneid, 292971, 104, 5, 5, true) --Hysteria
PlexusStatusRaidDebuff:DebuffId(zoneid, 298192, 105, 5, 5, true) --Dark Beyond
PlexusStatusRaidDebuff:DebuffId(zoneid, 295327, 106, 5, 5, true) --Shattered Psyche
PlexusStatusRaidDebuff:DebuffId(zoneid, 296015, 107, 5, 5, true) --Caustic Delirium
PlexusStatusRaidDebuff:DebuffId(zoneid, 303981, 108, 5, 5, true) --Nether Portal

-- Queen Azshara
PlexusStatusRaidDebuff:BossNameId(zoneid, 120, "Queen Azshara")
PlexusStatusRaidDebuff:DebuffId(zoneid, 302999, 121, 5, 5, true) --Arcane Vulnerability
PlexusStatusRaidDebuff:DebuffId(zoneid, 299276, 122, 5, 5, true) --Sanction
PlexusStatusRaidDebuff:DebuffId(zoneid, 300001, 123, 5, 5, true) --Devotion
PlexusStatusRaidDebuff:DebuffId(zoneid, 298781, 124, 5, 5, true) --Arcane Orb
PlexusStatusRaidDebuff:DebuffId(zoneid, 299251, 125, 5, 5, true) --Obey!
PlexusStatusRaidDebuff:DebuffId(zoneid, 297656, 126, 5, 5, true) --Stand Alone
PlexusStatusRaidDebuff:DebuffId(zoneid, 299255, 127, 5, 5, true) --Stand Alone!
PlexusStatusRaidDebuff:DebuffId(zoneid, 299249, 128, 5, 5, true) --Suffer!
PlexusStatusRaidDebuff:DebuffId(zoneid, 299254, 129, 5, 5, true) --Stand Together!
PlexusStatusRaidDebuff:DebuffId(zoneid, 297907, 130, 5, 5, true) --Cursed Heart
PlexusStatusRaidDebuff:DebuffId(zoneid, 303657, 131, 5, 5, true) --Arcane Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 299094, 132, 5, 5, true) --Beckon
PlexusStatusRaidDebuff:DebuffId(zoneid, 298569, 133, 5, 5, true) --Drained Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 298756, 134, 5, 5, true) --Serrated Edge
PlexusStatusRaidDebuff:DebuffId(zoneid, 301078, 135, 5, 5, true) --Charged Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 298018, 136, 5, 5, true) --Frozen
PlexusStatusRaidDebuff:DebuffId(zoneid, 300492, 137, 5, 5, true) --Static Shock
PlexusStatusRaidDebuff:DebuffId(zoneid, 298014, 138, 5, 5, true) --Cold Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 303825, 139, 5, 5, true) --Crushing Depths
end)