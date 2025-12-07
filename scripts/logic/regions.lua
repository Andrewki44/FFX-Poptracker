-- Region Logic
RegionDifficulty = {
    ["guadosalam"] = 1,
    ["baajtemple"] = 1,
    ["besaid"] = 2,
    ["kilika"] = 3,
    ["luca"] = 4,
    ["miihenhighroad"] = 5,
    ["mushroomrockroad"] = 6,
    ["djose"] = 7,
    ["moonflow"] = 8,
    ["thunderplains"] = 10,
    ["macalania"] = 11,
    ["bikanel"] = 12,
    ["airship"] = 13,
    ["bevelle"] = 13,
    ["calmlands"] = 14,
    ["cavernofthestolenfayth"] = 14,
    ["gagazet"] = 15,
    ["zanarkand"] = 16,
    ["sin"] = 17,
    ["omegaruins"] = 18
}

-- RegionToLocation = {
--     ["guadosalam"] = "Guadosalam",
--     ["baajtemple"] = "Baaj Temple",
--     ["besaid"] = "Besaid",
--     ["kilika"] = "Kilika",
--     ["luca"] = "Luca",
--     ["miihenhighroad"] = "Miihen Highroad",
--     ["mushroomrockroad"] = "Mushroom Rock Road",
--     ["djose"] = "Djose",
--     ["moonflow"] = "Moonflow",
--     ["thunderplains"] = "Thunder Plains",
--     ["macalania"] = "Macalania",
--     ["bikanel"] = "Bikanel",
--     ["airship"] = "Airship",
--     ["bevelle"] = "Bevelle",
--     ["calmlands"] = "Calm Lands",
--     ["cavernofthestolenfayth"] = "Cavern of the Stolen Fayth",
--     ["gagazet"] = "Mt. Gagazet",
--     ["zanarkand"] = "Zanarkand",
--     ["sin"] = "Inside Sin",
--     ["omegaruins"] = "Omega Ruins"
-- }

RegionAccessibility = {
    ["guadosalam"] = ACCESS_NORMAL,
    ["baajtemple"] = ACCESS_NORMAL,
    ["besaid"] = ACCESS_NORMAL,
    ["kilika"] = ACCESS_NORMAL,
    ["luca"] = ACCESS_NORMAL,
    ["miihenhighroad"] = ACCESS_NONE,
    ["mushroomrockroad"] = ACCESS_NONE,
    ["djose"] = ACCESS_NONE,
    ["moonflow"] = ACCESS_NONE,
    ["thunderplains"] = ACCESS_NONE,
    ["macalania"] = ACCESS_NONE,
    ["bikanel"] = ACCESS_NONE,
    ["airship"] = ACCESS_NONE,
    ["bevelle"] = ACCESS_NONE,
    ["calmlands"] = ACCESS_NONE,
    ["cavernofthestolenfayth"] = ACCESS_NONE,
    ["gagazet"] = ACCESS_NONE,
    ["zanarkand"] = ACCESS_NONE,
    ["sin"] = ACCESS_NONE,
    ["omegaruins"] = ACCESS_NONE
}

RegionAccessRegions = {
    ["guadosalam"] = {},
    ["baajtemple"] = {},
    ["besaid"] = {},
    ["kilika"] = {},
    ["luca"] = {},
    ["miihenhighroad"] = {},
    ["mushroomrockroad"] = {},
    ["djose"] = {},
    ["moonflow"] = {},
    ["thunderplains"] = {},
    ["macalania"] = {},
    ["bikanel"] = {},
    ["airship"] = {},
    ["bevelle"] = {},
    ["calmlands"] = {},
    ["cavernofthestolenfayth"] = {},
    ["gagazet"] = {},
    ["zanarkand"] = {},
    ["sin"] = {},
    ["omegaruins"] = {}
}

function UpdateAccessRegions()
    local LogicDifficulty = Tracker:ProviderCountForCode("logicdifficulty")
    
    for region, level in pairs(RegionDifficulty) do
        if (level > 5) then
            for other_region, other_level in pairs(RegionDifficulty) do
                if (level > other_level and other_level >= level - LogicDifficulty) then
                    table.insert(RegionAccessRegions[region], other_region)
                end
            end
        end
    end

    -- Print table
    for region, value in pairs(RegionAccessRegions) do
        for _, regions in ipairs(value) do
            print(region .. " | " .. regions)
        end
    end

end

function CheckRegionLogic(Region)
    print("ENTERING CHECK_REGION")
    local level = RegionDifficulty[Region]

    if (level < 5 and has(Region)) then
        --If region level < 5, always have access
        return true
    else
        local LogicDifficulty = Tracker:ProviderCountForCode("logicdifficulty")
        
        --Get list of regions within difficulty range of Region
        local appropriate_level_regions = {}
        for other_region, other_level in pairs(RegionDifficulty) do
            if (level > other_level and other_level >= level - LogicDifficulty) then
                table.insert(appropriate_level_regions, other_region)
            end
        end

        -- Print regions in logic from region
        for index, test in ipairs(appropriate_level_regions) do
            print(test)
        end

        -- Return true if location in table is accessible 
        for index, other_region in ipairs(appropriate_level_regions) do
            -- if () then
            --     return true
            -- end
            return ACCESS_SEQUENCEBREAK
        end
        return false
    end
end
