shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
game 'gta5'

client_script "client/client.lua"

name "PRO Sim Card"
description "Change your in-game phone number using an item"
author "SubhamPRO"

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

shared_scripts {
    'config.lua'
}
