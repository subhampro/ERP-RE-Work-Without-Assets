Config = {}
----FRAMEWORK----
Config.framework = 'qb' --esx/qb
Config.alert = 'QB' -- QB/linden
----WEBHOOK----
Config.webhook = "https://discord.com/api/webhooks/980335681622667296/P7X5cKl1Omghl9nqt7l9OulUf5c1EiK1zoibyqTWXq_musv6L1mQKH6sO4TCXfpvGbaK" --discord webhooks
----VEHICLES----
Config.boat = 0x3FD5AA2F -- boat that spawn https://wiki.rage.mp/index.php?title=Vehicles
----MONEY/ITEM----
Config.getMin = 5 -- minimum item give
Config.getMax = 20 -- maximum item give
Config.cashroll = 1000 -- ho mutch cashroll give money after use
Config.usable = true -- if you want to make cashroll usable
Config.removeitem = 'laptop' -- item for hacking
Config.giveitem = "" -- what item it give
----PEDS----
Config.startlocation = vector3(131.54, -1183.78, 29.5) -- location where starting ped spawn
Config.startped =  "cs_joeminuteman" -- what is ped for start
Config.ped = { -- ped location
    vector3(-2019.51, -1039.8, 2.64),
    vector3(-2030.54, -1039.34, 5.88),
    vector3(-2028.37, -1030.39, 5.88),
    vector3(-2037.22, -1033.76, 8.97),
    vector3(-2042.01, -1031.67, 11.98)
}
Config.peds = { -- ped models
    "s_m_y_cop_01", -- male cop
    "s_f_y_cop_01"  --female cop
}
Config.pedweapon = 'WEAPON_CARBINERIFLE' -- weapon for peds (not for  starting ped)
Config.pedarmour = 500 -- Armour for peds