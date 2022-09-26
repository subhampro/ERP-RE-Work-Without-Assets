QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetPotato")
AddEventHandler("erp-farming:server:GetPotato", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('trowel') then 
        Player.Functions.AddItem('potato_raw', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['potato_raw'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_trowel'), 'error')
    end
end)
