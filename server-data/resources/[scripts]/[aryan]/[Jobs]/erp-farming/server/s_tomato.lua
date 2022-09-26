QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetTomato")
AddEventHandler("erp-farming:server:GetTomato", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('trowel') then 
        Player.Functions.AddItem('tomato', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tomato'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_trowel'), 'error')
    end
end)
