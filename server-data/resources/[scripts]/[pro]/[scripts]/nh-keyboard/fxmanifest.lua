shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version "cerulean"
game "common"

name "NUI Text Input"
description "A modular, clean keyboard input for RedM & FiveM"
author "NeroHiro"

ui_page "./UI/index.html"

files{
    "./UI/index.html",
    "./UI/main.css",
    "./UI/main.js",
}

client_script "client.lua"

