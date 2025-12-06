-- Region Logic
function hasAirship()
    return has("region:airship")
end

function hasBaaj()
    return has("region:baajtemple")
end

function hasBesaid()
    return has("region:besaid")
end

function hasBevelle()
    return has("region:bevelle")
end

function hasBikanel()
    return has("region:bikanel")
end

function hasCalmLands()
    return has("region:calmlands")
end

function hasCavern()
    return has("region:cavernofthestolenfayth")
end

function hasDjose()
    return has("region:djose")
end

function hasGagazet()
    return has("region:mt.gagazet")
end

function hasGuadosalam()
    return has("region:guadosalam")
end

function hasKilika()
    return has("region:kilika")
end

function hasLuca()
    return has("region:luca")
end

function hasMacalania()
    return has("region:macalania")
end

function hasMiihen()
    return has("region:miihenhighroad")
end

function hasMoonflow()
    return has("region:moonflow")
end

function hasMRR()
    return has("region:mushroomrockroad")
end

function hasOmega()
    return has("region:omegaruins")
end

function hasSin()
    return has("region:sin")
end

function hasThunderPlains()
    return has("region:thunderplains")
end

function hasZanarkand()
    return has("region:zanarkandruins")
end

RegionDifficulty = {
    ["Guadosalam"] = 1,
    ["Baaj"] = 1,
    ["Besaid"] = 2,
    ["Kilika"] = 3,
    ["Luca"] = 4,
    ["Miihen"] = 5,
    ["MushroomRock"] = 6,
    ["Djose"] = 7,
    ["Moonflow"] = 8,
    ["ThunderPlains"] = 10,
    ["Macalania"] = 11,
    ["Bikanel"] = 12,
    ["Airship"] = 13,
    ["Bevelle"] = 13,
    ["CalmLands"] = 14,
    ["Cavern"] = 14,
    ["Gagazet"] = 15,
    ["Zanarkand"] = 16,
    ["Sin"] = 17,
    ["Omega"] = 18
}
-- RegionDifficulty = {
--     [1] = {"Guadosalam", "Baaj"},
--     [2] = {"Besaid"},
--     [3] = {"Kilika"},
--     [4] = {"Luca"},
--     [5] = {"Miihen"},
--     [6] = {"MushroomRock"},
--     [7] = {"Djose"},
--     [8] = {"Moonflow"},
--     [9] = {},
--     [10] = {"ThunderPlains"},
--     [11] = {"Macalania"},
--     [12] = {"Bikanel"},
--     [13] = {"Airship", "Bevelle"},
--     [14] = {"CalmLands", "Cavern"},
--     [15] = {"Gagazet"},
--     [16] = {"Zanarkand"},
--     [17] = {"Sin"},
--     [18] = {"Omega"}
-- }
CurrentMaxDifficulty = 1

function CheckLogic(Region)
    local LogicDifficulty = Tracker:ProviderCountForCode("logicdifficulty")

    if (RegionDifficulty[Region] > CurrentMaxDifficulty) then
        print(RegionDifficulty[Region])
    end
end

-- function CheckMax()
--     print()
-- end
