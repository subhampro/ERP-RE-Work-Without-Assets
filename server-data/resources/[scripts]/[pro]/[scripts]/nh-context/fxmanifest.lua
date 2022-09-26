shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield

fx_version "cerulean"
game "common"

name "NUI Context Menu"
description "A modular context Menu for RedM and FiveM"
author "NeroHiro"

ui_page "./ui/index.html"

files{
    "./ui/index.html",
    "./ui/main.css",
    "./ui/main.js",
}

client_script "client.lua"

