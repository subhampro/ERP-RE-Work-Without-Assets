QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetRawMilk")
AddEventHandler("erp-farming:server:GetRawMilk", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('milk_container') then 
        Player.Functions.AddItem('milk_raw', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['milk_raw'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_container'), 'error')
    end
end)
