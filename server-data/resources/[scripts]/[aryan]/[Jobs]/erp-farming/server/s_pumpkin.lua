QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetPumpkin")
AddEventHandler("erp-farming:server:GetPumpkin", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('trowel') then 
        Player.Functions.AddItem('raw_pumpkin', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['raw_pumpkin'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_trowel'), 'error')
    end
end)
