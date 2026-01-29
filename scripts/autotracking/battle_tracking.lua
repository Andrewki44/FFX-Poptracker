function updateBattleLogic(encounter, value)
    if (encounter == "zu") then
        Tracker:FindObjectForCode("zuboss").Active = value
        print("LOGIC: ZU = " .. tostring(value))
    end
end