Config = {

    BlipSprite = 237,
    BlipColor = 26,
    BlipText = 'Workbench',
    
    UseLimitSystem = false, -- Enable if your esx uses limit system
    
    CraftingStopWithDistance = false, -- Crafting will stop when not near workbench
    
    ExperiancePerCraft = 10, -- The amount of experiance added per craft (100 Experiance is 1 level)
    
    HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job
    
    Categories = {
    
        ['item'] = {
            Label = 'Craft Items',
            Image = 'tools',
            Jobs = {}
        },
        ['attach'] = {
            Label = 'Craft Attachment',
            Image = 'pistol_extendedclip',
            Jobs = {}
        },
        ['ammo'] = {
            Label = 'Craft Ammo',
            Image = 'pistol_ammo',
            Jobs = {}
        },
		['components'] = {
            Label = 'Craft Components',
            Image = 'laptop',
            Jobs = {}
        },
    },
        
    
    
    PermanentItems = { -- Items that dont get removed when crafting
        ['screwdriver'] = true,
        ['weapon_hammer'] = true
    },
    
    Recipes = { 
        ----------------------------------------------------------------- I T E M   C R A F T I N G  ---------------------------------------------------------------- 
        ['screwdriverset'] = {
            Level = 0, -- From what level this item will be craftable
            Category = 'item', -- The category item will be put in
            isGun = false, -- Specify if this is a gun so it will be added to the loadout
            Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
            JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
            Amount = 1, -- The amount that will be crafted
            SuccessRate = 100, -- 100% you will recieve the item
            requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
            Time = 30, -- Time in seconds it takes to craft this item
            Ingredients = { -- Ingredients needed to craft this item
                ['aluminum'] = 30,
                ['rubber'] = 30,
                ['iron'] = 30,
                ['steel'] = 30,
                ['screwdriver'] = 1
            },
        }, 
    
        ['lockpick'] = {
            Level = 0, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ['metalscrap'] = 25,
                ['iron'] = 25,
                ['steel'] = 30,
                ['screwdriver'] = 1
            },
        }, 
    
        ['advancedlockpick'] = {
            Level = 1, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ['metalscrap'] = 50,
                ['iron'] = 50,
                ['steel'] = 60,
                ['screwdriver'] = 1
            },
        }, 
    
        ['handcuffs'] = {
            Level = 2, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ['aluminum'] = 50,
                ['iron'] = 50,
                ['steel'] = 60,
                ['screwdriver'] = 1
            },
        }, 
    
        ['electronickit'] = {
            Level = 3, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 10,
                ["copper"] = 75,
                ["glass"] = 75,
                ["plastic"] = 100,
                ["battery"]  = 1,
                ['screwdriver'] = 1
            },
        }, 
    
        ['gatecrack'] = {
            Level = 4, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 20,
                ["copper"] = 100,
                ["glass"] = 50,
                ["plastic"] = 100,
                ["screen"] = 1,
                ["battery"] = 1,
                ['screwdriver'] = 1
            },
        },
        
        ['usb_green'] = {
            Level = 5, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 20,
                ["copper"] = 200,
                ["electronickit"] = 1,
                ["plastic"] = 150,
                ['screwdriver'] = 1
            },
        }, 
    
        ['trojan_usb'] = {
            Level = 6, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 30,
                ["copper"] = 250,
                ["glass"] = 200,
                ["plastic"] = 250,
                ['screwdriver'] = 1
            },
        }, 
    
        ['drill'] = {
            Level = 7, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 30,
                ["heavy_drillbit"] = 1,
                ["metalscrap"] = 300,
                ["aluminum"] = 300,
                ['screwdriver'] = 1
            },
        },

        ['aluminum_powder'] = {
            Level = 8, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["aluminum"] = 100,
                ["weapon_hammer"] = 1
            },
        },

        ['carbon_charcol'] = {
            Level = 9, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["carbon"] = 5,
                ["weapon_hammer"] = 1
            },
        },

        ['black_powder'] = {
            Level = 10, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["potassium_nitrate"] = 1,
                ["carbon_charcol"] = 1,
                ["aluminum_powder"] = 1,
                ['weapon_hammer'] = 1
            },
        },

        ['hacking_device'] = {
            Level = 11, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 35,
                ["wireless_card"] = 1,
                ["plastic"] = 100,
                ["screen"] = 1,
                ["battery"] = 1,
                ['screwdriver'] = 1
            },
        },

        ['armorplate'] = {
            Level = 12, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 60, 
            Ingredients = { 
                ["iron"] = 50,
                ["steel"] = 50,
                ["polymer"] = 40
            },
        }, 
    
        ['armor'] = {
            Level = 13, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["armorplate"] = 1,
                ["kevlarfiber"] = 5
            },
        },
    
        ['laptop'] = {
            Level = 14, 
            Category = 'item', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 126, 
            Ingredients = { 
                ["wires"] = 40,
                ["wireless_card"] = 1,
                ["plastic"] = 100,
                ["battery"] = 1,
                ["screen"] = 1,
                ['graphiccard'] = 1,
                ['i9_processor'] = 1,
                ['harddrive'] = 1, 
                ['screwdriver'] = 1
            },
        },
    
        ---------------------------------------------------------------- L A P T O P   C O M P O N E N T S    C R A F T I N G  ---------------------------------------------------------------- 
        ['battery'] = {
            Level = 10, 
            Category = 'components', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["copper"] = 50,
                ["aluminum"] = 50
            },
        },
    
        ['screen'] = {
            Level = 10, 
            Category = 'components', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["glass"] = 100,
                ["plastic"] = 25
            },
        },
    
        ['graphiccard'] = {
            Level = 10, 
            Category = 'components', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 10,
                ["plastic"] = 100,
                ["aluminum"] = 100, 
                ['screwdriver'] = 1
            },
        },
    
        ['harddrive'] = {
            Level = 10, 
            Category = 'components', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 10,
                ["aluminum"] = 75,
                ["plastic"] = 75,
                ["copper"] = 75, 
                ['screwdriver'] = 1
            },
        },
    
        ['i9_processor'] = {
            Level = 10, 
            Category = 'components', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 20,
                ["aluminum"] = 100,
                ["steel"] = 100,
                ["copper"] = 100,
                ["polymer"] = 50,
                ['screwdriver'] = 1
            },
        },
    
        ['wireless_card'] = {
            Level = 10, 
            Category = 'components', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["wires"] = 20,
                ["aluminum"] = 150,
                ["polymer"] = 75,
                ["steel"] = 150,
                ["copper"] = 150, 
                ['screwdriver'] = 1
            },
        },
    
        ----------------------------------------------------------------- A T T A C H M E N T   C R A F T I N G  ---------------------------------------------------------------- 
        ['pistol_extendedclip'] = {
            Level = 16, 
            Category = 'attach', 
            isGun = false,
            Jobs = {}, 
            JobGrades = {}, 
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = {
                ["metalscrap"] = 500, 
                ["steel"] = 550,
                ["rubber"] = 450,
                ['screwdriver'] = 1
            },
        }, 
    
        -- ['pistol_flashlight'] = {
        --     Level = 17, 
        --     Category = 'attach', 
        --     isGun = false, 
        --     Jobs = {}, 
        --     JobGrades = {},
        --     Amount = 1,
        --     SuccessRate = 100,
        --     requireBlueprint = false, 
        --     Time = 30, 
        --     Ingredients = { 
        --         ["plastic"] = 600,
        --         ["steel"] = 650,
        --         ["rubber"] = 550,
        --         ["glass"] = 200,
        --         ['screwdriver'] = 1
        --     },
        -- }, 
    
        ['microsmg_extendedclip'] = {
            Level = 18, 
            Category = 'attach', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["metalscrap"] = 790,
                ["steel"] = 605,
                ["rubber"] = 385,
                ["copper"] = 250,
                ['screwdriver'] = 1
            },
        }, 
    
        ['assaultsmg_extendedclip'] = {
            Level = 20, 
            Category = 'attach', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["metalscrap"] = 840,
                ["steel"] = 655,
                ["rubber"] = 435,
                ["copper"] = 300,
                ['screwdriver'] = 1
            },
        }, 
    
        ['microsmg_scope'] = {
            Level = 22, 
            Category = 'attach', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["plastic"] = 600,
                ["steel"] = 650,
                ["rubber"] = 550,
                ["glass"] = 500,
                ['screwdriver'] = 1
            },
        }, 
    
        ['combatpdw_grip'] = {
            Level = 24, 
            Category = 'attach', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["plastic"] = 700,
                ["rubber"] = 650,
                ['screwdriver'] = 1
            },
        }, 
    
        ['bullpuprifle_extendedclip'] = {
            Level = 26, 
            Category = 'attach', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["metalscrap"] = 940,
                ["steel"] = 755,
                ["rubber"] = 535,
                ["copper"] = 400,
                ['screwdriver'] = 1
            },
        }, 
    
        -- ['rifle_flashlight'] = {
        --     Level = 29, 
        --     Category = 'attach', 
        --     isGun = false, 
        --     Jobs = {}, 
        --     JobGrades = {},
        --     Amount = 1,
        --     SuccessRate = 100,
        --     requireBlueprint = false, 
        --     Time = 30, 
        --     Ingredients = { 
        --         ["plastic"] = 700,
        --         ["steel"] = 550,
        --         ["rubber"] = 650,
        --         ["glass"] = 400,
        --         ['screwdriver'] = 1
        --     },
        -- }, 
    
        ['rifle_grip'] = {
            Level = 28, 
            Category = 'attach', 
            isGun = false, 
            Jobs = {}, 
            JobGrades = {},
            Amount = 1,
            SuccessRate = 100,
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = { 
                ["plastic"] = 1500,
                ["rubber"] = 1000,
                ['screwdriver'] = 1
            },
        },
    
        ----------------------------------------------------------------- A M M O   C R A F T I N G  ---------------------------------------------------------------- 
        ['pistol_ammo'] = {
            Level = 30, 
            Category = 'ammo',
            isGun = false,
            Jobs = {}, 
            JobGrades = {}, 
            Amount = 1,
            SuccessRate = 100, 
            requireBlueprint = false, 
            Time = 30, 
            Ingredients = {
                ["copper"] = 20, 
                ["polymer"] = 10,
                ['black_powder'] = 1
            },
        }, 
    
        -- ['smg_ammo'] = {
        --     Level = 45, 
        --     Category = 'ammo', 
        --     isGun = false, 
        --     Jobs = {}, 
        --     JobGrades = {},
        --     Amount = 1,
        --     SuccessRate = 100,
        --     requireBlueprint = false, 
        --     Time = 60, 
        --     Ingredients = { 
        --         ["copper"] = 300, 
        --         ["steel"] = 450,
        --         ["rubber"] = 350,
        --         ['black_powder'] = 1
        --     },
            
        -- }, 
    
        -- ['rifle_ammo'] = {
        --     Level = 60, 
        --     Category = 'ammo', 
        --     isGun = false, 
        --     Jobs = {}, 
        --     JobGrades = {},
        --     Amount = 1,
        --     SuccessRate = 100,
        --     requireBlueprint = false, 
        --     Time = 60, 
        --     Ingredients = { 
        --         ["copper"] = 500, 
        --         ["steel"] = 550,
        --         ["rubber"] = 450,
        --         ['black_powder'] = 1
        --     },
        -- }, 
    
        -- ['shotgun_ammo'] = {
        --     Level = 80, 
        --     Category = 'ammo', 
        --     isGun = false, 
        --     Jobs = {}, 
        --     JobGrades = {},
        --     Amount = 1,
        --     SuccessRate = 100,
        --     requireBlueprint = false, 
        --     Time = 60, 
        --     Ingredients = { 
        --         ["copper"] = 600, 
        --         ["steel"] = 650,
        --         ["rubber"] = 450,
        --         ['black_powder'] = 1
        --     },
        -- }, 
    },
    
    Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access
    
        {coords = vector3(1966.86, 3820.03, 32.4), jobs = {}, blip = false, recipes = {'screwdriverset', 'carbon_charcol', 'lockpick', 'advancedlockpick', 'handcuffs','electronickit','gatecrack','trojan_usb','armorplate','armor','drill','usb_green','black_powder','aluminum_powder','hacking_device','laptop'}, radius = 2.0 },
		{coords = vector3(1006.12, -2401.63, 30.55), jobs = {}, blip = false, recipes = {'battery','screen','graphiccard','harddrive','i9_processor','wireless_card'}, radius = 2.0 },
        {coords = vector3(1994.08, 3049.4, 47.22), jobs = {}, blip = false, recipes = {'pistol_extendedclip','microsmg_extendedclip','assaultsmg_extendedclip','microsmg_scope','combatpdw_grip','bullpuprifle_extendedclip','rifle_grip'}, radius = 2.0 },
        {coords = vector3(591.81, -3283.39, 6.07), jobs = {}, blip = false, recipes = {'pistol_ammo'}, radius = 2.0 },
    
    },
     
    
    Text = {
    
        ['not_enough_ingredients'] = 'You dont have enough ingredients',
        ['you_cant_hold_item'] = 'You cant hold the item',
        ['item_crafted'] = 'Item crafted!',
        ['wrong_job'] = 'You cant open this workbench',
        ['workbench_hologram'] = '[~b~E~w~] Workbench',
        ['wrong_usage'] = 'Wrong usage of command',
        ['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
        ['crafting_failed'] = 'You failed to craft the item!'
    
    }
    
    }
    
    
    
    function SendTextMessage(msg)
    
            SetNotificationTextEntry('STRING')
            AddTextComponentString(msg)
            DrawNotification(0,1)
    
            --EXAMPLE USED IN VIDEO
            --exports['mythic_notify']:SendAlert('inform', msg)
    
    end
    