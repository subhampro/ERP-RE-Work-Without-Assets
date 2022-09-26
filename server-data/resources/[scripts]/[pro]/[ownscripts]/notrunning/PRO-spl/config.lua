Config = Config or {}

Config.RequiredCops = 0 -- Amount of cops required for ordering weapons

Config.DropPhonePrice = 0 -- Amount you pay for the drop phone

Config.DropContactPed = `g_m_y_mexgang_01`
Config.DropContactCoords = vector4(513.48, 231.35, 104.74, 102.63)

Config.WaitTime = 1 -- Time (minutes) you have to wait for the plane to arrive
Config.GlobalCooldown = 1 -- Time (minutes) until players can call the pilot again after the call has been made

-- Tier chances can be configured in server/main.lua
-- Default 50/50 for reward 1 or 2 (default amount of weapons you get is 4)
Config.PistolTierReward1 = 'weapon_heavypistol'
Config.PistolTierReward2 = 'weapon_heavypistol'

Config.SmgTierReward1 = 'weapon_vintagepistol'
Config.SmgTierReward2 = 'weapon_vintagepistol'

Config.ARTierReward1 = 'armor'
Config.ARTierReward2 = 'armor'

-- Config.SmgTierReward1 = 'weapon_microsmg'
-- Config.SmgTierReward2 = 'weapon_assaultsmg'

-- Config.ARTierReward1 = 'weapon_assaultrifle'
-- Config.ARTierReward2 = 'weapon_specialcarbine'

-- You can change the amount you recieve in server/main.lua, just add or remove the AddItem lines
-- Had to do it this way so you wouldn't get duplicated serial numbers