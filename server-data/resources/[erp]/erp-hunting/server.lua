local QBCore = exports['qb-core']:GetCoreObject()

-- List of all the animals

local animals = {
    [1] = {
        model = "a_c_deer",
        hash = -664053099,
        item = "meat_deer",
        name = "Deer Meat",
        id = 35,
        profit = 1
    },
    [2] = {
        model = "a_c_pig",
        hash = -1323586730,
        item = "meat_pig",
        name = "Pig Meat",
        id = 36,
        profit = 1
    },
    [3] = {
        model = "a_c_boar",
        hash = -832573324,
        item = "meat_boar",
        name = "Boar Meat",
        id = 37,
        profit = 1
    },
    [4] = {
        model = "a_c_mtlion",
        hash = 307287994,
        item = "meat_mtlion",
        name = "Mt Lion Meat",
        id = 38,
        profit = 1
    },
    [5] = {
        model = "a_c_sharkhammer",
        hash = 015224100,
        item = "meat_hshark",
        name = "Hammer Shark Meat",
        id = 39,
        profit = 1 
    },
    [6] = {
        model = "a_c_sharktiger",
        hash = 113504370,
        item = "meat_shark",
        name = "Shark Meat",
        id = 40,
        profit = 1 
    },
    [7] = {
        model = "a_c_stingray",
        hash = -1589092019,
        item = "meat_stingray",
        name = "Stingray Meat",
        id = 41,
        profit = 1 
    },
    [8] = {
        model = "a_c_coyote",
        hash = 1682622302,
        item = "meat_coyote",
        name = "Coyote Meat",
        id = 42,
        profit = 1
    },
    [9] = {
        model = "a_c_rabbit_01",
        hash = -541762431,
        item = "meat_rabbit",
        name = "Rabbit Meat",
        id = 43,
        profit = 1
    },
    [10] = {
        model = "a_c_dolphin",
        hash = -1950698411,
        item = "meat_dolphin",
        name = "Dolphin Meat",
        id = 44,
        profit = 1
    },
    [11] = {
        model = "a_c_killerwhale",
        hash = 1920284487,
        item = "meat_whale",
        name = "Whale Meat",
        id = 45,
        profit = 1
    },
	[12] = {
        model = "a_c_cormorant",
        hash = 2141914453,
        item = "meat_cormorant",
        name = "Cormorant Meat",
        id = 46,
        profit = 1
    },
    [13] = {
        model = "a_c_chickenhawk",
        hash = 942293100,
        item = "meat_chickenhawk",
        name = "Chicken Meat",
        id = 47,
        profit = 1
    }

}

------

-- Event for adding meat in the inv

RegisterServerEvent("erp-hunting:server:AddItem")
AddEventHandler("erp-hunting:server:AddItem", function (data, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local data = data
    local amount = 1

    for i = 1, #animals do
        if data == animals[i].id then
            Player.Functions.AddItem(animals[i].item, 1)
        end
    end
end)


-- Event for animal skin/meat sell

local ItemList = {
    ['meat_rabbit'] = 500,
    ['meat_chickenhawk'] = 200,
    ['meat_cormorant'] = 800,
    ['meat_pig'] = 100,
    ['meat_deer'] = 200,
    ['meat_boar'] = 200,
    ['meat_coyote'] = 300,
    ['meat_stingray'] = 800,
}

local illegalItemList = {
    ['meat_mtlion'] = 1250,
    ['meat_dolphin'] = 1950,
    ['meat_shark'] = 1900,
    ['meat_whale'] = 2500,
    ['meat_hshark'] = 2000, 
}


RegisterNetEvent('erp-hunting:server:sell', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(ItemList)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    Player.Functions.AddMoney("cash", price, "sold-meat")
                    TriggerClientEvent('Roda_Notifications:showNotification', source, "You sold some meat to the Pizza Hut dealer for $"..price, 'success', 10000)
                end
            end
        end
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source, "You don't have anything to sell!" , 'error', 7000)
    end
end)

RegisterNetEvent('erp-hunting:server:sellexotic', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    
    local xItem = Player.Functions.GetItemsByName(illegalItemList)
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do
            if Player.PlayerData.items[k] ~= nil then
                if illegalItemList[Player.PlayerData.items[k].name] ~= nil then
                    price = price + (illegalItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)

        Player.Functions.AddMoney("cash", price, "sold-meat")
                TriggerClientEvent('Roda_Notifications:showNotification', source, "You sold some exotic meat to the illegal meat dealer for $"..price, 'success', 7000)
                end
            end
        end
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source, "You don't have anything to sell!" , 'error', 7000)
    end
end)

