QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetApple")
AddEventHandler("erp-farming:server:GetApple", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('fruit_picker') then 
        Player.Functions.AddItem('apple', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['apple'], 'add')
    else
       TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_picker'), 'error')
    end
end)
