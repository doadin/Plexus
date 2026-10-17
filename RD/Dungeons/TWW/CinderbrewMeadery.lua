-- local zone = "Cinderbrew Meadery"
local zoneid = 2335
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
PlexusStatusRaidDebuff:DebuffId(zoneid, 437956, 1, 5, 5, true) --Erupting Inferno
PlexusStatusRaidDebuff:DebuffId(zoneid, 434707, 1, 5, 5, true) --Cinderbrew Toss
PlexusStatusRaidDebuff:DebuffId(zoneid, 437721, 1, 5, 5, true) --Boiling Flames
PlexusStatusRaidDebuff:DebuffId(zoneid, 463220, 1, 5, 5, true) --Volatile Keg
PlexusStatusRaidDebuff:DebuffId(zoneid, 442995, 1, 5, 5, true) --Swarming Surprise
PlexusStatusRaidDebuff:DebuffId(zoneid, 435000, 1, 5, 5, true) --High Steaks
PlexusStatusRaidDebuff:DebuffId(zoneid, 441397, 1, 5, 5, true) --Bee Venom
PlexusStatusRaidDebuff:DebuffId(zoneid, 434773, 1, 5, 5, true) --Mean Mug
PlexusStatusRaidDebuff:DebuffId(zoneid, 440687, 1, 5, 5, true) --Honey Volley

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

PlexusStatusRaidDebuff:BossNameId(zoneid, 100, "Brew Master Aldryr")
PlexusStatusRaidDebuff:DebuffId(zoneid, 442525, 101, 5, 5, true) --Happy Hour
PlexusStatusRaidDebuff:DebuffId(zoneid, 442611, 102, 5, 5, true) --Disregard
PlexusStatusRaidDebuff:DebuffId(zoneid, 445180, 103, 5, 5, true) --Crawling Brawl
PlexusStatusRaidDebuff:DebuffId(zoneid, 431896, 104, 5, 5, true) --Rowdy Yell
PlexusStatusRaidDebuff:DebuffId(zoneid, 432198, 105, 5, 5, true) --Blazing Belch
PlexusStatusRaidDebuff:DebuffId(zoneid, 432182, 106, 5, 5, true) --Throw Cinderbrew
PlexusStatusRaidDebuff:DebuffId(zoneid, 432196, 107, 5, 5, true) --Hot Honey
PlexusStatusRaidDebuff:DebuffId(zoneid, 432229, 108, 5, 5, true) --Keg Smash


PlexusStatusRaidDebuff:BossNameId(zoneid, 200, "I'pa")
PlexusStatusRaidDebuff:DebuffId(zoneid, 439365, 201, 5, 5, true) --Spouting Stout
PlexusStatusRaidDebuff:DebuffId(zoneid, 441171, 202, 5, 5, true) --Oozing Honey
PlexusStatusRaidDebuff:DebuffId(zoneid, 440104, 203, 5, 5, true) --Fill 'Er Up
PlexusStatusRaidDebuff:DebuffId(zoneid, 442122, 204, 5, 5, true) --Frothy
PlexusStatusRaidDebuff:DebuffId(zoneid, 448718, 205, 5, 5, true) --Reform
PlexusStatusRaidDebuff:DebuffId(zoneid, 439202, 206, 5, 5, true) --Burning Fermentation
PlexusStatusRaidDebuff:DebuffId(zoneid, 439031, 207, 5, 5, true) --Bottoms Uppercut


PlexusStatusRaidDebuff:BossNameId(zoneid, 300, "Benk Buzzbee")
PlexusStatusRaidDebuff:DebuffId(zoneid, 438025, 301, 5, 5, true) --Snack Time
PlexusStatusRaidDebuff:DebuffId(zoneid, 438971, 302, 5, 5, true) --Shredding Sting
PlexusStatusRaidDebuff:DebuffId(zoneid, 438763, 303, 5, 5, true) --Bee-Haw!
PlexusStatusRaidDebuff:DebuffId(zoneid, 440134, 304, 5, 5, true) --Honey Marinade
PlexusStatusRaidDebuff:DebuffId(zoneid, 443983, 305, 5, 5, true) --Honey Gorged
PlexusStatusRaidDebuff:DebuffId(zoneid, 439524, 306, 5, 5, true) --Fluttering Wing


PlexusStatusRaidDebuff:BossNameId(zoneid, 400, "Goldie Baronbottom")
PlexusStatusRaidDebuff:DebuffId(zoneid, 435567, 401, 5, 5, true) --Spread the Love!
PlexusStatusRaidDebuff:DebuffId(zoneid, 435788, 402, 5, 5, true) --Cinder-BOOM!
PlexusStatusRaidDebuff:DebuffId(zoneid, 435789, 403, 5, 5, true) --Cindering Wounds
PlexusStatusRaidDebuff:DebuffId(zoneid, 435622, 404, 5, 5, true) --Let It Hail!
PlexusStatusRaidDebuff:DebuffId(zoneid, 436640, 405, 5, 5, true) --Burning Ricochet
PlexusStatusRaidDebuff:DebuffId(zoneid, 436592, 406, 5, 5, true) --Cash Cannon
end)
