shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
game 'gta5'

description 'Mobile Fingerprint for Police. | QB-MDT event <3'

shared_scripts {
	'@qb-mdt/shared/config.lua',
}

client_scripts {
	"cl_fingerprint.lua"
}

server_scripts { 
	"sv_fingerprint.lua"
}

ui_page 'index.html'

files {
    '*.*'
}

lua54 'yes'