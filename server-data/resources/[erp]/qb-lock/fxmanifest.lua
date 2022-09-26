shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'bodacious'
games { 'gta5' }

author 'Leastjuh'
description 'Lockpick Circle Mini-Game'
version '1.0'

client_scripts {
    'client/*.lua',
}

ui_page {
    'html/index.html',
}
files {
    'html/index.html',
    'html/*.css',
    'html/*.js',
}

exports {
    "StartLockPickCircle"
}