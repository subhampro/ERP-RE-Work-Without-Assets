shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'cerulean'
game 'gta5'

description 'ERP | Wire Search'
version '1.0.0'
ModifiedBy 'ERROR'

shared_scripts { 'config.lua', '@qb-core/shared/locale.lua', 
'locales/en.lua' -- Change here to your desired language
}
server_script 'server/server.lua'
client_scripts { 'client/client.lua' }

lua54 'yes'
