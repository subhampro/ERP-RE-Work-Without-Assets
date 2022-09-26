shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
game 'gta5'

description 'PRO-Weed'
version '1.0.0'

server_scripts {
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/main.lua'
}

escrow_ignore {
    'config.lua',
	'readme.txt'
}

lua54 'yes'
dependency '/assetpacks'