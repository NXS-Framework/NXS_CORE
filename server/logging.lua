AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    local discordID, license = nil, nil

    local playerName = GetPlayerName(src)

    print("\27[35m[ NXS-Core ] \27[0m Player " .. playerName .. " is connecting.")
end)