shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

name "Jim-Shops"
author "Jimathy"
version "v1.7"
description "Shop Script By Jimathy"
fx_version "cerulean"
game "gta5"

dependencies { 'qb-input', 'qb-menu', 'qb-target' }

client_scripts { 'client.lua' }

server_scripts { '@oxmysql/lib/MySQL.lua', 'server.lua', }

shared_scripts { 'config.lua' }

lua54 'yes'