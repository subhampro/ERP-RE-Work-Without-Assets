Config = {}

Config.AttachedVehicle = nil

Config.AuthorizedIds = {
    "EZT73604",
    "UGU71986",
    "WNP12923",
}

Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
}

Config.ValuesLabels = {
    ["engine"] = "Engine",
    ["body"] = "Body",
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Ttank",
}

Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "plastic",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
}

Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 2,
    },
    ["body"] = {
        item = "plastic",
        costs = 2,
    },
    ["radiator"] = {
        item = "steel",
        costs = 5,
    },
    ["axle"] = {
        item = "aluminum",
        costs = 6,
    },
    ["brakes"] = {
        item = "copper",
        costs = 3,
    },
    ["clutch"] = {
        item = "iron",
        costs = 4,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 5,
    },
}

Config.Businesses = {
    "Auto Repair",
}

Config.Plates = {
    [1] = {
        coords = vector4(-326.19, -144.36, 38.67, 72.23),
        AttachedVehicle = nil,
        job = 'mechanic',
    },
    [2] = {
        coords = vector4(-322.64, -134.04, 39.02, 72.45),
        AttachedVehicle = nil,
        job = 'mechanic',
    },
    [3] = {
        coords = vector4(-318.94, -123.58, 39.02, 80.41),
        AttachedVehicle = nil,
        job = 'mechanic',
    },
    [4] = {
        coords = vector4(-315.74, -113.2, 38.38, 70.87),
        AttachedVehicle = nil,
        job = 'mechanic',
    },
    [5] = {
        coords = vector4(-311.2, -103.06, 39.02, 72.61),
        AttachedVehicle = nil,
        job = 'mechanic',
    },
    [6] = {
        coords = vector4(-347.08, -124.55, 39.02, 259.43),
        AttachedVehicle = nil,
        job = 'mechanic',
    },
    --[4] = {
    --     coords = vector4(-347.08, -124.51, 39.02, 252.35),
    --     AttachedVehicle = nil,
    --     job = 'tunnermechanic',
    -- },
    -- [5] = {
    --     coords = vector4(144.98, -3030.8, 6.69, 2.69),
    --     AttachedVehicle = nil,
    --     job = 'tunnermechanic',
    -- },
}

Config.Locations = {
    ["exit"] = vector3(-339.04, -135.53, 39),
    ["stash"] = vector3(-316.84, -129.08, 39.02),
    ["duty"] = vector3(-307.12, -102.0, 39.02), 
    ["vehicle"] = vector4(-357.29, -160.74, 38.09, 30.26), 
    ["pstash"] = vector3(-340.27, -160.38, 44.59), 
}

Config.Vehicles = {
    ["towtruck"] = "Towtruck",
    ["towtruck2"] = "Mini Towtruck",
    ["flatbedm2"] = "Flatbed",
    ["gladiator"] = "Jeep Gladiator",
}

Config.MinimalMetersForDamage = {
    [1] = {
        min = 8000,
        max = 12000,
        multiplier = {
            min = 1,
            max = 8,
        }
    },
    [2] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 8,
            max = 16,
        }
    },
    [3] = {
        min = 12000,
        max = 16000,
        multiplier = {
            min = 16,
            max = 24,
        }
    },
}

Config.Damages = {
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
}
