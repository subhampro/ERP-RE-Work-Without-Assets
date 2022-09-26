Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = true
Config.JointEffectTime = 100
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 50 -- carwash
Config.DirtLevel = 0.1 --carwash dirt level

ConsumeablesEat = {
    ["sandwich"] = math.random(25, 33),
    ["tosti"] = math.random(30, 35),
    ["burger"] = math.random(35, 45),
    ["snicker"] = math.random(20, 30),
}

ConsumeablesDrink = {
    ["water_bottle"] = math.random(30, 35),
    ["cola"] = math.random(25, 30),
    ["coffee"] = math.random(15, 20),
}

ConsumeablesAlcohol = {
    ["whiskey"] = math.random(20, 25),
    ["beer"] = math.random(20, 25),
    ["vodka"] = math.random(20, 25),
    ["wine"] = math.random(30, 45),
}

-- Config.BlacklistedScenarios = {
--     ['TYPES'] = {
--         "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
--         "WORLD_VEHICLE_MILITARY_PLANES_BIG",
--         "WORLD_VEHICLE_AMBULANCE",
--         "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
--         "WORLD_VEHICLE_POLICE_CAR",
--         "WORLD_VEHICLE_POLICE_BIKE",
--     },
--     ['GROUPS'] = {
--         2017590552,
--         2141866469,
--         1409640232,
--         `ng_planes`,
--     }
-- }

-- Config.BlacklistedVehs = {
--     [`POLICEB`] = true,
--     [`VOLTIC2`] = true,
--     [`SHAMAL`] = true,
--     [`JET`] = true,
--     [`LAZER`] = true,
--     [`BUZZARD`] = true,
--     [`BUZZARD2`] = true,
--     [`ANNIHILATOR`] = true,
--     [`SAVAGE`] = true,
--     [`TITAN`] = true,
--     [`RHINO`] = true,
--     [`FIRETRUK`] = true,
--     [`MULE`] = true,
--     [`MAVERICK`] = true,
--     [`BLIMP`] = true,
--     [`AIRTUG`] = true,
--     [`CAMPER`] = true,
--     [`HYDRA`] = true,
--     [`OPPRESSOR`] = true,
--     [`technical3`] = true,
--     [`insurgent3`] = true,
--     [`apc`] = true,
--     [`tampa3`] = true,
--     [`trailersmall2`] = true,
--     [`halftrack`] = true,
--     [`hunter`] = true,
--     [`vigilante`] = true,
--     [`akula`] = true,
--     [`barrage`] = true,
--     [`khanjali`] = true,
--     [`caracara`] = true,
--     [`blimp3`] = true,
--     [`menacer`] = true,
--     [`oppressor2`] = true,
--     [`scramjet`] = true,
--     [`strikeforce`] = true,
--     [`cerberus`] = true,
--     [`cerberus2`] = true,
--     [`cerberus3`] = true,
--     [`scarab`] = true,
--     [`scarab2`] = true,
--     [`scarab3`] = true,
--     [`rrocket`] = true,
--     [`ruiner2`] = true,
--     [`deluxo`] = true,
-- }

-- Config.BlacklistedPeds = {
--     [`s_m_y_ranger_01`] = true,
--     [`s_m_y_sheriff_01`] = true,
--     [`s_m_y_cop_01`] = true,
--     [`s_f_y_sheriff_01`] = true,
--     [`s_f_y_cop_01`] = true,
--     [`s_m_y_hwaycop_01`] = true,
-- }

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    
    --------------------------------------------------------------------- P I L L B O X ----------------------------------------------------------
    [2]= {
        [1] = {
            coords =  vector4(338.56, -583.75, 74.16, 246.71),
            ["AllowVehicle"] = false,
            drawText = '[E] TAKE ELEVATOR DOWN'
        },
        [2] = {
            coords = vector4(327.12, -603.86, 43.28, 339.77), 
            ["AllowVehicle"] = false,
            drawText = '[E] TAKE ELEVATOR UP'
        },
    },
    [3] = {
        [1] = {
            coords = vector4(332.38, -595.65, 43.28, 73.26),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },
        [2] = {
            coords = vector4(343.3, -581.85, 28.8, 249.58),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator UP'
        },
    },
    ------------------------------------------------- W E E D  P R O C C E S S I N G ---------------------------------------
    [4] = {
        [1] = {
            coords =  vector4(1066.4, -3183.38, -39.16, 89.3),
            ["AllowVehicle"] = false,
            drawText = '[E] LEAVE'
        },
        [2] = {
            coords = vector4(996.5, 3574.98, 34.61, 324.8), 
            ["AllowVehicle"] = false,
            drawText = '[E] ENTER'
        },
    },
    ------------------------------------------------- M O N E Y  W A S H ---------------------------------------
    [5] = {
        [1] = {
            coords =  vector4(2461.14, 1575.39, 33.11, 269.04),
            ["AllowVehicle"] = false,
            drawText = '[E] ENTER'
        },
        [2] = {
            coords = vector4(1138.09, -3199.2, -39.67, 359.32), 
            ["AllowVehicle"] = false,
            drawText = '[E] LEAVE'
        },
    },
    ------------------------------------------------- C O C A I N E   P R O C E S S I N G ---------------------------------------
    [6] = {
        [1] = {
            coords =  vector4(-1202.12, -1308.44, 4.92, 114.06),
            ["AllowVehicle"] = false,
            drawText = '[E] ENTER'
        },
        [2] = {
            coords = vector4(1131.04, -1236.37, 16.42, 34.7), 
            ["AllowVehicle"] = false,
            drawText = '[E] LEAVE'
        },
    },
    
}

Config.CarWash = { -- carwash
    [1] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(25.29, -1391.96, 29.33),
    },
    [2] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(174.18, -1736.66, 29.35),
    },
    [3] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-74.56, 6427.87, 31.44),
    },
    [5] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(1363.22, 3592.7, 34.92),
    },
    [6] = {
        ["label"] = "Hands Free Carwash",
        ["coords"] = vector3(-699.62, -932.7, 19.01),
    }
}
