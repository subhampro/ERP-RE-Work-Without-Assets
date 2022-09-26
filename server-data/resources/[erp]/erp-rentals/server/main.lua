QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('erp-rentals:server:removemoney', function(src, amount, account)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveMoney(account, amount, "vehicle-rentals")
end)

RegisterServerEvent('erp-rentals:server:givedocument', function(src, PlayerFirst, PlayerLast, Vehicle, Plate)
    local Player = QBCore.Functions.GetPlayer(source)
    info = {
        firstname = PlayerFirst,
        lastname = PlayerLast,
        vehicle = Vehicle,
        vehicleplate = Plate
    }
    if Player.Functions.AddItem("rentcertificate", 1, false, info) then
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["rentcertificate"], "add")
    end
end)

RegisterServerEvent('erp-rentals:server:removedocument', function(src)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem("rentcertificate", 1, false, info) then
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["rentcertificate"], "remove")
    end
end)