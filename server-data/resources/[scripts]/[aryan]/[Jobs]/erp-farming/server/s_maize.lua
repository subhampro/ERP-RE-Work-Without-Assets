QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetMaize")
AddEventHandler("erp-farming:server:GetMaize", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('trowel') then 
        Player.Functions.AddItem('maize', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['maize'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_trowel'), 'error')
    end
end)
