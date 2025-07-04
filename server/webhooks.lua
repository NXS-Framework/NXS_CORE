if nxs and nxs.EnableDiscordLogs then 
    function sendToDiscord(title, message, color)
        local payload = {
            username = "Server Logs",
            embeds = {
                {
                    title = title,
                    description = message,
                    color = color,
                    footer = {
                        text = "Nexus PvP Core • " .. os.date("%Y-%m-%d %H:%M:%S")
                    }
                }
            }
        }

        PerformHttpRequest(nxs.Webhook, function(err, text, headers)
        end, 'POST', json.encode(payload), {
            ['Content-Type'] = 'application/json'
        })
    end
end
