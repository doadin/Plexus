-- local zone = "Cruicible of Storms"
local zoneid = 1345
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
PlexusStatusRaidDebuff:DebuffId(zoneid, 294009, 1, 5, 5, true) --Mind Sear
PlexusStatusRaidDebuff:DebuffId(zoneid, 293957, 1, 5, 5, true) --Maddening Gaze
PlexusStatusRaidDebuff:DebuffId(zoneid, 294141, 1, 5, 5, true) --Embrace Madness
PlexusStatusRaidDebuff:DebuffId(zoneid, 293796, 1, 5, 5, true) --Dark Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 294175, 1, 5, 5, true) --Mind Shatter

-- The Restless Cabal
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "The Restless Cabal")
PlexusStatusRaidDebuff:DebuffId(zoneid, 283524, 11, 3, 3, true) --Aphotic Blast
PlexusStatusRaidDebuff:DebuffId(zoneid, 282384, 12, 4, 4, true, true) --Shear Mind
PlexusStatusRaidDebuff:DebuffId(zoneid, 282561, 13, 5, 5, true) --Dark Herald
PlexusStatusRaidDebuff:DebuffId(zoneid, 282432, 14, 5, 5, true) --Crushing Doubt
PlexusStatusRaidDebuff:DebuffId(zoneid, 282589, 15, 5, 5, true) --Cerebral Assault
PlexusStatusRaidDebuff:DebuffId(zoneid, 282566, 16, 5, 5, true) --Promises of Power
PlexusStatusRaidDebuff:DebuffId(zoneid, 282743, 17, 5, 5, true) --Storm of Annihilation
PlexusStatusRaidDebuff:DebuffId(zoneid, 282738, 18, 5, 5, true) --Embrace of the Void

-- Uu'nat, Harbinger of the Void
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Uu'nat, Harbinger of the Void")
PlexusStatusRaidDebuff:DebuffId(zoneid, 284851, 21, 5, 5, true) --Touch of the End
PlexusStatusRaidDebuff:DebuffId(zoneid, 285652, 22, 5, 5, true) --Insatiable Torment
PlexusStatusRaidDebuff:DebuffId(zoneid, 285685, 23, 5, 5, true) --Gift of N'Zoth: Lunacy
PlexusStatusRaidDebuff:DebuffId(zoneid, 285367, 24, 5, 5, true) --Piercing Gaze of N'Zoth
PlexusStatusRaidDebuff:DebuffId(zoneid, 285345, 25, 5, 5, true) --Maddening Eyes of N'Zoth
PlexusStatusRaidDebuff:DebuffId(zoneid, 285477, 26, 5, 5, true) --Obscurity
end)