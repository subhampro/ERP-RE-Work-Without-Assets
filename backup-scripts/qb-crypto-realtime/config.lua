Crypto = {
        Lower = 230,
        Upper = 350,
    History = {
        ["qbit"] = {}
    },

    Worth = {
        ["qbit"] = 55
    },

    Labels = {
        ["qbit"] = "ERP Token"
    },

    Exchange = {
        coords = vector3(1276.21, -1709.88, 54.57),
        RebootInfo = {
            state = false,
            percentage = 0
        },
    },

    -- For auto updating the value of qbit
    Coin = 'qbit',
    RefreshTimer = 10, -- In minutes, so every 10 minutes.

    -- Crashes or luck
    ChanceOfCrashOrLuck = 5, -- This is in % (1-100)
    Crash = {90,85}, -- Min / Max
    Luck = {10,15}, -- Min / Max

    -- If not not Chance of crash or luck, then this shit
    ChanceOfDown = 90, -- If out of 100 hits less or equal to
    ChanceOfUp = 10, -- If out of 100 is greater or equal to
    CasualDown = {1,10}, -- Min / Max (If it goes down)
    CasualUp = {1,5}, -- Min / Max (If it goes up)
}




Ticker = {
    Enabled = true, -- Decide whether the real life price ticker should be enabled or not :)  
    coin = 'XRP', --- The coin, please make sure you find the actual name, for example: Bitcoin vs BTC, BTC would be correct
    currency = 'USD', -- For example USD, NOK, SEK, EUR, CAD and more here https://www.countries-ofthe-world.com/world-currencies.html
    tick_time = 2, --- Minutes (Minimum is 2 minutes) 20,160 Requests a month, Its recommended to get the free API key so the crypto script doesnt switch on and off if ratelimit is encountered
    Api_key = '5841ca3801246531050140e6696c89def5c31c836a137b6e217fa3dc340b9cac', -- If you decide to get an api key for the API (https://min-api.cryptocompare.com/pricing) The free plan should be more than enough for 1 Fivem server
    --- Error handle stuff, for more user friendly and readable errors, Don't touch.
    Error_handle = {
        ['fsym is a required param.'] = 'Config error: Invalid / Missing coin name',
        ['tsyms is a required param.'] = 'Config error: Invalid / Missing currency',
        ['cccagg_or_exchange'] = 'Config error: Invalid currency / coin combination', -- For some reason api throws this error if either coin or currency is invalid
    },
}
