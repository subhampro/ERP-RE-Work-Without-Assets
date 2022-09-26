shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
author '</ERROR>'
Description 'ERP | Farming'
game 'gta5'

dependencies {
    'qb-menu',
    'qb-target',
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', 
    'config.lua',
}

client_scripts{
    'client/**.lua',
}

server_scripts{
    'server/**.lua',
}

this_is_a_map 'yes'

lua54 'yes'