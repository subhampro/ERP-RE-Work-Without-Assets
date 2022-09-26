Config = {}
Config.UseTarget = true

Config.SellCasinoChips = {
    coords = vector4(950.37, 34.72, 71.87, 33.82),
    radius = 1.5,
    ped = 's_m_y_casino_01'
}

Config.Products = {
    ["normal"] = {
        [1] = {
            name = "snicker",
            price = 15,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "water_bottle",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cola",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "sandwich",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "burger",
            price = 35,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "tosti",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "lighter",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 7,
        },
    },
    
    ["liquor"] = {
        [1] = {
            name = "beer",
            price = 180,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "whiskey",
            price = 150,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "vodka",
            price = 200,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
    },
    
    ["hardware"] = {
        [1] = {
            name = "weapon_hammer",
            price = 350,
            amount = 100,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "harness",
            price = 1000,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "advancedrepairkit",
            price = 2000,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "parachute",
            price = 1200,
            amount = 100,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "drugscales",
            price = 1500,
            amount = 100,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "screwdriver",
            price = 500,
            amount = 100,
            info = {},
            type = "item",
            slot = 7,
        },
        [8] = {
            name = "firework1",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 8,
        },
        [9] = {
            name = "firework2",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 9,
        },
        [10] = {
            name = "firework3",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "firework4",
            price = 50,
            amount = 100,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "fishingrod",
            price = 2000,
            amount = 500,
            info = {},
            type = "item",
            slot = 12,
        },
        [13] = {
            name = "fishingbait",
            price = 20,
            amount = 100000,
            info = {},
            type = "item",
            slot = 13,
        },
        [14] = {
            name = "heavy_drillbit",
            price = 1000,
            amount = 100,
            info = {},
            type = "item",
            slot = 14,
        },
    },

    ["weapons"] = {
        [1] = {
            name = "weapon_switchblade",
            price = 2000,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_bat",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_knuckle",
            price = 1250,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_stungun",
            price = 3000,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "taser_cardridge",
            price = 150,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
        -- [5] = {
        --     name = "weapon_pistol",
        --     price = 5000,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 5,
        --     requiresLicense = true
        -- },
        -- [6] = {
        --     name = "weapon_snspistol",
        --     price = 10000,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 6,
        --     requiresLicense = true
        -- },
        -- [7] = {
        --     name = "pistol_ammo",
        --     price = 350,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 7,
        --     requiresLicense = true
        -- },
    },
    
    -- ["weedshop"] = {
    --     [1] = {
    --         name = "weapon_poolcue",
    --         price = 100,
    --         amount = 50,
    --         info = {},
    --         type = "item",
    --         slot = 1,
    --     },
    --     [2] = {
    --         name = "weed_nutrition",
    --         price = 20,
    --         amount = 500,
    --         info = {},
    --         type = "item",
    --         slot = 2,
    --     },
    --     [3] = {
    --         name = "empty_weed_bag",
    --         price = 80,
    --         amount = 500,
    --         info = {},
    --         type = "item",
    --         slot = 3,
    --     },
    --     [4] = {
    --         name = "empty_coke_bag",
    --         price = 500,
    --         amount = 0,
    --         info = {},
    --         type = "item",
    --         slot = 4,
    --     },
    --     [5] = {
    --         name = "rolling_paper",
    --         price = 40,
    --         amount = 0,
    --         info = {},
    --         type = "item",
    --         slot = 5,
    --     },
    --     [6] = {
    --         name = "lighter",
    --         price = 20,
    --         amount = 50,
    --         info = {},
    --         type = "item",
    --         slot = 5,
    --     },
    -- },

    ["gearshop"] = {
        [1] = {
            name = "diving_gear",
            price = 1500,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "diving_fill",
            price = 800,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "fishingrod",
            price = 2000,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "fishingbait",
            price = 20,
            amount = 100000,
            info = {},
            type = "item",
            slot = 4,
        },
    },
    
    ["leisureshop"] = {
        [1] = {
            name = "parachute",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "binoculars",
            price = 50,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "diving_gear",
            price = 2500,
            amount = 10,
            info = {},
            type = "item",
            slot = 3,
        },
        -- [4] = {
        --     name = "smoketrailred",
        --     price = 250,
        --     amount = 50,
        --     info = {},
        --     type = "item",
        --     slot = 4,
        -- },
    },

    ["beanmachine"] = {
        [1] = {
            name = "coffee",
            price = 120,
            amount = 200,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "cola",
            price = 25,
            amount = 200,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "water_bottle",
            price = 20,
            amount = 200,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "tosti",
            price = 20,
            amount = 200,
            info = {},
            type = "item",
            slot = 4,
        },
    },

    ["mechanicshop"] = {
        [1] = {
            name = "repairkit",
            price = 200,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
            requiredJob = {"mechanic"}
        },
        [2] = {
            name = "advancedrepairkit",
            price = 400,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
            requiredJob = {"mechanic"}
        },
        [3] = {
            name = "cleaningkit",
            price = 5,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
            requiredJob = {"mechanic"}
        },
        [4] = {
            name = "rgb_controller",
            price = 12000,
            amount = 500,
            info = {},
            type = "item",
            slot = 4,
            requiredJob = {"mechanic"}
        },
        [5] = {
            name = "nitrous",
            price = 17000,
            amount = 500,
            info = {},
            type = "item",
            slot = 5,
            requiredJob = {"mechanic"}
        },
        [6] = {
            name = "carmp",
            price = 2000,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
            requiredJob = {"mechanic"} 
        },
    },

    ["pharmacy"] = {
        [1] = {
            name = "bandage",
            price = 40,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "painkillers",
            price = 100,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "heparin",
            price = 105,
            amount = 300,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "walkstick",
            price = 500,
            amount = 500,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "durex_condom",
            price = 100,
            amount = 500,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "potassium_nitrate",
            price = 700,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "carbon_charcol",
            price = 500,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
        },
    },

    ["pharmacy2"] = {
        [1] = {
            name = "bandage",
            price = 40,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "painkillers",
            price = 100,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "heparin",
            price = 150,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
    },

    ["pharmacy3"] = {
        [1] = {
            name = "bandage",
            price = 15,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "painkillers",
            price = 50,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "heparin",
            price = 75,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
    },

    ["emscanteen"] = {
        [1] = {
            name = "water_bottle",
            price = 10,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
            requiredJob = {"ambulance"}
        },
        [2] = {
            name = "sandwich",
            price = 10,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
            requiredJob = {"ambulance"}
        },
    },

    ["pdcanteen"] = {
        [1] = {
            name = "water_bottle",
            price = 10,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
             requiredJob = {"police"}
        },
        [2] = {
            name = "sandwich",
            price = 10,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
             requiredJob = {"police"}
        },
    },

    ["petshop"] = {
        [1] = {
            name = "keepcompanionwesty",
            price = 60000,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "keepcompanionshepherd",
            price = 40000,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        
        },
        [3] = {
            name = "keepcompanionretriever",
            price = 34000,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
       
        },
        [4] = {
            name = "keepcompanionrottweiler",
            price = 25000,
            amount = 250,
            info = {},
            type = "item",
            slot = 4,
      
        },
        [5] = {
            name = "keepcompanionpug",
            price = 45000,
            amount = 250,
            info = {},
            type = "item",
            slot = 5,
      
        },
        [6] = {
            name = "keepcompanionpoodle",
            price = 75000,
            amount = 250,
            info = {},
            type = "item",
            slot = 6,
      
        },
        [7] = {
            name = "keepcompanionmtlion2",
            price = 300000,
            amount = 250,
            info = {},
            type = "item",
            slot = 7,
      
        },
        [8] = {
            name = "keepcompanioncat",
            price = 20000,
            amount = 250,
            info = {},
            type = "item",
            slot = 8,
      
        },
        [9] = {
            name = "keepcompanionmtlion",
            price = 450000,
            amount = 250,
            info = {},
            type = "item",
            slot = 9,
      
        },
        [10] = {
            name = "keepcompanionhusky",
            price = 25000,
            amount = 250,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "keepcompanionrabbit",
            price = 35000,
            amount = 250,
            info = {},
            type = "item",
            slot = 11,
        
        },
        [12] = {
            name = "keepcompanionhen",
            price = 5000,
            amount = 250,
            info = {},
            type = "item",
            slot = 12,
       
        },
        [13] = {
            name = "keepcompanioncoyote",
            price = 8000,
            amount = 250,
            info = {},
            type = "item",
            slot = 13,
      
        },
        [14] = {
            name = "petfood",
            price = 500,
            amount = 250,
            info = {},
            type = "item",
            slot = 14,
      
        },
        [15] = {
            name = "collarpet",
            price = 45000,
            amount = 250,
            info = {},
            type = "item",
            slot = 15,
      
        },
        [16] = {
            name = "petnametag",
            price = 8000,
            amount = 250,
            info = {},
            type = "item",
            slot = 16,
      
        },
        [17] = {
            name = "firstaidforpet",
            price = 3500,
            amount = 250,
            info = {},
            type = "item",
            slot = 17,
      
        },
        [18] = {
            name = "petwaterbottleportable",
            price = 5000,
            amount = 250,
            info = {},
            type = "item",
            slot = 18,
      
        },
        [19] = {
            name = "petgroomingkit",
            price = 5000,
            amount = 250,
            info = {},
            type = "item",
            slot = 19,
        },
    },

    ["croma"] = {
        [1] = {
            name = "phone",
            price = 1000,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "radio",
            price = 1500,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "boombox",
            price = 1000,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "battery",
            price = 5000,
            amount = 500,
            info = {},
            type = "item",
            slot = 4,
      
        },
        [5] = {
            name = "screen",
            price = 10000,
            amount = 500,
            info = {},
            type = "item",
            slot = 5,
      
        },
        [6] = {
            name = "graphiccard",
            price = 50000,
            amount = 500,
            info = {},
            type = "item",
            slot = 6,
      
        },
        [7] = {
            name = "harddrive",
            price = 10000,
            amount = 500,
            info = {},
            type = "item",
            slot = 7,
      
        },
        [8] = {
            name = "i9_processor",
            price = 40000,
            amount = 500,
            info = {},
            type = "item",
            slot = 8,
      
        },
        [9] = {
            name = "wireless_card",
            price = 15000,
            amount = 500,
            info = {},
            type = "item",
            slot = 9,
      
        },
        [10] = {
            name = "fitbit",
            price = 500,
            amount = 500,
            info = {},
            type = "item",
            slot = 10,
      
        },
    },

    ["digitalden"] = {
        [1] = {
            name = "phone",
            price = 1000,
            amount = 500,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "radio",
            price = 1500,
            amount = 500,
            info = {},
            type = "item",
            slot = 2,
        
        },
        [3] = {
            name = "fitbit",
            price = 500,
            amount = 500,
            info = {},
            type = "item",
            slot = 3,
       
        },
    },

    ["hunting"] = {
        [1] = {
            name = "weapon_knife",
            price = 500,
            amount = 250,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "weapon_sniperrifle",
            price = 5000,
            amount = 250,
            info = {},
            type = "item",
            slot = 2,
        
        },
        [3] = {
            name = "snp_ammo",
            price = 500,
            amount = 250,
            info = {},
            type = "item",
            slot = 3,
       
        },
        [4] = {
            name = "bandage",
            price = 40,
            amount = 250,
            info = {},
            type = "item",
            slot = 4,
      
        },
       
    },

    ["casino"] = {
        [1] = {
            name = 'casinochips',
            price = 1,
            amount = 999999,
            info = {},
            type = 'item',
            slot = 1,
        }
    },
}

Config.Locations = {
    -- 24/7 Locations
    ["247supermarket"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(24.51, -1348.76, 29.5, 358.33),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket2"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(-3037.54, 585.0, 7.91, 103.13),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket3"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(-3240.77, 999.87, 12.83, 85.59),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket4"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(1727.26, 6413.83, 35.04, 335.81),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket5"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(1960.94, 3738.74, 32.34, 29.97),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket6"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(548.75, 2672.4, 42.16, 185.76),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket7"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(2679.41, 3278.79, 55.25, 58.81),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket8"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(2558.68, 380.88, 108.63, 88.66),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket9"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(372.2, 324.97, 103.57, 350.12),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket10"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(-548.99, -582.98, 34.68, 188.8),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = false,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["247supermarket11"] = {
        ["label"] = "normal Stores",
        ["coords"] = vector4(159.54, 6640.46, 31.7, 317.11),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = false,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- LTD Gasoline Locations
    ["ltdgasoline"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(-47.02, -1758.23, 29.42, 45.05),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["ltdgasoline2"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(-706.06, -913.97, 19.22, 88.04),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["ltdgasoline3"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(-1820.02, 794.03, 138.09, 135.45),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["ltdgasoline4"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(1164.71, -322.94, 69.21, 101.72),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["ltdgasoline5"] = {
        ["label"] = "LTD Gasoline",
        ["coords"] = vector4(1697.87, 4922.96, 42.06, 324.71),
        ["ped"] = 'mp_m_shopkeep_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["normal"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- Rob's Liquor Locations
    ["robsliquor"] = {
        ["label"] = "Liqour Store",
        ["coords"] = vector4(-1221.58, -908.15, 12.33, 35.49),
        ["ped"] = 's_m_m_lifeinvad_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor2"] = {
        ["label"] = "Liqour Store",
        ["coords"] = vector4(-1486.59, -377.68, 40.16, 139.51),
        ["ped"] = 's_m_m_lifeinvad_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = false,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor3"] = {
        ["label"] = "Liqour Store",
        ["coords"] = vector4(-2966.39, 391.42, 15.04, 87.48),
        ["ped"] = 's_m_m_lifeinvad_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor4"] = {
        ["label"] = "Liqour Store",
        ["coords"] = vector4(1165.17, 2710.88, 38.16, 179.43),
        ["ped"] = 's_m_m_lifeinvad_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor5"] = {
        ["label"] = "Liqour Store",
        ["coords"] = vector4(1134.2, -982.91, 46.42, 277.24),
        ["ped"] = 's_m_m_lifeinvad_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["robsliquor6"] = {
        ["label"] = "Liqour Store",
        ["coords"] = vector4(-160.6, 6320.91, 31.59, 314.86),
        ["ped"] = 's_m_m_lifeinvad_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-shopping-basket",
        ["targetLabel"] = "Open Shop",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = false,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- Hardware Store Locations
    ["hardware"] = {
        ["label"] = "Hardware Store",
        ["coords"] = vector4(-575.3, -584.28, 34.68, 276.72),
        ["ped"] = 'mp_m_waremech_01',
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-wrench",
        ["targetLabel"] = "Open Hardware Store",
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402,
        ["blipcolor"] = 0
    },

    ["hardware2"] = {
        ["label"] = "Hardware Store",
        ["coords"] = vector4(2747.71, 3472.85, 55.67, 255.08),
        ["ped"] = 'mp_m_waremech_01',
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-wrench",
        ["targetLabel"] = "Open Hardware Store",
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402,
        ["blipcolor"] = 0
    },

    ["hardware3"] = {
        ["label"] = "Hardware Store",
        ["coords"] = vector4(-421.83, 6136.13, 31.88, 228.2),
        ["ped"] = 'mp_m_waremech_01',
        ["scenario"] = "WORLD_HUMAN_CLIPBOARD",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-wrench",
        ["targetLabel"] = "Hardware Store",
        ["products"] = Config.Products["hardware"],
        ["showblip"] = true,
        ["blipsprite"] = 402,
        ["blipcolor"] = 0
    },

    -- Ammunation Locations
    ["ammunation"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(-659.11, -938.59, 21.83, 95.29),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = false,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation2"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(814.61, -2155.15, 29.62, 7.23),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation3"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(1697.28, 3758.05, 34.71, 140.66),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation4"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(-326.94, 6082.01, 31.45, 140.11),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation5"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(247.75, -51.68, 69.94, 346.18),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation6"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(17.32, -1107.73, 29.8, 168.17),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation7"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(2564.8, 297.84, 108.73, 280.29),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation8"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(-1113.03, 2697.86, 18.55, 141.08),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = false,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation9"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(841.19, -1029.88, 28.19, 276.93),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation10"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(-1309.55, -394.54, 36.7, 351.63),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = true,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation11"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(-3167.89, 1087.36, 20.84, 167.24),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = false,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },
    ["ammunation12"] = {
        ["label"] = "Ammunation",
        ["type"] = "weapon",
        ["coords"] = vector4(-544.9, -585.36, 34.68, 281.66),
        ["ped"] = 's_m_y_ammucity_01',
        ["scenario"] = "WORLD_HUMAN_COP_IDLES",
        ["radius"] = 2.5,
        ["targetIcon"] = "fas fa-gun",
        ["targetLabel"] = "Open Ammunation",
        ["products"] = Config.Products["weapons"],
        ["showblip"] = false,
        ["blipsprite"] = 110,
        ["blipcolor"] = 0
    },

    -- Casino Locations
    ["casino"] = {
        ["label"] = "Diamond Casino",
        ["coords"] = vector4(949.29, 32.13, 71.95, 79.54),
        ["ped"] = 'csb_tomcasino',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-coins",
        ["targetLabel"] = "Buy Chips",
        ["products"] = Config.Products["casino"],
        ["showblip"] = false,
        ["blipsprite"] = 617,
        ["blipcolor"] = 0
    },

    ["casinobar"] = {
        ["label"] = "Casino Bar",
        ["coords"] = vector4(937.45, 27.22, 71.83, 61.21),
        ["ped"] = 'a_m_y_smartcaspat_01',
        ["scenario"] = "WORLD_HUMAN_VALET",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-wine-bottle",
        ["targetLabel"] = "Open Casino Bar",
        ["products"] = Config.Products["liquor"],
        ["showblip"] = false,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- ["weedshop"] = {
    --     ["label"] = "White Widow",
    --     ["coords"] = vector4(188.0, -242.11, 54.07, 255.89),
    --     ["ped"] = 'mp_m_weed_01',
    --     ["scenario"] = "WORLD_HUMAN_SMOKING",
    --     ["radius"] = 2.5,
    --     ["targetIcon"] = "fa-solid fa-cannabis",
    --     ["targetLabel"] = "OPEN STORE",
    --     ["products"] = Config.Products["weedshop"],
    --     ["showblip"] = true,
    --     ["blipsprite"] = 496,
    --     ["blipcolor"] = 2
    -- },

    -- Sea Word Locations
    ["seaword"] = {
        ["label"] = "Sea World",
        ["coords"] = vector4(-1687.03, -1072.18, 13.15, 52.93),
        ["ped"] = 'a_m_y_beach_01',
        ["scenario"] = "WORLD_HUMAN_STAND_IMPATIENT",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-fish",
        ["targetLabel"] = "Sea Word",
        ["products"] = Config.Products["gearshop"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    -- Leisure Shop Locations
    ["leisureshop"] = {
        ["label"] = "Leisure Shop",
        ["coords"] = vector4(-1505.91, 1511.95, 115.29, 257.13),
        ["ped"] = 'a_m_y_beach_01',
        ["scenario"] = "WORLD_HUMAN_STAND_MOBILE_CLUBHOUSE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-leaf",
        ["targetLabel"] = "Open Leisure Shop",
        ["products"] = Config.Products["leisureshop"],
        ["showblip"] = true,
        ["blipsprite"] = 52,
        ["blipcolor"] = 0
    },

    ["beanmachine"] = {
        ["label"] = "Beanmachine",
        ["coords"] = vector4(121.33, -1041.11, 29.28, 71.83),
        ["ped"] = 'a_f_m_prolhost_01',
        ["scenario"] = "WORLD_HUMAN_BUM_FREEWAY",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-leaf",
        ["targetLabel"] = "Open Beanmachine",
        ["products"] = Config.Products["beanmachine"],
        ["showblip"] = true,
        ["blipsprite"] = 106,
        ["blipcolor"] = 31
    },

    ["mechanicshop"] = {
        ["label"] = "Mechanic Shop",
        ["coords"] = vector4(-309.39, -111.16, 39.02, 73.81),
        ["ped"] = 'mp_m_waremech_01',
        ["scenario"] = "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-wrench",
        ["targetLabel"] = "OPEN STORE",
        ["products"] = Config.Products["mechanicshop"],
        ["showblip"] = false,
        ["blipsprite"] = 273,
        ["blipcolor"] = 0
    },

    ["pharmacy"] = {
        ["label"] = "Pharmacy",
        ["coords"] = vector4(73.23, -814.73, 31.48, 341.15),
        ["ped"] = 'mp_f_execpa_01',
        ["scenario"] = "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-capsules",
        ["targetLabel"] = "OPEN STORE",
        ["products"] = Config.Products["pharmacy"],
        ["showblip"] = true,
        ["blipsprite"] = 51,
        ["blipcolor"] = 0
    },

    ["pharmacy2"] = {
        ["label"] = "Paleto Pharmacy",
        ["coords"] = vector4(-247.5, 6320.25, 32.43, 316.73),
        ["ped"] = 'mp_f_execpa_01',
        ["scenario"] = "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-capsules",
        ["targetLabel"] = "OPEN STORE",
        ["products"] = Config.Products["pharmacy2"],
        ["showblip"] = false,
        ["blipsprite"] = 51,
        ["blipcolor"] = 0
    },

    ["pharmacy3"] = {
        ["label"] = "Paleto Clinic",
        ["coords"] = vector4(2029.72, 4980.54, 42.1, 234.63),
        ["ped"] = 'mp_f_execpa_01',
        ["scenario"] = "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-capsules",
        ["targetLabel"] = "OPEN STORE",
        ["products"] = Config.Products["pharmacy2"],
        ["showblip"] = false,
        ["blipsprite"] = 51,
        ["blipcolor"] = 0
    },

    ["pharmacy4"] = {
        ["label"] = "Prison Clinic",
        ["coords"] = vector4(1769.86, 2571.81, 45.73, 131.91),
        ["ped"] = 'mp_f_execpa_01',
        ["scenario"] = "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-capsules",
        ["targetLabel"] = "OPEN STORE",
        ["products"] = Config.Products["pharmacy3"],
        ["showblip"] = false,
        ["blipsprite"] = 51,
        ["blipcolor"] = 0
    },

    --// EMS Canteen
    
    ["emscanteen"] = {
        ["label"] = "Ems Canteen",
        ["coords"] = vector4(310.42, -602.98, 43.28, 69.65),
        ["ped"] = 's_m_m_paramedic_01',
        ["scenario"] = "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-bowl-food",
        ["targetLabel"] = "OPEN CANTEEN",
        ["products"] = Config.Products["emscanteen"],
        ["showblip"] = false,
        ["blipsprite"] = 273,
        ["blipcolor"] = 0
    },

    --// PD Canteen
    
    ["pdcanteen"] = {
        ["label"] = "Pd Canteen",
        ["coords"] = vector4(362.18, -1593.07, 34.25, 59.21),
        ["ped"] = 's_m_y_cop_01',
        ["scenario"] = "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-bowl-food",
        ["targetLabel"] = "OPEN CANTEEN",
        ["products"] = Config.Products["pdcanteen"],
        ["showblip"] = false,
        ["blipsprite"] = 273,
        ["blipcolor"] = 0
    },

    --// Animal Ark
    
    ["petshop"] = {
        ["label"] = "Animal Ark",
        ["coords"] = vector4(562.27, 2752.85, 42.88, 183.33),
        ["ped"] = 'a_m_m_golfer_01',
        ["scenario"] = "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-bone",
        ["targetLabel"] = "OPEN STORE",
        ["products"] = Config.Products["petshop"],
        ["showblip"] = true,
        ["blipsprite"] = 273,
        ["blipcolor"] = 0
    },

    ["croma"] = {
        ["label"] = "Croma Megastore",
        ["coords"] = vector4(-1530.16, -402.02, 35.64, 231.06),
        ["ped"] = 's_m_m_movprem_01',
        ["scenario"] =  "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-mobile-screen",
        ["targetLabel"] = "OPEN STORE",
        ["products"] = Config.Products["croma"],
        ["showblip"] = true,
        ["blipsprite"] = 521,
        ["blipcolor"] = 0
    },

    ["digitalden"] = {
        ["label"] = "Digital Den",
        ["coords"] = vector4(-529.21, -582.66, 34.68, 187.34),
        ["ped"] = 'a_m_y_business_02',
        ["scenario"] =  "WORLD_HUMAN_VALETT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-mobile-screen",
        ["targetLabel"] = "OPEN STORE",
        ["products"] = Config.Products["digitalden"],
        ["showblip"] = false,
        ["blipsprite"] = 273,
        ["blipcolor"] = 0
    },

    ["hunting"] = {
        ["label"] = "Hunting Store",
        ["coords"] = vector4(-775.91, 5603.07, 33.74, 253.47),
        ["ped"] = 'cs_hunter',
        ["scenario"] = "WORLD_HUMAN_STAND_IMPATIENT",
        ["radius"] = 2.5,
        ["targetIcon"] = "fa-solid fa-paw",
        ["targetLabel"] = "OPEN SHOP",
        ["products"] = Config.Products["hunting"],
        ["showblip"] = true,
        ["blipsprite"] = 442,
        ["blipcolor"] = 43
    },

    
}
