Config = {}
--
--░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░
--██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░
--██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░
--██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗
--╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝
--░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░

-- Framework settings
Config.Framework = "standalone" -- "esx", "qbcore", or "standalone"
-- Disconnect/connect logging
Config.EnableLogging = true

--Discord webhook logging
Config.EnableDiscordLogs = false
  
-- Discord webhooks
Config.Webhooks = {
    PlayerConnecting = "", 
    PlayerDisconnected = "", 
}


