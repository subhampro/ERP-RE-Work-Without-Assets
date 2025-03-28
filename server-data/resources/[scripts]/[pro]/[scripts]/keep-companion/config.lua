Config = Config or {}

-- server and client
Config.MaxActivePetsPetPlayer = 4
Config.DataUpdateInterval = 10

Config.Settings = {
    let_players_cutomize_their_pet_after_purchase = true,
    callCompanionDuration = 5, -- sec
    despawnDuration = 5, -- sec
    itemUsageCooldown = 1, -- sec
    minHuntingAbilityLevel = 45, -- level
    PetMiniMap = { showblip = true, sprite = 442, colour = 2, shortRange = false },
    chaseDistance = 100.0,
    chaseIndicator = true, -- huge marker on hunted target head
    petMenuKeybind = 'o' -- keybind (players can change bind)
}

Config.Balance = {
    maximumLevel = 99, -- xp callculation only works util level 99 don't set it to higher values
    afk = {
        -- 30-sec passed after the player is AFK pet will wander in area
        -- 60-sec after when the player is AFK pet will start doing animation
        -- after 60-sec passes timer will start over from 0
        afkTimerRestAfter = 60, -- sec
        wanderingInterval = 30,
        animationInterval = 60
    }, -- sec pet gonna go wandering around player after player is AFK for a certain time

    petting_stress_relief = math.random(1, 5)
}


-- distincts are needed for animations and to know if pet can hunt or not
-- in my testing generaly small animals can't hunt.
-- so potentially you won't need to change distinct value!
-- distinct = "yes dog" ==> means this pet can hunt
-- distinct = "no dog" ==> means this dog can't hunt

Config.pets = {
    [1] = {
        name = 'keepcompanionwesty',
        model = 'A_C_Westy',
        maxHealth = 150,
        distinct = 'no dog'
    },
    [2] = {
        name = 'keepcompanionshepherd',
        model = 'A_C_shepherd',
        maxHealth = 250,
        distinct = 'yes dog'
    },
    [3] = {
        name = 'keepcompanionrottweiler',
        model = 'A_C_Rottweiler',
        maxHealth = 300,
        distinct = 'yes dog'
    },
    [4] = {
        name = 'keepcompanionretriever',
        model = 'A_C_Retriever',
        maxHealth = 300,
        distinct = 'yes dog'
    },
    [5] = {
        name = 'keepcompanionpug',
        model = 'A_C_Pug',
        maxHealth = 150,
        distinct = 'no dog'
    },
    [6] = {
        name = 'keepcompanionpoodle',
        model = 'A_C_Poodle',
        maxHealth = 150,
        distinct = 'no dog'
    },

    [7] = {
        name = 'keepcompanionmtlion2',
        model = 'A_C_Panther',
        maxHealth = 350,
        distinct = 'yes cat',
        price = 50000
    },
    [8] = {
        name = 'keepcompanionmtlion',
        model = 'A_C_MtLion',
        maxHealth = 350,
        distinct = 'yes cat'
    },
    [9] = {
        name = 'keepcompanioncat',
        model = 'A_C_Cat_01',
        maxHealth = 150,
        distinct = 'no cat'
    },
    [10] = {
        name = 'keepcompanionhusky',
        model = 'A_C_Husky',
        maxHealth = 350,
        distinct = 'yes dog'
    },
    [11] = {
        name = 'keepcompanionhen',
        model = 'A_C_Hen',
        maxHealth = 350,
        distinct = 'no hen'
    },
    [12] = {
        name = 'keepcompanionrabbit',
        model = 'A_C_Rabbit_01',
        maxHealth = 350,
        distinct = 'no rabbit'
    },
    [13] = {
        name = 'keepcompanioncoyote',
        model = 'A_C_Coyote',
        maxHealth = 350,
        distinct = 'no cat'
    }
}

Config.core_items = {
    -- don't change table keys
    ['food'] = {
        item_name = 'petfood',
        settings = {
            duration = 15,
            amount = 30,
            -- placeholders
            usage_cycle = 48, -- time to reach 100% to 0% Calories
            resting_cycle = 15,
            overeat = 20, --(percent) how much pets can eat more than they need (RER)
            max_overeat = 200, --(percent) 200% of their need
            weight_gain_by_evereat = 5, --(percent)
            max_weight_gain_by_evereat = 200 --(percent) 200% of their max weight
        }
    },
    ['collar'] = {
        item_name = 'collarpet',
        settings = {
            duration = 20
        }
    },
    ['nametag'] = {
        item_name = 'petnametag',
        settings = {
            duration = 20
        }
    },
    ['firstaid'] = {
        item_name = 'firstaidforpet',
        settings = {
            duration = 20,
            healing_duration_multiplier = 1,
            revive_duration_multiplier = 1,
            heal_amount = 50, --(percent) 25% of their max health
            revive_heal_bonuses = 1 --(additive) base health to stay alive is 100 it mean 100 + revive_amount
        }
    },
    ['groomingkit'] = {
        item_name = 'petgroomingkit',
    },
    ['waterbottle'] = {
        item_name = 'petwaterbottleportable',
        settings = {
            duration = 2,
            max_capacity = 10,
            water_bottle_refill_value = 2, -- how much every bottle of water can fill flask
            thirst_reduction_per_drinking = 25, --(additive)
            thirst_value_increase_per_tick = 0.1,
        }
    }
}


-- K9 Settings

local illegal_items = {
    'weed_brick',
    'coke_small_brick',
    'coke_brick',
    "weed_white-widow",
    "weed_skunk",
    "weed_purple-haze",
    "weed_og-kush",
    "weed_amnesia",
    "weed_ak47",
    "crack_baggy",
    "cokebaggy",
    "meth",
    "weed_2og"
}

Config.k9 = {
    illegal_items = illegal_items,
    indicator = true,
    models = {
        'A_C_Rottweiler',
        'A_C_shepherd'
    }
}
