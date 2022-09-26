Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.00 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.00 -- Percent that goes to sales person from a finance sale 5%
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'managed',  -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the shop
                vector2(-33.0198097229, -1108.6151123047),
                vector2(-60.57173538208, -1099.0933837891),
                vector2(-52.153514862061, -1077.7946777344),
                vector2(-24.592830657959, -1087.3881835938)
            },
            ['minZ'] = 27.047222137451,  -- min height of the shop zone
            ['maxZ'] = 27.274387359619,  -- max height of the shop zone
            ['size'] = 4, -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', 
        ['ShopLabel'] = 'Premium Deluxe Motorsport',
        ['showBlip'] = true,  
        ['blipSprite'] = 326,  
        ['blipColor'] = 3, 
        ['Categories'] = { 
            ['sportsclassics'] = 'Sports Classics',
            ['sedans'] = 'Sedans',
            ['coupes'] = 'Coupes',
            ['suvs'] = 'SUVs',
            ['offroad'] = 'Offroad',
            ['muscle'] = 'Muscle',
            ['compacts'] = 'Compacts',
            ['vans'] = 'Vans',
            ['cycles'] = 'Bicycles',
            ['sports'] = 'Sports',
            ['super'] = 'Super',
            ['motorcycles'] = 'Motorcycles',
        },
        ['TestDriveTimeLimit'] = 2.0,
        ['Location'] = vector3(-45.84, -1081.89, 26.09),
        ['ReturnLocation'] = vector3(-7.85, -1089.92, 26.78), 
        ['VehicleSpawn'] = vector4(-23.65, -1094.58, 26.67, 340.57), 
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-49.94, -1083.53, 26.30, 200.73),
                defaultVehicle = 'baller7',
                chosenVehicle = 'baller7', 
            },
            [2] = {
                coords = vector4(-47.63, -1091.76, 26.30, 191.67),
                defaultVehicle = 'jester4',
                chosenVehicle = 'jester4',
            },
            [3] = {
                coords = vector4(-54.55, -1096.69, 26.30, 318.98),
                defaultVehicle = 'ignus',
                chosenVehicle = 'ignus',
            },
            [4] = {
                coords = vector4(-36.61, -1093.24, 26.30, 78.52),
                defaultVehicle = 'vectre',
                chosenVehicle = 'vectre',
            },
            [5] = {
                coords = vector4(-42.45, -1101.65, 26.30, 6.05),
                defaultVehicle = 'iwagen',
                chosenVehicle = 'iwagen',
            },
        },
    },
    ['edm'] = {
        ['Type'] = 'free-use',  -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(-788.42071533203, -249.49792480469),
                vector2(-773.78594970703, -243.90946960449),
                vector2(-791.05212402344, -212.77113342285),
                vector2(-799.25213623047, -198.40914916992),
                vector2(-812.89581298828, -206.57717895508)
            },
            ['minZ'] = 37,
            ['maxZ'] = 37,
            ['size'] = 3, -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Luxury Vehicle Shop',
        ['showBlip'] = true,  -- true or false
        ['blipSprite'] = 326,  -- Blip sprite
        ['blipColor'] = 8,  -- Blip color
        ['Categories'] = {
            ['exclusive'] = 'Exclusive',
            ['limited'] = 'Limited Edition',
            ['nonlimited'] = 'Non Limited'
        },
        ['TestDriveTimeLimit'] = 0.65,
        ['Location'] = vector3(-788.5, -233.99, 37.25),
        ['ReturnLocation'] = vector3(-529.14, -3303.0, -35.34),
        ['VehicleSpawn'] = vector4(-954.41, -3364.77, 13.94, 56.09),
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-785.76, -243.27, 36.54, 120.55),
                defaultVehicle = 'wraithb',
                chosenVehicle = 'wraithb',
            },
            [2] = {
                coords = vector4(-790.7, -222.39, 36.60, 120.64),
                defaultVehicle = 'adr8',
                chosenVehicle = 'adr8',
            },
            [3] = {
                coords = vector4(-786.05, -227.47, 36.60, 210.43),
                defaultVehicle = '22g63',
                chosenVehicle = '22g63',
            },
            [4] = {
                coords = vector4(-796.27, -206.18, 36.40, 209.65),
                defaultVehicle = 'svjroadster20',
                chosenVehicle = 'svjroadster20',
            },
            
        }
    }
}
