Config = {}

Config.Objects = {
    ["cone"] = {model = `prop_roadcone02a`, freeze = false},
    ["barrier"] = {model = `prop_barrier_work06a`, freeze = true},
    ["roadsign"] = {model = `prop_snow_sign_road_06g`, freeze = true},
    ["tent"] = {model = `prop_gazebo_03`, freeze = true},
    ["light"] = {model = `prop_worklight_03b`, freeze = true},
}

Config.MaxSpikes = 5

Config.HandCuffItem = 'handcuffs'

Config.LicenseRank = 0

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Locations = {
    ["duty"] = {
        [1] = vector3(373.06, -1593.58, 30.05),
        [2] = vector3(-449.26, 6012.62, 31.72),
    },
    ["vehicle"] = {
        [1] = vector4(384.93, -1634.16, 29.29, 322.2),
        [2] = vector4(-455.39, 6002.02, 31.34, 87.93),
    },
    ["stash"] = {
        [1] = vector3(383.97, -1598.07, 30.05),
    },
    ["impound"] = {
        [1] = vector4(401.22, -1648.05, 28.66, 320.8),
        [2] = vector4(-436.14, 5982.63, 31.34, 136.0),
    },
    ["helicopter"] = {
        [1] = vector4(408.65, -1639.77, 29.68, 319.79),
        [2] = vector4(-475.43, 5988.353, 31.716, 31.34),
    },
    ["armory"] = {
        [1] = vector3(364.57, -1604.09, 25.45),
    },
    ["trash"] = {
        [1] = vector3(361.69, -1602.16, 30.05),
    },
    ["fingerprint"] = {
        [1] = vector3(368.72, -1591.61, 25.45),
    },
    ["evidence"] = {
        [1] = vector3(379.53, -1610.07, 30.2),
        [2] = vector3(381.54, -1607.3, 30.2),
        [3] = vector3(455.1456, -985.462, 30.689),
    },
    ["stations"] = {
        [1] = {label = "Police Station", coords = vector4(374.76, -1597.24, 30.05, 299.83)},
        --[2] = {label = "Prison", coords = vector4(1845.903, 2585.873, 45.672, 272.249)},
        [3] = {label = "Police Station Paleto", coords = vector4(-451.55, 6014.25, 31.716, 223.81)},
    },
}

Config.ArmoryWhitelist = {}

Config.PoliceHelicopter = "polmav"

Config.SecurityCameras = {
    hideradar = false,
    cameras = {
        [1] = {label = "Pacific Bank CAM#1", coords = vector3(257.45, 210.07, 109.08), r = {x = -25.0, y = 0.0, z = 28.05}, canRotate = false, isOnline = true},
        [2] = {label = "Pacific Bank CAM#2", coords = vector3(232.86, 221.46, 107.83), r = {x = -25.0, y = 0.0, z = -140.91}, canRotate = false, isOnline = true},
        [3] = {label = "Pacific Bank CAM#3", coords = vector3(252.27, 225.52, 103.99), r = {x = -35.0, y = 0.0, z = -74.87}, canRotate = false, isOnline = true},
        [4] = {label = "Limited Ltd Grove St. CAM#1", coords = vector3(-53.1433, -1746.714, 31.546), r = {x = -35.0, y = 0.0, z = -168.9182}, canRotate = false, isOnline = true},
        [5] = {label = "Rob's Liqour Prosperity St. CAM#1", coords = vector3(-1482.9, -380.463, 42.363), r = {x = -35.0, y = 0.0, z = 79.53281}, canRotate = false, isOnline = true},
        [6] = {label = "Rob's Liqour San Andreas Ave. CAM#1", coords = vector3(-1224.874, -911.094, 14.401), r = {x = -35.0, y = 0.0, z = -6.778894}, canRotate = false, isOnline = true},
        [7] = {label = "Limited Ltd Ginger St. CAM#1", coords = vector3(-718.153, -909.211, 21.49), r = {x = -35.0, y = 0.0, z = -137.1431}, canRotate = false, isOnline = true},
        [8] = {label = "24/7 Supermarkt Innocence Blvd. CAM#1", coords = vector3(23.885, -1342.441, 31.672), r = {x = -35.0, y = 0.0, z = -142.9191}, canRotate = false, isOnline = true},
        [9] = {label = "Rob's Liqour El Rancho Blvd. CAM#1", coords = vector3(1133.024, -978.712, 48.515), r = {x = -35.0, y = 0.0, z = -137.302}, canRotate = false, isOnline = true},
        [10] = {label = "Limited Ltd West Mirror Drive CAM#1", coords = vector3(1151.93, -320.389, 71.33), r = {x = -35.0, y = 0.0, z = -119.4468}, canRotate = false, isOnline = true},
        [11] = {label = "24/7 Supermarkt Clinton Ave CAM#1", coords = vector3(383.402, 328.915, 105.541), r = {x = -35.0, y = 0.0, z = 118.585}, canRotate = false, isOnline = true},
        [12] = {label = "Limited Ltd Banham Canyon Dr CAM#1", coords = vector3(-1832.057, 789.389, 140.436), r = {x = -35.0, y = 0.0, z = -91.481}, canRotate = false, isOnline = true},
        [13] = {label = "Rob's Liqour Great Ocean Hwy CAM#1", coords = vector3(-2966.15, 387.067, 17.393), r = {x = -35.0, y = 0.0, z = 32.92229}, canRotate = false, isOnline = true},
        [14] = {label = "24/7 Supermarkt Ineseno Road CAM#1", coords = vector3(-3046.749, 592.491, 9.808), r = {x = -35.0, y = 0.0, z = -116.673}, canRotate = false, isOnline = true},
        [15] = {label = "24/7 Supermarkt Barbareno Rd. CAM#1", coords = vector3(-3246.489, 1010.408, 14.705), r = {x = -35.0, y = 0.0, z = -135.2151}, canRotate = false, isOnline = true},
        [16] = {label = "24/7 Supermarkt Route 68 CAM#1", coords = vector3(539.773, 2664.904, 44.056), r = {x = -35.0, y = 0.0, z = -42.947}, canRotate = false, isOnline = true},
        [17] = {label = "Rob's Liqour Route 68 CAM#1", coords = vector3(1169.855, 2711.493, 40.432), r = {x = -35.0, y = 0.0, z = 127.17}, canRotate = false, isOnline = true},
        [18] = {label = "24/7 Supermarkt Senora Fwy CAM#1", coords = vector3(2673.579, 3281.265, 57.541), r = {x = -35.0, y = 0.0, z = -80.242}, canRotate = false, isOnline = true},
        [19] = {label = "24/7 Supermarkt Alhambra Dr. CAM#1", coords = vector3(1966.24, 3749.545, 34.143), r = {x = -35.0, y = 0.0, z = 163.065}, canRotate = false, isOnline = true},
        [20] = {label = "24/7 Supermarkt Senora Fwy CAM#2", coords = vector3(1729.522, 6419.87, 37.262), r = {x = -35.0, y = 0.0, z = -160.089}, canRotate = false, isOnline = true},
        [21] = {label = "Fleeca Bank Hawick Ave CAM#1", coords = vector3(309.341, -281.439, 55.88), r = {x = -35.0, y = 0.0, z = -146.1595}, canRotate = false, isOnline = true},
        [22] = {label = "Fleeca Bank Legion Square CAM#1", coords = vector3(144.871, -1043.044, 31.017), r = {x = -35.0, y = 0.0, z = -143.9796}, canRotate = false, isOnline = true},
        [23] = {label = "Fleeca Bank Hawick Ave CAM#2", coords = vector3(-355.7643, -52.506, 50.746), r = {x = -35.0, y = 0.0, z = -143.8711}, canRotate = false, isOnline = true},
        [24] = {label = "Fleeca Bank Del Perro Blvd CAM#1", coords = vector3(-1214.226, -335.86, 39.515), r = {x = -35.0, y = 0.0, z = -97.862}, canRotate = false, isOnline = true},
        [25] = {label = "Fleeca Bank Great Ocean Hwy CAM#1", coords = vector3(-2958.885, 478.983, 17.406), r = {x = -35.0, y = 0.0, z = -34.69595}, canRotate = false, isOnline = true},
        [26] = {label = "Paleto Bank CAM#1", coords = vector3(-102.939, 6467.668, 33.424), r = {x = -35.0, y = 0.0, z = 24.66}, canRotate = false, isOnline = true},
        [27] = {label = "Del Vecchio Liquor Paleto Bay", coords = vector3(-163.75, 6323.45, 33.424), r = {x = -35.0, y = 0.0, z = 260.00}, canRotate = false, isOnline = true},
        [28] = {label = "Don's Country Store Paleto Bay CAM#1", coords = vector3(166.42, 6634.4, 33.69), r = {x = -35.0, y = 0.0, z = 32.00}, canRotate = false, isOnline = true},
        [29] = {label = "Don's Country Store Paleto Bay CAM#2", coords = vector3(163.74, 6644.34, 33.69), r = {x = -35.0, y = 0.0, z = 168.00}, canRotate = false, isOnline = true},
        [30] = {label = "Don's Country Store Paleto Bay CAM#3", coords = vector3(169.54, 6640.89, 33.69), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = false, isOnline = true},
        [31] = {label = "Vangelico Jewelery CAM#1", coords = vector3(-627.54, -239.74, 40.33), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [32] = {label = "Vangelico Jewelery CAM#2", coords = vector3(-627.51, -229.51, 40.24), r = {x = -35.0, y = 0.0, z = -95.78}, canRotate = true, isOnline = true},
        [33] = {label = "Vangelico Jewelery CAM#3", coords = vector3(-620.3, -224.31, 40.23), r = {x = -35.0, y = 0.0, z = 165.78}, canRotate = true, isOnline = true},
        [34] = {label = "Vangelico Jewelery CAM#4", coords = vector3(-622.57, -236.3, 40.31), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},
        [35] = {label = "ERP Custom CAM#1", coords = vector3(-324.68, -151.95, 41.79), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},        
        [36] = {label = "ERP Custom CAM#2", coords = vector3(-308.52, -102.28, 40.81), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},        
        [37] = {label = "ERP Custom CAM#3", coords = vector3(-370.25, -79.22, 41.45), r = {x = -35.0, y = 0.0, z = 5.78}, canRotate = true, isOnline = true},        

    },
}

Config.AuthorizedVehicles = {
	-- Grade 0
	[0] = {
		["pbike"] = "Bicycle",
	},
	-- Grade 1
	[1] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
    },
	-- Grade 2
	[2] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
        ["yampolice"] = "Yamaha",
    },
	-- Grade 3
	[3] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",   
        ["yampolice"] = "Yamaha", 
        ["scoutpol"] = "Vapid Scout Police 2012",

    },
	-- Grade 4
	[4] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
        ["yampolice"] = "Yamaha", 
        ["scoutpol"] = "Vapid Scout Police 2012",
        ["c8cop"] = "2020 Chevrolet Corvette C8 [SPEED UNIT]",
    },
    -- Grade 5
    [5] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
        ["yampolice"] = "Yamaha",
        ["rfw_ninja"] = "Kawasaki Ninja",
        ["scoutpol"] = "Vapid Scout Police 2012",
        ["c8cop"] = "2020 Chevrolet Corvette C8 [SPEED UNIT]",
    },
    -- Grade 6
    [6] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
        ["yampolice"] = "Yamaha",
        ["rfw_ninja"] = "Kawasaki Ninja",
        ["scoutpol"] = "Vapid Scout Police 2012",
        ["c8cop"] = "2020 Chevrolet Corvette C8 [SPEED UNIT]",
        ["lp770cop"] = "Lamborghini Centenario LP770 [SPEED UNIT 2]",
    },
    -- Grade 7
    [7] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
        ["yampolice"] = "Yamaha",
        ["rfw_ninja"] = "Kawasaki Ninja",
        ["scoutpol"] = "Vapid Scout Police 2012",
        ["c8cop"] = "2020 Chevrolet Corvette C8 [SPEED UNIT]",
        ["lp770cop"] = "Lamborghini Centenario LP770 [SPEED UNIT 2]",

    },
    -- Grade 8
    [8] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
        ["yampolice"] = "Yamaha",
        ["rfw_ninja"] = "Kawasaki Ninja",
        ["scoutpol"] = "Vapid Scout Police 2012",
        ["c8cop"] = "2020 Chevrolet Corvette C8 [SPEED UNIT]",
        ["lp770cop"] = "Lamborghini Centenario LP770 [SPEED UNIT 2]",
        ["ghispo2"] = "Maserati Ghibli [SPEED UNIT 3]",

    },
    -- Grade 9
    [9] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
        ["yampolice"] = "Yamaha",
        ["rfw_ninja"] = "Kawasaki Ninja",
        ["scoutpol"] = "Vapid Scout Police 2012",
        ["c8cop"] = "2020 Chevrolet Corvette C8 [SPEED UNIT]",
        ["lp770cop"] = "Lamborghini Centenario LP770 [SPEED UNIT 2]",
        ["ghispo2"] = "Maserati Ghibli [SPEED UNIT 3]",

    },
    -- Grade 10
    [10] = {
        ["pbike"] = "Bicycle",
        ["pbus"] = "pbus",
        ["yampolice"] = "Yamaha",
        ["rfw_ninja"] = "Kawasaki Ninja",
        ["scoutpol"] = "Vapid Scout Police 2012",
        ["c8cop"] = "2020 Chevrolet Corvette C8 [SPEED UNIT]",
        ["lp770cop"] = "Lamborghini Centenario LP770 [SPEED UNIT 2]",
        ["ghispo2"] = "Maserati Ghibli [SPEED UNIT 3]",

    },
}

Config.WhitelistedVehicles = {}

Config.AmmoLabels = {
    ["AMMO_PISTOL"] = "9x19mm parabellum bullet",
    ["AMMO_SMG"] = "9x19mm parabellum bullet",
    ["AMMO_RIFLE"] = "7.62x39mm bullet",
    ["AMMO_MG"] = "7.92x57mm mauser bullet",
    ["AMMO_SHOTGUN"] = "12-gauge bullet",
    ["AMMO_SNIPER"] = "Large caliber bullet",
}

Config.Radars = {
	vector4(-623.44421386719, -823.08361816406, 25.25704574585, 145.0),
	vector4(-652.44421386719, -854.08361816406, 24.55704574585, 325.0),
	vector4(1623.0114746094, 1068.9924316406, 80.903594970703, 84.0),
	vector4(-2604.8994140625, 2996.3391113281, 27.528566360474, 175.0),
	vector4(2136.65234375, -591.81469726563, 94.272926330566, 318.0),
	vector4(2117.5764160156, -558.51013183594, 95.683128356934, 158.0),
	vector4(406.89505004883, -969.06286621094, 29.436267852783, 33.0),
	vector4(657.315, -218.819, 44.06, 320.0),
	vector4(2118.287, 6040.027, 50.928, 172.0),
	vector4(-106.304, -1127.5530, 30.778, 230.0),
	vector4(-823.3688, -1146.980, 8.0, 300.0),
}

Config.CarItems = {
    [1] = {
        name = "empty_evidence_bag",
        amount = 10,
        info = {},
        type = "item",
        slot = 1,
    },
}

Config.Items = {
    label = "Police Armory",
    slots = 18,
    items = {
        [1] = {
            name = "weapon_stungun",
            price = 0,
            amount = 1,
            info = {
                serie = "",
            },
            type = "weapon",
            slot = 3,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [2] = {
            name = "weapon_pistol_mk2",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_PI_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 2,
            authorizedJobGrades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [3] = {
            name = "weapon_pumpshotgun_mk2",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 4,
            authorizedJobGrades = {6, 7, 8, 9, 10}
        },
        [4] = {
            name = "weapon_smg_mk2",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO_02", label = "1x Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 5,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10}
        },
        [5] = {
            name = "weapon_carbinerifle_mk2",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                    {component = "COMPONENT_AT_SCOPE_MEDIUM", label = "3x Scope"},
                }
            },
            type = "weapon",
            slot = 6,
            authorizedJobGrades = {5, 6, 7, 8, 9, 10}
        },
        [6] = {
            name = "weapon_nightstick",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 7,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [7] = {
            name = "pistol_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 8,
            authorizedJobGrades = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [8] = {
            name = "smg_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 9,
            authorizedJobGrades = {3, 4, 5, 6, 7, 8, 9, 10}
        },
        [9] = {
            name = "shotgun_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 10,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10}
        },
        [10] = {
            name = "rifle_ammo",
            price = 0,
            amount = 5,
            info = {},
            type = "item",
            slot = 11,
            authorizedJobGrades = {4, 5, 6, 7, 8, 9, 10}
        },
        [11] = {
            name = "handcuffs",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [12] = {
            name = "weapon_flashlight",
            price = 0,
            amount = 1,
            info = {},
            type = "weapon",
            slot = 13,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [13] = {
            name = "empty_evidence_bag",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 14,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [14] = {
            name = "police_stormram",
            price = 0,
            amount = 50,
            info = {},
            type = "item",
            slot = 15,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [15] = {
            name = "radio",
            price = 0,
            amount = 1,
            info = {},
            type = "item",
            slot = 16,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [16] = {
            name = "heavyarmor",
            price = 0,
            amount = 20,
            info = {},
            type = "item",
            slot = 17,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [17] = {
            name = "bodycam",
            price = 1999,
            amount = 5,
            info = {},
            type = "item",
            slot = 18,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [18] = {
            name = "weapon_revolver_mk2",
            price = 0,
            amount = 1,
            info = {
                serie = "",
                attachments = {
                    {component = "COMPONENT_AT_SCOPE_MACRO_02", label = "1x Scope"},
                    {component = "COMPONENT_AT_AR_FLSH", label = "Flashlight"},
                }
            },
            type = "weapon",
            slot = 19,
            authorizedJobGrades = {8, 9, 10}
        }, 
        [19] = {
            name = "diving_gear",
            price = 1999,
            amount = 1,
            info = {},
            type = "item",
            slot = 20,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },
        [20] = {
            name = "ifaks",
            price = 100,
            amount = 10,
            info = {},
            type = "item",
            slot = 21,
            authorizedJobGrades = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
        },

    }
}

Config.VehicleSettings = {
    ["pbike"] = { --- Model name
        ["extras"] = {
            ["1"] = true, -- on/off
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
            ["13"] = true,
        }
    },
    ["rfw_ninja"] = { --- Model name
    ["extras"] = {
        ["1"] = true, -- on/off
        ["2"] = true,
        ["3"] = true,
        ["4"] = true,
        ["5"] = true,
        ["6"] = true,
        ["7"] = true,
        ["8"] = true,
        ["9"] = true,
        ["10"] = true,
        ["11"] = true,
        ["12"] = true,
        ["13"] = true,
    }
},
["yampolice"] = { --- Model name
["extras"] = {
    ["1"] = true, -- on/off
    ["2"] = true,
    ["3"] = true,
    ["4"] = true,
    ["5"] = true,
    ["6"] = true,
    ["7"] = true,
    ["8"] = true,
    ["9"] = true,
    ["10"] = true,
    ["11"] = true,
    ["12"] = true,
    ["13"] = true,
}
},

["scoutpol"] = { --- Model name
["extras"] = {
    ["1"] = true, -- on/off
    ["2"] = true,
    ["3"] = true,
    ["4"] = true,
    ["5"] = true,
    ["6"] = true,
    ["7"] = true,
    ["8"] = true,
    ["9"] = true,
    ["10"] = true,
    ["11"] = true,
    ["12"] = true,
    ["13"] = true,
}
},
["c8cop"] = { --- Model name
["extras"] = {
    ["1"] = true, -- on/off
    ["2"] = true,
    ["3"] = true,
    ["4"] = true,
    ["5"] = true,
    ["6"] = true,
    ["7"] = true,
    ["8"] = true,
    ["9"] = true,
    ["10"] = true,
    ["11"] = true,
    ["12"] = true,
    ["13"] = true,
}
},
["lp770cop"] = { --- Model name
["extras"] = {
    ["1"] = true, -- on/off
    ["2"] = true,
    ["3"] = true,
    ["4"] = true,
    ["5"] = true,
    ["6"] = true,
    ["7"] = true,
    ["8"] = true,
    ["9"] = true,
    ["10"] = true,
    ["11"] = true,
    ["12"] = true,
    ["13"] = true,
}
},
["ghispo2"] = { --- Model name
["extras"] = {
    ["1"] = true, -- on/off
    ["2"] = true,
    ["3"] = true,
    ["4"] = true,
    ["5"] = true,
    ["6"] = true,
    ["7"] = true,
    ["8"] = true,
    ["9"] = true,
    ["10"] = true,
    ["11"] = true,
    ["12"] = true,
    ["13"] = true,
}
},
    ["pbus"] = {
        ["extras"] = {
            ["1"] = true,
            ["2"] = true,
            ["3"] = true,
            ["4"] = true,
            ["5"] = true,
            ["6"] = true,
            ["7"] = true,
            ["8"] = true,
            ["9"] = true,
            ["10"] = true,
            ["11"] = true,
            ["12"] = true,
            ["13"] = true,
        }
    }
}


