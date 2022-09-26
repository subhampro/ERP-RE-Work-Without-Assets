Config = Config or {}

Config.LogsImage = "https://media.discordapp.net/attachments/870999295199940608/979745927327797329/ERP_LOGO.png"

Config.WebHook = "https://discord.com/api/webhooks/980335681622667296/P7X5cKl1Omghl9nqt7l9OulUf5c1EiK1zoibyqTWXq_musv6L1mQKH6sO4TCXfpvGbaK"

Config.RequiredPolice = 0 -- Needed cops to start the mission

Config.PoliceJob = 'police' -- Police job

Config.UseBlips = true

Config.Phone = 'qb-phone'

Config.ThermiteItem = 'thermite'

Config.MinEarn = 1

Config.MaxEarn = 3

Config.NextRob = 1800 -- Time player can start the mission again (in seconds)

Config.StartPeds = {  -- Start ped locations + model
    peds = {
        {pos = vector3(218.47, 106.4, 100.75), heading = 249.53, ped = 'ig_paige'},
    }
}

Config.BlipLocation = {
    {title = "Paige", colour = 0, id = 47, x = -604.0787, y = -773.9486, z = 25.403778},
}

Config.Guards = {
    [1] = {
        ['pos'] = vector4(-1824.42, 3017.07, 41.34, 136.81),
        ['ped'] = 's_m_y_blackops_01',
                -- ['weapon'] = 'WEAPON_CARBINERIFLE',
        ['weapon'] = 'WEAPON_PISTOL',      
        ['health'] = 6000,
        ['accuracy'] = 100,
        ['alertness'] = 3,
        ['aggresiveness'] = 3,
    },
    [2] = {
        ['pos'] = vector4(-1770.06, 2996.05, 41.34, 110.74),
        ['ped'] = 's_m_y_blackops_01',
                -- ['weapon'] = 'WEAPON_CARBINERIFLE',
        ['weapon'] = 'WEAPON_PISTOL',
        ['health'] = 6000,
        ['accuracy'] = 100,
        ['alertness'] = 3,
        ['aggresiveness'] = 3,
    },
    [3] = {
        ['pos'] = vector4(-1865.51, 2951.51, 41.34, 309.92),
        ['ped'] = 's_m_y_blackops_01',
                -- ['weapon'] = 'WEAPON_CARBINERIFLE',
        ['weapon'] = 'WEAPON_PISTOL',
        ['health'] = 6000,
        ['accuracy'] = 100,
        ['alertness'] = 3,
        ['aggresiveness'] = 3,
    },
    [4] = {
        ['pos'] = vector4(-1822.12, 2917.8, 41.34, 318.7),
        ['ped'] = 's_m_y_blackops_01',
                -- ['weapon'] = 'WEAPON_CARBINERIFLE',
        ['weapon'] = 'WEAPON_PISTOL',
        ['health'] = 3000,
        ['accuracy'] = 90,
        ['alertness'] = 3,
        ['aggresiveness'] = 3,
    },
    [5] = {
        ['pos'] = vector4(-1794.43, 2976.18, 32.81, 96.99),
        ['ped'] = 's_m_y_blackops_01',
                -- ['weapon'] = 'WEAPON_CARBINERIFLE',
        ['weapon'] = 'WEAPON_PISTOL',
        ['health'] = 3000,
        ['accuracy'] = 90,
        ['alertness'] = 3,
        ['aggresiveness'] = 3,
    },
    [6] = {
        ['pos'] = vector4(-1846.56, 2949.66, 32.81, 294.97),
        ['ped'] = 's_m_y_blackops_01',
                -- ['weapon'] = 'WEAPON_CARBINERIFLE',
        ['weapon'] = 'WEAPON_PISTOL',
        ['health'] = 3000,
        ['accuracy'] = 90,
        ['alertness'] = 3,
        ['aggresiveness'] = 3,
    },
}