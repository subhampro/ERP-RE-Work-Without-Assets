shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
game 'gta5'

description 'QB-Diving'
version '1.1.0'

shared_script {
    '@qb-core/shared/locale.lua',
	'locales/en.lua',
    'config.lua'
}
server_script 'server/main.lua'
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client/main.lua'
}

lua54 'yes'
