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
    ["thunderplains"] = 9,
    ["macalania"] = 10,
    ["bikanel"] = 11,
    ["airship"] = 12,
    ["bevelle"] = 12,
    ["calmlands"] = 13,
    ["cavernofthestolenfayth"] = 13,
    ["gagazet"] = 14,
    ["baajtemple2"] = 15,
    ["zanarkand"] = 15,
    ["airshipsin"] = 16,
    ["sin"] = 16,
    ["omegaruins"] = 17,
    ["superbosses"] = 18
}

RegionOrder = {
    "guadosalam",
    "baajtemple",
    "besaid",
    "kilika",
    "luca",
    "miihenhighroad",
    "mushroomrockroad",
    "djose",
    "moonflow",
    "thunderplains",
    "macalania",
    "bikanel",
    "airship",
    "bevelle",
    "calmlands",
    "cavernofthestolenfayth",
    "gagazet",
    "baajtemple2",
    "zanarkand",
    "airshipsin",
    "sin",
    "omegaruins",
    "superbosses"
}

RegionAccessibility = {
    ["guadosalam"] = ACCESS_NONE,
    ["baajtemple"] = ACCESS_NONE,
    ["besaid"] = ACCESS_NONE,
    ["kilika"] = ACCESS_NONE,
    ["luca"] = ACCESS_NONE,
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
    ["baajtemple2"] = ACCESS_NONE,
    ["zanarkand"] = ACCESS_NONE,
    ["airshipsin"] = ACCESS_NONE,
    ["sin"] = ACCESS_NONE,
    ["omegaruins"] = ACCESS_NONE,
    ["superbosses"] = ACCESS_NONE
}

-- Must be in difficulty order
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
    ["baajtemple2"] = {},
    ["zanarkand"] = {},
    ["airshipsin"] = {},
    ["sin"] = {},
    ["omegaruins"] = {},
    ["superbosses"] = {}
}

-- Updates RegionAccessRegions with list of regions required to access new region, based on difficulty
function UpdateAccessRegions()
    local LogicDifficulty = Tracker:ProviderCountForCode("logicdifficulty")
    
    for Region, Level in pairs(RegionDifficulty) do
        if (Level >= 5) then
            RegionAccessRegions[Region] = {}
            for OtherRegion, OtherLevel in pairs(RegionDifficulty) do
                if (Level > OtherLevel and OtherLevel >= Level - LogicDifficulty) then
                    table.insert(RegionAccessRegions[Region], OtherRegion)
                end
            end
        end
    end

    -- Print table
    -- for region, value in pairs(RegionAccessRegions) do
    --     for _, regions in ipairs(value) do
    --         print(region .. " | " .. regions)
    --     end
    -- end

    UpdateAccessLevels()
end

-- Updates RegionAccessibility based on RegionAccessRegions when a new region is gained
function UpdateAccessLevels()

    for Index, Region in ipairs(RegionOrder) do
        -- print(Index .. " | " .. Region)
        -- Check for region item
        if (Tracker:FindObjectForCode(Region).Active == true or Region == "superbosses") then
            -- Has region item
            -- Difficulty < 5 --> Always have access
            if (RegionDifficulty[Region] < 5) then
                -- print("REGION DIFFICULTY < 5: " .. Region)
                RegionAccessibility[Region] = ACCESS_NORMAL
            
            -- Check RegionAccessRegions to see if access regions have normal access
            else
                for CheckRegion, AccessRegion in pairs(RegionAccessRegions[Region]) do
                    if (RegionAccessibility[AccessRegion] == ACCESS_NORMAL) then
                        -- print(CheckRegion .. " | " .. AccessRegion .. " | ACCESS_NORMAL")
                        RegionAccessibility[Region] = ACCESS_NORMAL
                        break
                    else
                        -- print(AccessRegion .. " | ACCESS_SEQUENCEBREAK")
                        RegionAccessibility[Region] = ACCESS_SEQUENCEBREAK
                    end
                end
            end  
        else
            -- No region item
            -- print("REGION OBJECT FALSE: " .. Region)            
            RegionAccessibility[Region] = ACCESS_NONE
        end
    end
end

function CheckAccessLevel(Region)
    -- print("CHECK ACCESS: " .. Region .. " | " .. RegionAccessibility[Region])
    return RegionAccessibility[Region]
end

function CheckGoalRequirement()
    local goal = Tracker:FindObjectForCode("goalrequirement").CurrentStage
    
    if (goal == 0) then
        -- No Requirements
        return ACCESS_NORMAL
    elseif (goal == 1) then
        -- Party Members
        if (hasPartyMembers(Tracker:ProviderCountForCode("requiredpartymembers"))) then
            return ACCESS_NORMAL
        else
            return ACCESS_NONE
        end
    elseif (goal == 2) then
        -- Pilgrimage
        if (has("besaidcloister") and has("kilikacloister") and has("djosecloister") and has("macalaniacloister") and has("bevellecloister") and has("yunalesca")) then
            print("PILGRIMAGE ACCESS_NORMAL")
            return ACCESS_NORMAL
        else
            print("PILGRIMAGE ACCESS_NONE")
            return ACCESS_NONE
        end
    elseif (goal == 3) then
        -- Party Members & Aeons
        if (hasPartyMembersAndAeons(Tracker:ProviderCountForCode("requiredpartymembers"))) then
            return ACCESS_NORMAL
        else
            return ACCESS_NONE
        end
    end
end