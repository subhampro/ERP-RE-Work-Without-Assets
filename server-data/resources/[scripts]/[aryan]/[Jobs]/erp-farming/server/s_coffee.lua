QBCore = exports["qb-core"]:GetCoreObject()

RegisterServerEvent("erp-farming:server:GetCoffeeBeans")
AddEventHandler("erp-farming:server:GetCoffeeBeans", function()
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName('trowel') then 
        Player.Functions.AddItem('coffee_beans', 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['coffee_beans'], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.dont_have_trowel'), 'error')
    end
end)
