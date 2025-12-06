-- Core Functions
function has(item)
    return Tracker:ProviderCountForCode(item) > 0
end
