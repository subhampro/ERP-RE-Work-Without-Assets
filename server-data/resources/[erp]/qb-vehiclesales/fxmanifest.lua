shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
game 'gta5'

description 'ERP | Vehiclesales'
version '1.0.0'

ui_page 'html/ui.html'

shared_scripts {
	'config.lua',
	'@qb-core/shared/locale.lua',
	'locales/en.lua'
}

client_scripts { 
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client/main.lua'


}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua'
}

files {
	'html/reset.css',
	'html/logo.svg',
	'html/ui.css',
	'html/ui.html',
	'html/vue.min.js',
	'html/ui.js',
}

lua54 'yes'
