Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)
Config.CopsChance = 0.0 -- The chance of the cops getting called when a coral gets picked up, this ranges from 0.0 to 1.0

Config.CoralLocations = {
    [1] = {
        label = "This is Location 1",
        coords = {
            Area = vector3(-2838.8, -376.1, 3.55),
            Coral = {
                [1] = {
                    coords = vector3(-2849.25, -377.58, -40.23),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [2] = {
                    coords = vector3(-2838.43, -363.63, -39.45),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [3] = {
                    coords = vector3(-2887.04, -394.87, -40.91),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [4] = {
                    coords = vector3(-2808.99, -385.56, -39.32),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 10,
        TotalCoral = 16,
    },
    [2] = {
        label = "Location 2",
        coords = {
            Area = vector3(-3288.2, -67.58, 2.79),
            Coral = {
                [1] = {
                    coords = vector3(-3275.03, -38.58, -19.21),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [2] = {
                    coords = vector3(-3273.73, -76.0, -26.81),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [3] = {
                    coords = vector3(-3346.53, -50.4, -35.84),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 10,
        TotalCoral = 16,
    },
    [3] = {
        label = "Location 3",
        coords = {
            Area = vector3(-3367.24, 1617.89, 1.39),
            Coral = {
                [1] = {
                    coords = vector3(-3388.01, 1635.88, -39.41),
                    length = 6,
                    width = 6,
                    heading = 100.0,
                    PickedUp = false
                },
                [2] = {
                    coords = vector3(-3354.19, 1549.3, -38.21),
                    length = 6,
                    width = 6,
                    heading = 100.0,
                    PickedUp = false
                },
                [3] = {
                    coords = vector3(-3326.04, 1636.43, -40.98),
                    length = 6,
                    width = 6,
                    heading = 100.0,
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 10,
        TotalCoral = 16,
    },
    [4] = {
        label = "Location 4",
        coords = {
            Area = vector3(3002.5, -1538.28, -27.36),
            Coral = {
                [1] = {
                    coords = vector3(2978.05, -1509.07, -24.96),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [2] = {
                    coords = vector3(3004.42, -1576.95, -29.36),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [3] = {
                    coords = vector3(2951.65, -1560.69, -28.36),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 10,
        TotalCoral = 16,
    },
    [5] = {
        label = "Location 5",
        coords = {
            Area = vector3(3421.58, 1975.68, 0.86),
            Coral = {
                [1] = {
                    coords = vector3(3421.69, 1976.54, -50.64),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [2] = {
                    coords = vector3(3424.07, 1957.46, -53.04),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [3] = {
                    coords = vector3(3434.65, 1993.73, -49.84),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [4] = {
                    coords = vector3(3415.42, 1965.25, -52.04),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 10,
        TotalCoral = 16,
    },
    [6] = {
        label = "Location 6",
        coords = {
            Area = vector3(2720.14, -2136.28, 0.74),
            Coral = {
                [1] = {
                    coords = vector3(2724.0, -2134.95, -19.33),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [2] = {
                    coords = vector3(2710.68, -2156.06, -18.63),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [3] = {
                    coords = vector3(2702.84, -2139.29, -18.51),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [4] = {
                    coords = vector3(2736.27, -2153.91, -20.88),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 10,
        TotalCoral = 16,
    },
    [7] = {
        label = "Location 7",
        coords = {
            Area = vector3(536.69, 7253.75, 1.69),
            Coral = {
                [1] = {
                    coords = vector3(542.31, 7245.37, -30.01),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [2] = {
                    coords = vector3(528.21, 7223.26, -29.51),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [3] = {
                    coords = vector3(510.36, 7254.97, -32.11),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
                [4] = {
                    coords = vector3(525.37, 7259.12, -30.51),
                    length = 3,
                    width = 3,
                    heading = 100.0,
                    PickedUp = false
                },
            }
        },
        DefaultCoral = 10,
        TotalCoral = 16,
    },
}

Config.CoralTypes = {
    [1] = {
        item = "dendrogyra_coral",
        maxAmount = math.random(1, 5),
        price = math.random(3500, 7000),
    },
    [2] = {
        item = "antipatharia_coral",
        maxAmount = math.random(2, 7),
        price = math.random(1500, 3000),
    }
}

Config.PriceModifiers = {
    [1] = {
        minAmount = 1000,
        maxAmount = 12000,
        minPercentage = 80,
        maxPercentage = 85
    },
    [2] = {
        minAmount = 1700,
        maxAmount = 2000,
        minPercentage = 70,
        maxPercentage = 75
    },
    [3] = {
        minAmount = 2900,
        minPercentage = 6000,
        maxPercentage = 55
    }
}

Config.SellLocations = {
    [1] = {
        coords = vector4(-1684.13, -1068.91, 13.15, 100.0),
        model = 'a_m_m_salton_01',
        zoneOptions = { -- Only used when not using the target
            length = 6,
            width = 6
        }
    }
}
