AddEventHandler('playerSpawned', function()
    TriggerServerEvent('NXS:PlayerLoaded')
end)


local showDebug = false

RegisterNetEvent('NXS:toggleDebug')
AddEventHandler('NXS:toggleDebug', function()
    showDebug = not showDebug
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if showDebug then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            local health = GetEntityHealth(ped)
            local fps = math.floor(1 / GetFrameTime())
            local id = GetPlayerServerId(PlayerId())
            local ping = GetPlayerPing(PlayerId())

            -- pozice 
            local y = 0.02
            local function draw(text)
                SetTextFont(0)
                SetTextProportional(1)
                SetTextScale(0.30, 0.30)
                SetTextColour(255, 255, 255, 255)
                SetTextOutline()
                SetTextEntry("STRING")
                AddTextComponentString(text)
                DrawText(0.01, y)
                y = y + 0.02
            end

            draw("~g~NSX DEBUG MODE~s~")
            draw("FPS: " .. fps)
            draw("Ping: " .. ping)
            draw("Player ID: " .. id)
            draw(string.format("Coords: %.2f, %.2f, %.2f", coords.x, coords.y, coords.z))
            draw("Heading: " .. math.floor(heading))
            draw("Health: " .. health)
        end
    end
end)
