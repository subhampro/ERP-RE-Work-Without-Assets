shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'cerulean'
game 'gta5'

files {
  'html/vhs.ttf',
  'html/main.js',
  'html/index.html',
  'html/axon_blank.png',
}

ui_page 'html/index.html'

server_script 'server/main.lua'

client_script 'client/main.lua'
lua54 'yes'