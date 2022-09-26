shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'cerulean'
game 'gta5'

description 'QB-MechanicJob'
version '1.0.0'



client_scripts {
	'@menuv/menuv.lua',
	'config.lua',
	'client/main.lua',
	'client/gui.lua',
	'client/drivingdistance.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'config.lua',
	'server/main.lua'
}


exports {
	'GetVehicleStatusList',
	'GetVehicleStatus',
	'SetVehicleStatus'
}

