-- local zone = "The Azure Vault"
local zoneid = 2073
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

--"Trash"
PlexusStatusRaidDebuff:DebuffId(zoneid, 387564, 1, 5, 5, true) -- Mystic Vapors
PlexusStatusRaidDebuff:DebuffId(zoneid, 370764, 1, 5, 5, true) -- Piercing Shards
PlexusStatusRaidDebuff:DebuffId(zoneid, 375596, 1, 5, 5, true) -- Erratic Growth
PlexusStatusRaidDebuff:DebuffId(zoneid, 375602, 1, 5, 5, true) -- Erratic Growth
PlexusStatusRaidDebuff:DebuffId(zoneid, 375649, 1, 5, 5, true) -- Infused Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 370766, 1, 5, 5, true) -- Crystalline Rupture
PlexusStatusRaidDebuff:DebuffId(zoneid, 371007, 1, 5, 5, true) -- Splintering Shards
PlexusStatusRaidDebuff:DebuffId(zoneid, 375591, 1, 5, 5, true) -- Sappy Burst
PlexusStatusRaidDebuff:DebuffId(zoneid, 395492, 1, 5, 5, true) -- Scornful Haste
PlexusStatusRaidDebuff:DebuffId(zoneid, 395532, 1, 5, 5, true) -- Sluggish Adoration
PlexusStatusRaidDebuff:DebuffId(zoneid, 390301, 1, 5, 5, true) -- Hardening Scales
PlexusStatusRaidDebuff:DebuffId(zoneid, 386549, 1, 5, 5, true) -- Waking Bane
PlexusStatusRaidDebuff:DebuffId(zoneid, 371352, 1, 5, 5, true) -- Forbidden Knowledge
PlexusStatusRaidDebuff:DebuffId(zoneid, 377488, 1, 5, 5, true) -- Icy Bindings
PlexusStatusRaidDebuff:DebuffId(zoneid, 386640, 1, 5, 5, true) -- Tear Flesh

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Leymor")
PlexusStatusRaidDebuff:DebuffId(zoneid, 374789, 101, 5, 5, true) -- Infused Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 374523, 102, 5, 5, true) -- Stinging Sap
PlexusStatusRaidDebuff:DebuffId(zoneid, 374567, 103, 5, 5, true) -- Explosive Brand

PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "Azureblade")

PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Telash Greywing")
PlexusStatusRaidDebuff:DebuffId(zoneid, 386881, 301, 5, 5, true) -- Frost Bomb
PlexusStatusRaidDebuff:DebuffId(zoneid, 387150, 302, 5, 5, true) -- Frozen Ground
PlexusStatusRaidDebuff:DebuffId(zoneid, 387151, 303, 5, 5, true) -- Icy Devastator
PlexusStatusRaidDebuff:DebuffId(zoneid, 388072, 304, 5, 5, true) -- Vault Rune
PlexusStatusRaidDebuff:DebuffId(zoneid, 396722, 305, 5, 5, true) -- Absolute Zero

PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Umbrelskul")
PlexusStatusRaidDebuff:DebuffId(zoneid, 388777, 401, 5, 5, true) -- Oppressive Miasma
PlexusStatusRaidDebuff:DebuffId(zoneid, 384978, 402, 5, 5, true) -- Dragon Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 385331, 403, 5, 5, true) -- Fracture
PlexusStatusRaidDebuff:DebuffId(zoneid, 385267, 404, 5, 5, true) -- Crackling Vortex
end)