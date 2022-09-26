shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'cerulean'
game 'gta5'

description 'PRO-gsr'
version '1.0.0'

ui_page 'html/index.html'


client_script {
	'client.lua',
	'config.lua',
}

server_script {
	'server.lua',
	'config.lua',
}


lua54 'yes'