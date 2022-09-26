shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'cerulean'
games {  'gta5' }


name 'PRO-bettergunshot'
description 'Advanced Gunshot detection and alert system.'
author 'SubhamPROYT#3729'
version '1.0.1'



server_script "server.lua"
client_script {
	"client.lua",
	"config.lua"
}


lua54 'yes'