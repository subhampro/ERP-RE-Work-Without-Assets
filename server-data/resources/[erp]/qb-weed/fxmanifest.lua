shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'cerulean'
game 'gta5'

description 'QB-Weed'
version '1.0.0'

shared_script 'config.lua'

client_script 'client/main.lua'

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

lua54 'yes'