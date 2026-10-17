-- local zone = "Antorus, the Burning Throne"
local zoneid = 909
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

-- Trash


-- Varimathras
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Varimathras")
PlexusStatusRaidDebuff:DebuffId(zoneid, 244042, 11, 6, 6, false, true) -- Marked Prey
PlexusStatusRaidDebuff:DebuffId(zoneid, 243999, 12, 6, 6, false, true) -- Dark Fissure
PlexusStatusRaidDebuff:DebuffId(zoneid, 244093, 13, 6, 6, false, true) -- Necrotic Embrace
PlexusStatusRaidDebuff:DebuffId(zoneid, 243961, 14, 6, 6) -- Misery
PlexusStatusRaidDebuff:DebuffId(zoneid, 243980, 15, 6, 6) -- Torment of Fel
PlexusStatusRaidDebuff:DebuffId(zoneid, 243968, 16, 6, 6) -- Torment of Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 243977, 17, 6, 6) -- Torment of Frost
PlexusStatusRaidDebuff:DebuffId(zoneid, 243974, 18, 6, 6) -- Torment of Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 248732, 19, 6, 6) -- Echoes of Doom

-- Aggramar
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Aggramar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 243431, 21, 6, 6, true, true) -- Taeshalach's Reach
PlexusStatusRaidDebuff:DebuffId(zoneid, 245995, 22, 6, 6, false, true) -- Scorching Blaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 246014, 23, 6, 6, false, true) -- Searing Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 244912, 24, 6, 6, false, true) -- Blazing Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 244291, 25, 6, 6) -- Foe Breaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 244736, 26, 6, 6) -- Wake of Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 245916, 27, 6, 6) -- Molten Remnants
PlexusStatusRaidDebuff:DebuffId(zoneid, 254452, 28, 6, 6) -- Ravenous Blaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 247079, 29, 6, 6) -- Empowered Flame Rend
PlexusStatusRaidDebuff:DebuffId(zoneid, 255062, 30, 6, 6) -- Empowered Searing Tempest
PlexusStatusRaidDebuff:DebuffId(zoneid, 255060, 31, 6, 6) -- Empowered Foe Breaker
PlexusStatusRaidDebuff:DebuffId(zoneid, 255528, 32, 6, 6) -- Searing Binding

-- Portal Keeper Hasabel
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Portal Keeper Hasabel")
PlexusStatusRaidDebuff:DebuffId(zoneid, 245157, 41, 6, 6) -- Everburning Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 244853, 42, 6, 6) -- Caustic Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 245075, 43, 6, 6) -- Hungering Gloom
PlexusStatusRaidDebuff:DebuffId(zoneid, 244016, 44, 6, 6, true, true) -- Reality Tear
PlexusStatusRaidDebuff:DebuffId(zoneid, 245240, 45, 6, 6) -- Oppressive Gloom
PlexusStatusRaidDebuff:DebuffId(zoneid, 245118, 46, 6, 6) -- Cloying Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 245099, 47, 6, 6) -- Mind Fog
PlexusStatusRaidDebuff:DebuffId(zoneid, 244613, 48, 6, 6) -- Everburning Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 245050, 49, 6, 6) -- Delusions
PlexusStatusRaidDebuff:DebuffId(zoneid, 245040, 50, 6, 6) -- Corrupt
PlexusStatusRaidDebuff:DebuffId(zoneid, 244849, 51, 6, 6) -- Caustic Slime
PlexusStatusRaidDebuff:DebuffId(zoneid, 244915, 52, 6, 6) -- Poison Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 244915, 53, 6, 6) -- Leech Essence
PlexusStatusRaidDebuff:DebuffId(zoneid, 244949, 54, 6, 6) -- Felsilk Wrap
PlexusStatusRaidDebuff:DebuffId(zoneid, 246208, 55, 6, 6) -- Acidic Web
PlexusStatusRaidDebuff:DebuffId(zoneid, 244709, 56, 6, 6) -- Fiery Detonation

-- Noura, Mother of Flames <Coven of Shivarra>
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "Noura")
PlexusStatusRaidDebuff:DebuffId(zoneid, 250095, 61, 6, 6, true, true) -- Machinations of Aman'Thul
PlexusStatusRaidDebuff:DebuffId(zoneid, 245586, 62, 6, 6, false, true) -- Chilled Blood
PlexusStatusRaidDebuff:DebuffId(zoneid, 245518, 63, 6, 6, true, true) -- Flashfreeze
PlexusStatusRaidDebuff:DebuffId(zoneid, 244899, 64, 6, 6, true, true) -- Fiery Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 253203, 65, 6, 6) -- Shivan Pact
PlexusStatusRaidDebuff:DebuffId(zoneid, 253520, 66, 6, 6) -- Fulminating Pulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 253752, 67, 6, 6) -- Sense of Dread
PlexusStatusRaidDebuff:DebuffId(zoneid, 245627, 68, 6, 6) -- Whirling Saber
PlexusStatusRaidDebuff:DebuffId(zoneid, 253697, 69, 6, 6) -- Orb of Frost
PlexusStatusRaidDebuff:DebuffId(zoneid, 252861, 70, 6, 6) -- Storm of Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 246763, 71, 6, 6) -- Fury of Golganneth
PlexusStatusRaidDebuff:DebuffId(zoneid, 245921, 72, 6, 6) -- Spectral Army
PlexusStatusRaidDebuff:DebuffId(zoneid, 245671, 73, 6, 6) -- Flames of Khaz'goroth
PlexusStatusRaidDebuff:DebuffId(zoneid, 250757, 74, 6, 6) -- Cosmic Glare

-- F'harg
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "F'harg")
PlexusStatusRaidDebuff:DebuffId(zoneid, 248815, 81, 6, 6, false, true) -- Enflamed
PlexusStatusRaidDebuff:DebuffId(zoneid, 244057, 82, 6, 6) -- Enflame Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 244768, 83, 6, 6) -- Desolate Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 254760, 84, 6, 6) -- Corrupting Maw
PlexusStatusRaidDebuff:DebuffId(zoneid, 244071, 85, 6, 6, false, true) -- Weight of Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 248819, 86, 6, 6) -- Siphoned
PlexusStatusRaidDebuff:DebuffId(zoneid, 244056, 87, 6, 6) -- Siphon Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 248815, 88, 6, 6) -- Enflamed
PlexusStatusRaidDebuff:DebuffId(zoneid, 251445, 89, 6, 6) -- Smouldering
PlexusStatusRaidDebuff:DebuffId(zoneid, 244091, 90, 6, 6, true, true) -- Singed
PlexusStatusRaidDebuff:DebuffId(zoneid, 244517, 91, 6, 6, true, true) -- Lingering Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 245098, 92, 6, 6, true, true) -- Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 251445, 93, 6, 6) -- Smouldering
PlexusStatusRaidDebuff:DebuffId(zoneid, 245024, 94, 6, 6) -- Consumed
PlexusStatusRaidDebuff:DebuffId(zoneid, 244086, 95, 6, 6) -- Molten Touch
PlexusStatusRaidDebuff:DebuffId(zoneid, 244055, 96, 6, 6) -- Shadowtouched
PlexusStatusRaidDebuff:DebuffId(zoneid, 244054, 97, 6, 6) -- Flametouched
PlexusStatusRaidDebuff:DebuffId(zoneid, 245022, 98, 6, 6) -- Burning Remnant

-- Garothi Worldbreaker
PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Garothi Worldbreaker")
PlexusStatusRaidDebuff:DebuffId(zoneid, 244395, 101, 6, 6) -- Searing Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 244410, 102, 6, 6) -- Decimation
PlexusStatusRaidDebuff:DebuffId(zoneid, 246848, 103, 6, 6) -- Luring Destruction
PlexusStatusRaidDebuff:DebuffId(zoneid, 244536, 104, 6, 6) -- Fel Bombardment
PlexusStatusRaidDebuff:DebuffId(zoneid, 246920, 105, 6, 6) -- Haywire Decimation
PlexusStatusRaidDebuff:DebuffId(zoneid, 246848, 106, 6, 6) -- Luring Destruction

-- Admiral Svirax
PlexusStatusRaidDebuff:BossNameId(zoneid, 110, "Admiral Svirax")
PlexusStatusRaidDebuff:DebuffId(zoneid, 244910, 111, 6, 6) -- Felshield
PlexusStatusRaidDebuff:DebuffId(zoneid, 244172, 112, 6, 6) -- Psychic Assault
PlexusStatusRaidDebuff:DebuffId(zoneid, 257974, 113, 6, 6, true, true) -- Chaos Pulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 244892, 114, 6, 6, false, true) -- Exploit Weakness
PlexusStatusRaidDebuff:DebuffId(zoneid, 245121, 115, 6, 6) -- Entropic Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 253037, 116, 6, 6) -- Demonic Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 244388, 117, 6, 6) -- Psychic Scarring
PlexusStatusRaidDebuff:DebuffId(zoneid, 244748, 118, 6, 6) -- Shocked

-- Kin'garoth <Engineer of the Apocalypse>
PlexusStatusRaidDebuff:BossNameId(zoneid, 120, "Kin'garoth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 248061, 121, 6, 6) -- Purging Protocol
PlexusStatusRaidDebuff:DebuffId(zoneid, 246706, 122, 6, 6) -- Demolish
PlexusStatusRaidDebuff:DebuffId(zoneid, 244312, 123, 6, 6) -- Forging Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 249535, 124, 6, 6) -- Demolished
PlexusStatusRaidDebuff:DebuffId(zoneid, 246687, 125, 6, 6) -- Decimation
PlexusStatusRaidDebuff:DebuffId(zoneid, 246840, 126, 6, 6) -- Ruiner

-- Imonar the Soulhunter
PlexusStatusRaidDebuff:BossNameId(zoneid, 130, "Imonar the Soulhunter")
PlexusStatusRaidDebuff:DebuffId(zoneid, 248321, 131, 6, 6, false, true) -- Conflagration
PlexusStatusRaidDebuff:DebuffId(zoneid, 248424, 132, 6, 6) -- Gathering Power
PlexusStatusRaidDebuff:DebuffId(zoneid, 247641, 133, 6, 6) -- Stasis Trap
PlexusStatusRaidDebuff:DebuffId(zoneid, 247552, 134, 6, 6) -- Sleep Canister
PlexusStatusRaidDebuff:DebuffId(zoneid, 247565, 135, 6, 6) -- Slumber Gas
PlexusStatusRaidDebuff:DebuffId(zoneid, 247367, 136, 6, 6, true, true) -- Shock Lance
PlexusStatusRaidDebuff:DebuffId(zoneid, 247687, 137, 6, 6, true, true) -- Sever
PlexusStatusRaidDebuff:DebuffId(zoneid, 250255, 138, 6, 6, true, true) -- Empowered Shock Lance
PlexusStatusRaidDebuff:DebuffId(zoneid, 250006, 139, 6, 6, true, true) -- Empowered Pulse
PlexusStatusRaidDebuff:DebuffId(zoneid, 255029, 140, 6, 6, true, true) -- Asleep
PlexusStatusRaidDebuff:DebuffId(zoneid, 247716, 141, 6, 6, true, true) -- Charged Blasts
PlexusStatusRaidDebuff:DebuffId(zoneid, 250224, 142, 6, 6, true, true) -- Shocked
PlexusStatusRaidDebuff:DebuffId(zoneid, 247949, 143, 6, 6, true, true) -- Shrapnel Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 254181, 144, 6, 6, true, true) -- Seared Skin
PlexusStatusRaidDebuff:DebuffId(zoneid, 248255, 145, 6, 6, true, true) -- Infernal Rockets

-- Essence of Eonar
PlexusStatusRaidDebuff:BossNameId(zoneid, 150, "Essence of Eonar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 248326, 151, 6, 6) -- Rain of Fel
PlexusStatusRaidDebuff:DebuffId(zoneid, 248333, 152, 6, 6) -- Meteor Storm
PlexusStatusRaidDebuff:DebuffId(zoneid, 248861, 153, 6, 6) -- Spear of Doom
PlexusStatusRaidDebuff:DebuffId(zoneid, 248795, 154, 6, 6) -- Fel Wake
PlexusStatusRaidDebuff:DebuffId(zoneid, 250691, 155, 6, 6) -- Burning Embers
PlexusStatusRaidDebuff:DebuffId(zoneid, 250140, 156, 6, 6) -- Foul Steps
PlexusStatusRaidDebuff:DebuffId(zoneid, 249016, 157, 6, 6) -- Targeted
PlexusStatusRaidDebuff:DebuffId(zoneid, 249017, 158, 6, 6) -- Arcane Singularity
PlexusStatusRaidDebuff:DebuffId(zoneid, 249014, 159, 6, 6) -- Feedback: Foul Steps
PlexusStatusRaidDebuff:DebuffId(zoneid, 249015, 160, 6, 6) -- Feedback: Burning Embers

-- Argus the Unmaker
PlexusStatusRaidDebuff:BossNameId(zoneid, 170, "Argus the Unmaker")
PlexusStatusRaidDebuff:DebuffId(zoneid, 248499, 171, 6, 6, true, true) -- Sweeping Scythe
PlexusStatusRaidDebuff:DebuffId(zoneid, 255199, 172, 6, 6, false, true) -- Avatar of Aggramar
PlexusStatusRaidDebuff:DebuffId(zoneid, 251570, 173, 6, 6, false, true) -- Soulbomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 250669, 174, 6, 6, false, true) -- Soulburst
PlexusStatusRaidDebuff:DebuffId(zoneid, 257313, 175, 6, 6, false, true) -- Gift of the Sky
PlexusStatusRaidDebuff:DebuffId(zoneid, 257306, 176, 6, 6, false, true) -- Gift of the Sea
PlexusStatusRaidDebuff:DebuffId(zoneid, 258039, 177, 6, 6) -- Deadly Scythe
PlexusStatusRaidDebuff:DebuffId(zoneid, 248396, 178, 6, 6) -- Soulblight
PlexusStatusRaidDebuff:DebuffId(zoneid, 253901, 179, 6, 6) -- Strength of Sea
PlexusStatusRaidDebuff:DebuffId(zoneid, 253903, 180, 6, 6) -- Strength of Sky
PlexusStatusRaidDebuff:DebuffId(zoneid, 255200, 181, 6, 6) -- Aggramar’s Boon
PlexusStatusRaidDebuff:DebuffId(zoneid, 257299, 182, 6, 6) -- Ember of Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 252729, 183, 6, 6) -- Cosmic Ray
PlexusStatusRaidDebuff:DebuffId(zoneid, 252634, 184, 6, 6) -- Cosmic Smash
PlexusStatusRaidDebuff:DebuffId(zoneid, 257215, 185, 6, 6) -- Titanforged
PlexusStatusRaidDebuff:DebuffId(zoneid, 248167, 186, 6, 6) -- Death Fog
PlexusStatusRaidDebuff:DebuffId(zoneid, 256899, 187, 6, 6) -- Soul Detonation
PlexusStatusRaidDebuff:DebuffId(zoneid, 251815, 188, 6, 6) -- Edge of Obliteration
PlexusStatusRaidDebuff:DebuffId(zoneid, 257299, 189, 6, 6) -- Ember of Rage
PlexusStatusRaidDebuff:DebuffId(zoneid, 258373, 190, 6, 6) -- Grasp
PlexusStatusRaidDebuff:DebuffId(zoneid, 257961, 191, 6, 6) -- Chains of Sargeras
PlexusStatusRaidDebuff:DebuffId(zoneid, 257966, 192, 6, 6) -- Sentence of Sargeras
PlexusStatusRaidDebuff:DebuffId(zoneid, 258026, 193, 6, 6) -- Punishment
PlexusStatusRaidDebuff:DebuffId(zoneid, 258000, 194, 6, 6) -- Shattered Bonds
PlexusStatusRaidDebuff:DebuffId(zoneid, 257930, 195, 6, 6) -- Crushing
PlexusStatusRaidDebuff:DebuffId(zoneid, 257931, 196, 6, 6) -- Sargeras Fear
PlexusStatusRaidDebuff:DebuffId(zoneid, 257869, 197, 6, 6) -- Unleashed
PlexusStatusRaidDebuff:DebuffId(zoneid, 257911, 198, 6, 6) -- Sargeras Rage
end)