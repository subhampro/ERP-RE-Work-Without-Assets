shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'adamant'

game 'gta5'

ui_page 'html/index.html'


client_script {
	'client.lua',
	'config.lua',
}

server_script {
	'server.lua',
	'config.lua',
}

files {
	'html/index.html',
	'html/assets/css/*.css',
	'html/assets/js/*.js',
	'html/assets/fonts/roboto/*.woff',
	'html/assets/fonts/roboto/*.woff2',
	'html/assets/fonts/justsignature/JustSignature.woff',
	'html/assets/images/*.png'
}

