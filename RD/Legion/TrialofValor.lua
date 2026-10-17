--local zone = "Trial of Valor"
local zoneid = 807
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
PlexusStatusRaidDebuff:DebuffId(zoneid, 232450, 1, 5, 5) -- Corrupted Axion
PlexusStatusRaidDebuff:DebuffId(zoneid, 228883, 1, 5, 5) -- Unholy Reckoning

-- Guarm
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Guarm")
PlexusStatusRaidDebuff:DebuffId(zoneid, 228226, 11, 6, 6) -- Flame Lick
PlexusStatusRaidDebuff:DebuffId(zoneid, 228246, 12, 6, 6) -- Frost Lick
PlexusStatusRaidDebuff:DebuffId(zoneid, 228250, 13, 6, 6) -- Shadow Lick
PlexusStatusRaidDebuff:DebuffId(zoneid, 227539, 14, 5, 5) -- Fiery Phlegm
PlexusStatusRaidDebuff:DebuffId(zoneid, 227566, 15, 5, 5) -- Salty Spittle
PlexusStatusRaidDebuff:DebuffId(zoneid, 227570, 16, 5, 5) -- Dark Discharge
PlexusStatusRaidDebuff:DebuffId(zoneid, 228744, 17, 5, 5) -- Flaming Volatile Foam
PlexusStatusRaidDebuff:DebuffId(zoneid, 228810, 18, 5, 5) -- Briney Volatile Foam
PlexusStatusRaidDebuff:DebuffId(zoneid, 228818, 19, 5, 5) -- Shadowy Volatile Foam

-- Helya
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Helya")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227903, 21, 5, 5) -- Orb of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 228058, 22, 5, 5) -- Orb of Corrosion
PlexusStatusRaidDebuff:DebuffId(zoneid, 228054, 23, 6, 6) -- Taint of the Sea
PlexusStatusRaidDebuff:DebuffId(zoneid, 193367, 24, 5, 5) -- Fetid Rot
PlexusStatusRaidDebuff:DebuffId(zoneid, 227982, 25, 5, 5) -- Bilewater Redox
PlexusStatusRaidDebuff:DebuffId(zoneid, 228519, 26, 5, 5) -- Anchor Slam
PlexusStatusRaidDebuff:DebuffId(zoneid, 202476, 27, 5, 5) -- Rabid
PlexusStatusRaidDebuff:DebuffId(zoneid, 232450, 28, 5, 5) -- Corrupted Axion


-- Odyn
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Odyn")
PlexusStatusRaidDebuff:DebuffId(zoneid, 227959, 31, 5, 5) -- Storm of Justice
PlexusStatusRaidDebuff:DebuffId(zoneid, 227475, 32, 5, 5) -- Cleansing Flame
PlexusStatusRaidDebuff:DebuffId(zoneid, 192044, 33, 5, 5) -- Expel Light
PlexusStatusRaidDebuff:DebuffId(zoneid, 227781, 34, 5, 5) -- Glowing Fragment
end)