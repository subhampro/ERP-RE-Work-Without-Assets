local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("moneywash:server:checkInv", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local markedbills = Player.Functions.GetItemByName('markedbills')
    local amt = Player.Functions.GetItemByName('markedbills').amount
    local worth = 1000
    if Player.Functions.GetItemByName('markedbills') ~= nil then
        if amt <= 1 then
            Player.Functions.RemoveItem('markedbills', amt)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "remove")
            TriggerClientEvent('moneywash:client:startTimer', src, amt, worth)
            TriggerClientEvent('Roda_Notifications:showNotification', src, amt .. ' Marked Money Set To Wash At $' .. worth, 'info', 6000)
        elseif amt > 1 then
            Player.Functions.RemoveItem('markedbills', amt)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "remove")
            TriggerClientEvent('moneywash:client:startTimer', src, amt, worth)
            TriggerClientEvent('Roda_Notifications:showNotification',  src, amt .. ' Marked Money Set To Wash At $' .. worth .. ' Each.', 'info', 6000)
        end
    else
        TriggerClientEvent('Roda_Notifications:showNotification', src, "You dont have any marked money!", 'error', 6000)
    end
end)


RegisterNetEvent("moneywash:server:giveMoney", function(amt, worth)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash', worth * amt)
    TriggerClientEvent('Roda_Notifications:showNotification',  src, 'Looks Like It Is All There...', 'success', 6000)
end)
