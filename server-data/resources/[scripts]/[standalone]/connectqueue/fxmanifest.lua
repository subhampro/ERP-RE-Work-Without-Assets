shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'bodacious'
game 'common'

server_script "server/sv_queue_config.lua"
server_script "connectqueue.lua"

server_script "shared/sh_queue.lua"
client_script "shared/sh_queue.lua"
