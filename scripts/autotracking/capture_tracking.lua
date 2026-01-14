local json = require("scripts/libraries/dkjson")
local captures = require("scripts/logic/captures")

function updateCaptures(value)
    local captures_table, i, err = json.decode(value)
    local capture_updates = {}

    if captures_table then
        for _, capture in ipairs(captures_table.captures) do
            local fiend = Tracker:FindObjectForCode(AllCaptures[capture.arena_idx])
            fiend.AcquiredCount = capture.captured
            capture_updates[AllCaptures[capture.arena_idx]] = fiend.AcquiredCount
            -- print("Fiend: " .. AllCaptures[capture.arena_idx] .. "\nCaptured: " .. fiend.AcquiredCount)
        end
    else
        print("JSON PARSE FAILED")
        return
    end

    for fiend, qty in pairs(capture_updates) do
        print("\nFiend: " .. fiend .. "\nCaptured: " .. qty)
    end
end

-- Incoming json format --
-- {
--   "captures": [
--     {
--       "arena_idx": 13,
--       "captured": 5
--     },
--     {
--       "arena_idx": 33,
--       "captured": 5
--     },
--     {
--       "arena_idx": 4,
--       "captured": 2
--     },
--     {
--       "arena_idx": 19,
--       "captured": 1
--     },
--     {
--       "arena_idx": 55,
--       "captured": 1
--     },
--     {
--       "arena_idx": 57,
--       "captured": 1
--     }
--   ]
-- }
