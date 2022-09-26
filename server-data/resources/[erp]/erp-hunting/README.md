## ERROR HUB
## </ERROR>

## HUNTING SCRIPT INCLUDING HUNTING STORE & HUNTING RIFLE

## Depedency ERP Drawtext


## Instalation Process


1.  Add these lines on QB-Target


["MeatSell"] = {
        models = {
            "g_m_m_korboss_01",
        },
        options = {
            {
                type = "server",
                event = "erp-hunting:server:sell",
                icon = "fa-solid fa-meat",
                label = "Sell Meats!!",
            },
        },
        distance = 2.5,
    },
	
["ExoticMeatSell"] = {
        models = {
            "ig_gustavo",
        },
        options = {
            {
                type = "server",
                event = "erp-hunting:server:sellexotic",
                icon = "fa-solid fa-meat",
                label = "Sell Exotic Meats!!",
            },
        },
        distance = 2.5,
    },



2 . Add this line on qb-shops/config/Config.Products = {

["huntingstore"] = {
        [1] = {
            name = "weapon_sniperrifle",
            price = 5000,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "snp_ammo",
            price = 200,
            amount = 100,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "weapon_knife",
            price = 500,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
    },


----- H U N T I N G -----
	{ 
	    model = 'g_m_m_korboss_01',
	    coords = vector4(815.02, -764.89, 25.78, 264.53),
	    gender = 'male',
	    freeze = true,
        invincible = true,
        blockevents = true,
    },
	{ 
	    model = 'ig_gustavo',
	    coords = vector4(-3108.97, 752.08, 23.7, 144.45),
	    gender = 'male',
	    freeze = true,
        invincible = true,
        blockevents = true,
    },



3. Add this line on qb-shops/config/Config.Locations = {

      ["huntingstore"] = {
        ["label"] = "Hunting Store",
        ["coords"] = vector4(-775.89, 5603.15, 33.74, 265.7),
        ["ped"] = 'cs_hunter',
        ["scenario"] = "WORLD_HUMAN_SUPERHERO",
        ["radius"] = 1.5,
        ["targetIcon"] = "fa-solid fa-store",
        ["targetLabel"] = "Open Hunting Shop",
        ["products"] = Config.Products["huntingstore"],
        ["showblip"] = true,
        ["blipsprite"] = 141,
        ["blipcolor"] = 37
    },



4. Add this items on qb-core/shared/items.lua


-- Hunting
	
	["meat_hshark"]         	 = {["name"] = "meat_hshark",         		["label"] = "Hammer Shark Meat",   	   	["weight"] = 1200,      ["type"] = "item",      ["image"] = "meat_shark.png",     		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hammer Shark meat!"},
	["meat_shark"]         	     = {["name"] = "meat_shark",         		["label"] = "Shark Meat",   	   	    ["weight"] = 1200,      ["type"] = "item",      ["image"] = "meat_shark.png",     		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Shark meat!"},
	["meat_stingray"]            = {["name"] = "meat_stingray",         	["label"] = "Stingray Meat",    		["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_stingray.png",        ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Stingray meat!"},
	["meat_dolphin"]             = {["name"] = "meat_dolphin",         		["label"] = "Dolphin Meat",    			["weight"] = 850,       ["type"] = "item",      ["image"] = "meat_dolphin.png",         ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Dolphin meat!"},
	["meat_whale"]         		 = {["name"] = "meat_whale",         		["label"] = "Whale Meat",    			["weight"] = 6000,      ["type"] = "item",      ["image"] = "meat_whale.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Whale meat!"},
	["meat_boar"]            	 = {["name"] = "meat_boar",         		["label"] = "Boar Meat",    			["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_boar.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Boar meat!"},
	["meat_chickenhawk"]         = {["name"] = "meat_chickenhawk",         	["label"] = "Chickenhawk Meat",    		["weight"] = 400,       ["type"] = "item",      ["image"] = "meat_chickenhawk.png",     ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Chickenhawk meat!"},
	["meat_cormorant"]           = {["name"] = "meat_cormorant",         	["label"] = "Cormorant Meat",    		["weight"] = 400,       ["type"] = "item",      ["image"] = "meat_cormorant.png",       ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Cormorant meat!"},
	["meat_coyote"]              = {["name"] = "meat_coyote",         	    ["label"] = "Coyote Meat",    			["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_coyote.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Coyote meat!"},
	["meat_deer"]            	 = {["name"] = "meat_deer",         	    ["label"] = "Venison",    				["weight"] = 850,       ["type"] = "item",      ["image"] = "meat_deer.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Deer meat!"},
	["meat_mtlion"]            	 = {["name"] = "meat_mtlion",         		["label"] = "Mt Lion Meat",    			["weight"] = 1000,      ["type"] = "item",      ["image"] = "meat_mtlion.png",          ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Mt Lion meat!"},
	["meat_rabbit"]              = {["name"] = "meat_rabbit",         		["label"] = "Rabbit Meat",    			["weight"] = 700,       ["type"] = "item",      ["image"] = "meat_rabbit.png",        	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Rabbit meat!"},
	["meat_pig"]            	 = {["name"] = "meat_pig",         			["label"] = "Pork Meat",    			["weight"] = 750,       ["type"] = "item",      ["image"] = "meat_pig.png",        		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Pig meat!"},
	


5. Add all the images on erp-hunting/images to inventory/images

That's all now enjoy the script !!


