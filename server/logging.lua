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
        local identifiers = GetPlayerIdentifiers(src)
        local license, steam, discord = "unknown", "unknown", "unknown"
        for _, v in ipairs(identifiers) do
            if v:find("license:") then license = v end
            if v:find("steam:") then steam = v end
            if v:find("discord:") then discord = v:gsub("discord:", "") end
        end
        reason = reason or "Unknown"
        sendToDiscord(
            "🔴 Player",
            "**" .. playerName .. "** has disconnected.\n" ..
            "• Reason: `" .. reason .. "`\n" ..
            "• License: `" .. license .. "`\n" ..
            "• Steam: `" .. steam .. "`\n" ..
            "• Discord: `<@" .. discord .. ">`",
            15158332
        )
    end)
end
local function handlePlayerLoaded(src)
    local playerName = GetPlayerName(src)
    local identifiers = GetPlayerIdentifiers(src)

    local license, steam, discord = "unknown", "unknown", "unknown"
    for _, v in ipairs(identifiers) do
        if v:find("license:") then license = v end
        if v:find("steam:") then steam = v end
        if v:find("discord:") then discord = v:gsub("discord:", "") end
    end

    local ID = "unknown"
    if Config.Framework == "qb-core" then
        local QBCore = exports['qb-core']:GetCoreObject()
        local Player = QBCore.Functions.GetPlayer(src)
        if Player then ID = Player.PlayerData.citizenid or "unknown" end
    elseif Config.Framework == "esx" then
        local ESX = exports['es_extended']:getSharedObject()
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then ID = xPlayer.identifier or "unknown" end
    elseif Config.Framework == "standalone" then
        if not playerIDs then playerIDs = {} end
        if not lastID then lastID = 0 end
        if not playerIDs[src] then
            lastID = lastID + 1
            playerIDs[src] = lastID
        end
        ID = tostring(playerIDs[src])
    end

if Config and Config.EnableLogging then
    if Config.Framework == "qb-core" then
        RegisterNetEvent('QBCore:Server:PlayerLoaded')
        AddEventHandler('QBCore:Server:PlayerLoaded', function()
            print("[DEBUG] QBCore:Server:PlayerLoaded fired for source: " .. tostring(source))
            handlePlayerLoaded(source)
        end)
    elseif Config.Framework == "esx" then
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(playerId)
            print("[DEBUG] esx:playerLoaded fired for playerId: " .. tostring(playerId))
            handlePlayerLoaded(playerId)
        end)
    elseif Config.Framework == "standalone" then
        RegisterNetEvent('NXS:PlayerLoaded')
        AddEventHandler('NXS:PlayerLoaded', function()
            print("[DEBUG] NXS:PlayerLoaded fired for source: " .. tostring(source))
            handlePlayerLoaded(source)
        end)
    end
end
sendToDiscord(
        "🟢 Player Loaded",
        "**" .. playerName .. "** has fully loaded into the server.\n" ..
        "• ID: `" .. ID .. "`\n" ..
        "• License: `" .. license .. "`\n" ..
        "• Steam: `" .. steam .. "`\n" ..
        "• Discord: `<@" .. discord .. ">`",
        3066993
    )
end
