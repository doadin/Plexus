--local zone = "Darkheart Thicket"
local zoneid = 733

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

-- zoneid, debuffID, order, icon_priority, color_priority, timer, stackable, color, default_disable, noicon
--true, true is for stackable

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

--Trash
PlexusStatusRaidDebuff:DebuffId(zoneid, 200580, 1, 6, 6, true) --Maddening Roar
PlexusStatusRaidDebuff:DebuffId(zoneid, 200642, 1, 6, 6, true) --Despair
PlexusStatusRaidDebuff:DebuffId(zoneid, 225484, 1, 6, 6, true) --Grievous Rip
PlexusStatusRaidDebuff:DebuffId(zoneid, 201365, 1, 6, 6, true) --Darksoul Drain
PlexusStatusRaidDebuff:DebuffId(zoneid, 204243, 1, 6, 6, true) --Tormenting Eye
PlexusStatusRaidDebuff:DebuffId(zoneid, 198904, 1, 6, 6, true) --Poison Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 199063, 1, 6, 6, true) --Strangling Roots
PlexusStatusRaidDebuff:DebuffId(zoneid, 204246, 1, 6, 6, true) --Tormenting Fear
PlexusStatusRaidDebuff:DebuffId(zoneid, 225568, 1, 6, 6, true) --Curse of Isolation
PlexusStatusRaidDebuff:DebuffId(zoneid, 200684, 1, 6, 6, true) -- Nightmare Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 218759, 1, 6, 6, true) -- Corruption Pool
PlexusStatusRaidDebuff:DebuffId(zoneid, 201839, 1, 6, 6, true) -- Curse of Isolation
PlexusStatusRaidDebuff:DebuffId(zoneid, 201902, 1, 6, 6, true) --Scorching Shot
PlexusStatusRaidDebuff:DebuffId(zoneid, 200771, 1, 6, 6, true) --Propelling Charge
PlexusStatusRaidDebuff:DebuffId(zoneid, 200631, 1, 6, 6, true) --Unnerving Screech

--Archdruid Glaidalis
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Archdruid Glaidalis")
PlexusStatusRaidDebuff:DebuffId(zoneid, 196376, 11, 6, 6, true) --Grievous Tear
PlexusStatusRaidDebuff:DebuffId(zoneid, 198408, 12, 6, 6, true) --Nightfall
PlexusStatusRaidDebuff:DebuffId(zoneid, 198376, 13, 6, 6, true) -- primal-rampage
PlexusStatusRaidDebuff:DebuffId(zoneid, 198477, 14, 6, 6, true) -- Fixate


--Oakheart
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Oakheart")
PlexusStatusRaidDebuff:DebuffId(zoneid, 204667, 21, 6, 6, true) --Nightmare Breath
PlexusStatusRaidDebuff:DebuffId(zoneid, 204611, 22, 6, 6, true) --Crushing Grip
PlexusStatusRaidDebuff:DebuffId(zoneid, 204574, 23, 6, 6, true) -- strangling-roots
PlexusStatusRaidDebuff:DebuffId(zoneid, 204666, 24, 6, 6, true) -- shattered-earth


--Dresaron
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Dresaron")
PlexusStatusRaidDebuff:DebuffId(zoneid, 220855, 31, 6, 6, true) --Down Draft
PlexusStatusRaidDebuff:DebuffId(zoneid, 191326, 32, 6, 6, true) --Breath of Corruption
PlexusStatusRaidDebuff:DebuffId(zoneid, 199460, 33, 6, 6, true) -- falling-rocks
PlexusStatusRaidDebuff:DebuffId(zoneid, 199389, 34, 6, 6, true) -- earthshaking-roar

--Shade of Xavius
PlexusStatusRaidDebuff:BossNameId(zoneid, 40, "Shade of Xavius")
PlexusStatusRaidDebuff:DebuffId(zoneid, 200289, 41, 6, 6, true) --Growing Paranoia
PlexusStatusRaidDebuff:DebuffId(zoneid, 200238, 42, 6, 6, true) --Feed on the Weak
PlexusStatusRaidDebuff:DebuffId(zoneid, 200182, 43, 6, 6, true) --Festering Rip
PlexusStatusRaidDebuff:DebuffId(zoneid, 200273, 44, 6, 6, true) -- Cowardice
PlexusStatusRaidDebuff:DebuffId(zoneid, 200243, 45, 6, 6, true) -- Waking Nightmare
PlexusStatusRaidDebuff:DebuffId(zoneid, 204502, 46, 6, 6, true) -- apocalyptic-nightmare
PlexusStatusRaidDebuff:DebuffId(zoneid, 200111, 47, 6, 6, true) -- apocalyptic-fire
PlexusStatusRaidDebuff:DebuffId(zoneid, 200329, 48, 6, 6, true) --Overwhelming Terror
end)