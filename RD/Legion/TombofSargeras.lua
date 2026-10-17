-- local zone = "Tomb of Sargeras"
local zoneid = 850
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

-- Goroth
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Goroth")
PlexusStatusRaidDebuff:DebuffId(zoneid, 233279, 11, 6, 6, true) -- Shattering Star
PlexusStatusRaidDebuff:DebuffId(zoneid, 230345, 12, 6, 6, true) -- Crashing Comet
PlexusStatusRaidDebuff:DebuffId(zoneid, 231363, 13, 6, 6, true) -- Burning Armor

-- Demonic Inquisition
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Demonic Inquisition")
PlexusStatusRaidDebuff:DebuffId(zoneid, 233430, 21, 5, 5) -- Ubearable Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 233983, 22, 6, 6, true) -- Echoing Anguish

-- Harjatan
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Harjatan")
PlexusStatusRaidDebuff:DebuffId(zoneid, 231770, 31, 5, 5, false, true) -- Drenched
PlexusStatusRaidDebuff:DebuffId(zoneid, 231998, 32, 6, 6, true, true) -- Jagged Abrasion

-- Sisters of the Moon
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Sisters of the Moon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 236603, 41, 6, 6, true) -- Rapid Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 234996, 42, 6, 6, false, true) -- Umbra Suffusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 234995, 43, 6, 6, false, true) -- Lunar Suffusion
PlexusStatusRaidDebuff:DebuffId(zoneid, 236519, 44, 6, 6, true) -- Moon Burn
PlexusStatusRaidDebuff:DebuffId(zoneid, 236697, 45, 7, 7, false, true) -- Deathly Screech
PlexusStatusRaidDebuff:DebuffId(zoneid, 236550, 46, 6, 6, true) -- Discorporate
PlexusStatusRaidDebuff:DebuffId(zoneid, 239264, 47, 6, 6, true, true) -- Lunar Fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 233263, 48, 7, 7, true) -- Embrace of the Eclipse

-- Mistress Sassz'ine
PlexusStatusRaidDebuff:BossNameId(zoneid, 50, "Mistress Sassz'ine")
PlexusStatusRaidDebuff:DebuffId(zoneid, 230959, 51, 6, 6, true) -- Concealing Murk
PlexusStatusRaidDebuff:DebuffId(zoneid, 232722, 52, 6, 6, true) -- Slicing Tornado
PlexusStatusRaidDebuff:DebuffId(zoneid, 232913, 53, 6, 6) -- Befouling Ink
PlexusStatusRaidDebuff:DebuffId(zoneid, 234621, 54, 6, 6) -- Devouring Maw
PlexusStatusRaidDebuff:DebuffId(zoneid, 230201, 55, 6, 6) -- Burden of Pain

-- The Desolate Host
PlexusStatusRaidDebuff:BossNameId(zoneid, 60, "The Desolate Host")
PlexusStatusRaidDebuff:DebuffId(zoneid, 236072, 61, 6, 6) -- Wailing Souls
PlexusStatusRaidDebuff:DebuffId(zoneid, 236449, 62, 7, 7) -- Soulbind
PlexusStatusRaidDebuff:DebuffId(zoneid, 236515, 63, 6, 6, true) -- Shattering Scream
PlexusStatusRaidDebuff:DebuffId(zoneid, 235989, 64, 6, 6) -- Tormented Cries
PlexusStatusRaidDebuff:DebuffId(zoneid, 236131, 65, 7, 7, true) -- Wither

-- Maiden of Vigilance
PlexusStatusRaidDebuff:BossNameId(zoneid, 70, "Maiden of Vigilance")
PlexusStatusRaidDebuff:DebuffId(zoneid, 235117, 71, 6, 6, true) -- Unstable Soul
PlexusStatusRaidDebuff:DebuffId(zoneid, 235534, 72, 6, 6, false, true) -- Creator's Grace
PlexusStatusRaidDebuff:DebuffId(zoneid, 235538, 73, 6, 6, false, true) -- Demon's Vigor
PlexusStatusRaidDebuff:DebuffId(zoneid, 234891, 74, 6, 6) -- Wrath of the Creators
PlexusStatusRaidDebuff:DebuffId(zoneid, 235569, 75, 6, 6) -- Hammer of Creation
PlexusStatusRaidDebuff:DebuffId(zoneid, 235573, 76, 6, 6) -- Hammer of Obliteration

-- Fallen Avatar
PlexusStatusRaidDebuff:BossNameId(zoneid, 80, "Fallen Avatar")
PlexusStatusRaidDebuff:DebuffId(zoneid, 239058, 81, 6, 6) -- Touch of Sargeras
PlexusStatusRaidDebuff:DebuffId(zoneid, 239739, 82, 6, 6, true) -- Dark Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 234059, 83, 6, 6, true) -- Unbound Chaos
PlexusStatusRaidDebuff:DebuffId(zoneid, 240213, 84, 6, 6, true) -- Chaos Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 236604, 85, 6, 6) -- Shadowy Blades
PlexusStatusRaidDebuff:DebuffId(zoneid, 236494, 86, 6, 6, true, true) -- Desolate

-- Kil'jaeden
PlexusStatusRaidDebuff:BossNameId(zoneid, 90, "Kil'jaeden")
PlexusStatusRaidDebuff:DebuffId(zoneid, 238999, 91, 6, 6) -- Darkness of a Thousand Souls
PlexusStatusRaidDebuff:DebuffId(zoneid, 239155, 92, 7, 7) -- Gravity Squeeze
PlexusStatusRaidDebuff:DebuffId(zoneid, 234295, 93, 6, 6, true, true) -- Armageddon Rain
PlexusStatusRaidDebuff:DebuffId(zoneid, 240908, 94, 6, 6, true) -- Armageddon Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 239932, 95, 6, 6, true, true) -- Felclaws
PlexusStatusRaidDebuff:DebuffId(zoneid, 240911, 96, 6, 6, true, true) -- Armageddon Hail
end)
