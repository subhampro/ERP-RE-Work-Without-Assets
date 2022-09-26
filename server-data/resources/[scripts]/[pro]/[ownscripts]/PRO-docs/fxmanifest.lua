shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



-- fx_version 'adamant '
-- game 'gta5'
fx_version 'cerulean'
games {  'gta5' }


name 'PRO-Docs'
description 'PRO-Docs'
author 'SubhamPROYT#3729'
version '1.1.1'

ui_page 'html/form.html'

files {
	'html/form.html',
	'html/img/seal.png',
	'html/img/document.jpg',
	'html/img/signature.png',
	'html/img/cursor.png',
	'html/css.css',
	'html/language_en.js',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
}

server_scripts {
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'locales/en.lua',
	'server.lua',
	'locale.lua',
}

client_scripts {
	'config.lua',
	'locales/en.lua',
	'GUI.lua',
	'client.lua',
	'locale.lua',
}
