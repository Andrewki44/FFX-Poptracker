-- Core Functions
function has(item)
    return Tracker:ProviderCountForCode(item) > 0
end

function canReachAnima()
    if (hasBesaid() and hasKilika() and hasDjose() and hasMacalania() and hasZanarkand()) then
        return true
    else
        return false
    end
end