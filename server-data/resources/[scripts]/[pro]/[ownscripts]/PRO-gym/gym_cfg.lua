Config = {}

Config.Exercises = {
    ["Pushups"] = {
        ["idleDict"] = "amb@world_human_push_ups@male@idle_a",
        ["idleAnim"] = "idle_c",
        ["actionDict"] = "amb@world_human_push_ups@male@base",
        ["actionAnim"] = "base",
        ["actionTime"] = 1100,
        ["enterDict"] = "amb@world_human_push_ups@male@enter",
        ["enterAnim"] = "enter",
        ["enterTime"] = 3050,
        ["exitDict"] = "amb@world_human_push_ups@male@exit",
        ["exitAnim"] = "exit",
        ["exitTime"] = 3400,
        ["actionProcent"] = 1,
        ["actionProcentTimes"] = 3,
    },
    ["Situps"] = {
        ["idleDict"] = "amb@world_human_sit_ups@male@idle_a",
        ["idleAnim"] = "idle_a",
        ["actionDict"] = "amb@world_human_sit_ups@male@base",
        ["actionAnim"] = "base",
        ["actionTime"] = 3400,
        ["enterDict"] = "amb@world_human_sit_ups@male@enter",
        ["enterAnim"] = "enter",
        ["enterTime"] = 4200,
        ["exitDict"] = "amb@world_human_sit_ups@male@exit",
        ["exitAnim"] = "exit", 
        ["exitTime"] = 3700,
        ["actionProcent"] = 1,
        ["actionProcentTimes"] = 10,
    },
    ["Chins"] = {
        ["idleDict"] = "amb@prop_human_muscle_chin_ups@male@idle_a",
        ["idleAnim"] = "idle_a",
        ["actionDict"] = "amb@prop_human_muscle_chin_ups@male@base",
        ["actionAnim"] = "base",
        ["actionTime"] = 3000,
        ["enterDict"] = "amb@prop_human_muscle_chin_ups@male@enter",
        ["enterAnim"] = "enter",
        ["enterTime"] = 1600,
        ["exitDict"] = "amb@prop_human_muscle_chin_ups@male@exit",
        ["exitAnim"] = "exit",
        ["exitTime"] = 3700,
        ["actionProcent"] = 1,
        ["actionProcentTimes"] = 10,
    },
} vector3(-187.58, -37.43, 52.16)
 
Config.Locations = {      -- REMINDER. If you want it to set coords+heading then enter heading, else put nil ( ["h"] )
    {["x"] = -1257.07, ["y"] = -358.58, ["z"] = 36.96 , ["h"] = 111.39, ["exercise"] = "Chins"},  
    {["x"] = -1258.7, ["y"] = -355.43, ["z"] = 36.96 , ["h"] = 160.18, ["exercise"] = "Chins"}, 
    {["x"] = -1262.47, ["y"] = -363.29,["z"] = 35.50 , ["h"] = nil, ["exercise"] = "Situps"}, 
    {["x"] = -1263.94, ["y"] = -361.1,["z"] = 35.50 , ["h"] = nil, ["exercise"] = "Situps"}, 
    {["x"] = -1260.97, ["y"] = -360.83, ["z"] = 35.50, ["h"] = nil, ["exercise"] = "Pushups"},
    {["x"] = -1261.89, ["y"] = -359.0, ["z"] = 35.50, ["h"] = nil, ["exercise"] = "Pushups"},
    --{["x"] = -1206.76, ["y"] = -1572.93, ["z"] = 4.61 - 0.98, ["h"] = nil, ["exercise"] = "Pushups"}, vector4(-1257.2, -358.58, 36.96, 122.92)
    -- ^^ You can add more locations like this
}

Config.xBlips = {
    [1] = {["x"] = -1264.15, ["y"] = -357.81, ["z"] = 36.96, ["id"] = 311, ["color"] = 49, ["scale"] = 0.6, ["text"] = "Pump & Run Gym"},
}
