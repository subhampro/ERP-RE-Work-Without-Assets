local QBCore = exports['qb-core']:GetCoreObject()
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('erp-hookers:pay')
AddEventHandler('erp-hookers:pay', function(boolean)

    local src       = source
    local Player    = QBCore.Functions.GetPlayer(src)
    local check     = Player.PlayerData.money.cash
    
    if (boolean == true) then
    
        if check >= Config.BlowjobPrice then
            Player.Functions.RemoveMoney('cash', Config.BlowjobPrice)
            TriggerClientEvent('erp-hookers:startBlowjob', src)
            TriggerClientEvent('QBCore:Notify', src, 'You Paid!', 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash', 'error')
            TriggerClientEvent('erp-hookers:noMoney', src)
        end  
    else
        if check >= Config.SexPrice then
            Player.Functions.RemoveMoney('cash', Config.SexPrice)
            TriggerClientEvent('erp-hookers:startSex', src)
            QBCore.Functions.Notify('You Paid', 'success')
            TriggerClientEvent('QBCore:Notify', src, 'You Paid!', 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash', 'error')
            TriggerClientEvent('erp-hookers:noMoney', src)
        end 
    end
end)


