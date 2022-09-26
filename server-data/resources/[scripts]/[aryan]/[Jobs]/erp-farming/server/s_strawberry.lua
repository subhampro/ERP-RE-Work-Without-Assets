QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetStrawberry")
AddEventHandler("erp-farming:server:GetStrawberry", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('trowel') then 
        Player.Functions.AddItem('strawberry', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['strawberry'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_trowel'), 'error')
    end
end)
