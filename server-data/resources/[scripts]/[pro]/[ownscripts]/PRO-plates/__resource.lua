shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/index.html'

server_scripts {
	'server.lua'
}

client_scripts {
	'client.lua',
}

files {
	'html/assets/images/plate.png',
	'html/index.html',
	'html/assets/fonts/roboto/Roboto-Bold.woff',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/init.js',
}

client_script "@IND-ymaps/acloader.lua"