local ID = nil

if Config and Config.EnableLogging then

    AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
        local src = source
        local ip = GetPlayerEndpoint(src)


            if Config and Config.Framework == "qb-core" then
                local QBCore = exports['qb-core']:GetCoreObject()
                local Player = QBCore.Functions.GetPlayer(source)
                if Player then
                    ID = Player.PlayerData.citizenid
                end

            elseif Config and Config.Framework == "esx" then
                local ESX = exports['es_extended']:getSharedObject()
                local xPlayer = ESX.GetPlayerFromId(source)
                if xPlayer then
                    ID = xPlayer.identifier
                end

            elseif Config and Config.Framework == "standalone" then
                if not playerIDs then playerIDs = {} end
                if not lastID then lastID = 0 end

                if not playerIDs[source] then
                    lastID = lastID + 1
                    playerIDs[source] = lastID
                end

                ID = playerIDs[source]
            end

            local safeID = ID or "unknown"
-- zatím fungujen v standalone režim

        print("\27[34m[ NXS-Core ] \27[0m Player " .. playerName .. " is connecting.")
            sendToDiscord(
                "🔵 Player",
                "**" .. playerName .. "** is connecting from IP: `xxx.xxx.xxx`\n" ..
                "Identifier: `" .. safeID .. "`\n" ..
                "_Use_ `/ip " .. safeID .. "` _to view IP._",
                3447003
            )
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
    print("Framework", Config.Framework)
    print("Config:", Config)
    print("Config.EnableLogging:", Config.EnableLogging)
    print("sendToDiscord:", sendToDiscord)
end


