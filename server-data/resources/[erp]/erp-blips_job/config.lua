Config = {}

Config.Framework = 'QBCORE' 
Config.Blips = {
	---------------------------------------------------------------------- V I N E Y A R D  ----------------------------------------------------------------------------
	[1] = {  
		Coords = { x = -1919.45, y = 2054.7, z = 140.74  },
		Blip = { name = 'Vineyard', sprite = 270, size = 0.7, color = 27 },
		AllowedJobs = {'vineyard'},
		DeniedJobs = {},
	},
	[2] = {  
		Coords = { x = 829.03, y = 2190.97, z = 52.38 },
		Blip = { name = 'Grape Processing', sprite = 473, size = 0.7, color = 27 },
		AllowedJobs = {'vineyard'},
		DeniedJobs = {},
	},
	---------------------------------------------------------------------- T A X I  J O B----------------------------------------------------------------------------
	[3] = {   
		Coords = { x = 909.5, y = -177.35, z = 74.22  },
		Blip = { name = 'Downtow Cab', sprite = 198, size = 0.6, color = 5 },
		AllowedJobs = {'taxi'},
		DeniedJobs = {},
	},
	---------------------------------------------------------------------- B U S  J O B  ----------------------------------------------------------------------------
	[4] = {   
		Coords = { x = 462.22, y = -641.15, z = 28.44 },
		Blip = { name = 'Bus Depot', sprite = 513, size = 0.6, color = 49 },
		AllowedJobs = {'bus'},
		DeniedJobs = {},
	},
	---------------------------------------------------------------------- G A R B A G E   J O B  ----------------------------------------------------------------------------
	[5] = {    
		Coords = { x = -315.23, y = -1529.88, z = 27.59 },
		Blip = { name = 'Garbage Depot', sprite = 318, size = 0.9, color = 2 },
		AllowedJobs = {'garbage'},
		DeniedJobs = {},
	},
}


