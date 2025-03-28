--[[
    Author: JDev17#8160
    TRANSLATION: 
        To create a new translation file, copy an existing one and rename it to e.g. es (spanish), then translate it and change the imported file in the fxmanifest under shared_scripts.
    GARAGE CONFIGURATION EXAMPLE:
    ['somegarage'] = {
        ['Zone'] = {
            ['Shape'] = { -- Create a polyzone by using '/pzcreate poly', '/pzadd' and '/pzfinish' or '/pzcancel' to cancel it. the newly created polyzone will be in txData/QBCoreFramework_******.base/polyzone_created_zones.txt
            vector2(-1030.4713134766, -3016.3388671875),
            vector2(-970.09686279296, -2914.7397460938),
            vector2(-948.322265625, -2927.9030761718),
            vector2(-950.47174072266, -2941.6584472656),
            vector2(-949.04180908204, -2953.9467773438),
            vector2(-940.78369140625, -2957.2941894532),
            vector2(-943.88732910156, -2964.5512695312),
            vector2(-897.61529541016, -2990.0505371094),
            vector2(-930.01025390625, -3046.0695800782),
            vector2(-942.36407470704, -3044.7858886718),
            vector2(-952.97467041016, -3056.5122070312),
            vector2(-957.11712646484, -3057.0900878906)
            },
            ['minZ'] = 12.5,  -- min height of the parking zone, cannot be the same as maxZ, and must be smaller than maxZ
            ['maxZ'] = 20.0,  -- max height of the parking zone
            -- Important: Make sure the parking zone is high enough - higher than the tallest vehicle and touches the ground (turn on debug to see)
        },
        label = 'Hangar', -- label displayed on phone
        type = 'public', -- 'public', 'job', 'depot' or 'gang'
        showBlip = true, -- optional, when not defined, defaults to false
        blipName = 'Police', -- otional
        blipNumber = 90, -- optional, numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipColor = 69, -- optional, defaults to 3 (Blue), numbers can be found here: https://docs.fivem.net/docs/game-references/blips/
        blipcoords = vector3(-972.66, -3005.4, 13.32), -- blip coordinates
        job = 'police', -- optional, everyone can use it when not defined
        vehicleCategories = {'helicopter', 'plane'}, -- categories defined in VehicleCategories
        drawText = 'Hangar', -- the drawtext text, shown when entering the polyzone of that garage
        ParkingDistance = 10.0 -- Optional ParkingDistance, to override the global ParkingDistance
        SpawnDistance = 5.0 -- Optional SpawnDistance, to override the global SpawnDistance
        debug = false -- will show the polyzone and the parking spots, helpful when creating new garages. If too many garages are set to debug, it will not show all parking lots
        ExitWarpLocations: { -- Optional, Used for e.g. Boat parking, to teleport the player out of the boat to the closest location defined in the list. 
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        } 
    },
]]



FuelScript = 'ps-fuel' -- change to lj-fuel if you use lj-fuel or something else if you use any other LegcyFuel compatible script
AutoRespawn = true --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
SharedGarages = false   --True == Gang and job garages are shared, false == Gang and Job garages are personal
WarpPlayerIntoVehicle = false -- True == Will Warp Player Into their vehicle after pulling it out of garage. False It will spawn on the parking lot / in front of them  (Global, can be overriden by each garage)
HouseParkingDrawText = 'Parking' -- text when driving on to the HOUSE parking lot
ParkingDistance = 2.0 -- Distance to the parking lot when trying to park the vehicle  (Global, can be overriden by each garage)
SpawnDistance = 4.5 -- The maximum distance you can be from a parking spot, to spawn a car (Global, can be overriden by each garage)
DepotPrice = 60.0 -- The price to take out a despawned vehicle from impound.
DrawTextPosition = 'left' -- location of drawtext: left, top, right

-- '/restorelostcars <destination_garage>' allows you to restore cars that have been parked in garages which no longer exist in the config (garage renamed or removed). The restored cars get sent to the destination garage or if left empty to the first garage in the list.
RestoreCommandPermissionLevel = 'god' -- sets the permission level for the above mentioned command

-- Here you can define which category contains which vehicle class. These categories can then be used in the garage config
-- All vehicle classes can be found here: https://docs.fivem.net/natives/?_0x29439776AAA00A62
VehicleCategories = {
    ['car'] = {0,1,2,3,4,5,6,7,9,10,11,12},
    ['motorcycle'] = {8},
    ['boat'] = {14},
    ['helicopter'] = {15},
    ['plane'] = {16},
    ['service'] = {17},
    ['emergency'] = {18},
    ['other'] = {13} -- cycles: 13 - you can move cycles to cars if you want and have anything else like military vehicles in this category
    -- you can also create new / delete or update categories, and use them below in the config. 
}

HouseGarageCategories = {'car', 'motorcycle', 'other'} -- Which categories are allowed to be parked at a house garage


VehicleHeading = 'driverside' -- only used when NO parking spots are defined in the garage config
--[[^^^^^^^^
    'forward' = will face the sameway as the ped
    'driverside' = will put the driver door closets to the ped
    'hood' = will face the hood towards ped
    'passengerside' = will put the passenger door closets to the ped
]]

SharedJobGarages = { -- define the job garages which are shared
    --'pdgarage',
}

Garages = {
    --[[
        types:
        - public
        - job
        - depot
        vehicleCategories:
        - car
        - motorcycle
        - boat
        - helicopter
        - plane
        - other
    ]]
    
    -- ['mirrorpark'] = {
    --     ['Zone'] = {
    --         ['Shape'] = {
    --             vector2(1043.447265625, -767.26947021484),
    --             vector2(1049.4702148438, -769.44775390625),
    --             vector2(1049.4797363281, -794.31622314453),
    --             vector2(1048.9655761719, -794.32214355469),
    --             vector2(1049.03125, -793.87451171875),
    --             vector2(1043.466796875, -793.80151367188),
    --             vector2(1043.3436279297, -794.52691650391),
    --             vector2(1031.5026855469, -794.34808349609),
    --             vector2(1007.7255859375, -764.88061523438),
    --             vector2(1022.2494506836, -752.11022949219),
    --             vector2(1025.6563720703, -755.25653076172),
    --             vector2(1030.9210205078, -758.50311279297),
    --             vector2(1031.2462158203, -758.19201660156),
    --             vector2(1035.1042480469, -760.79956054688),
    --             vector2(1030.6268310547, -767.16302490234),
    --             vector2(1025.9473876953, -763.81085205078),
    --             vector2(1024.8063964844, -765.39245605469),
    --             vector2(1033.9915771484, -772.05816650391),
    --             vector2(1036.6497802734, -781.24871826172),
    --             vector2(1038.708984375, -780.87786865234),
    --             vector2(1035.7690429688, -770.72528076172),
    --             vector2(1032.0593261719, -768.04278564453),
    --             vector2(1034.0390625, -764.51586914062),
    --             vector2(1036.8060302734, -766.30773925781),
    --             vector2(1038.0424804688, -763.41851806641),
    --             vector2(1043.5157470703, -766.21325683594)
    --         },
    --         ['minZ'] = 56.50,
    --         ['maxZ'] = 59.20
    --     },
    --     label = 'Mirror Park Parking',
    --     showBlip = true,
    --     blipcoords = vector3(1037.65, -771.62, 58.01),
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     type = 'public',
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Parking',
    --     debug = false,
    --     ['ParkingSpots'] = {
    --         vector4(1023.5, -756.15, 57.48, 225.44),
    --         vector4(1020.64, -758.19, 57.49, 225.22),
    --         vector4(1017.57, -760.75, 57.47, 222.83),
    --         vector4(1014.9, -763.11, 57.4, 223.82),
    --         vector4(1016.1, -770.57, 57.41, 311.2),
    --         vector4(1018.8, -773.42, 57.43, 308.15),
    --         vector4(1020.68, -776.34, 57.39, 311.86),
    --         vector4(1023.75, -779.38, 57.41, 309.66),
    --         vector4(1025.72, -782.07, 57.4, 308.8),
    --         vector4(1028.49, -784.92, 57.41, 307.36),
    --         vector4(1030.06, -787.96, 57.38, 310.65),
    --         vector4(1038.12, -791.16, 57.47, 1.48),
    --         vector4(1046.49, -785.56, 57.5, 89.6),
    --         vector4(1046.38, -782.01, 57.51, 92.17),
    --         vector4(1046.22, -778.03, 57.52, 89.04),
    --         vector4(1046.27, -774.45, 57.52, 90.5),
    --         vector4(1030.96, -773.4, 57.57, 144.89),
    --         vector4(1028.05, -771.42, 57.55, 146.44),
    --         vector4(1029.35, -763.6, 57.49, 56.05),
    --         vector4(1041.6, -791.45, 57.5, 0.97),
    --     }
    -- },
    -- ['casinop'] = {
    --     ['Zone'] = {
    --         ['Shape'] = {
    --             vector2(915.48345947266, -14.229139328003),
    --             vector2(912.52160644531, -19.256662368774),
    --             vector2(914.41729736328, -20.468030929565),
    --             vector2(928.14013671875, -29.422761917114),
    --             vector2(931.68640136719, -24.097787857056),
    --             vector2(943.31915283203, -31.373510360718),
    --             vector2(940.18115234375, -36.682193756104),
    --             vector2(940.63336181641, -37.222324371338),
    --             vector2(941.06457519531, -38.056762695312),
    --             vector2(940.69250488281, -39.514526367188),
    --             vector2(945.86834716797, -42.898574829102),
    --             vector2(936.578125, -58.041912078857),
    --             vector2(935.71746826172, -59.93187713623),
    --             vector2(935.32781982422, -63.596141815186),
    --             vector2(935.49609375, -65.299346923828),
    --             vector2(936.2734375, -67.329566955566),
    --             vector2(938.08367919922, -69.736022949219),
    --             vector2(939.06182861328, -70.789291381836),
    --             vector2(942.05615234375, -73.50260925293),
    --             vector2(944.24096679688, -76.701873779297),
    --             vector2(945.71282958984, -80.333465576172),
    --             vector2(945.46759033203, -86.331184387207),
    --             vector2(944.24163818359, -90.072593688965),
    --             vector2(942.83435058594, -92.46647644043),
    --             vector2(928.69256591797, -105.37116241455),
    --             vector2(926.07592773438, -107.04386138916),
    --             vector2(922.68194580078, -107.79019927979),
    --             vector2(918.29956054688, -107.78350067139),
    --             vector2(914.76385498047, -106.68801879883),
    --             vector2(891.66986083984, -92.136535644531),
    --             vector2(894.90283203125, -86.966018676758),
    --             vector2(877.28314208984, -75.933624267578),
    --             vector2(873.83764648438, -81.048561096191),
    --             vector2(849.61877441406, -65.853485107422),
    --             vector2(842.07305908203, -59.212493896484),
    --             vector2(832.29779052734, -48.991901397705),
    --             vector2(836.66088867188, -44.546573638916),
    --             vector2(834.18530273438, -42.00004196167),
    --             vector2(832.93865966797, -39.975162506104),
    --             vector2(832.380859375, -35.275825500488),
    --             vector2(833.16229248047, -31.17188835144),
    --             vector2(839.43792724609, -22.388980865479),
    --             vector2(849.22601318359, -10.30827331543),
    --             vector2(871.66424560547, 12.689045906067),
    --             vector2(872.94342041016, 12.611633300781),
    --             vector2(881.33111572266, 7.0416121482849),
    --             vector2(880.61773681641, 5.6222538948059),
    --             vector2(880.45855712891, 1.066015958786),
    --             vector2(889.86468505859, -5.0284695625305),
    --             vector2(894.46960449219, -2.9582657814026),
    --             vector2(895.51623535156, -1.5529407262802)
    --         },
    --         ['minZ'] = 77.50,
    --         ['maxZ'] = 80.00
    --     },
    --     label = 'Casino Parking',
    --     showBlip = true,
    --     blipcoords = vector3(888.47, -37.44, 78.76),
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     type = 'public',
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Parking',
    --     debug = false,
    --     ['ParkingSpots'] = {
    --         vector4(874.36, -77.52, 78.34, 326.7),
    --         vector4(868.22, -74.12, 78.34, 327.6),
    --         vector4(865.89, -71.32, 78.34, 327.2),
    --         vector4(862.79, -70.26, 78.34, 327.35),
    --         vector4(859.57, -67.92, 78.34, 326.45),
    --         vector4(856.54, -66.59, 78.34, 326.94),
    --         vector4(853.6, -64.76, 78.34, 329.96),
    --         vector4(850.98, -62.23, 78.34, 315.33);
    --         vector4(848.28, -60.42, 78.34, 316.25),
    --         vector4(845.29, -58.06, 78.34, 316.99),
    --         vector4(843.2, -55.19, 78.34, 315.68),
    --         vector4(841.22, -52.13, 78.34, 315.19),
    --         vector4(838.31, -49.98, 78.34, 309.63),
    --         vector4(836.03, -47.87, 78.34, 310.48),
    --         vector4(871.34, -75.41, 78.34, 327.5),
    --         vector4(934.99, -72.5, 78.27, 132.69),
    --         vector4(937.69, -74.87, 78.27, 135.96),
    --         vector4(940.12, -77.9, 78.27, 124.93),
    --         vector4(874.36, -77.52, 78.34, 326.7),
    --         vector4(871.34, -75.41, 78.34, 327.5),
    --         vector4(894.66, -90.02, 78.34, 329.43),
    --         vector4(897.75, -92.07, 78.34, 328.5),
    --         vector4(900.96, -93.67, 78.34, 326.42),
    --         vector4(903.67, -95.7, 78.34, 328.69),
    --         vector4(906.77, -97.42, 78.34, 326.69),
    --         vector4(909.56, -98.98, 78.27, 329.54),
    --         vector4(912.88, -100.65, 78.27, 327.47),
    --         vector4(915.52, -102.44, 78.27, 328.46),
    --         vector4(919.92, -104.15, 78.27, 355.56),
    --         vector4(924.34, -102.86, 78.27, 23.29),
    --         vector4(928.29, -100.03, 78.27, 41.76),
    --         vector4(931.14, -98.26, 78.27, 42.82),
    --         vector4(933.29, -95.84, 78.27, 43.98),
    --         vector4(935.95, -93.66, 78.27, 43.12),
    --         vector4(938.28, -91.0, 78.27, 43.96),
    --         vector4(941.5, -86.74, 78.27, 71.64),
    --         vector4(942.22, -82.22, 78.27, 96.61),
    --         vector4(932.29, -67.33, 78.27, 108.81),
    --         vector4(931.48, -62.49, 78.27, 87.5),
    --         vector4(933.04, -58.41, 78.27, 74.44),
    --         vector4(934.81, -53.94, 78.27, 56.79),
    --         vector4(936.58, -51.51, 78.27, 59.07),
    --         vector4(938.49, -48.34, 78.27, 57.96),
    --         vector4(939.46, -45.37, 78.27, 57.51),
    --         vector4(941.87, -42.09, 78.27, 57.26),
    --         vector4(939.92, -33.37, 78.27, 147.28),
    --         vector4(937.11, -31.58, 78.27, 146.31),
    --         vector4(934.46, -29.74, 78.27, 147.43),
    --         vector4(931.24, -28.27, 78.27, 148.17),
    --         vector4(911.98, -15.91, 78.27, 148.59),
    --         vector4(908.33, -14.25, 78.27, 151.66),
    --         vector4(905.28, -11.85, 78.27, 146.75),
    --         vector4(901.6, -10.25, 78.27, 151.03),
    --         vector4(898.56, -7.47, 78.27, 150.42),
    --         vector4(894.74, -5.36, 78.27, 147.31),
    --         vector4(878.41, 5.09, 78.27, 148.03),
    --         vector4(874.81, 6.34, 78.27, 145.35),
    --         vector4(872.04, 8.2, 78.27, 147.69),
    --         vector4(857.52, -16.84, 78.27, 61.37),
    --         vector4(855.4, -18.91, 78.27, 56.95),
    --         vector4(853.22, -21.71, 78.27, 58.03),
    --         vector4(851.4, -24.62, 78.27, 56.48),
    --         vector4(849.71, -27.73, 78.27, 56.12),
    --         vector4(848.46, -30.95, 78.27, 58.58),
    --         vector4(846.43, -33.78, 78.27, 58.11),
    --         vector4(844.31, -36.58, 78.27, 58.6),
    --         vector4(851.99, -41.32, 78.27, 237.04),
    --         vector4(854.14, -38.45, 78.27, 237.84),
    --         vector4(855.52, -35.12, 78.27, 239.77),
    --         vector4(857.58, -32.6, 78.27, 237.61),
    --         vector4(859.49, -29.77, 78.27, 238.44),
    --         vector4(860.76, -26.41, 78.27, 239.23),
    --         vector4(862.82, -23.64, 78.27, 238.93),
    --         vector4(864.37, -20.41, 78.27, 237.61),
    --         vector4(867.05, -18.08, 78.27, 237.15),
    --         vector4(868.52, -15.1, 78.27, 236.79),
    --         vector4(870.25, -12.23, 78.27, 236.92),
    --         vector4(871.96, -9.18, 78.27, 236.79),
    --         vector4(860.59, -50.52, 78.27, 56.19),
    --         vector4(862.21, -47.59, 78.27, 57.87),
    --         vector4(864.07, -44.72, 78.27, 57.35),
    --         vector4(866.09, -41.98, 78.27, 59.81),
    --         vector4(868.02, -39.09, 78.27, 58.16),
    --         vector4(869.38, -35.99, 78.27, 59.41),
    --         vector4(871.76, -33.27, 78.27, 57.79),
    --         vector4(873.26, -30.41, 78.27, 58.11),
    --         vector4(875.5, -27.57, 78.27, 59.75),
    --         vector4(876.7, -24.3, 78.27, 55.59),
    --         vector4(878.68, -21.55, 78.27, 55.73),
    --         vector4(880.83, -18.82, 78.27, 58.7),
    --         vector4(882.29, -15.94, 78.27, 59.44),
    --         vector4(868.59, -55.55, 78.27, 239.79),
    --         vector4(870.31, -52.52, 78.27, 237.16),
    --         vector4(872.25, -49.62, 78.27, 238.25),
    --         vector4(873.82, -46.81, 78.27, 237.55),
    --         vector4(875.38, -43.64, 78.27, 240.61),
    --         vector4(877.57, -40.99, 78.27, 238.89),
    --         vector4(879.2, -37.86, 78.27, 239.24),
    --         vector4(881.32, -35.29, 78.27, 239.98),
    --         vector4(882.71, -32.06, 78.27, 239.47),
    --         vector4(884.88, -29.13, 78.27, 238.24),
    --         vector4(886.69, -26.11, 78.27, 238.21),
    --         vector4(888.29, -23.61, 78.27, 236.97),
    --         vector4(890.23, -20.25, 78.27, 237.91),
    --         vector4(879.01, -62.07, 78.27, 57.16),
    --         vector4(880.87, -59.46, 78.27, 56.4),
    --         vector4(882.31, -55.9, 78.27, 56.01),
    --         vector4(884.39, -53.05, 78.27, 55.15),
    --         vector4(886.74, -50.98, 78.27, 57.74),
    --         vector4(887.88, -47.3, 78.27, 56.18),
    --         vector4(889.9, -44.62, 78.27, 57.31),
    --         vector4(891.22, -41.1, 78.27, 56.82),
    --         vector4(893.37, -38.44, 78.27, 57.27),
    --         vector4(894.9, -35.5, 78.27, 57.88),
    --         vector4(896.66, -32.62, 78.27, 56.27),
    --         vector4(898.89, -29.89, 78.27, 59.62),
    --         vector4(900.59, -27.03, 78.27, 57.96),
    --         vector4(918.92, -38.5, 78.27, 57.96),
    --         vector4(917.27, -41.62, 78.27, 57.19),
    --         vector4(915.72, -44.57, 78.27, 58.35),
    --         vector4(913.25, -46.72, 78.27, 59.34),
    --         vector4(911.8, -50.19, 78.27, 58.27),
    --         vector4(909.86, -52.95, 78.27, 56.01),
    --         vector4(907.82, -56.09, 78.27, 58.75),
    --         vector4(906.64, -59.22, 78.27, 59.0),
    --         vector4(904.82, -62.24, 78.27, 58.09),
    --         vector4(902.76, -64.94, 78.27, 57.42),
    --         vector4(900.32, -67.77, 78.27, 60.95),
    --         vector4(898.92, -70.71, 78.27, 59.52),
    --         vector4(897.37, -73.94, 78.27, 60.01),
    --         vector4(905.41, -78.55, 78.27, 237.47),
    --         vector4(906.51, -75.4, 78.27, 239.08),
    --         vector4(908.51, -72.21, 78.27, 240.06),
    --         vector4(910.57, -69.75, 78.27, 239.33),
    --         vector4(912.5, -66.76, 78.27, 236.77),
    --         vector4(914.61, -63.85, 78.27, 236.27),
    --         vector4(916.47, -61.02, 78.27, 239.26),
    --         vector4(918.2, -57.97, 78.27, 239.18),
    --         vector4(919.83, -55.26, 78.27, 239.26),
    --         vector4(921.38, -52.13, 78.27, 239.95),
    --         vector4(923.46, -49.15, 78.27, 240.09),
    --         vector4(925.59, -46.6, 78.27, 238.16),
    --         vector4(925.88, -42.81, 78.27, 239.65),
    --         vector4(915.9, -84.07, 78.27, 56.96),
    --         vector4(917.48, -81.16, 78.27, 58.09),
    --         vector4(920.09, -78.3, 78.27, 55.86),
    --         vector4(927.69, -83.29, 78.27, 238.3),
    --         vector4(926.1, -86.14, 78.27, 236.23),
    --         vector4(924.0, -89.35, 78.27, 237.62),
    --     }
    -- },
   
    ['pdm'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-61.654758453369, -1114.3413085938),
                vector2(-64.072082519531, -1121.0498046875),
                vector2(-39.18355178833, -1119.6369628906),
                vector2(-37.499908447266, -1114.9281005859)
            },
            ['minZ'] = 25.0,  -- min height of the parking zone
            ['maxZ'] = 31.30,  -- max height of the parking zone
        },
        label = 'PDM Parking',
        showBlip = false,
        blipcoords = vector3(-61.09, -1119.28, 26.67),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(-61.11, -1118.75, 26.17, 339.04),
            vector4(-57.43, -1118.23, 26.17, 338.75),
            vector4(-53.95, -1117.99, 26.17, 338.91),
            vector4(-50.62, -1117.8, 26.17, 340.37),
            vector4(-47.15, -1117.59, 26.17, 338.65),

        }
    },
    ['recycle'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(752.57672119141, -1399.4943847656),
                vector2(752.5107421875, -1406.9986572266),
                vector2(766.54223632812, -1406.6828613281),
                vector2(766.48199462891, -1399.5004882812)
            },
            ['minZ'] = 23.0,  -- min height of the parking zone
            ['maxZ'] = 27.30,  -- max height of the parking zone
        },
        label = 'Recycle Parking',
        showBlip = false,
        blipcoords = vector3(-61.09, -1119.28, 26.67),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
        ['ParkingSpots'] = {
            vector4(757.22, -1403.51, 25.9, 179.37),
            vector4(763.95, -1403.56, 25.88, 180.55),

        }
    },
    ['motelgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(266.04238891602, -348.67025756836),
                vector2(285.89639282227, -356.23840332031),
                vector2(287.69180297852, -351.80249023438),
                vector2(294.92953491211, -354.30316162109),
                vector2(304.30255126953, -329.3703918457),
                vector2(268.12475585938, -316.15463256836),
                vector2(261.09896850586, -334.95642089844),
                vector2(268.07708740234, -337.50454711914),
                vector2(266.080078125, -343.24353027344),
                vector2(267.49453735352, -344.12811279297)
            },
            ['minZ'] = 44.0,  -- min height of the parking zone
            ['maxZ'] = 47.15,  -- max height of the parking zone
        },
        label = "Motel Parking",
        showBlip = true,
        blipcoords = vector3(273.43, -343.99, 44.91),
        blipName = "Motel Parking",
        blipNumber = 357,
        type = 'public',                -- public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},                --car, air, sea
        drawText = 'Parking',
        debug = false,                 
        ['ParkingSpots'] = {
            vector4(277.62, -340.01, 44.5, 70.08),
            vector4(284.0, -342.32, 44.5, 70.09),
            vector4(278.33, -336.51, 44.49, 70.34),
            vector4(284.94, -338.87, 44.5, 70.28),
            vector4(285.3, -335.65, 44.5, 70.49),
            vector4(286.94, -332.56, 44.5, 67.79),
            vector4(288.56, -329.41, 44.5, 69.87),
            vector4(289.54, -325.98, 44.5, 70.81),
            vector4(300.23, -330.3, 44.5, 69.25),
            vector4(298.52, -333.09, 44.5, 69.25),
            vector4(298.66, -337.07, 44.5, 67.98),
            vector4(297.0, -340.11, 44.49, 69.9),
            vector4(296.05, -342.85, 44.49, 68.75),
            vector4(294.61, -346.22, 44.5, 67.07),
            vector4(292.54, -349.49, 44.52, 68.4),
            vector4(268.42, -325.58, 44.5, 249.47),
            vector4(267.58, -329.12, 44.49, 247.62),
            vector4(266.03, -332.22, 44.5, 247.32),
            vector4(271.12, -319.16, 44.5, 67.31),
            vector4(283.0, -323.71, 44.5, 73.83),
            vector4(281.99, -326.86, 44.5, 69.26),
            vector4(281.1, -330.43, 44.49, 71.55),
            vector4(279.59, -333.68, 44.5, 71.98),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },
    ['redgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-362.48254394531, -793.2802734375),
                vector2(-362.46408081055, -730.71594238281),
                vector2(-360.078125, -727.29187011719),
                vector2(-359.91299438477, -726.02014160156),
                vector2(-355.41589355469, -725.94165039062),
                vector2(-347.00802612305, -729.64282226562),
                vector2(-312.21273803711, -742.18682861328),
                vector2(-310.43478393555, -737.13165283203),
                vector2(-266.06091308594, -753.01647949219),
                vector2(-275.53680419922, -777.63562011719),
                vector2(-284.21676635742, -774.40985107422),
                vector2(-285.57073974609, -778.85809326172),
                vector2(-287.20227050781, -778.1279296875),
                vector2(-289.10836791992, -783.76214599609),
                vector2(-319.63018798828, -772.48706054688),
                vector2(-335.69149780273, -786.58020019531),
                vector2(-345.55349731445, -791.60711669922)
            },
            ['minZ'] = 33.00,  -- min height of the parking zone
            ['maxZ'] = 37.60,  -- max height of the parking zone
        },
        label = "Red Garage",
        showBlip = true,
        blipcoords = vector3(-330.01, -780.33, 33.96),
        blipName = "Red Garage",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,                 --car, air, sea
        ['ParkingSpots'] = {
            vector4(-356.89, -749.29, 33.54, 270.15),
            vector4(-356.83, -753.66, 33.54, 269.64),
            vector4(-357.22, -756.74, 33.54, 269.93),
            vector4(-357.17, -760.01, 33.54, 269.71),
            vector4(-357.4, -764.54, 33.54, 268.82),
            vector4(-357.14, -767.51, 33.54, 269.67),
            vector4(-357.09, -770.59, 33.54, 271.03),
            vector4(-357.09, -776.02, 33.54, 267.95),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-357.37, -746.23, 33.54, 269.64),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-289.82, -764.25, 33.54, 160.83),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-295.59, -762.4, 33.54, 160.93),
            vector4(-298.43, -761.45, 33.54, 159.95),
            vector4(-302.41, -760.02, 33.54, 161.24),
            vector4(-305.16, -758.37, 33.54, 158.98),
            vector4(-308.23, -757.98, 33.54, 160.64),
            vector4(-311.14, -757.03, 33.54, 158.78),
            vector4(-315.09, -755.34, 33.54, 157.34),
            vector4(-317.51, -753.39, 33.54, 160.53),
            vector4(-320.45, -752.5, 33.55, 161.44),
            vector4(-323.24, -751.76, 33.54, 158.57),
            vector4(-329.02, -750.3, 33.54, 179.15),
            vector4(-331.75, -750.26, 33.54, 179.53),
            vector4(-334.52, -750.73, 33.54, 181.13),
            vector4(-337.46, -751.25, 33.54, 183.02),
            vector4(-342.14, -749.82, 33.55, 272.39),
            vector4(-341.94, -753.53, 33.55, 94.28),
            vector4(-341.97, -756.82, 33.55, 90.65),
            vector4(-342.23, -760.49, 33.55, 88.42),
            vector4(-341.84, -764.1, 33.55, 89.13),
            vector4(-341.93, -767.36, 33.55, 91.18),
            vector4(-357.3, -732.9, 33.54, 270.41),
            vector4(-357.24, -737.63, 33.55, 269.9),
            vector4(-357.33, -743.24, 33.54, 270.89),
            vector4(-295.82, -778.26, 33.54, 342.22),
            vector4(-299.37, -776.74, 33.54, 342.64),
            vector4(-307.47, -773.5, 33.54, 340.32),
            vector4(-303.19, -775.79, 33.54, 339.27),
            vector4(-310.37, -772.78, 33.54, 339.1),
            vector4(-313.07, -771.64, 33.54, 338.38),
            vector4(-315.73, -770.26, 33.54, 339.87),
            vector4(-273.07, -761.54, 33.54, 69.58),
            vector4(-273.81, -765.05, 33.54, 71.99),
            vector4(-276.05, -771.7, 33.54, 68.27),
            vector4(-277.3, -775.37, 33.54, 70.28),
            vector4(-277.07, -751.83, 33.54, 160.8),
            vector4(-279.97, -750.75, 33.54, 160.08),
            vector4(-284.28, -748.9, 33.54, 159.2),
            vector4(-287.28, -748.29, 33.54, 160.63),
            vector4(-290.22, -747.64, 33.54, 159.94),
            vector4(-292.89, -746.25, 33.54, 160.17),
            vector4(-297.03, -744.69, 33.54, 159.37),
            vector4(-299.71, -743.7, 33.54, 159.26),
            vector4(-302.62, -742.8, 33.54, 159.48),
            vector4(-275.18, -768.22, 33.54, 71.26)
        }
    },
    ['spanishave'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1135.1311035156, -778.41644287109),
                vector2(-1114.7188720703, -761.08288574219),
                vector2(-1142.3354492188, -729.19293212891),
                vector2(-1161.1352539062, -745.50402832031)
            },
            ['minZ'] = 17.69,  -- min height of the parking zone
            ['maxZ'] = 20.61,  -- max height of the parking zone
        },
        label = "Spanish Ave Parking",
        showBlip = true,
        blipcoords = vector3(-1160.86, -741.41, 19.63),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
    },
    ['cars24'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(76.188446044922, 7.9120540618896),
                vector2(81.977760314941, 23.525623321533),
                vector2(55.219917297363, 32.982769012451),
                vector2(49.228351593018, 16.684007644653),
                vector2(68.127639770508, 9.6578321456909),
                vector2(68.597557067871, 10.655039787292)
            },
            ['minZ'] = 68.00,  -- min height of the parking zone
            ['maxZ'] = 70.45,  -- max height of the parking zone
        },
        label = "Cars 24 Parking",
        showBlip = true,
        blipcoords = vector3(69.84, 12.6, 68.96),
        blipName = "Cars 24 Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(54.49, 19.49, 69.14, 339.68),
            vector4(57.48, 17.98, 68.92, 340.13),
            vector4(60.49, 16.99, 68.8, 338.05),
            vector4(64.03, 16.28, 68.75, 337.71),
        }
    },
    -- ['caears242'] = {
    --     ['Zone'] = {
    --         ['Shape'] = { --polygon that surrounds the parking area
    --             vector2(-480.87042236328, -819.84265136719),
    --             vector2(-441.08392333984, -820.39178466797),
    --             vector2(-440.29922485352, -795.61010742188),
    --             vector2(-450.12713623047, -795.83892822266),
    --             vector2(-450.57876586914, -792.54748535156),
    --             vector2(-480.38143920898, -792.79217529297)
    --         },
    --         ['minZ'] = 29.47,  -- min height of the parking zone
    --         ['maxZ'] = 32.82,  -- max height of the parking zone
    --     },
    --     label = "Caears 24 Parking",
    --     showBlip = true,
    --     blipcoords = vector3(-475.31, -818.73, 30.46),
    --     blipName = "Public Parking",
    --     blipNumber = 357,
    --     type = 'public',                --public, job, gang, depot
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Parking',                 --car, air, sea
    --     debug = false,
    --     ['ParkingSpots'] = {
    --         vector4(-477.62, -816.44, 30.05, 271.2),
    --         vector4(-477.28, -813.29, 30.1, 265.04),
    --         vector4(-477.3, -809.77, 30.12, 268.93),
    --         vector4(-477.37, -806.7, 30.12, 271.51),
    --         vector4(-477.45, -803.55, 30.12, 268.73),
    --         vector4(-477.12, -800.59, 30.12, 270.28),
    --         vector4(-476.98, -796.99, 30.12, 269.26),
    --         vector4(-476.98, -796.99, 30.12, 269.26),
    --         vector4(-476.99, -794.09, 30.13, 268.72),
    --         vector4(-459.54, -797.15, 30.12, 267.11),
    --         vector4(-460.45, -800.21, 30.12, 270.89),
    --         vector4(-460.18, -803.33, 30.11, 269.85),
    --         vector4(-460.74, -809.84, 30.11, 270.31),
    --         vector4(-460.21, -813.14, 30.13, 271.44),
    --         vector4(-460.21, -816.42, 30.16, 269.02),
    --         vector4(-444.8, -797.5, 30.12, 90.73),
    --         vector4(-444.33, -801.16, 30.12, 92.51),
    --         vector4(-444.6, -804.72, 30.11, 90.88),
    --         vector4(-444.63, -808.75, 30.11, 89.24),
    --         vector4(-443.84, -812.02, 30.13, 87.33),
    --         vector4(-444.21, -816.02, 30.24, 89.21),
    --         vector4(-460.34, -806.46, 30.11, 267.68),
    --         vector4(-466.14, -816.36, 30.11, 88.66),
    --         vector4(-466.18, -812.98, 30.11, 88.96),
    --         vector4(-466.22, -809.72, 30.11, 89.54),
    --         vector4(-467.38, -806.99, 30.11, 89.36),
    --         vector4(-466.99, -803.3, 30.12, 85.98),
    --         vector4(-466.81, -800.55, 30.12, 89.29),
    --         vector4(-466.41, -797.08, 30.12, 88.09),
    --         vector4(-460.34, -806.46, 30.11, 267.68),
    --     }
    -- },
    -- ['lagunapi'] = {
    --     ['Zone'] = {
    --         ['Shape'] = { --polygon that surrounds the parking area
    --             vector2(358.69207763672, 302.30017089844),
    --             vector2(351.44546508789, 277.92486572266),
    --             vector2(355.01831054688, 277.03842163086),
    --             vector2(353.3766784668, 270.50997924805),
    --             vector2(387.72875976562, 257.78961181641),
    --             vector2(399.73132324219, 290.71780395508),
    --             vector2(364.49926757812, 300.54202270508),
    --             vector2(362.70568847656, 295.12139892578),
    --             vector2(359.67681884766, 296.56146240234),
    --             vector2(361.49871826172, 301.58950805664)
    --         },
    --         ['minZ'] = 102.00,  -- min height of the parking zone
    --         ['maxZ'] = 105.89,  -- max height of the parking zone
    --     },
    --     label = "Laguna Parking",
    --     showBlip = true,
    --     blipcoords = vector3(364.37, 297.83, 103.49),
    --     blipName = "Public Parking",
    --     blipNumber = 357,
    --     type = 'public',                --public, job, gang, depot
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Parking',                 --car, air, sea
    --     debug = false,
    --     ['ParkingSpots'] = {
    --         vector4(359.53, 270.99, 102.65, 341.37),
    --         vector4(363.59, 269.88, 102.64, 341.77),
    --         vector4(368.05, 267.75, 102.62, 337.77),
    --         vector4(371.2, 266.77, 102.6, 340.94),
    --         vector4(375.32, 265.38, 102.59, 339.29),
    --         vector4(379.12, 264.74, 102.59, 337.98),
    --         vector4(388.53, 269.67, 102.58, 68.7),
    --         vector4(389.17, 272.93, 102.58, 72.26),
    --         vector4(391.11, 276.63, 102.57, 69.67),
    --         vector4(392.57, 280.58, 102.57, 70.77),
    --         vector4(393.81, 283.91, 102.55, 71.82),
    --         vector4(390.92, 290.55, 102.58, 163.29),
    --         vector4(386.89, 291.62, 102.63, 162.58),
    --         vector4(383.07, 292.87, 102.69, 164.08),
    --         vector4(379.23, 293.87, 102.77, 162.43),
    --         vector4(374.93, 294.49, 102.85, 162.54),
    --         vector4(375.86, 274.26, 102.65, 157.86),
    --         vector4(371.94, 275.54, 102.71, 158.54),
    --         vector4(368.03, 277.26, 102.77, 156.9),
    --         vector4(378.84, 281.93, 102.68, 336.98),
    --         vector4(375.05, 283.0, 102.75, 339.72),
    --         vector4(370.91, 284.66, 102.83, 337.04),
    --         vector4(361.12, 293.52, 103.08, 251.69),
    --         vector4(359.6, 290.0, 103.08, 249.21),
    --         vector4(357.99, 286.45, 103.1, 248.69),
    --         vector4(356.98, 283.01, 103.0, 248.05),
    --     }
    -- },
    ['airportp'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-779.76104736328, -2023.2966308594),
                vector2(-775.14440917969, -2019.8140869141),
                vector2(-767.18334960938, -2012.3591308594),
                vector2(-760.70989990234, -2004.76171875),
                vector2(-756.01049804688, -1997.4604492188),
                vector2(-753.18353271484, -1990.4525146484),
                vector2(-751.64544677734, -1983.7036132812),
                vector2(-748.98046875, -1969.5380859375),
                vector2(-748.11468505859, -1967.5456542969),
                vector2(-746.72650146484, -1965.5721435547),
                vector2(-744.23596191406, -1963.4608154297),
                vector2(-739.22473144531, -1961.9007568359),
                vector2(-733.59368896484, -1962.0502929688),
                vector2(-729.30279541016, -1963.3483886719),
                vector2(-727.666015625, -1964.8414306641),
                vector2(-725.72021484375, -1966.9916992188),
                vector2(-714.04919433594, -2019.2927246094),
                vector2(-710.76025390625, -2032.8103027344),
                vector2(-707.01336669922, -2040.8115234375),
                vector2(-704.6533203125, -2044.3029785156),
                vector2(-703.19024658203, -2045.3291015625),
                vector2(-701.63171386719, -2045.6253662109),
                vector2(-699.74157714844, -2045.2917480469),
                vector2(-687.05395507812, -2039.5653076172),
                vector2(-685.76708984375, -2038.6518554688),
                vector2(-684.13092041016, -2036.3044433594),
                vector2(-672.29400634766, -2041.8348388672),
                vector2(-670.67193603516, -2043.4077148438),
                vector2(-665.39947509766, -2046.6591796875),
                vector2(-657.96466064453, -2048.1787109375),
                vector2(-655.55963134766, -2048.3508300781),
                vector2(-651.94177246094, -2047.6011962891),
                vector2(-649.02130126953, -2046.1932373047),
                vector2(-633.71252441406, -2030.9672851562),
                vector2(-631.34783935547, -2030.0726318359),
                vector2(-628.30303955078, -2030.5014648438),
                vector2(-616.89349365234, -2042.3790283203),
                vector2(-616.16394042969, -2045.1605224609),
                vector2(-617.02777099609, -2047.9118652344),
                vector2(-648.34002685547, -2079.3305664062),
                vector2(-652.69281005859, -2082.1706542969),
                vector2(-658.36376953125, -2083.3293457031),
                vector2(-671.02252197266, -2082.0708007812),
                vector2(-676.02673339844, -2082.1984863281),
                vector2(-684.85815429688, -2084.7019042969),
                vector2(-695.00408935547, -2087.8937988281),
                vector2(-701.19207763672, -2088.712890625),
                vector2(-703.89630126953, -2088.4221191406),
                vector2(-708.56176757812, -2085.2458496094),
                vector2(-713.30065917969, -2087.1435546875),
                vector2(-718.29937744141, -2082.3813476562),
                vector2(-724.05651855469, -2078.2341308594),
                vector2(-736.53204345703, -2071.5529785156),
                vector2(-746.24493408203, -2067.9118652344),
                vector2(-751.45703125, -2073.4653320312),
                vector2(-787.72106933594, -2037.2147216797)
            },
            ['minZ'] = 5.85,  -- min height of the parking zone
            ['maxZ'] = 10.10,  -- max height of the parking zone
        },
        label = "Airport Parking",
        showBlip = true,
        blipcoords = vector3(-796.86, -2024.85, 8.88),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        debug = false,
    },
    -- ['beachp'] = {
    --     ['Zone'] = {
    --         ['Shape'] = { --polygon that surrounds the parking area
    --             vector2(-1177.4599609375, -1504.8297119141),
    --             vector2(-1170.6567382812, -1500.1866455078),
    --             vector2(-1167.892578125, -1496.4272460938),
    --             vector2(-1167.0075683594, -1491.4938964844),
    --             vector2(-1168.083984375, -1487.3162841797),
    --             vector2(-1184.8902587891, -1461.9444580078),
    --             vector2(-1203.3045654297, -1475.2700195312),
    --             vector2(-1202.2609863281, -1476.640625),
    --             vector2(-1208.1496582031, -1480.9470214844),
    --             vector2(-1207.1524658203, -1483.8693847656),
    --             vector2(-1207.7424316406, -1485.8941650391),
    --             vector2(-1188.0931396484, -1513.3830566406),
    --             vector2(-1185.7036132812, -1511.7416992188),
    --             vector2(-1187.1550292969, -1509.7088623047),
    --             vector2(-1183.7425537109, -1507.1494140625),
    --             vector2(-1182.2048339844, -1508.9814453125)
    --         },
    --         ['minZ'] = 4.20,  -- min height of the parking zone
    --         ['maxZ'] = 6.53,  -- max height of the parking zone
    --     },
    --     label = "Beach Parking",
    --     showBlip = true,
    --     blipcoords = vector3(-1183.1, -1511.11, 4.36),
    --     blipName = "Public Parking",
    --     blipNumber = 357,
    --     type = 'public',                --public, job, gang, depot
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Parking',                 --car, air, sea
    --     debug = false
    -- },
    ["themotorhotel"] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1140.2746582031, 2644.5261230469),
                vector2(1108.8831787109, 2644.2172851562),
                vector2(1108.5783691406, 2660.1645507812),
                vector2(1089.9521484375, 2660.1198730469),
                vector2(1091.3571777344, 2677.4743652344),
                vector2(1133.5280761719, 2674.8422851562),
                vector2(1133.7532958984, 2658.8393554688),
                vector2(1140.4176025391, 2658.8898925781)
            },
            ['minZ'] = 35.78,  -- min height of the parking zone
            ['maxZ'] = 39.74,  -- max height of the parking zone
        },
        label = "The Motor Hotel Parking",
        showBlip = true,
        blipcoords = vector3(1137.77, 2663.54, 37.9),
        blipName = "The Motor Hotel Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
    },
    ['alamoseaparking'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(934.54669189453, 3604.5546875),
                vector2(954.29815673828, 3604.1672363281),
                vector2(954.35180664062, 3626.7893066406),
                vector2(934.75305175781, 3626.3806152344)
            },
            ['minZ'] = 32.37,  -- min height of the parking zone
            ['maxZ'] = 35.99,  -- max height of the parking zone
        },
        label = "Alamo Sea Parking",
        showBlip = true,
        blipcoords = vector3(934.95, 3606.59, 32.81),
        blipName = "Alamo Sea Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
    },
    ['legionsquare'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(239.88751220703, -820.52038574219),
                vector2(252.71513366699, -784.91027832031),
                vector2(258.39483642578, -786.82489013672),
                vector2(264.27755737305, -769.99841308594),
                vector2(218.69738769531, -754.69787597656),
                vector2(200.07238769531, -805.74285888672)
            },
            ['minZ'] = 29.07,  -- min height of the parking zone
            ['maxZ'] = 40.0,  -- max height of the parking zone
        },
        label = "Legion Square Parking",
        showBlip = true,
        blipcoords = vector3(215.9499, -809.698, 30.731),
        blipName = "Legion Garage",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(219.38, -765.95, 30.41, 247.04),
            vector4(218.07, -768.47, 30.41, 248.86),
            vector4(216.93, -770.89, 30.42, 249.93),
            vector4(216.35, -773.48, 30.43, 249.43),
            vector4(215.02, -775.62, 30.44, 252.59),
            vector4(214.22, -778.6, 30.45, 247.99),
            vector4(213.67, -780.92, 30.45, 248.98),
            vector4(212.9, -783.52, 30.46, 249.01),
            vector4(210.97, -785.75, 30.5, 250.38),
            vector4(210.35, -788.41, 30.51, 249.85),
            vector4(209.74, -790.91, 30.51, 248.14),
            vector4(209.21, -793.47, 30.52, 249.87),
            vector4(207.96, -795.82, 30.55, 248.81),
            vector4(206.91, -798.68, 30.57, 248.97),
            vector4(205.45, -800.74, 30.6, 249.38),
            vector4(234.07, -771.23, 30.33, 249.64),
            vector4(232.09, -776.31, 30.3, 248.31),
            vector4(230.94, -778.87, 30.29, 248.97),
            vector4(230.7, -781.41, 30.28, 250.6),
            vector4(229.02, -783.81, 30.28, 250.06),
            vector4(227.64, -789.2, 30.26, 247.99),
            vector4(226.28, -791.42, 30.26, 248.95),
            vector4(225.72, -794.21, 30.24, 249.28),
            vector4(224.66, -796.59, 30.24, 247.01),
            vector4(223.2, -798.92, 30.25, 248.79),
            vector4(222.61, -801.4, 30.25, 248.1),
            vector4(221.77, -804.1, 30.26, 245.92),
            vector4(221.6, -806.74, 30.25, 247.77),
            vector4(219.83, -808.89, 30.26, 251.3),
            vector4(228.63, -768.88, 30.36, 69.31),
            vector4(227.76, -771.74, 30.35, 71.5),
            vector4(226.39, -773.88, 30.35, 68.62),
            vector4(225.43, -776.69, 30.35, 69.02),
            vector4(224.35, -778.81, 30.34, 64.93),
            vector4(224.25, -781.78, 30.33, 70.11),
            vector4(222.81, -784.16, 30.34, 72.1),
            vector4(221.16, -786.48, 30.35, 68.66),
            vector4(221.04, -789.3, 30.34, 68.07),
            vector4(219.76, -791.48, 30.34, 70.29),
            vector4(218.97, -794.38, 30.34, 68.04),
            vector4(218.34, -796.97, 30.34, 66.59),
            vector4(217.56, -799.45, 30.35, 69.51),
            vector4(216.23, -801.69, 30.37, 70.17),
            vector4(215.69, -804.56, 30.38, 68.56),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(236.32, -812.55, 29.88, 248.26),
            vector4(237.41, -809.93, 29.89, 244.26),
            vector4(238.45, -807.4, 29.9, 244.04),
            vector4(238.94, -804.82, 29.93, 248.53),
            vector4(240.36, -802.39, 29.94, 246.63),
            vector4(241.52, -799.87, 29.96, 245.68),
            vector4(242.03, -797.37, 29.98, 246.08),
            vector4(243.06, -794.79, 30.01, 249.35),
            vector4(244.27, -792.42, 30.03, 247.07),
            vector4(245.14, -789.87, 30.06, 247.13),
            vector4(246.18, -787.38, 30.08, 248.58),
            vector4(246.61, -784.52, 30.12, 248.32),
            vector4(248.17, -782.46, 30.14, 248.95),
            vector4(249.12, -779.63, 30.18, 249.01),
            vector4(249.32, -776.78, 30.22, 247.42),
            vector4(250.19, -774.3, 30.26, 248.86),
            vector4(244.75, -772.24, 30.29, 69.17),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(231.42, -810.44, 30.01, 70.18),
            vector4(231.62, -807.79, 30.03, 68.27),
            vector4(232.96, -805.51, 30.02, 66.62),
            vector4(234.88, -803.0, 30.02, 69.62),
            vector4(235.38, -800.43, 30.04, 68.23),
            vector4(236.58, -797.83, 30.05, 69.89),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(237.88, -792.75, 30.08, 66.76),
            vector4(238.84, -790.11, 30.11, 68.34),
            vector4(240.15, -787.59, 30.13, 67.55),
            vector4(241.01, -785.27, 30.15, 69.84),
            vector4(244.51, -775.07, 30.26, 70.7),
            vector4(243.65, -777.69, 30.22, 67.25),
            vector4(242.44, -779.84, 30.2, 68.04),
            vector4(241.32, -782.41, 30.18, 69.19),
        }
    },
    ['bellsfarm'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-23.325819015503, 6324.0756835938),
                vector2(-19.95845413208, 6318.2236328125),
                vector2(67.769134521484, 6404.8295898438),
                vector2(80.006652832031, 6392.4770507813),
                vector2(85.264366149902, 6397.3115234375),
                vector2(67.407508850098, 6414.5219726563)
            },
            ['minZ'] = 25,  -- min height of the parking zone
            ['maxZ'] = 36,  -- max height of the parking zone
        },
        label = "Bell's Farm Parking",
        showBlip = true,
        blipcoords = vector3(39.61, 6382.74, 30.59),
        blipName = "Legion Garage",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(8.84, 6350.31, 30.59, 214.33),
            vector4(11.44, 6352.89, 30.59, 212.39),
            vector4(13.77, 6355.78, 30.59, 212.63),
            vector4(16.78, 6358.31, 30.59, 212.8),
            vector4(19.27, 6361.24, 30.59, 213.15),
            vector4(22.18, 6364.06, 30.59, 214.44),
            vector4(24.78, 6367.01, 30.59, 214.4),
            vector4(27.51, 6369.8, 30.59, 213.71),
            vector4(37.35, 6379.05, 30.59, 211.35),
            vector4(40.18, 6382.15, 30.59, 211.45),
            vector4(42.3, 6385.46, 30.59, 211.88),
            vector4(45.45, 6388.0, 30.59, 214.23),
            vector4(48.04, 6390.81, 30.59, 212.57),
            vector4(50.68, 6393.64, 30.59, 214.69),
            vector4(58.89, 6401.1, 30.59, 211.78),
            vector4(61.92, 6404.04, 30.59, 213.56),
            vector4(64.32, 6406.81, 30.59, 211.11),
            vector4(72.67, 6404.29, 30.59, 132.32),
            vector4(75.61, 6401.57, 30.59, 133.17),
            vector4(78.03, 6398.6, 30.59, 131.98),
            vector4(81.13, 6396.26, 30.59, 132.06),
        }
    },
    ['shoppingmall'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
              vector2(-494.423828125, -593.47314453125),
              vector2(-476.85974121094, -593.04974365234),
              vector2(-477.2096862793, -610.84173583984),
              vector2(-455.34072875977, -610.80151367188),
              vector2(-455.33578491211, -627.90887451172),
              vector2(-472.64218139648, -627.58038330078),
              vector2(-472.76574707031, -617.07092285156),
              vector2(-482.69403076172, -616.39624023438),
              vector2(-482.8869934082, -618.83215332031),
              vector2(-495.50466918945, -618.86901855469),
              vector2(-495.71072387695, -613.22247314453),
              vector2(-495.74746704102, -605.01629638672)
            },
            ['minZ'] = 12,  -- min height of the parking zone
            ['maxZ'] = 35,  -- max height of the parking zone
        },
        label = "Shopping Mall Parking",
        showBlip = false,
        blipcoords = vector3(-482.92, -612.8, 31.18),
        blipName = "Shopping Mall Garage",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-471.08, -624.65, 30.54, 359.46),
            vector4(-467.51, -624.67, 30.54, 0.73),
            vector4(-464.17, -624.63, 30.54, 359.53),
            vector4(-460.58, -624.76, 30.54, 2.46),
            vector4(-457.3, -624.99, 30.54, 0.85),
            vector4(-457.06, -613.63, 30.54, 180.54),
            vector4(-460.74, -613.52, 30.54, 181.77),
            vector4(-464.12, -613.88, 30.54, 180.03),
            vector4(-467.58, -614.12, 30.54, 181.04),
            vector4(-471.0, -613.47, 30.54, 180.19),
            vector4(-484.58, -615.48, 30.54, 179.89),
            vector4(-487.59, -615.49, 30.54, 181.45),
            vector4(-490.69, -614.97, 30.54, 181.88),
            vector4(-494.01, -615.32, 30.54, 181.47),
            vector4(-478.51, -596.08, 30.54, 179.34),
            vector4(-482.01, -596.23, 30.54, 181.21),
            vector4(-485.73, -596.12, 30.54, 180.61),
            vector4(-489.12, -595.98, 30.54, 182.07),
            vector4(-492.54, -595.82, 30.54, 180.44),
            vector4(-484.46, -608.59, 30.54, 359.8),
            vector4(-487.55, -608.65, 30.54, 1.0),
            vector4(-494.0, -608.95, 30.54, 2.72),
            vector4(-491.07, -608.85, 30.54, 359.51),
        }
    },
    ['edm'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
               vector2(-598.12561035156, -1143.5256347656),
               vector2(-591.59283447266, -1143.1964111328),
               vector2(-591.56042480469, -1136.291015625),
               vector2(-570.49621582031, -1136.0368652344),
               vector2(-570.56311035156, -1099.1268310547),
               vector2(-584.13409423828, -1098.8548583984),
               vector2(-584.5791015625, -1109.9364013672),
               vector2(-598.20770263672, -1110.1145019531)
            },
            ['minZ'] = 14,  -- min height of the parking zone
            ['maxZ'] = 27,  -- max height of the parking zone
        },
        label = "EDM Parking",
        showBlip = false,
        blipcoords = vector3(-586.87, -1122.57, 21.54),
        blipName = "EDM Garage",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-581.67, -1100.97, 21.54, 89.81),
            vector4(-581.82, -1111.84, 21.54, 90.23),
            vector4(-581.54, -1115.95, 21.54, 88.68),
            vector4(-581.9, -1119.32, 21.54, 90.0),
            vector4(-581.94, -1126.74, 21.54, 89.21),
            vector4(-581.73, -1133.95, 21.54, 89.17),
            vector4(-594.94, -1141.48, 21.54, 271.83),
            vector4(-594.75, -1137.37, 21.54, 270.98),
            vector4(-594.97, -1133.95, 21.54, 268.91),
            vector4(-594.84, -1130.35, 21.54, 270.27),
            vector4(-594.52, -1126.59, 21.54, 268.83),
            vector4(-595.07, -1122.84, 21.54, 268.59),
            vector4(-594.82, -1119.12, 21.54, 269.52),
            vector4(-595.09, -1115.65, 21.54, 266.52),
            vector4(-594.87, -1112.11, 21.54, 271.24),
            vector4(-582.02, -1104.5, 21.54, 88.95),
            vector4(-582.13, -1123.15, 21.54, 89.23),
            vector4(-581.81, -1130.38, 21.54, 89.83),
            vector4(-573.43, -1100.81, 21.54, 269.58),
            vector4(-573.42, -1108.22, 21.54, 269.76),
            vector4(-573.35, -1111.84, 21.54, 271.26),
            vector4(-573.19, -1115.4, 21.54, 270.06),
            vector4(-573.39, -1119.09, 21.54, 270.56),
            vector4(-573.43, -1122.71, 21.54, 270.69),
            vector4(-573.32, -1126.37, 21.54, 270.09),
            vector4(-573.02, -1130.12, 21.54, 269.92),
            vector4(-572.82, -1133.91, 21.54, 269.23),
            vector4(-581.63, -1108.03, 21.54, 92.07),
            vector4(-573.35, -1104.33, 21.54, 267.65),
        }
    },
    ['impoundlot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-155.97354125977, -1172.095703125),
                vector2(-150.54695129395, -1171.9118652344),
                vector2(-150.63743591309, -1163.7630615234),
                vector2(-134.80215454102, -1163.9595947266),
                vector2(-134.34875488281, -1184.138671875),
                vector2(-129.1598815918, -1184.0386962891),
                vector2(-129.38648986816, -1158.8569335938),
                vector2(-155.31358337402, -1158.8569335938),
            },
            ['minZ'] = 20.154972076416,  -- min height of the parking zone
            ['maxZ'] = 29.9315471649171,  -- max height of the parking zone
            debug = false,
        },
        label = "Depot",
        showBlip = true,
        blipcoords = vector3(-141.22, -1174.54, 23.77),
        blipName = "Depot",
        blipNumber = 68,
        blipColor = 5, 
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Depot',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-152.82, -1169.78, 23.13, 272.17),
            vector4(-152.48, -1166.63, 23.13, 269.44),
            vector4(-147.78, -1161.98, 23.13, 178.23),
            vector4(-144.18, -1161.92, 23.13, 180.57),
            vector4(-139.07, -1162.21, 23.13, 179.43),
            vector4(-132.38, -1166.74, 23.13, 89.54),
            vector4(-132.25, -1170.28, 23.13, 89.02),
            vector4(-132.02, -1175.22, 23.13, 88.85),
            vector4(-132.19, -1178.65, 23.13, 89.25),
            vector4(-132.19, -1182.16, 23.13, 89.74),
        }
    },
    ['police'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(427.85052490234, -1017.9293212891),
                vector2(428.14498901367, -1030.7161865234),
                vector2(459.05325317383, -1026.896484375),
                vector2(459.12948608398, -1012.3634033203),
                vector2(449.7737121582, -1012.4426879883),
                vector2(449.38006591797, -1011.4791870117),
                vector2(434.09115600586, -1011.4317016602),
                vector2(434.05737304688, -1013.9020996094),
                vector2(427.95745849609, -1013.9678344727)
            },
            ['minZ'] = 28.10,  -- min height of the parking zone
            ['maxZ'] = 30.97,  -- max height of the parking zone
        },
        label = "Police",
        showBlip = false,
        blipName = "Police",
        blipNumber = 357,
        type = 'job',                --public, job, gang, depot
        vehicleCategories = {'emergency'},
        drawText = 'Parking',              --car, air, sea
        job = "police",
        debug = false,
        ['ParkingSpots'] = {
            vector4(449.57, -1024.85, 28.06, 5.95),
            vector4(446.04, -1025.62, 28.14, 5.18),
            vector4(442.53, -1025.66, 28.2, 6.39),
            vector4(438.8, -1025.99, 28.27, 7.28),
            vector4(435.41, -1026.74, 28.35, 3.84),
        }
    },
    ['erpcustoms'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-353.88778686523, -119.96187591553),
                vector2(-357.81494140625, -130.22131347656),
                vector2(-363.0133972168, -128.33973693848),
                vector2(-359.24221801758, -118.11127471924),
            },
            ['minZ'] = 35.154972076416,  -- min height of the parking zone
            ['maxZ'] = 45.9315471649171,  -- max height of the parking zone
            debug = false,
        },
        label = "ERP Customs",
        showBlip = false,
        blipcoords = vector3(410.26, -1641.74, 29.29),
        blipName = "Impound Lot",
        blipNumber = 68,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-360.07, -127.17, 38.06, 71.12),
            vector4(-358.89, -123.98, 38.06, 71.82),
            vector4(-357.47, -120.72, 38.06, 70.43),
        }
    },
    -- ['apartments'] = {
    --     ['Zone'] = {
    --         ['Shape'] = { --polygon that surrounds the parking area
    --             vector2(-363.8267211914, -862.93182373046),
    --             vector2(-268.29055786132, -885.1919555664),
    --             vector2(-282.65710449218, -925.12030029296),
    --             vector2(-298.25598144532, -919.4287109375),
    --             vector2(-302.71203613282, -930.14245605468),
    --             vector2(-297.5908203125, -932.38952636718),
    --             vector2(-310.84530639648, -969.61614990234),
    --             vector2(-289.9221496582, -977.25311279296),
    --             vector2(-296.0697631836, -994.66876220704),
    --             vector2(-364.01559448242, -969.91552734375)
    --         },
    --         ['minZ'] = 30.0,  -- min height of the parking zone
    --         ['maxZ'] = 33.0,  -- max height of the parking zone
            
    --     },
    --     label = 'Alta Apartments',
    --     showBlip = true,
    --     blipcoords = vector3(-322.55, -969.96, 31.08),
    --     blipName = "Apartments Parking",
    --     blipNumber = 357,
    --     type = 'public',
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Parking',
    --     ["ParkingSpots"] = {
    --         vector4(-297.71, -990.11, 30.76, 338.79),
    --         vector4(-301.09, -988.82, 30.76, 339.11),
    --         vector4(-304.64, -987.72, 30.76, 339.36),
    --         vector4(-308.09, -986.34, 30.76, 339.47),
    --         vector4(-311.46, -985.08, 30.76, 339.5),
    --         vector4(-315.07, -983.98, 30.76, 339.18),
    --         vector4(-318.71, -982.49, 30.76, 338.43),
    --         vector4(-277.33, -890.09, 30.75, 339.58),
    --         vector4(-285.76, -888.04, 30.76, 168.44),
    --         vector4(-289.39, -887.34, 30.76, 168.59),
    --         vector4(-292.99, -886.36, 30.76, 167.4),
    --         vector4(-296.78, -885.82, 30.75, 167.93),
    --         vector4(-300.35, -885.14, 30.76, 167.76),
    --         vector4(-303.82, -884.06, 30.76, 167.76),
    --         vector4(-307.59, -883.44, 30.76, 167.24),
    --         vector4(-311.16, -882.7, 30.76, 166.92),
    --         vector4(-314.74, -881.99, 30.75, 166.91),
    --         vector4(-318.34, -881.19, 30.75, 167.5),
    --         vector4(-322.02, -880.47, 30.75, 167.75),
    --         vector4(-325.62, -879.65, 30.75, 168.31),
    --         vector4(-329.11, -878.9, 30.75, 168.35),
    --         vector4(-332.88, -878.22, 30.75, 167.35),
    --         vector4(-336.55, -877.38, 30.75, 168.02),
    --         vector4(-340.1, -876.67, 30.75, 167.45),
    --         vector4(-343.78, -875.91, 30.75, 167.01),
    --         vector4(-352.86, -874.08, 30.75, 0.76),
    --         vector4(-360.26, -889.43, 30.75, 269.23),
    --         vector4(-360.46, -893.17, 30.75, 268.23),
    --         vector4(-360.24, -896.83, 30.75, 270.26),
    --         vector4(-360.37, -900.58, 30.75, 268.61),
    --         vector4(-360.29, -904.27, 30.75, 269.75),
    --         vector4(-360.14, -908.01, 30.75, 270.4),
    --         vector4(-360.5, -911.66, 30.76, 269.55),
    --         vector4(-360.12, -915.4, 30.76, 269.63),
    --         vector4(-360.28, -919.07, 30.76, 270.11),
    --         vector4(-360.56, -922.77, 30.75, 268.41),
    --         vector4(-360.46, -926.49, 30.76, 270.43),
    --         vector4(-360.37, -930.12, 30.76, 269.72),
    --         vector4(-360.22, -933.88, 30.76, 270.34),
    --         vector4(-360.28, -937.58, 30.76, 269.99),
    --         vector4(-360.47, -941.31, 30.75, 269.54),
    --         vector4(-360.28, -944.99, 30.76, 270.14),
    --         vector4(-360.32, -948.72, 30.76, 269.82),
    --         vector4(-360.38, -952.44, 30.75, 269.95),
    --         vector4(-360.57, -956.16, 30.76, 270.31),
    --         vector4(-322.02, -981.29, 30.76, 339.92),
    --         vector4(-325.56, -980.1, 30.76, 340.1),
    --         vector4(-329.0, -978.69, 30.76, 338.49),
    --         vector4(-332.49, -977.59, 30.76, 339.58),
    --         vector4(-335.9, -976.3, 30.76, 339.7),
    --         vector4(-339.43, -975.08, 30.76, 339.47),
    --         vector4(-342.7, -973.45, 30.76, 338.85),
    --         vector4(-326.58, -956.4, 30.75, 250.37),
    --         vector4(-325.37, -952.84, 30.76, 250.47),
    --         vector4(-324.03, -949.43, 30.76, 250.37),
    --         vector4(-322.69, -945.96, 30.75, 249.91),
    --         vector4(-321.47, -942.43, 30.76, 250.29),
    --         vector4(-320.23, -939.06, 30.76, 250.38),
    --         vector4(-318.8, -935.56, 30.76, 249.46),
    --         vector4(-317.66, -932.03, 30.76, 250.73),
    --         vector4(-316.5, -928.43, 30.76, 250.15),
    --         vector4(-345.07, -932.2, 30.76, 69.27),
    --         vector4(-343.99, -928.61, 30.76, 70.11),
    --         vector4(-342.58, -925.18, 30.76, 70.69),
    --         vector4(-341.39, -921.67, 30.76, 69.83),
    --         vector4(-327.34, -924.44, 30.76, 69.82),
    --         vector4(-328.81, -927.89, 30.76, 69.43),
    --         vector4(-330.09, -931.33, 30.76, 70.81),
    --         vector4(-331.29, -934.83, 30.76, 70.29),
    --         vector4(-332.71, -938.34, 30.76, 69.75),
    --         vector4(-333.91, -941.81, 30.76, 69.46),
    --         vector4(-335.02, -945.3, 30.75, 71.24),
    --         vector4(-336.56, -948.74, 30.75, 70.65),
    --         vector4(-337.69, -952.22, 30.76, 70.31),
    --         vector4(-340.74, -902.45, 30.75, 167.89),
    --         vector4(-337.18, -903.24, 30.75, 167.65),
    --         vector4(-333.64, -903.98, 30.75, 167.05),
    --         vector4(-329.93, -904.61, 30.75, 167.95),
    --         vector4(-326.38, -905.62, 30.75, 168.51),
    --         vector4(-322.65, -906.2, 30.75, 167.96),
    --         vector4(-318.98, -906.94, 30.75, 168.06),
    --         vector4(-315.39, -907.89, 30.75, 166.81),
    --         vector4(-311.81, -908.81, 30.75, 167.5),
    --         vector4(-308.14, -909.33, 30.75, 167.34),
    --         vector4(-285.56, -921.9, 30.76, 70.14),
    --         vector4(-283.75, -918.52, 30.76, 70.23),
    --         vector4(-282.97, -914.81, 30.75, 69.93),
    --         vector4(-281.65, -911.4, 30.76, 69.49),
    --         vector4(-280.5, -908.04, 30.76, 69.51),
    --         vector4(-279.28, -904.45, 30.76, 70.18),
    --         vector4(-302.07, -933.44, 30.75, 69.9),
    --         vector4(-303.19, -937.09, 30.76, 70.71),
    --         vector4(-304.56, -940.34, 30.76, 70.04),
    --         vector4(-305.74, -943.95, 30.76, 70.49),
    --         vector4(-307.19, -947.34, 30.76, 69.04),
    --         vector4(-308.26, -950.95, 30.76, 70.24),
    --         vector4(-309.63, -954.35, 30.76, 68.9),
    --         vector4(-310.83, -957.88, 30.76, 69.56),
    --         vector4(-312.07, -961.38, 30.76, 70.21),
    --         vector4(-313.39, -964.8, 30.76, 68.92),
    --         vector4(-298.26, -899.82, 30.66, 346.23),
    --         vector4(-302.47, -898.86, 30.66, 348.7),
    --         vector4(-305.9, -898.52, 30.66, 351.35),
    --         vector4(-309.58, -897.38, 30.66, 347.24),
    --         vector4(-313.04, -896.37, 30.65, 349.98),
    --         vector4(-316.74, -895.46, 30.65, 347.83),
    --         vector4(-320.36, -894.95, 30.65, 348.97),
    --         vector4(-324.05, -893.86, 30.65, 348.71),
    --         vector4(-327.67, -893.18, 30.65, 347.61),
    --         vector4(-331.02, -892.69, 30.65, 346.03),
    --         vector4(-334.83, -891.72, 30.65, 350.2),
    --         vector4(-338.6, -891.08, 30.65, 348.34),
    --     },
    --     debug = false
    
    -- },
    ['courthouse'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-475.55926513672, -222.67430114746),
            vector2(-472.03475952148, -220.5464630127),
            vector2(-498.85870361328, -173.8444366455),
            vector2(-502.67169189454, -175.96449279786),
            },
            ['minZ'] = 35.0,  -- min height of the parking zone
            ['maxZ'] = 39.0,  -- max height of the parking zone
        },
        label = 'Court House Parking',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(-475.26, -219.26, 36.05, 30.12),
            vector4(-478.26, -214.06, 36.21, 30.11),
            vector4(-481.41, -208.59, 36.37, 30.32),
            vector4(-484.34, -203.49, 36.52, 30.67),
            vector4(-487.17, -198.51, 36.67, 30.37),
            vector4(-490.26, -193.18, 36.83, 29.72),
            vector4(-493.21, -187.98, 36.99, 29.64),
            vector4(-496.19, -182.75, 37.14, 29.96),
            vector4(-499.21, -177.5, 37.3, 30.1),
        },
        debug = false,
    },
    ['courthouse2'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-486.55825805664, -250.04667663574),
            vector2(-484.78402709961, -253.67185974121),
            vector2(-535.18054199219, -274.01614379883),
            vector2(-536.49346923828, -270.32464599609),
            },
            ['minZ'] = 32.0,  -- min height of the parking zone
            ['maxZ'] = 39.0,  -- max height of the parking zone
        },
        label = 'Court House Parking',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(-488.5, -252.71, 35.04, 110.88),
            vector4(-494.03, -254.83, 34.99, 110.93),
            vector4(-499.27, -257.28, 34.93, 111.88),
            vector4(-504.48, -259.4, 34.9, 112.09),
            vector4(-510.27, -261.7, 34.83, 111.47),
            vector4(-515.61, -263.77, 34.76, 112.83),
            vector4(-520.23, -265.69, 34.7, 112.5),
            vector4(-526.14, -268.15, 34.64, 112.55),
            vector4(-532.77, -270.91, 34.57, 112.57),
        },
        debug = false,
    },
    ['pdfront'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(383.34912109375, -1614.9207763672),
            vector2(388.14016723633, -1619.2120361328),
            vector2(397.22348022461, -1608.6739501953),
            vector2(392.15493774414, -1604.3559570313),
            },
            ['minZ'] = 27.0,  -- min height of the parking zone
            ['maxZ'] = 32.0,  -- max height of the parking zone
            
        },
        label = 'PD',
        type = 'job',
        job = "police",
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(392.75, -1608.18, 28.79, 230.07),
            vector4(390.74, -1610.36, 28.79, 229.85),
            vector4(389.08, -1613.07, 28.79, 230.18),
            vector4(387.13, -1615.3, 28.79, 230.18),
        },
        debug = false,
    },

    ---sandy shore pdfront
    ['sandypd'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(1842.2381591797, 3673.4763183594),
            vector2(1846.1569824219, 3667.2309570313),
            vector2(1858.6499023438, 3673.7800292969),
            vector2(1854.9344482422, 3680.7966308594),
            },
            ['minZ'] = 32.0,  -- min height of the parking zone
            ['maxZ'] = 35.0,  -- max height of the parking zone
            
        },
        label = 'Sandy PD',
        type = 'job',
        job = "police",
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(1853.85, 3675.91, 33.24, 209.83),
            vector4(1850.57, 3674.0, 33.26, 209.3),
            vector4(1847.34, 3672.04, 33.2, 211.89),
        },
        debug = false,
    },
    ----palatopd
    ['palatopd'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-468.47991943359, 6044.1840820313),
            vector2(-462.22094726563, 6038.3310546875),
            vector2(-481.26950073242, 6018.0659179688),
            vector2(-488.19543457031, 6024.6904296875),
            },
            ['minZ'] = 30.0,  -- min height of the parking zone
            ['maxZ'] = 35.0,  -- max height of the parking zone
            
        },
        label = 'Paleto PD',
        type = 'job',
        job = "police",
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(-469.04, 6038.58, 30.84, 225.24),
            vector4(-472.0, 6035.28, 30.84, 226.7),
            vector4(-475.28, 6031.21, 30.84, 225.55),
            vector4(-478.89, 6027.94, 30.84, 225.44),
            vector4(-482.38, 6024.65, 30.84, 224.53),
        },
        debug = false,
    },
    ['pdgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(388.65509033203, -1628.2716064453),
            vector2(393.97012329102, -1633.0235595703),
            vector2(407.22344970703, -1617.1821289063),
            vector2(401.82482910156, -1612.552734375),
            },
            ['minZ'] = 26.0,  -- min height of the parking zone
            ['maxZ'] = 32.0,  -- max height of the parking zone
        },
        label = 'PD Garage',
        type = 'job',
        job = "police",
        vehicleCategories = {'emergency'},
        drawText = 'Parking',
        ["ParkingSpots"] = {
            vector4(402.8, -1616.6, 28.79, 50.82),
            vector4(400.81, -1618.86, 28.79, 50.05),
            vector4(398.85, -1621.25, 28.79, 49.89),
            vector4(396.78, -1623.64, 28.79, 50.06),
            vector4(394.93, -1626.0, 28.79, 49.79),
            vector4(392.88, -1628.51, 28.79, 50.27),
        },
        debug = false,
    },
    ['heligarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-757.8896484375, -1469.876953125),
                vector2(-744.54223632812, -1480.4110107422),
                vector2(-733.07989501954, -1467.4460449218),
                vector2(-746.4605102539, -1456.0607910156)
            },
            ['minZ'] = 4.0,  -- min height of the parking zone
            ['maxZ'] = 8.0,  -- max height of the parking zone
        },
        label = 'Heli Garage',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Heli Garage',
        showBlip = true, 
        blipName = "Heli Garage",
        blipNumber = 64,
        blipColor = 69, 
        blipcoords = vector3(-745.61, -1468.57, 4.37),
        ["ParkingSpots"] = {
            vector4(-745.53, -1468.68, 5.0, 321.19)
        },
        ParkingDistance = 10.0,
        debug = false,
    },
    ['airdepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1235.3253173828, -3378.4008789062),
                vector2(-1284.2642822266, -3350.1474609375),
                vector2(-1284.5589599609, -3350.7241210938),
                vector2(-1289.5042724609, -3348.0512695312),
                vector2(-1308.7587890625, -3382.4091796875),
                vector2(-1307.0877685547, -3383.8776855469),
                vector2(-1307.6185302734, -3385.4577636719),
                vector2(-1306.0087890625, -3386.4213867188),
                vector2(-1308.2755126953, -3391.1662597656),
                vector2(-1306.2180175781, -3392.1394042969),
                vector2(-1264.1188964844, -3420.0451660156),
                vector2(-1258.6077880859, -3412.1069335938),
                vector2(-1258.1317138672, -3412.4846191406),
                vector2(-1237.5152587891, -3387.8581542969),
                vector2(-1236.4268798828, -3387.1162109375),
                vector2(-1233.0942382812, -3380.8115234375),
                vector2(-1233.4357910156, -3380.13671875),
                vector2(-1235.1755371094, -3379.1962890625)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Air Depot',
        type = 'depot',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'AIR DEPOT',
        showBlip = true, 
        blipName = 'Air Depot',
        blipNumber = 569,
        blipColor = 5, 
        blipcoords = vector3(-1274.34, -3385.97, 13.94),
        ParkingDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1287.29, -3390.26, 13.84, 336.95),
            vector4(-1271.82, -3399.1, 13.84, 335.19),
            

        },
    },
    -- ['boathouse1'] = {
    --     ['Zone'] = {
    --         ['Shape'] = { 
    --             vector2(-778.9291381836, -1513.3040771484),
    --             vector2(-803.83276367188, -1521.1665039062),
    --             vector2(-816.67852783204, -1493.2373046875),
    --             vector2(-791.34436035156, -1481.7546386718)
    --         },
    --         ['minZ'] = 0.00,
    --         ['maxZ'] = 5.00
    --     },
    --     label = 'Boat House',
    --     type = 'public',
    --     vehicleCategories = {'boat'},
    --     drawText = 'BOAT HOUSE',
    --     showBlip = true, 
    --     blipName = 'Boat House',
    --     blipNumber = 569,
    --     blipColor = 33, 
    --     blipcoords = vector3(-1274.34, -3385.97, 13.94),
    --     ParkingDistance = 20.0,
    --     SpawnDistance = 10.0,
    --     debug = false,
    --     ['ParkingSpots'] = {
    --         vector4(-798.39, -1499.15, 0.37, 109.87),
    --         vector4(-797.47, -1506.73, 0.3, 114.49),
    --     },
    --     ExitWarpLocations = {
    --         vector3(-807.15, -1496.86, 1.6),
    --         vector3(-800.17, -1494.87, 1.6),
    --         vector3(-792.92, -1492.18, 1.6),
    --         vector3(-787.58, -1508.59, 1.6),
    --         vector3(-794.89, -1511.16, 1.6),
    --         vector3(-800.21, -1513.05, 1.6),
    --     },
    -- }
}

HouseGarages = {} -- DO NOT TOUCH!
