if Config.EnableLogging = true then
AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    local discordID, license = nil, nil
    local ip = GetPlayerEndpoint(src
    print("\27[34m[ NXS-Core ] \27[0m Player " .. playerName .. " is connecting.")
        sendToDiscord("🔵 Player ", "**" .. name .. "** is connecting from :`||" .. ip .. "||`", 3447003)
end)

AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(src)
    reason = reason or "Unknown"

    print("\27[34m[ NXS-Core ] \27[0m Player " .. playerName .. " has disconnected. Reason: " .. reason)
            sendToDiscord("🔴 Player ", "**" .. name .. "** has disconnected for `" .. reason .. "`", 15158332)
end)
end)
else
    print("Logging disabled or Config not loaded.")
end    

if Config and Config.Debug then
    print("Config:", Config)
    print("Config.EnableLogging:", Config and Config.EnableLogging)
end

