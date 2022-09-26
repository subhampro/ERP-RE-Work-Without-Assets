local QBCore = exports['qb-core']:GetCoreObject()
local timeOut = false

-- Callback

QBCore.Functions.CreateCallback('erp-jewelery:server:getCops', function(source, cb)
	local amount = 4
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Events
RegisterNetEvent('erp-jewelery:server:ThermitePtfx', function()
    TriggerClientEvent('erp-jewelery:client:ThermitePtfx', -1)
end)

RegisterNetEvent('erp-jewelery:server:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
    TriggerClientEvent('erp-jewelery:client:setVitrineState', -1, stateType, state, k)
end)

RegisterNetEvent('erp-jewelery:server:vitrineReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local item = math.random(1, #Config.VitrineRewards)
    local amount = math.random(Config.VitrineRewards[item]["amount"], Config.VitrineRewards[item]["amount"])
    if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'You have to much in your pocket', 'error', 6000)
    end
end)

RegisterNetEvent('erp-jewelery:server:setTimeout', function()
    if not timeOut then
        timeOut = true
        TriggerEvent('qb-scoreboard:server:SetActivityBusy', "jewellery", true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, v in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('erp-jewelery:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('erp-jewelery:client:setAlertState', -1, false)
                TriggerEvent('qb-scoreboard:server:SetActivityBusy', "jewellery", false)
            end
            timeOut = false
        end)
    end
end)