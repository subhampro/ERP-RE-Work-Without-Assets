shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
games      { 'gta5' }

description 'ERP | RGB Controller'
author '</ERROR>'

ui_page 'html/index.html'

files {
    'html/js/jquery.js',
    'html/farbtastic/farbtastic.js',
    'html/farbtastic/farbtastic.css',
    'html/fonts/bebasneue.ttf',
    'html/farbtastic/*.png',
    'html/index.html',
}

server_scripts {
    'shared/config.lua',
    'server/server.lua',
}

client_scripts {
    'shared/config.lua',
    'client/client.lua',
}
