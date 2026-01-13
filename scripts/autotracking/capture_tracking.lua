local json = require("scripts/libraries/dkjson")
local captures = require("scripts/logic/captures")

function updateCaptures(value)
    local captures_table, i, err = json.decode(value)

    if captures_table then
        for _, capture in ipairs(captures_table.captures) do
            Tracker:FindObjectForCode(ArenaIndexToHostedItem[capture.arena_idx]).AcquiredCount = capture.captured
        end
    else
        print("JSON PARSE FAILED")
    end
end

ArenaIndexToHostedItem = {
    [13] = "dingo",
}

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
