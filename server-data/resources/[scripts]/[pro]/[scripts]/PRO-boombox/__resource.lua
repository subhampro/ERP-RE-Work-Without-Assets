shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'SUB:Boombox'

ui_page('html/index.html') 

files({
  'html/index.html',
  'html/style.css',
})

client_scripts {
  'config.lua',
  'client/main.lua',
}

server_scripts {
  'config.lua',
  'server/main.lua'
}
