QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetOrange")
AddEventHandler("erp-farming:server:GetOrange", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('fruit_picker') then 
        Player.Functions.AddItem('orange', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['orange'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_picker'), 'error')
    end
end)
