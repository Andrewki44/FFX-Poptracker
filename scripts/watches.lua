
-- Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddClearHandler("clear handler", onClearHandler)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)

Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)

-- Region Watches
-- ScriptHost:AddWatchForCode("update access level: airship", "airship", UpdateAccessLevels)
-- ScriptHost:AddWatchForCode("update logic: baajtemple", "baajtemple", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: besaid", "besaid", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: bevelle", "bevelle", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: bikanel", "bikanel", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: calmlands", "calmlands", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: cavernofthestolenfayth", "cavernofthestolenfayth", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: djose", "djose", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: gagazet", "gagazet", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: guadosalam", "guadosalam", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: kilika", "kilika", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: luca", "luca", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: macalania", "macalania", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: miihenhighroad", "miihenhighroad", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: moonflow", "moonflow", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: mushroomrockroad", "mushroomrockroad", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: omegaruins", "omegaruins", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: sin", "sin", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: thunderplains", "thunderplains", UpdateMaxRegionLogic)
-- ScriptHost:AddWatchForCode("update logic: zanarkand", "zanarkand", UpdateMaxRegionLogic)

-- Logic Difficulty Watch
ScriptHost:AddWatchForCode("Update Region Logic Difficulty", "logicdifficulty", UpdateAccessRegions)