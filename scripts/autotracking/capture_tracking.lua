-- key = Slot:1:FFX_CAPTURE:54
function updateCaptures(key, value, oldValue)
    local arena_idx = tonumber(string.match(key, "[^:]*:[^:]*:.*_(.*)"))
    local fiend = Tracker:FindObjectForCode(AllCaptures[arena_idx])
    
    if fiend ~= nil and (value ~= 0 or oldValue ~= 0) then
        fiend.AcquiredCount = value
        print("ARENA_IDX: " .. arena_idx .. " (" .. AllCaptures[arena_idx] .. ") | QTY: " .. value)    
    end
end