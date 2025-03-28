-- If you would like to contribute to this project or report an issue, please visit: https://github.com/IngPleb/pro-trashsearch
Config = {}

Config.General = {
    -- Model of the trash bins -> can be entered as a string or as a number
    TrashBinModels = {
        -1096777189, 666561306, 1437508529, -1426008804, -228596739, 161465839,
        651101403,-58485588,218085040
    },
    -- Search distance for qb-target
    SearchDistance = 1.5,
    -- How long does it take to search trough trash
    DurationOfSearch = 11000, -- In miliseconds
    -- How long does before player can search again
    SearchCooldown = 65000, -- In miliseconds
    -- Time that trash is refilled and can be searched again
    RefillTime = 1300000 -- In miliseconds
}

Config.Stress = {
    -- Should player get some stress after searching trough trash
    AddStress = true,
    -- How much stress should player get MIN
    MinStress = 1,
    -- How much stress should player get MAX
    MaxStress = 10
}

Config.Reward = {
    -- Chance of getting a reward in % (0-100)
    Chance = 45,
    -- Money
    Money = {
        Chance = 25, -- Chance to get money instead of an item in % (0-100)
        Min = 1,
        Max = 100
    },
    -- Minimal number of items that can be found
    MinNumberOfItems = 1,
    -- Maximal number of items that can be found
    MaxNumberOfItems = 2,

    -- Items you can get
    ItemList = {
        "water_bottle", "metalscrap", "plastic", "copper", "glass", "lockpick",
        "binoculars","lighter","beer","tosti" , "pistol_ammo" , "trojan_usb", "kevlarfiber"
    }
}

Config.Animations = {
    -- Animation dictionary
    AnimationDictionary = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
    -- Animation
    Animation = "weed_crouch_checkingleaves_idle_01_inspector"
}