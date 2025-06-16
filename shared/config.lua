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

--Debug Seting
Config.Debug = true

-- Disconnect/connect logging
Config.EnableLogging = true

--Discord webhook logging
Config.EnableDiscordLogs = false
  
-- Discord webhooks
Config.Webhooks = {
    PlayerConnecting = "", 
    PlayerDisconnected = "", 
}
