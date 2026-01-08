function UpdatePrimerTotal(code)
    Tracker:FindObjectForCode("albhedprimers").AcquiredCount = Tracker:ProviderCountForCode(code)
end