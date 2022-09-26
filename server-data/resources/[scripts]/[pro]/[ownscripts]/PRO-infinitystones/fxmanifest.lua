shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
game 'gta5'

name "PRO-infinitystones"
description "Infinity stones System that gives you armor, health, stamina, or stress depending on the stone you use."
author "SubhamPROYT#3729"
version "1.0."

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua'
}


-- escrow_ignore {
--     'config.lua' -- Coming Soon
-- }

lua54 'yes'

dependency '/assetpacks'