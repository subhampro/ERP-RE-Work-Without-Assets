local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('GetPaid')
AddEventHandler('GetPaid', function()
        if Config.Payment == 'cash' then
            local _source = source
            local Player = QBCore.Functions.GetPlayer(_source)
            Player.Functions.AddMoney('cash', Config.JobPay)
        elseif Config.Payment == 'bank' then
            local _source = source
            local Player = QBCore.Functions.GetPlayer(_source)
            Player.Functions.AddMoney('bank', Config.JobPay, "Electric Job")
        end
end)

RegisterServerEvent('setlight:on')
AddEventHandler('setlight:on', function(location)
    local loc = location
    TriggerClientEvent("setlight:on", -1, loc)
end)

RegisterServerEvent('setlight:off')
AddEventHandler('setlight:off', function(location)
    local loc = location
    TriggerClientEvent("setlight:off", -1, loc)
end)