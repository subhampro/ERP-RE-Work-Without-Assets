shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'adamant'

game 'gta5'

description 'ERP | AI MEDIC'

author 'ERROR'

version '1.0.5'


client_scripts {
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/client.lua',
    'client/mdzones.lua'
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    -- '@qb-core/import.lua',
    'config.lua'
} 


