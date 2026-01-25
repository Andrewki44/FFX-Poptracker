AllCaptures = {
    [0] = "raldo",
    [1] = "bunyip",
    [2] = "murussu",
    [3] = "mafdet",
    [4] = "shred",
    [5] = "gandarewa",
    [6] = "aerouge",
    [7] = "imp",
    [8] = "dingo",
    [9] = "miihenfang",
    [10] = "garm",
    [11] = "snowwolf",
    [12] = "sandwolf",
    [13] = "skoll",
    [14] = "bandersnatch",
    [15] = "waterflan",
    [16] = "thunderflan",
    [17] = "snowflan",
    [18] = "iceflan",
    [19] = "flameflan",
    [20] = "darkflan",
    [21] = "dinonix",
    [22] = "ipiria",
    [23] = "raptor",
    [24] = "melusine",
    [25] = "iguion",
    [26] = "yowie",
    [27] = "condor",
    [28] = "simurgh",
    [29] = "alcyone",
    [30] = "killerbee",
    [31] = "bitebug",
    [32] = "wasp",
    [33] = "nebiros",
    [34] = "floatingeye",
    [35] = "buer",
    [36] = "evileye",
    [37] = "ahriman",
    [38] = "ragora",
    [39] = "grat",
    [40] = "garuda",
    [41] = "zu",
    [42] = "sandworm",
    [43] = "",
    [44] = "ghost",
    [45] = "achelous",
    [46] = "maelspike",
    [47] = "dualhorn",
    [48] = "valaha",
    [49] = "grendel",
    [50] = "vouivre",
    [51] = "lamashtu",
    [52] = "kusariqqu",
    [53] = "mushussu",
    [54] = "nidhogg",
    [55] = "malboro",
    [56] = "greatmalboro",
    [57] = "ogre",
    [58] = "bashura",
    [59] = "",
    [60] = "splasher",
    [61] = "yellowelement",
    [62] = "whiteelement",
    [63] = "redelement",
    [64] = "goldelement",
    [65] = "blueelement",
    [66] = "darkelement",
    [67] = "blackelement",
    [68] = "epaaj",
    [69] = "behemoth",
    [70] = "behemothking",
    [71] = "chimera",
    [72] = "chimerabrain",
    [73] = "coeurl",
    [74] = "mastercoeurl",
    [75] = "demonolith",
    [76] = "irongiant",
    [77] = "geminisword",
    [78] = "geminiclub",
    [79] = "basilisk",
    [80] = "anacondaur",
    [81] = "adamantoise",
    [82] = "varuna",
    [83] = "ochu",
    [84] = "mandragora",
    [85] = "bomb",
    [86] = "grenade",
    [87] = "qactuar",
    [88] = "cactuar",
    [89] = "larva",
    [90] = "barbatos",
    [91] = "funguar",
    [92] = "thorn",
    [93] = "exoray",
    [94] = "xiphos",
    [95] = "puroboros",
    [96] = "spirit",
    [97] = "wraith",
    [98] = "tonberry",
    [99] = "mastertonberry",
    [100] = "zaurus",
    [101] = "halma",
    [102] = "floatingdeath",
    [103] = "machea",
}

AllCreations = {
    "stratoavis",
    "malboromenace",
    "kottos",
    "coeurlregina",
    "cactuarking",
    "espada",
    "abyssworm",
    "chimerageist",
    "dontonberry",
    "catoblepas",
    "abaddon",
    "vorban",
    "fenrir",
    "ornitholestes",
    "pteryx",
    "hornet",
    "vidatu",
    "oneeye",
    "jumboflan",
    "negaelemental",
    "tanket",
    "fafnir",
    "sleepsprout",
    "bombking",
    "juggernaut",
    "ironclad",
    "eartheater",
    "greatersphere",
    "catastrophe",
    "thuban",
    "neslug",
    "ultimabuster",
    "shinryu",
}

function CheckAllCaptures(qty)    
    for _, capture in ipairs(AllCaptures) do
        if (capture ~= "") then
            if (Tracker:FindObjectForCode(capture).AcquiredCount < tonumber(qty)) then
                return ACCESS_NONE
            end    
        end
    end
    return ACCESS_NORMAL
end

function CheckAllCreations()    
    for _, creation in ipairs(AllCreations) do
        if (not Tracker:FindObjectForCode(creation).Active) then
            return ACCESS_NONE
        end
    end
    return ACCESS_NORMAL
end

function CheckCaptures(fiend)
    local capture = Tracker:FindObjectForCode(fiend)
    local access = ACCESS_NONE

    if (capture.AcquiredCount ~= 0) then
        if (capture.AcquiredCount > 0) then
            if (capture.AcquiredCount == 10) then
                print(fiend .. " ACCESS = CLEARED")
                return ACCESS_CLEARED
            end
            print(fiend .. " ACCESS = INSPECT")
            return ACCESS_INSPECT
        end
        print(fiend .. " ACCESS = NONE")
        return ACCESS_NONE
    else
        print(fiend .. " ACCESS = NORMAL")
        return ACCESS_NORMAL
    end
end

function CheckCaptures(fiends)
    local access = ACCESS_NONE
    
    for fiend in ipairs(fiends) do
        local capture = Tracker:FindObjectForCode(fiend)

        if (capture.AcquiredCount >= 1) then
            if (capture.AcquiredCount < 10) then
                access = ACCESS_INSPECT
                goto continue
            end
        end
        
        ::continue::
    end
    
    

    
end