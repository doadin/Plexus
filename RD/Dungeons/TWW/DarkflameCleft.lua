-- local zone = "Darkflame Cleft"
local zoneid = 2303
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
PlexusStatusRaidDebuff:DebuffId(zoneid, 1216858, 1, 5, 5, true) --Void Pulsar
PlexusStatusRaidDebuff:DebuffId(zoneid, 1218133, 1, 5, 5, true) --Burning Candles
PlexusStatusRaidDebuff:DebuffId(zoneid, 424322, 1, 5, 5, true) --Explosive Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 423501, 1, 5, 5, true) --Wild Wallop
PlexusStatusRaidDebuff:DebuffId(zoneid, 469620, 1, 5, 5, true) --Creeping Shadow
PlexusStatusRaidDebuff:DebuffId(zoneid, 440653, 1, 5, 5, true) --Surging Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 426883, 1, 5, 5, true) --Bonk!
PlexusStatusRaidDebuff:DebuffId(zoneid, 426295, 1, 5, 5, true) --Flaming Tether
PlexusStatusRaidDebuff:DebuffId(zoneid, 428019, 1, 5, 5, true) --Flashpoint
PlexusStatusRaidDebuff:DebuffId(zoneid, 426277, 1, 5, 5, true) --One-Hand Headlock

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

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Ol' Waxbeard")
PlexusStatusRaidDebuff:DebuffId(zoneid, 422150, 101, 5, 5, true) --Reckless Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 422270, 102, 5, 5, true) --Cave-In
PlexusStatusRaidDebuff:DebuffId(zoneid, 422245, 103, 5, 5, true) --Rock Buster
PlexusStatusRaidDebuff:DebuffId(zoneid, 421875, 104, 5, 5, true) --"Kol"-to-Arms
PlexusStatusRaidDebuff:DebuffId(zoneid, 422682, 105, 5, 5, true) --Crude Weapons
PlexusStatusRaidDebuff:DebuffId(zoneid, 428268, 106, 5, 5, true) --Underhanded Track-tics
PlexusStatusRaidDebuff:DebuffId(zoneid, 422162, 107, 5, 5, true) --Luring Candleflame


PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Blazikon")
PlexusStatusRaidDebuff:DebuffId(zoneid, 421638, 201, 5, 5, true) --Wicklighter Barrage
PlexusStatusRaidDebuff:DebuffId(zoneid, 422700, 202, 5, 5, true) --Extinguishing Gust
PlexusStatusRaidDebuff:DebuffId(zoneid, 424223, 203, 5, 5, true) --Incite Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 423099, 204, 5, 5, true) --Enkindling Inferno
PlexusStatusRaidDebuff:DebuffId(zoneid, 425394, 205, 5, 5, true) --Dousing Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 443835, 206, 5, 5, true) --Blazing Storms


PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "The Candle King")
PlexusStatusRaidDebuff:DebuffId(zoneid, 420659, 301, 5, 5, true) --Eerie Molds
PlexusStatusRaidDebuff:DebuffId(zoneid, 421648, 302, 5, 5, true) --Cursed Wax
PlexusStatusRaidDebuff:DebuffId(zoneid, 421277, 303, 5, 5, true) --Darkflame Pickaxe
PlexusStatusRaidDebuff:DebuffId(zoneid, 426145, 304, 5, 5, true) --Paranoid Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 420696, 305, 5, 5, true) --Throw Darkflame
PlexusStatusRaidDebuff:DebuffId(zoneid, 421067, 306, 5, 5, true) --Molten Wax
PlexusStatusRaidDebuff:DebuffId(zoneid, 426127, 307, 5, 5, true) --Darklight


PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "The Darkness")
PlexusStatusRaidDebuff:DebuffId(zoneid, 422806, 401, 5, 5, true) --Smothering Shadows
PlexusStatusRaidDebuff:DebuffId(zoneid, 426943, 402, 5, 5, true) --Rising Gloom
PlexusStatusRaidDebuff:DebuffId(zoneid, 426866, 403, 5, 5, true) --Candlelight
PlexusStatusRaidDebuff:DebuffId(zoneid, 426941, 404, 5, 5, true) --Wax Lump
PlexusStatusRaidDebuff:DebuffId(zoneid, 428266, 405, 5, 5, true) --Eternal Darkness
PlexusStatusRaidDebuff:DebuffId(zoneid, 427157, 406, 5, 5, true) --Call Darkspawn
PlexusStatusRaidDebuff:DebuffId(zoneid, 427176, 407, 5, 5, true) --Drain Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 427100, 408, 5, 5, true) --Umbral Slash
PlexusStatusRaidDebuff:DebuffId(zoneid, 427011, 409, 5, 5, true) --Shadowblast
PlexusStatusRaidDebuff:DebuffId(zoneid, 427180, 410, 5, 5, true) --Fear of the Gloom
end)
