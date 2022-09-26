Config = Config or {}

-------------------
-- Utility
-------------------
Config.Framework = "NEW" -- "NEW" -> New qbcore | "OLD" -> Old qbcore
Config.MechanicJob = "mechanic" 
-- Config.MechanicJob2 = "mechanic"
-- Config.MechanicJob3 = "mechanic" -- You dont need 3 mechanics, delete the line 9 and 8 and go to server lua line: 14 and remove the config.
Config.MechanicNecessary = 0


Config.OnlyUseWithMechanicOFF = true
-------------------
-- Stations
-------------------
Config["Repairs"] = {
    vector3(385.71, -1638.46, 28.29),
    vector3(734.93, -1088.77, 21.17), 
    vector3(107.28, 6629.47, 31.79),
    vector3(-32.09, 2892.31, 58.55),
    vector3(541.12, -180.81, 54.48),
    vector3(218.15, -757.13, 29.85),
    vector3(-217.96, -2027.08, 26.62)

    -- You can add more locations
}

Config.Function = 'repair' -- Functions: "repair" - Only repair vehicle. | "colour" - Only change a colour. | "all" - Repair & Colour
Config.Payment = 'cash' -- You can put: OFF or cash
Config.Amount = 100 -- Paymant amount if you use 'cash'

-------------------
-- Language
-------------------
Config["Language"] = {
    ["QBTarget"] = {
        ["Falar"] = "Speak",
        ["Reparar"] = "Repair",
        ["Pintar"] = "Paint",
        ["Icon"] = "fas fa-car",
    },
    ["ProgressBars"] = {
        ["Reparar"] = "Repairing the vehicle...",
        ["Pintar"] = "Painting the car..."
    },
    ['Notificacoes'] = {
        ["SemGuita"] = "You don't have enough money"
    }
}

----------------------
-- Blip
----------------------
Config.BlipRepair = {
    Enable = true,
    Name = "Repairs",
    Sprite = 402,
    Scale = 0.6,
    Colour = 4,
}

----------------------
-- Peds
----------------------
Config.PedListRepairs = {                                              -- Peds that will be spawned in
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(734.93, -1088.77, 21.17),           
        heading = 88.45,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(107.28, 6629.47, 30.79),         
        heading = 88.45,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(-32.09, 2892.31, 57.55),           
        heading = 88.45,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(385.71, -1638.46, 28.29),           
        heading = 314.26,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(541.12, -180.81, 53.48),          
        heading = 88.45,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords = vector3(218.15, -757.13, 29.85),          
        heading = 266.05,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
    {
        model = "s_m_y_armymech_01",                                                         
        coords =  vector3(-217.96, -2027.08, 26.62),          
        heading = 266.05,
        gender = "male",
        scenario = "WORLD_HUMAN_STAND_MOBILE_UPRIGHT" 
    },
   
}