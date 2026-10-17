--local zone = "Utgarde Pinnacle"
local zoneid = 136

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

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

PlexusStatusRaidDebuff:DebuffId(zoneid, 49089, 1, 6, 6, true) --Shrink
PlexusStatusRaidDebuff:DebuffId(zoneid, 59239, 1, 6, 6, true) --Rend
PlexusStatusRaidDebuff:DebuffId(zoneid, 59267, 1, 6, 6, true) --Withering Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 59330, 1, 6, 6, true) --Crush
PlexusStatusRaidDebuff:DebuffId(zoneid, 48291, 1, 6, 6, true) --Fetid Rot
PlexusStatusRaidDebuff:DebuffId(zoneid, 59263, 1, 6, 6, true) --Grievous Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 48278, 1, 6, 6, true) --Paralyze
PlexusStatusRaidDebuff:DebuffId(zoneid, 59265, 1, 6, 6, true) --Mortal Wound
PlexusStatusRaidDebuff:DebuffId(zoneid, 59271, 1, 6, 6, true) --Poison Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 56785, 1, 6, 6, true) --Volatile Infection
PlexusStatusRaidDebuff:DebuffId(zoneid, 59268, 1, 6, 6, true) --Impale
PlexusStatusRaidDebuff:DebuffId(zoneid, 48132, 1, 6, 6, true) --Acid Spit
PlexusStatusRaidDebuff:DebuffId(zoneid, 48131, 1, 6, 6, true) --Stomp
PlexusStatusRaidDebuff:DebuffId(zoneid, 48639, 1, 6, 6, true) --Hamstring
PlexusStatusRaidDebuff:DebuffId(zoneid, 48871, 1, 6, 6, true) --Aimed Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 49092, 1, 6, 6, true) --Net
PlexusStatusRaidDebuff:DebuffId(zoneid, 48144, 1, 6, 6, true) --Terrifying Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 48277, 1, 6, 6, true) --Ritual Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 59408, 1, 6, 6, true) --Shadows in the Dark
PlexusStatusRaidDebuff:DebuffId(zoneid, 51750, 1, 6, 6, true) --Screams of the Dead
PlexusStatusRaidDebuff:DebuffId(zoneid, 59264, 1, 6, 6, true) --Gore
PlexusStatusRaidDebuff:DebuffId(zoneid, 59079, 1, 6, 6, true) --Grave Strike
PlexusStatusRaidDebuff:DebuffId(zoneid, 59237, 1, 6, 6, true) --Beast's Mark
PlexusStatusRaidDebuff:DebuffId(zoneid, 59334, 1, 6, 6, true) --Poisoned Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 49106, 1, 6, 6, true) --Terrify
PlexusStatusRaidDebuff:DebuffId(zoneid, 61549, 1, 6, 6, true) --Shred
PlexusStatusRaidDebuff:DebuffId(zoneid, 59304, 1, 6, 6, true) --Spirit Strike
end)