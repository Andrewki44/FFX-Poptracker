
local variant = Tracker.ActiveVariantUID

-- Items
require("scripts/items_import")

-- Logic
-- require("scripts/logic/logic_helper")
-- require("scripts/logic/logic_main")
require("scripts/logic/core")
require("scripts/logic/regions")
require("scripts/logic/party_members")
require("scripts/logic/celestial")
require("scripts/logic/primers")
require("scripts/logic/captures")

-- Maps
if Tracker.ActiveVariantUID == "maps-u" then
    Tracker:AddMaps("maps/maps-u.json")  
else
    Tracker:AddMaps("maps/maps.json")  
end  

-- if PopVersion and PopVersion >= "0.23.0" then
--     Tracker:AddLocations("locations/dungeons.json")
-- end

-- Layout
require("scripts/layouts_import")

-- Locations
require("scripts/locations_import")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.26.0" then
    require("scripts/autotracking")
end

function OnFrameHandler()
    ScriptHost:RemoveOnFrameHandler("load handler")
    -- stuff
    -- ScriptHost:AddWatchForCode("StateChanged", "*", StateChanged)
    ScriptHost:AddOnLocationSectionChangedHandler("location_section_change_handler", ForceUpdate)
    ForceUpdate()
end
require("scripts/watches")
ScriptHost:AddOnFrameHandler("load handler", OnFrameHandler)

UpdateAccessRegions()