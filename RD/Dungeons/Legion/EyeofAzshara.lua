--local zone = "Eye of Azshara"
local zoneid = 713

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
PlexusStatusRaidDebuff:DebuffId(zoneid, 196064, 1, 6, 6, true) --Tearing Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 195105, 1, 6, 6, true) --Crunching Bite
PlexusStatusRaidDebuff:DebuffId(zoneid, 196111, 1, 6, 6, true) --Jagged Claws
PlexusStatusRaidDebuff:DebuffId(zoneid, 196058, 1, 6, 6, true) --Lethargic Toxin
PlexusStatusRaidDebuff:DebuffId(zoneid, 196060, 1, 6, 6, true) --Numbing Toxin

--Lady Hatecoil
PlexusStatusRaidDebuff:BossNameId(zoneid, 10, "Warlord Parjesh")
PlexusStatusRaidDebuff:DebuffId(zoneid, 192131, 11, 6, 6, true) --Throw Spear
PlexusStatusRaidDebuff:DebuffId(zoneid, 192094, 12, 6, 6, true) --Impaling Spear
--Hatecoil Warrior
PlexusStatusRaidDebuff:DebuffId(zoneid, 195094, 13, 6, 6, true) --Coral Slash


--Lady Hatecoil
PlexusStatusRaidDebuff:BossNameId(zoneid, 20, "Lady Hatecoil")
PlexusStatusRaidDebuff:DebuffId(zoneid, 193698, 21, 6, 6, true) --Curse of the Witch


--Serpentrix
PlexusStatusRaidDebuff:BossNameId(zoneid, 30, "Serpentrix")
PlexusStatusRaidDebuff:DebuffId(zoneid, 191855, 31, 6, 6, true) --toxic-wound
end)