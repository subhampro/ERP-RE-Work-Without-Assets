Shared = {} or Shared

Shared.CastTimeMin = 5 -- Minimum Time in seconds between fishing and minigame
Shared.CastTimeMax = 8 -- Maximum Time in seconds between fishing and minigame

Shared.MinigameCirclesMin = 2 -- Minigame: Minimum amount of circles
Shared.MinigameCirclesMax = 3 -- Minigame: Maximum amount of circles
Shared.MinigameTime = 20 -- Minigame: Amount of time in seconds

Shared.SellLocation = vector4(-1037.98, -1397.05, 4.55, 79.63)

Shared.FishingZones = {
    -- [1] = { -- Example of a BoxZone (box = true)
    --     coords = vector3(-1803.24, -1193.65, 13.02),
    --     heading = 320,
    --     length = 150.0,
    --     width = 150.0,
        
    --     box = true,
    -- },
    [1] = { -- Example of a PolyZone (box = false)
        points = {
            vector2(-1675.2387695312, -1173.5948486328),
            vector2(-1735.0972900391, -1123.5853271484),
            vector2(-1791.2192382812, -1190.1511230469),
            vector2(-1781.0803222656, -1198.3968505859),
            vector2(-1811.3393554688, -1234.6142578125),
            vector2(-1801.5816650391, -1241.4423828125),
            vector2(-1826.2922363281, -1271.0466308594),
            vector2(-1866.1932373047, -1237.609375),
            vector2(-1860.5042724609, -1230.4948730469),
            vector2(-1880.2086181641, -1213.7786865234),
            vector2(-1832.3840332031, -1156.3748779297),
            vector2(-1805.9240722656, -1178.3273925781),
            vector2(-1738.1322021484, -1097.5084228516),
            vector2(-1736.1848144531, -1099.3897705078),
            vector2(-1805.8577880859, -1181.7016601562),
            vector2(-1831.7720947266, -1159.8989257812),
            vector2(-1876.298828125, -1213.2581787109),
            vector2(-1858.2048339844, -1228.2017822266),
            vector2(-1862.7119140625, -1237.49609375),
            vector2(-1826.8615722656, -1267.0612792969),
            vector2(-1806.0493164062, -1241.7878417969),
            vector2(-1814.787109375, -1234.55078125),
            vector2(-1784.9338378906, -1199.3608398438),
            vector2(-1794.4528808594, -1190.880859375),
            vector2(-1735.6239013672, -1120.7244873047),
            vector2(-1674.5981445312, -1171.3869628906)
        },
        minZ = 1.00,
        maxZ = 26.00,
    }
  
}

Shared.Fishing = {
    {name = "Fishing", coords = vector4(-1850.65, -1232.74, 13.02, 319.03), sprite = 86, colour = 43, scale = 0.6,}, 
}
