local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('erp-item_sell:server:SellItems', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        local itemName = data.name
        local price = data.price
        local Items = Player.Functions.GetItemsByName(itemName)
        local finalAmount = 0
        if Items[1] then
            for i = 1, #Items do
                if Items[i] then
                    local Amount = Items[i].amount
                    local Slot   = Items[i].slot
                    finalAmount = finalAmount + Amount
                    Player.Functions.RemoveItem(itemName, Amount, Slot)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemName], "remove", Amount)
                end
            end
        end
        if finalAmount > 0 then
            Player.Functions.AddMoney('bank', price*finalAmount)
            TriggerClientEvent('QBCore:Notify', source, "You sold "..finalAmount.." "..data.label.." for $ "..price*finalAmount, "success")
        else
            TriggerClientEvent('QBCore:Notify', source, "You don't have anything to sell!", "error")
        end
    end
end)