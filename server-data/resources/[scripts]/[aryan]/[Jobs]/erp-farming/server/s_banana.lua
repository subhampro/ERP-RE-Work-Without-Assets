QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetBanana")
AddEventHandler("erp-farming:server:GetBanana", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('fruit_picker') then 
        Player.Functions.AddItem('banana', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['banana'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_picker'), 'error')
    end
end)
