Config = {
    FuelScript = "ps-fuel", 
    Rental = {
        RentalVehicleRtrnDmgFee = 100, 
        ChrgPlrFeeIfRtrnDmged = true,
        RentalVehicleDamagedFee = 200, -- If the rental vehicle is destroyed, the player will pay this fee
        CheckForEngineDamage = true, -- Checks if the engine health is below 0 (If the car is blown up)
        CheckForUnderWaterVeh = true, -- Check if the vehicle is underwater (If you are having issues with this, please change it to false :)
      
    },
    --// Category [1] is for land vehicles
    --// Category [2] is for aircrafts 
    --// Category [3] is for boats

    RentableVehicles = {
        Catagorys = {
            [1] = { 
                [1] = {
                    SpawnName = "scorcher", 
                    Label = "Bicycle | Scorcher", 
                    RentFee = 50,
                },
                -- [2] = {
                --     SpawnName = "Sanchez", 
                --     Label = "Motorcycle | Sanchez", 
                --     RentFee = 150, 
                -- },
                [2] = {
                    SpawnName = "Bison",
                    Label = "PickupTruck | Bison",
                    RentFee = 250, 
                },
                [3] = {
                    SpawnName = "habanero",
                    Label = "Suv | Habanero",
                    RentFee = 350, 
                },
                [4] = {
                    SpawnName = "Coquette",
                    Label = "Sports | Coquette",
                    RentFee = 550, 
                },
            },
            [3] = { 
                [1] = { 
                    SpawnName = "seashark",
                    Label = "Jet Ski | Seashark ",
                    RentFee = 250, 
                },
            },
        }
    },
    Locations = {
        [1] = { 
            GetVehicle = vector4(235.53, -736.11, 34.63, 163.33),
            VehicleSpawn = vector4(234.79, -739.11, 33.95, 70.46), 
            TargetPed = "a_m_y_business_02",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        [2] = { 
            GetVehicle = vector4(257.89, -1493.23, 29.14, 146.02),
            VehicleSpawn = vector4(253.59, -1493.11, 28.83, 224.31), 
            TargetPed = "a_m_y_business_02",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        [3] = { 
            GetVehicle = vector4(-455.13, -274.27, 35.9, 23.68),
            VehicleSpawn = vector4(-460.24, -272.82, 35.47, 22.08), 
            TargetPed = "a_m_y_business_02",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        [4] = { 
            GetVehicle = vector4(-1213.88, -572.4, 27.3, 132.53),
            VehicleSpawn = vector4(-1211.2, -574.46, 26.84, 129.11), 
            TargetPed = "a_m_y_business_02",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        [5] = { 
            GetVehicle = vector4(1852.13, 2581.79, 45.67, 279.1),
            VehicleSpawn = vector4(1855.41, 2578.84, 45.36, 269.25), 
            TargetPed = "a_m_y_business_02",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        [6] = { 
            GetVehicle = vector4(2433.61, 4980.43, 45.98, 54.28),
            VehicleSpawn = vector4(2433.28, 4985.66, 45.63, 314.59), 
            TargetPed = "a_m_y_business_02",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        [7] = { 
            GetVehicle = vector4(-34.53, 6287.64, 31.39, 34.18),
            VehicleSpawn = vector4(-28.92, 6289.6, 30.92, 29.98), 
            TargetPed = "a_m_y_business_02",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        [8] = { 
            GetVehicle = vector4(-1924.8, 2051.23, 140.83, 256.8),
            VehicleSpawn = vector4(-1920.94, 2048.91, 140.1, 258.27), 
            TargetPed = "a_m_y_business_01",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = false, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        [9] = { 
            GetVehicle = vector4(817.33, -3148.55, 5.9, 8.52),
            VehicleSpawn = vector4(818.19, -3144.21, 5.26, 0.42), 
            TargetPed = "a_m_y_business_01",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 227, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Vehicle Rental",
            VehicleCatagory = 1, 
        },
        --// Boat Rentals
        [10] = { 
            GetVehicle = vector4(-1005.64, -1397.74, 1.6, 200.89),
            VehicleSpawn = vector4(-998.14, -1401.14, 0.12, 17.44), 
            TargetPed = "a_m_y_business_01",
            TargetPedScenario = "WORLD_HUMAN_CLIPBOARD", 
            BlipEnabled = true, 
            BlipIcon = 427, 
            BlipColor = 47,
            BlipSize = 0.4,
            BlipLabel = "Jet Ski Rental",
            VehicleCatagory = 3, 
        },
    },
    
}