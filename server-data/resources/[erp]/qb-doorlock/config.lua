Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = false -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 3.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)
Config.SaveDoorDialog = true -- Saves the door dialogue popup between door saves
Config.PersistentDoorStates = false -- Persists the door state between server restarts
Config.PersistentSaveInternal = 60000 -- How often door states are saved to the file system, in miliseconds. 

Config.ChangeColor = true -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(19, 28, 74)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(255 00 00 / 60%)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(255 00 00 / 60%)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked
Config.UseDoorLabelText = false -- Will use the LABEL field as the nui text instead of locked/unlocked
Config.DoorDebug = false -- Enable DRAWTEXT in the world at the coords where the door 'center' is
Config.RemoteTriggerDistance = 15.0 -- This is how far from your camera the raycast will go to try to hit something solid
Config.RemoteTriggerMinDistance = 5.0 -- This is the minimum distance required for the raycast hit to count near a door. It will take the larger two between this and 'distance' option

Config.Consumables = { ['ticket'] = 1, ['paperclip'] = 1 } -- The items will get removed once used on a door that has the item on it

--[[ -- Configuration Options
Config.DoorList['configname-identifier'] = {
	fixText = false, -- Adjusts guess of center of door
	textCoords = vector3(x, y, z) -- Set the text coordinates to a specific location
	setText = true -- Use with above setting
		distance = 2.0, -- Max interact distance
		lockpick = true, -- Alows for lockpicking
	allAuthorized = true, -- Anyone can use door
	authorizedJobs = { ['police']=0, ['bcso']=0, ['sasp]=0 } -- Authorize door access based on job grade
	authorizedGangs = { ['vagos']=0, ['ballas']=0 } -- Authorize door access based on gang grade
	authorizedCitizenIDs = { 'ABC123', 'DEF456' } -- Authorize door access based on citizenid
	items = {'item_1','item_2'} -- Authorize based on items. Must have all items in this list.
		doorLabel = 'Cloakroom', -- Label of room that shows up when nearby
		locked = true, -- Default lock state
		audioRemote = true, -- Play sound from the player instead of the door
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6}, -- Play sound on door lock
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}, -- Play sound on door unlock
		autoLock = 1000, -- Auto lock after this many miliseconds
		doorRate = 1.0,  -- Time till auto closes? Needs more testing
	cantUnlock = true -- Set to true to not allow the player to unlock the door, only lock it. This means a script will have to trigger the unlock.
	pickable = true, -- Can use a lockpick to unlock, only need if true
	hideLabel = true, -- Set to true to hide the popup label, for hiding doors ;)
		remoteTrigger = true, -- If you want to be able to remote trigger a door with H, put this here 
} 
]]

Config.DoorStates = {}
Config.DoorList = {
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vec3(261.83, 221.39, 106.41),
		textCoords = vec3(261.83, 221.39, 106.41),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	--door2 for pacific opened with thermite right near the vault door
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(252.98, 220.65, 101.8),
		textCoords = vec3(252.98, 220.65, 101.8),
		authorizedJobs = { 'police' },
		objYaw = 160.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- door3 for pacific opened with thermite after passing the door near vault
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(261.68, 215.62, 101.81),
		textCoords = vec3(261.68, 215.62, 101.81),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- Paleto Door 1 opened with security card A
	{
		objName = 'v_ilev_cbankvaulgate01',
		objCoords  = vec3(-105.77, 6472.59, 31.81),
		textCoords = vec3(-105.77, 6472.59, 31.81),
		objYaw = 45.0,
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- Paleto Door 2 opened with thermite
	{
		objName = 'v_ilev_cbankvaulgate02',
		objCoords  = vec3(-106.26, 6476.01, 31.98),
		textCoords = vec3(-105.5, 6475.08, 31.99),
		objYaw = -45.0,
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- First Pacific Door opened with lockpick
	{
		objName = 'hei_v_ilev_bk_gate_pris',
		objCoords  = vec3(257.41, 220.25, 106.4),
		textCoords = vec3(257.41, 220.25, 106.4),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Second Pacific Door opened with lockpick
	{
		objName = 'v_ilev_bk_door',
		objCoords  = vec3(265.19, 217.84, 110.28),
		textCoords = vec3(265.19, 217.84, 110.28),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(314.61, -285.82, 54.49),
		textCoords = vec3(313.3, -285.45, 54.49),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(148.96, -1047.12, 29.7),
		textCoords = vec3(148.96, -1047.12, 29.7),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-351.7, -56.28, 49.38),
		textCoords = vec3(-351.7, -56.28, 49.38),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-1208.12, -335.586, 37.759),
		textCoords = vec3(-1208.12, -335.586, 37.759),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-2956.18, 483.96, 16.02),
		textCoords = vec3(-2956.18, 483.96, 16.02),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Prison Door 1
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vec3(1844.9, 2604.8, 44.6),
		textCoords = vec3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 13
	},
	-- Prison Door 2
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vec3(1818.5, 2604.8, 44.6),
		textCoords = vec3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 13
	},
	-- Prison Door 3
	{
		objName = 'prop_gate_prison_01',
		objCoords = vec3(1799.237, 2616.303, 44.6),
		textCoords = vec3(1795.941, 2616.969, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 7
	},
	------------------------------------------Always add new doors below this line for your bank robberies to work!!!---------------------------------
				------------------------------------------End Fixed Doors!!!---------------------------------
	

    
--------------------------------------------------------------- ERP CUSTOMS ----------------------------------------------------------------------------


    {
		objName = 'ajaxon_burton_lsc_side_door2',
		objCoords  = vector3(-372.05, -99.57, 39.13),			
		textCoords = vector3(-372.05, -99.57, 39.13),
		authorizedJobs = { 'mechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	{
		objName = 'ajaxon_burton_lsc_side_door2',
		objCoords  = vector3(-365.06, -102.21, 39.1),			
		textCoords = vector3(-365.06, -102.21, 39.1),
		authorizedJobs = { 'mechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	{
		objName = 'ajaxon_burton_lsc_front_door2',
		objCoords  = vector3(-349.84, -117.27, 39.02),			
		textCoords = vector3(-349.84, -117.27, 39.02),
		authorizedJobs = { 'mechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	{
		objName = 'ajaxon_burton_lsc_front_door2',
		objCoords  = vector3(-356.26, -134.82, 39.01),			
		textCoords = vector3(-356.26, -134.82, 39.01),
		authorizedJobs = { 'mechanic' },
		locking = false,
		locked = false,
		pickable = false,
		distance = 2,
		size = 2
	},
	{
		objName = 'ajaxon_burton_lsc_storage_door',
		objCoords  = vector3(-341.7675, -166.5335, 38.0078),			
		textCoords = vector3(-341.7675, -166.5335, 38.0078),
		authorizedJobs = { 'mechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	{
		textCoords = vector3(-334.85, -155.5, 44.59),
		authorizedJobs = { 'mechanic' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 2.0,
		size = 2,
		doors = {
			{
				objName = 'ajaxon_burton_lsc_office_door',
				objCoords  = vector3(-334.92, -156.34, 44.59)
			},

			{
				objName = 'ajaxon_burton_lsc_office_door',
				objCoords  = vector3(-334.68, -154.72, 44.59)
			}
		}
	},

    ---------------------------------------------------------------- MISC ---------------------------------------------------------------
	
	---------------------------------------------------------- C L O T H I N G   S H O P ----------------------------------------------

	---- MRPD CLOTHING SHOP
	{
		textCoords = vector3(418.62, -807.51, 29.49),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_cs_door01',
				objCoords = vector3(418.67, -806.97, 29.5)
			},

			{
				objName = 'v_ilev_cs_door01_r',
				objCoords = vector3(418.52, -808.16, 29.49)
			}
		}
	},
	---- VANILLA CLOTHING SHOP
	{
		textCoords = vector3(82.3, -1391.59, 29.38),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_cs_door01',
				objCoords = vector3(82.28, -1392.13, 29.39)
			},

			{
				objName = 'v_ilev_cs_door01_r',
				objCoords = vector3(82.44, -1390.99, 29.4)
			}
		}
	},
	---- Pharmacy Clothing
	{
		objName = 'v_ilev_clothmiddoor',
		objCoords  = vector3(126.74, -211.23, 54.56),			
		textCoords = vector3(126.74, -211.23, 54.56),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	---- NEAR ERP CUSTOMS CLOTHING SHOP
	{
		textCoords = vector3(-156.74, -305.47, 39.73),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_ch_glassdoor',
				objCoords = vector3(-157.08, -305.97, 39.73)
			},

			{
				objName = 'v_ilev_ch_glassdoor',
				objCoords = vector3(-156.57, -304.86, 39.73)
			}
		}
	},
	---- EDM CLOTHING SHOP
	{
		textCoords = vector3(-716.09, -156.29, 37.42),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_ch_glassdoor',
				objCoords = vector3(-716.36, -155.77, 37.42)
			},

			{
				objName = 'v_ilev_ch_glassdoor',
				objCoords = vector3(-715.78, -156.84, 37.42)
			}
		}
	},
	---- South Rockford aprt CLOTHING SHOP
	{
		textCoords = vector3(-817.81, -1078.82, 11.34),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_cs_door01',
				objCoords = vector3(-818.33, -1079.23, 11.33)
			},

			{
				objName = 'v_ilev_cs_door01_r',
				objCoords = vector3(-817.15, -1078.72, 11.33)
			}
		}
	},
	---- Cityhall Clothing Shop
	{
		objName = 'v_ilev_clothmiddoor',
		objCoords  = vector3(-1200.64, -777.84, 17.33),			
		textCoords = vector3(-1200.64, -777.84, 17.33),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	---- NEAR GRAVEYARD CLOTHING SHOP
	{
		textCoords = vector3(-1455.47, -232.68, 49.8),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_ch_glassdoor',
				objCoords = vector3(-1455.03, -232.2, 49.8)
			},

			{
				objName = 'v_ilev_ch_glassdoor',
				objCoords = vector3(-1455.93, -233.04, 49.8)
			}
		}
	},
	---------------------------------------------------------- B A R B E R   S H O P ----------------------------------------------

	---- Nikola Barber Shop
	{
		objName = 'v_ilev_bs_door',
		objCoords  = vector3(1207.63, -471.03, 66.21),			
		textCoords = vector3(1207.63, -471.03, 66.21),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2,
		size = 2
	},
	---- EDM Barber Shop
	{
		textCoords = vector3(-822.94, -187.52, 37.57),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 2.0,
		doors = {
			{
				objName = 'v_ilev_hd_door_l',
				objCoords = vector3(-823.07, -187.49, 37.57)
			},

			{
				objName = 'v_ilev_hd_door_r',
				objCoords = vector3(-822.72, -188.06, 37.57)
			}
		}
	},
	---------------------------------------------------------- A L W A Y S   C L O S E D ----------------------------------------------

	---- Wallmart selling point door
	{
		objName = 'vw_prop_vw_casino_door_01b',
		objCoords  = vector3(-586.62, -589.8, 34.68),			
		textCoords = vector3(-586.62, -589.8, 34.68),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 0.1,
		size = 0.1
	},
	---- Wallmart Bank
	{
		objName = 'v_ilev_cd_door2',
		objCoords  = vector3(-566.16, -583.42, 41.43),			
		textCoords = vector3(-566.16, -583.42, 41.43),
		authorizedJobs = { 'misc' },
		locked = true,
		pickable = false,
		distance = 0.1,
		size = 0.1
	},
}
