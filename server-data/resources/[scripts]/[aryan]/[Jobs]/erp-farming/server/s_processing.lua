QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetPackagedApple")
AddEventHandler("erp-farming:server:GetPackagedApple", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("apple")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("apple", 10)
            Player.Functions.AddItem("apples_packaged", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["apples_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPackagedOrange")
AddEventHandler("erp-farming:server:GetPackagedOrange", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("orange")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("orange", 10)
            Player.Functions.AddItem("orange_packaged", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["orange_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPackagedStrawberry")
AddEventHandler("erp-farming:server:GetPackagedStrawberry", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("strawberry")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("strawberry", 10)
            Player.Functions.AddItem("strawberry_packaged", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["strawberry_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPackagedBananas")
AddEventHandler("erp-farming:server:GetPackagedBananas", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("banana")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("banana", 10)
            Player.Functions.AddItem("banana_packaged", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["banana_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPackagedMaize")
AddEventHandler("erp-farming:server:GetPackagedMaize", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("maize")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("maize", 10)
            Player.Functions.AddItem("maize_packaged", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["maize_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPackagedPotato")
AddEventHandler("erp-farming:server:GetPackagedPotato", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("potato_raw")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("potato_raw", 10)
            Player.Functions.AddItem("potato_packaged", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["potato_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPackagedTomato")
AddEventHandler("erp-farming:server:GetPackagedTomato", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("tomato")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("tomato", 10)
            Player.Functions.AddItem("tomato_packaged", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["tomato_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPumpkinPieBox")
AddEventHandler("erp-farming:server:GetPumpkinPieBox", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("raw_pumpkin")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("raw_pumpkin", 10)
            Player.Functions.AddItem("pumpkinpiebox", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["pumpkinpiebox"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPackagedMilk")
AddEventHandler("erp-farming:server:GetPackagedMilk", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("milk_raw")

    if item ~= nil then
        if item.amount >= 1 then
            Player.Functions.RemoveItem("milk_raw", 1)
            Player.Functions.AddItem("milk_packaged", 10)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["milk_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetPackagedCoffee")
AddEventHandler("erp-farming:server:GetPackagedCoffee", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("coffee_beans")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("coffee_beans", 10)
            Player.Functions.AddItem("coffee_packaged", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["coffee_packaged"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetAppleJuice")
AddEventHandler("erp-farming:server:GetAppleJuice", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("apple")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("apple", 10)
            Player.Functions.AddItem("juice_apple", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["juice_apple"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetOrangeJuice")
AddEventHandler("erp-farming:server:GetOrangeJuice", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("orange")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("orange", 10)
            Player.Functions.AddItem("juice_orange", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["juice_orange"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

RegisterServerEvent("erp-farming:server:GetStrawberryJuice")
AddEventHandler("erp-farming:server:GetStrawberryJuice", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName("strawberry")

    if item ~= nil then
        if item.amount >= 10 then
            Player.Functions.RemoveItem("strawberry", 10)
            Player.Functions.AddItem("juice_strawberry", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["juice_strawberry"], "add")
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have enough items", 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have the required items!", "error")
    end
end)

