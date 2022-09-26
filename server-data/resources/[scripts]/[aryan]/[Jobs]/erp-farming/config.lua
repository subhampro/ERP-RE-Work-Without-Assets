Config = {}

Config.New_Core = false

Config.Target = "qb-target"

Config.Menu = "qb-menu"

Config.Fuel = "ps-fuel"

Config.ps_ui = {
    
    NumberOfCircles = 2,
    MS = 20,
}

--//Store
Config.Items = {
    label = "Farming",
    slots = 30,
    items = {
        [1] = {
            name = "fruit_picker",                                  
            price = 300,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "trowel",                                  
            price = 300,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "milk_container",                                  
            price = 300,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "smallbox",                                  
            price = 4000,
            amount = 500,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "medbox",                                  
            price = 7000,
            amount = 500,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "bigbox",                                  
            price = 15000,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "water_bottle",                                  
            price = 20,
            amount = 500,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "tosti",                                  
            price = 20,
            amount = 500,
            info = {},
            type = "item",
            slot = 8,
        },
    }
}

--//Box
Config.WeightSmallBox = 15000
Config.WeightMedBox = 30000
Config.WeightBigBox = 60000
Config.Slots = 30
   
Config["ProgressBarTime"] = {
    ["Harvest"]     = 10000,
    ["Processing"]  = 6000,
}

--//Box Zones
Config["AppleTrees"] = {    
    [1] = { x = 377.9431, y = 6505.925, z = 26.93631},  
    [2] = { x = 363.1317, y = 6505.81152, z = 27.5222778}, 
    [3] = { x = 347.757568, y = 6505.419, z = 27.7004089}, 
    [4] = { x = 330.857666, y = 6505.64941, z = 27.3882446}, 
    [5] = { x = 378.122437, y = 6517.551, z = 27.3438721},  
    [6] = { x = 362.722046, y = 6517.836, z = 27.2300415}, 
    [7] = { x = 347.5349, y = 6517.551, z = 27.5750732}, 
    [9] = { x = 330.313354, y = 6517.61426, z = 27.90004}, 
    [10] = { x = 369.340881, y = 6531.68164, z = 27.3559265},  
    [11] = { x = 353.747925, y = 6530.77148, z = 27.3292313}, 
    [12] = { x = 338.400757, y = 6531.294, z = 27.4470367}, 
    [13] = { x = 321.785034, y = 6531.18945, z = 28.139679}, 
}

Config["OrangeTrees"] = {    
    [1] = { x = 281.987061, y = 6506.6416, z = 28.9862061},  
    [2] = { x = 263.898315, y = 6506.115, z = 29.6335449}, 
    [3] = { x = 246.8045, y = 6503.006, z = 30.0219727}, 
    [4] = { x = 227.909851, y = 6501.59473, z = 30.26355}, 
    [5] = { x = 209.964966, y = 6498.254, z = 30.2569885},  
    [6] = { x = 193.958679, y = 6497.31055, z = 30.3540955}, 
    [7] = { x = 281.3197, y = 6518.829, z = 28.9613647}, 
    [9] = { x = 262.241821, y = 6516.55762, z = 29.6215515}, 
    [10] = { x = 244.695374, y = 6515.327, z = 29.9513855},  
    [11] = { x = 225.834137, y = 6511.675, z = 30.19989}, 
    [12] = { x = 208.500549, y = 6509.882, z = 30.2976379}, 
    [13] = { x = 280.378052, y = 6530.831, z = 29.1203613}, 
    [14] = { x = 261.5282, y = 6527.64453, z = 29.5289917},  
    [15] = { x =242.876953, y = 6526.327, z = 29.9081421}, 
    [16] = { x = 223.788391, y = 6523.69629, z = 30.138092}, 
}

Config["TomatoPlants"] = {    
    [1] = { x = 1984.57031, y = 4806.722, z = 41.4040375},  
    [2] = { x = 1989.82764, y = 4811.456, z = 41.5453758}, 
    [3] = { x = 1994.76489, y = 4816.404, z = 41.58361}, 
    [4] = { x = 1999.61951, y = 4821.26758, z = 41.58361}, 
    [5] = { x = 2005.16492, y = 4831.971, z = 41.6312561},  
    [6] = { x = 1966.91187, y = 4825.094, z = 42.445507}, 
    [7] = { x = 1971.59961, y = 4830.0957, z = 42.55532}, 
    [9] = { x = 1976.771, y = 4834.74463, z = 42.6865}, 
    [10] = { x = 1981.84277, y = 4839.564, z = 42.568985},  
    [11] = { x = 1990.70166, y = 4846.93457, z = 42.568985}, 
    [12] = { x = 1919.01233, y = 4805.59863, z = 43.00113}, 
    [13] = { x = 1924.036, y = 4810.421, z = 43.00113}, 
    [14] = { x = 1932.0354, y = 4818.50244, z = 43.4428024},  
    [15] = { x = 1929.478, y = 4831.084, z = 44.45498}, 
    [16] = { x = 1907.18384, y = 4827.12, z = 44.25887}, 
    [17] = { x = 1893.08191, y = 4834.425, z = 44.583744},  
    [18] = { x = 1879.90173, y = 4847.51855, z = 43.9178848}, 
    [19] = { x = 1890.24084, y = 4846.32471, z = 44.45037}, 
    [20] = { x = 1902.315, y = 4843.658, z = 44.93579}, 
    [21] = { x = 1889.13477, y = 4856.752, z = 44.43877},  
    [22] = { x = 1909.41052, y = 4850.72852, z = 45.50754}, 
    [23] = { x = 1896.197, y = 4863.833, z = 45.04726}, 
    [24] = { x = 1926.69006, y = 4866.854, z = 45.79941},  
    [25] = { x = 1906.27222, y = 4886.86426, z = 45.93596}, 
    [26] = { x = 1931.19678, y = 4871.52734, z = 45.6756973}, 
    [27] = { x = 1911.07874, y = 4891.46875, z = 46.3063927}, 
    [28] = { x = 1916.95374, y = 4898.675, z = 46.3437729},  
    [29] = { x = 1943.3645, y = 4888.011, z = 44.84801}, 
    [30] = { x = 1925.16858, y = 4906.28369, z = 46.2876434}, 
 
}

--//Cow Spawn Loc
Config.LocationCow1 = vector3(2128.35, 4990.86, 41.38)   
Config.LocationCow2 = vector3(2136.66, 4998.93, 41.42)
Config.LocationCow3 = vector3(2142.59, 5005.74, 40.69)
Config.LocationCow4 = vector3(2150.98, 5012.53, 41.36)
Config.LocationCow5 = vector3(2143.98, 4975.87, 41.47)
Config.LocationCow6 = vector3(2151.47, 4982.27, 41.42)
Config.LocationCow7 = vector3(2157.9, 4989.44, 41.32)
Config.LocationCow8 = vector3(2165.55, 4996.65, 41.3)

--//Peds
Config.Peds = {
	{ coords = vector4(2310.62, 4884.86, 40.81, 42.01), gender = "male", },
}

--//Blips
Config.Blips = {

    {name = "Los Santos Farming Assc.", coords = vector4(2310.57, 4884.94, 41.81, 46.01), sprite = 210, colour = 69, scale = 0.7,},
    {name = "Los Santos Farm's Processing", coords = vector4(421.41, 6468.17, 28.81, 141.02), sprite = 267, colour = 69, scale = 0.6,},
    {name = "Dairy Farm", coords = vector4(2143.72, 4992.48, 41.4, 245.2), sprite = 256, colour = 62, scale = 0.6,}, 
    {name = "Potato Farm", coords = vector4(260.63, 6456.57, 31.49, 97.12), sprite = 256, colour = 52, scale = 0.6,}, 
    {name = "Apple Farm", coords = vector4(356.25, 6524.98, 28.36, 89.99), sprite = 256, colour = 6, scale = 0.6,},
    {name = "Orange Farm", coords = vector4(202.65, 6507.51, 31.5, 92.71), sprite = 256, colour = 17, scale = 0.6,},
    {name = "Maize Farm", coords = vector4(651.68, 6475.14, 30.54, 136.23), sprite = 256, colour = 60, scale = 0.6,},
    {name = "Strawberry Farm", coords = vector4(2116.26, 5188.01, 55.36, 57.97), sprite = 256, colour = 1, scale = 0.6,},
    {name = "Tomato Farm", coords = vector4(1893.18, 4842.54, 45.79, 44.3), sprite = 256, colour = 49, scale = 0.6,},
    {name = "Coffee Farm", coords = vector4(2822.92, 4603.16, 46.39, 72.59), sprite = 256, colour = 56, scale = 0.6,},
    {name = "Banana Farm", coords = vector4(2037.0, 4904.54, 42.67, 150.59), sprite = 256, colour = 69, scale = 0.6,},
    {name = "Pumpkin Farm", coords = vector4(498.81, 6493.31, 30.62, 105.1), sprite = 256, colour = 81, scale = 0.6,},
}

