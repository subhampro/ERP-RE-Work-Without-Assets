shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'adamant'
game 'gta5'

author 'DV-SCRIPT'
description 'Script that allows you to add more illegal roleplay with Yacht heist.'
version '1.0'

server_scripts {
	'config/server_config.lua',
	'server/*.lua'
}

client_scripts {
	'config/client_config.lua',
	'client/*.lua'
}

lua54 'yes'
dependency '/server:4700' -- You must have server artifact at least 4700