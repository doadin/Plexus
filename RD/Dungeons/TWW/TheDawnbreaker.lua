-- local zone = "The Dawnbreaker"
local zoneid = 2359
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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 451115, 1, 5, 5, true) -- Terrifying Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 432448, 1, 5, 5, true) -- Stygian Seed
PlexusStatusRaidDebuff:DebuffId(zoneid, 451107, 1, 5, 5, true) -- Bursting Cocoon
PlexusStatusRaidDebuff:DebuffId(zoneid, 451098, 1, 5, 5, true) -- Tacky Nova
PlexusStatusRaidDebuff:DebuffId(zoneid, 431309, 1, 5, 5, true) -- Ensnaring Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 431350, 1, 5, 5, true) -- Tormenting Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 431365, 1, 5, 5, true) -- Tormenting Ray
PlexusStatusRaidDebuff:DebuffId(zoneid, 431491, 1, 5, 5, true) -- Tainted Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 451119, 1, 5, 5, true) -- Abyssal Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 453345, 1, 5, 5, true) -- Abyssal Rot
PlexusStatusRaidDebuff:DebuffId(zoneid, 449332, 1, 5, 5, true) -- Encroaching Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 1242681, 1, 6, 6, true, true) --Shadowblades

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

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Speaker Shadowcrown")
PlexusStatusRaidDebuff:DebuffId(zoneid, 451026, 101, 5, 5, true) --Darkness Comes
PlexusStatusRaidDebuff:DebuffId(zoneid, 449042, 102, 5, 5, true) --Radiant Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 449332, 103, 5, 5, true) --Encroaching Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 452001, 104, 5, 5, true) --Light Fragment
PlexusStatusRaidDebuff:DebuffId(zoneid, 425264, 105, 5, 5, true) --Obsidian Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 453212, 106, 5, 5, true) --Obsidian Beam
PlexusStatusRaidDebuff:DebuffId(zoneid, 426712, 107, 5, 5, true) --Collapsing Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 453140, 108, 5, 5, true) --Collapsing Night
PlexusStatusRaidDebuff:DebuffId(zoneid, 426734, 109, 5, 5, true) --Burning Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 426736, 110, 5, 5, true) --Shadow Shroud
PlexusStatusRaidDebuff:DebuffId(zoneid, 428086, 111, 5, 5, true) --Shadow Bolt


PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Anub'ikkaj")
PlexusStatusRaidDebuff:DebuffId(zoneid, 427192, 201, 5, 5, true) --Empowered Might
PlexusStatusRaidDebuff:DebuffId(zoneid, 426860, 202, 5, 5, true) --Dark Orb
PlexusStatusRaidDebuff:DebuffId(zoneid, 427378, 203, 5, 5, true) --Dark Scars
PlexusStatusRaidDebuff:DebuffId(zoneid, 427001, 204, 5, 5, true) --Terrifying Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 426787, 205, 5, 5, true) --Shadowy Decay
PlexusStatusRaidDebuff:DebuffId(zoneid, 452127, 206, 5, 5, true) --Animate Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 452099, 207, 5, 5, true) --Congealed Darkness


PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Rasha'nan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 434655, 301, 5, 5, true) --Arathi Bombs
PlexusStatusRaidDebuff:DebuffId(zoneid, 434668, 302, 5, 5, true) --Sparking Arathi Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 438946, 303, 5, 5, true) --Throw Arathi Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 434407, 304, 5, 5, true) --Rolling Acid
PlexusStatusRaidDebuff:DebuffId(zoneid, 434579, 305, 5, 5, true) --Corrosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 434576, 306, 5, 5, true) --Acidic Stupor
PlexusStatusRaidDebuff:DebuffId(zoneid, 448213, 307, 5, 5, true) --Expel Webs
PlexusStatusRaidDebuff:DebuffId(zoneid, 448888, 308, 5, 5, true) --Erosive Spray
PlexusStatusRaidDebuff:DebuffId(zoneid, 463428, 309, 5, 5, true) --Lingering Erosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 449042, 310, 5, 5, true) --Radiant Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 449332, 311, 5, 5, true) --Encroaching Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 452001, 312, 5, 5, true) --Light Fragment
PlexusStatusRaidDebuff:DebuffId(zoneid, 449734, 313, 5, 5, true) --Acidic Eruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 434089, 314, 5, 5, true) --Spinneret's Strands
PlexusStatusRaidDebuff:DebuffId(zoneid, 434119, 315, 5, 5, true) --Spinneret's Websnap
PlexusStatusRaidDebuff:DebuffId(zoneid, 434096, 316, 5, 5, true) --Sticky Webs
PlexusStatusRaidDebuff:DebuffId(zoneid, 438957, 317, 5, 5, true) --Acid Pools
PlexusStatusRaidDebuff:DebuffId(zoneid, 435793, 318, 5, 5, true) --Tacky Burst
end)
