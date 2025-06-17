fx_version 'cerulean'
game 'gta5'

author 'Nexus Development'
description 'An advanced PvP Core for FiveM servers'
version '1.0.0'

shared_scripts {
    'shared/config.lua',
}

client_scripts {
    'client/*',
}

server_scripts {
     'server/logging.lua',
}

dependencies {
    'nexus_anticheat',
    'ox_inventory',
    'ox_target'
    'ox_lib'
}

   

 -- files {
 --   prostě další soubory jako html, css, js, json, pro saskyče C# :D
