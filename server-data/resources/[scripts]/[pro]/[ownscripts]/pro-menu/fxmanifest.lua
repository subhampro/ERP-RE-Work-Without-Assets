shared_script '@qb-courthouse/waveshield.lua' --this line was automatically written by WaveShield



fx_version "cerulean"
games { 'gta5' }

name "pro-menu"
description "qbcore menu"
author "PRO"

ui_page "./ui/index.html"

files {
    "./ui/index.html",
    "./ui/main.css",
    "./ui/main.js",
}

client_script "client.lua"
