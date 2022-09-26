function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Whether to have the target as a toggle or not
Config.Toggle = false

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = false

-- The default distance to draw the Sprite
Config.DrawDistance = 10.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = {255, 255, 255, 255}

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = {30, 144, 255, 255}

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = {255, 255, 255, 255}

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = false

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {
	---------------------------------------------------------------- M E C H A N I C ----------------------------------------------------------------
    ["boxzone1"] = {
        name = "Mechanic",
        coords = vector3(-339.99, -156.44, 44.59),
        length = 0.1,
        width = 0.6,
        heading = 15,
        debugPoly = false,
        minZ = 40.99,
        maxZ = 44.99,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fa-solid fa-book-journal-whills",
                label = "Job Management",
                job = {
                    ["mechanic"] = 6,7,
                }
            },
        },
        distance = 2.0
    },
    ------------------------------------------------------------------------- L S P D --------------------------------------------------------------------
    ["boxzone2"] = {
        name = "LSPD",
        coords = vector3(356.54, -1591.76, 31.05),
        length = 0.5,
        width = 0.3,
        heading = 320,
        debugPoly = false,
        minZ = 27.45,
        maxZ = 31.45,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fa-solid fa-book-journal-whills",
                label = "Job Management",
                job = {
                    ["police"] = 10,
                }
            },
        },
        distance = 2.0
    },
    ---------------------------------------------------------------------------- P D M ---------------------------------------------------------------------
    ["boxzone3"] = {
        name = "PDM",
        coords = vector3(-26.51, -1104.29, 27.27),
        length = 0.1,
        width = 0.5,
        heading = 60,
        debugPoly = false,
        minZ = 23.67,
        maxZ = 27.67,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fa-solid fa-book-journal-whills",
                label = "Job Management",
                job = {
                    ["cardealer"] = 5,6,
                }
            },
        },
        distance = 2.0
    },
    --------------------------------------------------------------- D O C T O R --------------------------------------------
    -- BOSS MENU
    ["boxzone4"] = {
        name = "Doctor",
        coords = vector3(-508.9, -300.82, 69.52),
        length = 1.2,
        width = 0.2,
        heading = 290,
        debugPoly = false,
        minZ = 65.92,
        maxZ = 69.92,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fa-solid fa-book-journal-whills",
                label = "Job Management",
                job = {
                    ["ambulance"] = 7,
                }
            },
        },
        distance = 2.5
    },
    -----------------------------------------------I T E M   C R A F T I N G --------------------------------------------
    ["boxzone5"] = {
        name = "ItemCrafting",
        coords = vector3(1533.82, 3586.45, 38.77),
        length = 4,
        width = 1,
        heading = 30,
        debugPoly = false,
        minZ = 35.97,
        maxZ = 39.97,
        options = {
            {
                type = "client",
                event = "inventory:client:craftTarget",
                icon = "fa-solid fa-wrench",
                label = "Craft Items",
            },
        },
        distance = 4.5
    },

}


Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetModels = {

	-------------------------------------------------------------------------- A T M ----------------------------------------------------------------
	["atm"] = {
		models = { 
		'v_corp_fleeca_display', 'prop_atm_01', 'prop_atm_02', 'prop_atm_03', 'prop_fleeca_atm',
	},
	options = {
		{
			type = "server",
			event = "qb-atms:server:enteratm",
			parameters = {},
			icon = "fas fa-piggy-bank",
			label = "Open Bank ATM",
		},
	},
	distance = 1.5
	},
   --------- BANKS ---------
	["Bank"] = {
        models = {
            "ig_karen_daniels"
        },
        options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-piggy-bank", 
                label = "Access Net Banking ",
            }
        },
        distance = 3.5,
    },
	--------- SCRAPYARD--------- 
	["scrapyard-guy"] = {
        models = {
            "ig_floyd"
        },
        options = {
            {
                type = "client",
                event = "qb-scapyard:client:getvehicles",
                icon = "fa-solid fa-car-burst", 
                label = "Email vehicle list",
            }
        },
        distance = 1.5,
    },
	------------PDM Finance girl -------
	["Finance-girl"] = {
        models = {
            "ig_agatha"
        },
        options = {
            {
                type = "client",
                event = "qb-vehicleshop:client:getVehicles",
                icon = "fa-solid fa-coins",  
                label = "Financed vehicles",
            }
        },
        distance = 3.5,
    },
    ------------PDM Finance girl -------
	["Garbage"] = {
        models = {
            "s_m_y_garbage"
        },
        options = {
            {
                type = "client",
                event = "qb-garbagejob:client:MainMenu",
                label = 'Talk to Garbageman',
                icon = 'fa-solid fa-recycle',
				job = 'garbage',
            }
        },
        distance = 3.5,
    },
-------------------   TATTO SHOP -----------------------
    ["tattoo"] = {
        models = {
            "csb_cletus",
        },
        options = {
            {
                type = "client",
                event = "qb-tattoo:client:tattooppen",
                icon = "fas fa-marker",
                label = "Tattoo Shop",
            },
        },
        distance = 3.0,
    },
    ----------------------------------------------- H U N T I N G    --------------------------------------------
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
   

}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

}

Config.Peds = {

    --// Paintball Arena Start
	{ 
        model = `csb_mp_agent14`,
        coords = vector4(-282.01, -2031.36, 29.15, 295.18), 
        gender = 'male',
		freeze = true,
        invincible = true,
        blockevents = true,
    },
	--// Wallmart Bank
    { 
        model = 'ig_karen_daniels',
        coords = vector4(-561.4, -583.15, 40.43, 180.19),
        gender = 'female',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
	--// Scrapyard-guy
	{ 
        model = 'ig_floyd',
        coords = vector4(2403.56, 3127.95, 47.15, 250.0),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
	--// PDM Finance Girl
	{ 
        model = 'ig_agatha',
        coords = vector4(-31.62, -1098.9, 26.27, 74.8),
        gender = 'female',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
	--// Vineyard
    { 
        model = 'a_m_m_farmer_01', 
        coords = vector4(-1928.86, 2059.45, 139.84, 347.81),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
    --// Cocaine Field 
    { 
        model = 'player_two', 
        coords = vector4(-502.49, 6645.6, 12.47, 47.5),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
    },
    ---------- Garbage -----------------------
    { 
        model = 's_m_y_garbage', 
        coords = vector4(-322.24, -1545.86, 30.02, 277.81),
        gender = 'male',
        freeze = true,
        invincible = true,
        blockevents = true,
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
    
    { --tattoo
		model = 'csb_cletus',
		coords = vector4(1324.34, -1650.04, 51.27, 138.47),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	{ --tattoo
		model = 'csb_cletus',
		coords = vector4(-1152.41, -1423.54, 3.95, 131.11),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	{ --tattoo
		model = 'csb_cletus',
		coords = vector4(319.76, 180.73, 102.59, 253.24),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	{ --tattoo
		model = 'csb_cletus',
		coords = vector4(-3170.36, 1072.96, 19.83, 336.51),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	{ --tattoo
		model = 'csb_cletus',
		coords = vector4(1864.9, 3746.64, 32.03, 21.28),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},

	{ --tattoo
		model = 'csb_cletus',
		coords = vector4(-294.75, 6201.26, 30.49, 245.13),
		gender = 'male',
		freeze = true,
		invincible = true,
		blockevents = true,
	},
}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('qb-core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('qb-core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCheck = QBCore.Functions.HasItem

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end