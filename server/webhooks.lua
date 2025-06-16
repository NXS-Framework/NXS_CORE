if Config and Config.EnableDiscordLogs then 
function sendToDiscord(title, message, color)
    local payload = {
        username = "Server Logs",
        embeds = {
            {
                title = title,
                description = message,
                color = color,
                footer = {
                    text = "NXS Core • " .. os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
    }

    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode(payload), {
        ['Content-Type'] = 'application/json'
    })
end