# PRO-infinitystones
Rings System that gives you armor, health, stamina, or stress depending on the ring you use.

| Join my discord server [here](https://discord.gg/YvCjetXNsw) |
| ------------------------------------------------------------ |

## Preview: [SOON]

## How to Install
1. Drag PRO-infinitystones into your resources folder then ensure PRO-infinitystones in your cfg file.
2. Go to qb-core/shared/items.lua and paste this
```lua
--Infinity Stones
["aqua-stone"] 	= {["name"] = "aqua-stone", ["label"] = "Aqua Stone", ["weight"] = 1000, 		["type"] = "item", 		["image"] = "aqua-stone.png",   ["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "The Stone Will Increase Health For 2 Minutes and Stamina for 40 Seconds.a"},
["soul-stone"] 	= {["name"] = "soul-stone", ["label"] = "Soul Stone", ["weight"] = 1000, 		["type"] = "item", 		["image"] = "soul-stone.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "The Stone will Absorb anothers Peace from their Soul and Relief your Soul From Stress For 10 Minutes"},
["power-stone"] = {["name"] = "power-stone",["label"] = "Power Stone",["weight"] = 1000, 		["type"] = "item", 		["image"] = "power-stone.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "The Stone Will Increase your Armor , Health For 10 Minutes and Releaf From Stress For Same amount Of time"},
["time-stone"]	= {["name"] = "time-stone", ["label"] = "Time Stone", ["weight"] = 1000,		["type"] = "item", 		["image"] = "time-stone.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "The Stone Will Take your Stress at Past That Mean Reeleaf from Stress For 30 Minutes and Genarate Armor for 10 Minutes"},
["space-stone"] = {["name"] = "space-stone",["label"] = "Space Stone",["weight"] = 1000, 		["type"] = "item", 		["image"] = "space-stone.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "The Stone Will Give you Power that you can Swim Faster like in Space or Zero Gravity FOR 10 Minutes"},
["fire-stone"] 	= {["name"] = "fire-stone", ["label"] = "Fire Stone", ["weight"] = 1000, 		["type"] = "item", 		["image"] = "fire-stone.png",	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "The Stone Will Increase your Armor For 10 Minutes , Increase your Health For 20 Minutes, Releaf Stress For 20 Minutes"},
["light-stone"] = {["name"] = "light-stone",["label"] = "Light Stone",["weight"] = 1000, 		["type"] = "item", 		["image"] = "light-stone.png",  ["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "The Stone Will Heal you Like Lightning Heals THOR High Speed Healing For 2 Minutes, Releaf Stress Medium Speed For 10 Minutes"},
["tanzanite-stone"] = {["name"] = "tanzanite-stone",  ["label"] = "Tanzanite Stone",  ["weight"] = 1000, 		["type"] = "item", 		["image"] = "tanzanite-stone.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "This Stone Will Increase Your Armor Very Fast For 5 Minutes and Increase Stamina Very Fast For 2 Minutes."},


```

3. Go to qb-inventory or lj-inventory / html / images and add in the images I put in that images folder.

# Configuration

If you want to change the amount of armor, health, stamina, or stress that a ring give you , head over to MY Discord and Approch ME. Find export['ps-buffs']

You can contact me for additional Items add and Any Customization

## Dependencies
# ps-hud: https://github.com/Project-Sloth/ps-hud
# ps-buffs: https://github.com/Project-Sloth/ps-buffs
