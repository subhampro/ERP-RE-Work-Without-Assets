Config = {}

Config.DrawDistance = 10.0
Config.MarkerSize   = {x = 7.0, y = 7.0, z = 1.0}

Config.Money = 0 -- How much it takes from you when you open the clothing menu
Config.Debug = true

Config.ClothingShops = {
	[1] = {
		blip = false,
		coords = vector3(-3169.79, 1042.39, 20.86),
		MarkerSize   = {x = 7.0, y = 7.0, z = 1.0}
	},
}


Config.BarberShops = {
	vector3(136.8038, -1708.44, 28.291),
    vector3(-1282.60, -1116.80, 5.9938),
    vector3(1931.613, 3729.659, 31.844),
    vector3(1212.713, -472.972, 65.207),
    vector3(-32.9359, -152.341, 56.076),
    vector3(-278.205, 6228.501, 30.695),
    vector3(-814.235, -183.812, 36.568)
}

Config.ClothingRooms = {
    [1] = {requiredJob = "police", coords = vector3(361.6, -1592.7, 25.45)},
    [2] = {requiredJob = "ambulance", coords = vector3(300.69, -597.6, 43.28)},
	[3] = {requiredJob = "mechanic", coords = vector3(-336.66, -166.22, 44.59)}
}

Config.Outfits = {
    ["police"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "Recruit",
                outfitData = {
                    ["t-shirt"]     = { item = 66, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 515, texture = 0},  -- Jacket
					["arms"]        = { item = 26, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
                    ["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["vest"]        = { item = 77, texture = 0},  -- Vest
				},
            },
			[2] = {
                outfitLabel = "Cadet",
                outfitData = {
                    ["t-shirt"]     = { item = 31, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 515, texture = 0},  -- Jacket
					["arms"]        = { item = 26, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
                    ["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["vest"]        = { item = 15, texture = 0},  -- Vest
				},
            },
			[3] = {
                outfitLabel = "Officer",
                outfitData = {
                    ["t-shirt"]     = { item = 31, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 515, texture = 0},  -- Jacket
					["arms"]        = { item = 26, texture = 0},  -- Arms
					["pants"]       = { item = 23, texture = 0},  -- pants
                    ["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["vest"]        = { item = 51, texture = 0},  -- Vest
				},
            },
			[4] = {
                outfitLabel = "Senior Officer",
                outfitData = {
                    ["t-shirt"]     = { item = 117, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 516, texture = 0},  -- Jacket
					["arms"]        = { item = 27, texture = 0},  -- Arms
					["pants"]       = { item = 23, texture = 0},  -- pants
                    ["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["vest"]        = { item = 26, texture = 0},  -- Vest
				},
            },
			[5] = {
                outfitLabel = "Corporal",
                outfitData = {
                    ["t-shirt"]     = { item = 60, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 516, texture = 0},  -- Jacket
					["arms"]        = { item = 27, texture = 0},  -- Arms
					["pants"]       = { item = 23, texture = 0},  -- pants
                    ["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["vest"]        = { item = 32, texture = 0},  -- Vest
				},
            },
			[6] = {
                outfitLabel = "Sergaent",
                outfitData = {
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 518, texture = 0},  -- Jacket
					["arms"]        = { item = 27, texture = 0},  -- Arms
					["pants"]       = { item = 76, texture = 0},  -- pants
                    ["shoes"]       = { item = 42, texture = 0},  -- Shoes
				    ["accessory"]   = { item = 1, texture = 0},  -- Neck
                },
            },
		},
        -- ["female"] = {
        --     [1] = {
        --         outfitLabel = "Recluta",
        --         outfitData = {
        --             ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
        --             ["torso2"]      = { item = 518, texture = 0},  -- Jacket
		-- 			["arms"]        = { item = 27, texture = 0},  -- Arms
		-- 			["pants"]       = { item = 76, texture = 0},  -- pants
        --             ["shoes"]       = { item = 42, texture = 0},  -- Shoes
		-- 			["vest"]        = { item = 0, texture = 0},  -- Vest
		-- 			["decals"]      = { item = 0, texture = 0},  -- Decals
        --             ["accessory"]   = { item = 1, texture = 0},  -- Nek / Das
        --             ["bag"]         = { item = 0, texture = 0},  -- Bag
        --             ["hat"]         = { item = 0, texture = 0},  -- Hat
        --             ["glass"]       = { item = 0, texture = 0},  -- Glasses
        --             ["ear"]         = { item = 0, texture = 0},  -- Ear
        --             ["mask"]        = { item = 0, texture = 0},  -- Mask
        --         },
        --     },
		-- },
	},
	
    ["ambulance"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "Trainee",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 0},  -- Jacket
				},
            },
			[2] = {
                outfitLabel = "EMT Advance",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 1},  -- Jacket
				},
            },
			[3] = {
                outfitLabel = "Paramedic",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 2},  -- Jacket
				},
            },
			[4] = {
                outfitLabel = "Paramedic",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 2},  -- Jacket
				},
            },
			[5] = {
                outfitLabel = "Surgeon",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 3},  -- Jacket
				},
            },
			[6] = {
                outfitLabel = "Head Medic",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 3},  -- Jacket
				},
            },
			[7] = {
                outfitLabel = "Lieutenant",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 4},  -- Jacket
				},
            },
			[8] = {
                outfitLabel = "Captain",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 4},  -- Jacket
				},
            },
			[9] = {
                outfitLabel = "Chief",
                outfitData = {
					["mask"]        = { item = 31, texture = 0},  -- Mask
					["arms"]        = { item = 85, texture = 0},  -- Arms
					["pants"]       = { item = 10, texture = 0},  -- pants
					["shoes"]       = { item = 10, texture = 0},  -- Shoes
					["accessory"]   = { item = 24, texture = 0},  -- Nek / Das
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 526, texture = 5},  -- Jacket
				},
            },
        },
        -- ["female"] = {
        --     [1] = {
        --         outfitLabel = "Trainee",
        --         outfitData = {
        --             ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
        --             ["torso2"]      = { item = 518, texture = 0},  -- Jacket
		-- 			["arms"]        = { item = 27, texture = 0},  -- Arms
		-- 			["pants"]       = { item = 76, texture = 0},  -- pants
        --             ["shoes"]       = { item = 42, texture = 0},  -- Shoes
		-- 			["vest"]        = { item = 0, texture = 0},  -- Vest
		-- 			["decals"]      = { item = 0, texture = 0},  -- Decals
        --             ["accessory"]   = { item = 1, texture = 0},  -- Nek / Das
        --             ["bag"]         = { item = 0, texture = 0},  -- Bag
        --             ["hat"]         = { item = 0, texture = 0},  -- Hat
        --             ["glass"]       = { item = 0, texture = 0},  -- Glasses
        --             ["ear"]         = { item = 0, texture = 0},  -- Ear
        --             ["mask"]        = { item = 0, texture = 0},  -- Mask
        --         },
        --     },
        -- },
	},

	["mechanic"] = {
        ["male"] = {
            [1] = {
                outfitLabel = "Novice",
                outfitData = {
					["arms"]        = { item = 18, texture = 0},  -- Arms
					["pants"]       = { item = 69, texture = 0},  -- pants
					["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["t-shirt"]     = { item = 111, texture = 0},  -- Shirt
					["vest"]        = { item = 69, texture = 0},  -- Vest
					["torso2"]      = { item = 178, texture = 0},  -- Jacket
					["hat"]         = { item = 88, texture = 4},  -- Hat
					["glass"]       = { item = 15, texture = 0},  -- Glasses
				},
            },
			[2] = {
                outfitLabel = "Intern",
                outfitData = {
					["arms"]        = { item = 19, texture = 0},  -- Arms
					["pants"]       = { item = 82, texture = 0},  -- pants
					["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["t-shirt"]     = { item = 112, texture = 0},  -- Shirt
					["vest"]        = { item = 69, texture = 0},  -- Vest
					["torso2"]      = { item = 185, texture = 1},  -- Jacket
					["hat"]         = { item = 88, texture = 9},  -- Hat
					["glass"]       = { item = 15, texture = 0},  -- Glasses
				},
            },
			[3] = {
                outfitLabel = "Lead Mechanic",
                outfitData = {
					["arms"]        = { item = 26, texture = 0},  -- Arms
					["pants"]       = { item =76, texture = 0},  -- pants
					["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["t-shirt"]     = { item = 112, texture = 0},  -- Shirt
					["vest"]        = { item = 69, texture = 0},  -- Vest
					["torso2"]      = { item = 138, texture = 0},  -- Jacket
					["hat"]         = { item = 88, texture = 1},  -- Hat
					["glass"]       = { item = 15, texture = 0},  -- Glasses
				},
            },
			[4] = {
                outfitLabel = "Expert",
                outfitData = {
					["arms"]        = { item = 22, texture = 0},  -- Arms
					["pants"]       = { item = 76, texture = 0},  -- pants
					["shoes"]       = { item = 41, texture = 0},  -- Shoes
					["t-shirt"]     = { item = 112, texture = 0},  -- Shirt
					["vest"]        = { item = 69, texture = 0},  -- Vest
					["torso2"]      = { item = 223, texture = 1},  -- Jacket
					["hat"]         = { item = 168, texture = 0},  -- Hat
					["glass"]       = { item = 17, texture = 1},  -- Glasses
				},
            },
			[5] = {
                outfitLabel = "Senior Mechanic",
                outfitData = {
					["arms"]        = { item = 26, texture = 0},  -- Arms
					["pants"]       = { item = 89, texture = 0},  -- pants
					["shoes"]       = { item = 42, texture = 0},  -- Shoes
					["t-shirt"]     = { item = 112, texture = 0},  -- Shirt
					["vest"]        = { item = 69, texture = 0},  -- Vest
					["torso2"]      = { item = 154, texture = 0},  -- Jacket
					["hat"]         = { item = 88, texture = 9},  -- Hat
					["glass"]       = { item = 21, texture = 0},  -- Glasses
				},
            },
			[6] = {
                outfitLabel = "Manager",
                outfitData = {
					["arms"]        = { item = 20, texture = 0},  -- Arms
					["pants"]       = { item = 76, texture = 0},  -- pants
					["shoes"]       = { item = 42, texture = 0},  -- Shoes
					["t-shirt"]     = { item = 112, texture = 0},  -- Shirt
					["vest"]        = { item = 69, texture = 0},  -- Vest
					["torso2"]      = { item = 500, texture = 1},  -- Jacket
					["hat"]         = { item = 88, texture = 9},  -- Hat
					["glass"]       = { item = 21, texture = 0},  -- Glasses
				},
            },
			
        },
        ["female"] = {
            [1] = {
                outfitLabel = "Trainee",
                outfitData = {
                    ["t-shirt"]     = { item = 15, texture = 0},  -- Shirt
                    ["torso2"]      = { item = 518, texture = 0},  -- Jacket
					["arms"]        = { item = 27, texture = 0},  -- Arms
					["pants"]       = { item = 76, texture = 0},  -- pants
                    ["shoes"]       = { item = 42, texture = 0},  -- Shoes
					["vest"]        = { item = 0, texture = 0},  -- Vest
					["decals"]      = { item = 0, texture = 0},  -- Decals
                    ["accessory"]   = { item = 1, texture = 0},  -- Nek / Das
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 0, texture = 0},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["ear"]         = { item = 0, texture = 0},  -- Ear
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
            },
        },
	},	
}

Config.PedQube = {
	[1] = {
		["nome"] = "pedclothing1",
        ["coordinate"] = vector3(-523.89, -594.98, 40.43),
		["heading"] = 188.45, --direzione ped
		["modello"] = "ig_miguelmadrazo",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop", --tipo di animazione
		["fisso"] = false, --se il ped deve spawnare o despawnare in base alla distanza
        ["spawnato"] = false, --bool per controllare se il ped è già spawnato (non toccare se non sai quello che fai)
	},
	[2] = {
        ["nome"] = "pedclothing2",
		["coordinate"] = vector3(-568.96, -586.22, 33.68),
		["heading"] = 271.03, 
		["modello"] = "ig_miguelmadrazo",
		["dict"] = "anim@amb@nightclub@peds@", 
        ["anim"] = "rcmme_amanda1_stand_loop_cop",
		["fisso"] = false, 
        ["spawnato"] = false, 
	},
	[3] = {
        ["nome"] = "pedclothing3",
		["coordinate"] = vector3(-3169.79, 1042.39, 19.86),
		["heading"] = 68.28, 
		["modello"] = "ig_miguelmadrazo",
		["dict"] = "anim@amb@nightclub@peds@", 
        ["anim"] = "rcmme_amanda1_stand_loop_cop",
		["fisso"] = false, 
        ["spawnato"] = false, 
	},
	[4] = {
        ["nome"] = "pedclothing4",
		["coordinate"] = vector3(-1102.35, 2711.63, 18.11),
		["heading"] = 229.01, 
		["modello"] = "ig_miguelmadrazo",
		["dict"] = "anim@amb@nightclub@peds@", 
        ["anim"] = "rcmme_amanda1_stand_loop_cop",
		["fisso"] = false, 
        ["spawnato"] = false, 
	},
	[5] = {
        ["nome"] = "pedclothing5",
		["coordinate"] = vector3(612.9, 2763.66, 41.09),
		["heading"] = 275.38, 
		["modello"] = "ig_miguelmadrazo",
		["dict"] = "anim@amb@nightclub@peds@", 
        ["anim"] = "rcmme_amanda1_stand_loop_cop",
		["fisso"] = false, 
        ["spawnato"] = false, 
	},
	[6] = {
        ["nome"] = "pedclothing6",
		["coordinate"] = vector3(1196.68, 2711.62, 37.22),
		["heading"] = 187.02, 
		["modello"] = "ig_miguelmadrazo",
		["dict"] = "anim@amb@nightclub@peds@", 
        ["anim"] = "rcmme_amanda1_stand_loop_cop",
		["fisso"] = false, 
        ["spawnato"] = false, 
	},
	[7] = {
        ["nome"] = "pedclothing7",
		["coordinate"] = vector3(1695.3, 4822.9, 41.06),
		["heading"] = 98.17, 
		["modello"] = "ig_miguelmadrazo",
		["dict"] = "anim@amb@nightclub@peds@", 
        ["anim"] = "rcmme_amanda1_stand_loop_cop",
		["fisso"] = false, 
        ["spawnato"] = false, 
	},
	[8] = {
        ["nome"] = "pedclothing8",
		["coordinate"] = vector3(5.85, 6511.45, 30.88),
		["heading"] = 41.41, 
		["modello"] = "ig_miguelmadrazo",
		["dict"] = "anim@amb@nightclub@peds@", 
        ["anim"] = "rcmme_amanda1_stand_loop_cop",
		["fisso"] = false, 
        ["spawnato"] = false, 
	},
	----barber
	[9] = {
		["nome"] = "pedclothing9", 
        ["coordinate"] = vector3(-555.07, -584.39, 40.43), 
		["heading"] = 281.63, 
		["modello"] = "s_f_y_clubbar_02",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop",  
		["fisso"] = false, 
        ["spawnato"] = false,
	},
	[10] = {
		["nome"] = "pedclothing10",
        ["coordinate"] = vector3(136.8038, -1708.44, 28.291), --129
		["heading"] = 137.8, --direzione ped
		["modello"] = "s_f_y_clubbar_02",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop", --tipo di animazione
		["fisso"] = false, --se il ped deve spawnare o despawnare in base alla distanza
        ["spawnato"] = false, --bool per controllare se il ped è già spawnato (non toccare se non sai quello che fai)
	},
	[11] = {
		["nome"] = "pedclothing11",
        ["coordinate"] = vector3(-1282.60, -1116.80, 5.9938), --314
		["heading"] = 138.6, --direzione ped
		["modello"] = "s_f_y_clubbar_02",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop", --tipo di animazione
		["fisso"] = false, --se il ped deve spawnare o despawnare in base alla distanza
        ["spawnato"] = false, --bool per controllare se il ped è già spawnato (non toccare se non sai quello che fai)
	},
	[12] = {
		["nome"] = "pedclothing12",
        ["coordinate"] = vector3(1931.613, 3729.659, 31.844), --1033
		["heading"] = 220.3, --direzione ped
		["modello"] = "s_f_y_clubbar_02",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop", --tipo di animazione
		["fisso"] = false, --se il ped deve spawnare o despawnare in base alla distanza
        ["spawnato"] = false, --bool per controllare se il ped è già spawnato (non toccare se non sai quello che fai)
	},
	[13] = {
		["nome"] = "pedclothing13",
        ["coordinate"] = vector3(1212.713, -472.972, 65.207), --436
		["heading"] = 78.45, --direzione ped
		["modello"] = "s_f_y_clubbar_02",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop", --tipo di animazione
		["fisso"] = false, --se il ped deve spawnare o despawnare in base alla distanza
        ["spawnato"] = false, --bool per controllare se il ped è già spawnato (non toccare se non sai quello che fai)
	},
	[14] = {
		["nome"] = "pedclothing14",
        ["coordinate"] = vector3(-32.9359, -152.341, 56.076), --571
		["heading"] = 340.4, --direzione ped
		["modello"] = "s_f_y_clubbar_02",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop", --tipo di animazione
		["fisso"] = false, --se il ped deve spawnare o despawnare in base alla distanza
        ["spawnato"] = false, --bool per controllare se il ped è già spawnato (non toccare se non sai quello che fai)
	},
	[15] = {
		["nome"] = "pedclothing15",
        ["coordinate"] = vector3(-278.205, 6228.501, 30.695), --3012
		["heading"] = 52.88, --direzione ped
		["modello"] = "s_f_y_clubbar_02",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop", --tipo di animazione
		["fisso"] = false, --se il ped deve spawnare o despawnare in base alla distanza
        ["spawnato"] = false, --bool per controllare se il ped è già spawnato (non toccare se non sai quello che fai)
	},
	[16] = {
		["nome"] = "pedclothing16",
        ["coordinate"] = vector3(-814.235, -183.812, 36.568), --682
		["heading"] = 129.5, --direzione ped
		["modello"] = "s_f_y_clubbar_02",
		["dict"] = "anim@amb@nightclub@peds@", --catalogo animazione
        ["anim"] = "rcmme_amanda1_stand_loop_cop", --tipo di animazione
		["fisso"] = false, --se il ped deve spawnare o despawnare in base alla distanza
        ["spawnato"] = false, --bool per controllare se il ped è già spawnato (non toccare se non sai quello che fai)
	},
}
