-- If you would like to contribute to this project or report an issue, please visit: https://github.com/IngPleb/pro-trashsearch
Config = {}

Config.General = {
    -- Model of the trash bins -> can be entered as a string or as a number
    PolesModels = {
        1381105889, -2138350253, 2114960499, -2008643115, 1086210513, -686494084, -1610383710, -2007495856, 1130200868, -692524020, 
        -1944495994, 1419852836, -1620823304, 393527760, -1333576134, 1923262137, 1518466392
    },
    -- Search distance for qb-target
    SearchDistance = 1.5,
    -- How long does it take to search trough trash
    DurationOfSearch = 11000, -- In miliseconds
    -- How long does before player can search again
    SearchCooldown = 900000, -- In miliseconds
    -- Time that trash is refilled and can be searched again
    RefillTime = 1300000 -- In miliseconds
}

Config.Stress = {
    -- Should player get some stress after searching trough trash
    AddStress = true,
    -- How much stress should player get MIN
    MinStress = 1,
    -- How much stress should player get MAX
    MaxStress = 6
}

Config.Reward = {
    -- Chance of getting a reward in % (0-100)
    Chance = 100,
    
    -- Minimal number of items that can be found
    MinNumberOfItems = 2,
    -- Maximal number of items that can be found
    MaxNumberOfItems = 3,

    -- Items you can get
    ItemList = {
        "wires"
    }
}

Config.Animations = {
    -- Animation dictionary
    AnimationDictionary = "mp_car_bomb",
    -- Animation
    Animation = "car_bomb_mechanic"
}