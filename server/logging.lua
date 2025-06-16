if Config.EnableLogging = true then
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    local discordID, license = nil, nil

    print("\27[34m[ NXS-Core ] \27[0m Player " .. playerName .. " is connecting.")
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    local playerName = GetPlayerName(src)
    reason = reason or "Unknown"

    print("\27[34m[ NXS-Core ] \27[0m Player " .. playerName .. " has disconnected. Reason: " .. reason)
end)
else
    print("Logging disabled or Config not loaded.")
end    

if Config and Confi.Debug then
    print("Config:", Config)
    print("Config.EnableLogging:", Config and Config.EnableLogging)
end

