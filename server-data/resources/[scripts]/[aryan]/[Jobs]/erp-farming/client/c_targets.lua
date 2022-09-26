QBCore = exports["qb-core"]:GetCoreObject()

local peds = {}

CreateThread(function()
    
    ---//Peds
    for k, v in pairs(Config.Peds) do
        RequestModel('a_m_m_farmer_01') while not HasModelLoaded('a_m_m_farmer_01') do Wait(0) end
	    peds[#peds+1] = CreatePed(0, 'a_m_m_farmer_01', v.coords.x, v.coords.y, v.coords.z, v.coords[4], false, false)
        SetEntityInvincible(peds[#peds], true)
	    SetBlockingOfNonTemporaryEvents(peds[#peds], true)
	    FreezeEntityPosition(peds[#peds], true)
    end
    ---//Processing
    exports[Config.Target]:AddBoxZone('Processing', vector3(420.0, 6468.27, 28.81), 1, 4, {
        name = 'Processing',
        heading = 320,
        minZ = 25.41,
        maxZ = 29.41,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "erp-farming:client:ProcessMenu",
                icon = 'fas fa-seedling',
                label = 'Process'
            },
        },
        distance = 1.5,
    })
    ---//Farm General Grapeseed
    exports[Config.Target]:AddBoxZone('Farming_Main', vector3(2310.62, 4884.86, 40.81), 1.0, 1.0, {
        name = 'Farming_Main',
        heading = 42.01,
        minZ = 39.81,
        maxZ = 42.81,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "erp-farming:client:GeneralMenu",
                icon = 'fas fa-seedling',
                label = 'Talk with employee'
            },
        },
        distance = 5.0,
    })
    ---//Apple Trees
    for k, v in pairs(Config["AppleTrees"]) do
        name = "Apples"..k
        exports[Config.Target]:AddBoxZone(name, vector3(v.x, v.y, v.z), 1, 1.2, {
            name= name,
            minZ = v.z - 2.5,
            maxZ = v.z + 2.5,
            heading = 22,
            debugPoly = false,
        }, {
            options = {
                {
                    type = "Client",
                    event = "erp-farming:client:PickApples",
                    icon = 'fas fa-seedling',
                    label = 'Pick Apples',
                }
            },
            distance = 1.5,
        })
    end
    ---//Orange Trees
    for k, v in pairs(Config["OrangeTrees"]) do
        name = "Oranges"..k
        exports[Config.Target]:AddBoxZone(name, vector3(v.x, v.y, v.z), 1, 1.2, {
            name= name,
            minZ = v.z - 2.5,
            maxZ = v.z + 2.5,
            heading = 22,
            debugPoly = false,
        }, {
            options = {
                {
                    type = "Client",
                    event = "erp-farming:client:PickOrange",
                    icon = 'fas fa-seedling',
                    label = 'Pick Oranges',
                }
            },
            distance = 1.5,
        })
    end
    ---//Tomato Plants
    for k, v in pairs(Config["TomatoPlants"]) do
        name = "Tomatos"..k
        exports[Config.Target]:AddBoxZone(name, vector3(v.x, v.y, v.z), 2, 10, {
            name= name,
            heading = 314.99,
            debugPoly = false,
        }, {
            options = {
                {
                    event 	= "erp-farming:client:HarvestTomato",
                    icon 	= "fa-solid fa-trowel",
                    label 	= "Harvest Tomato",
                },
            },
            distance = 1.5
        })
    end
    ---//Maize Plants
  
    exports[Config.Target]:AddBoxZone('Maize', vector3(647.96, 6473.04, 30.15), 50, 80, {
        name = "maize",
        heading = 350,
        debugPoly = false,
        minZ = 26.75,
        maxZ = 32.75,
    }, {
        options = {
            {
                event 	= "erp-farming:client:HarvestMaize",
                icon 	= "fa-solid fa-trowel",
                label 	= "Harvest Maize",
            },
        },
        distance = 1.5
    })
    
    ---//Banana Trees
	exports[Config.Target]:AddTargetModel(`prop_veg_crop_tr_02`, {
	    options = {
	        {
	            event 	= "erp-farming:client:PickBanana",
	            icon 	= "fa-solid fa-basket-shopping",
	            label 	= "Pick Bananas",
	        },
	    },
	    distance = 1.5
	})
    ---//Pumpkin Plants
	exports[Config.Target]:AddTargetModel(`prop_veg_crop_03_pump`, {
	    options = {
	        {
	            event 	= "erp-farming:client:HarvestPumpkin",
	            icon 	= "fa-solid fa-trowel",
	            label 	= "Harvest Pumpkin",
	        },
	    },
	    distance = 1.5
	})
    ---//Potato Plants
	exports[Config.Target]:AddTargetModel(`prop_plant_fern_02a`, {
	    options = {
	        {
	            event 	= "erp-farming:client:HarvestPotato",
	            icon 	= "fa-solid fa-trowel",
	            label 	= "Harvest Raw Potatoes",
	        },
	    },
	    distance = 1.5
	})
    ---//Coffee Plants
	exports[Config.Target]:AddTargetModel(`prop_bush_dead_02`, {
	    options = {
	        {
	            event 	= "erp-farming:client:HarvestCoffeeBeans",
	            icon 	= "fa-solid fa-trowel",
	            label 	= "Harvest Coffee Beans",
	        },
	    },
	    distance = 1.5
	})
    ---//Strawberrys Plants 
    exports[Config.Target]:AddTargetModel(`prop_veg_crop_04_leaf`, {
	    options = {
	        {
	            event 	= "erp-farming:client:HarvestStrawberry",
	            icon 	= "fa-solid fa-trowel",
	            label 	= "Harvest Strawberry",
	        },
	    },
	    distance = 1.5
	})
    ---//Collect Milk 
	exports[Config.Target]:AddTargetModel(`a_c_cow`, {
	    options = {
	        {
	            event 	= "erp-farming:client:CollectRawMilk",
	            icon 	= "fa fa-tint",
	            label 	= "Collect Milk",
            },
	    },
	    distance = 1.5
	})
    
end)

