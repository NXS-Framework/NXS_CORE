if Config and Config.EnableLogging then

    AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
        local src = source
        local ip = GetPlayerEndpoint(src)
        
        
        print("\27[34m[ NXS-Core ] \27[0m Player " .. playerName .. " is connecting.")
        sendToDiscord("🔵 Player", 
    "**" .. playerName .. "** is connecting from IP: `xxx.xxx.xxx`\n" ..
    "_If you want to see this ip, use the command_ `/ip (id) " .. playerName .. "`", 
    3447003)
    end)

    AddEventHandler('playerDropped', function(reason)
        local src = source
        local playerName = GetPlayerName(src)
        reason = reason or "Unknown"
        
        print("\27[34m[ NXS-Core ] \27[0m Player " .. playerName .. " has disconnected. Reason: " .. reason)
        sendToDiscord("🔴 Player", "**" .. playerName .. "** has disconnected. Reason: `" .. reason .. "`", 15158332)
    end)

else
    print("Logging disabled or Config not loaded.")
end    

if Config and Config.Debug then
    print("Config:", Config)
    print("Config.EnableLogging:", Config.EnableLogging)
    print("sendToDiscord:", sendToDiscord)
end

