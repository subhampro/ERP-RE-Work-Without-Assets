QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateCallback('qb-scoreboardmenu:server:GetActivity', function(source, cb)
    local PoliceCount = 0
    local AmbulanceCount = 0
    
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if (Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "police1" or Player.PlayerData.job.name == "police2" or Player.PlayerData.job.name == "police3" or Player.PlayerData.job.name == "police4" or Player.PlayerData.job.name == "police5" or Player.PlayerData.job.name == "police6" or Player.PlayerData.job.name == "police7" or Player.PlayerData.job.name == "police8" or Player.PlayerData.job.name == "police9" or Player.PlayerData.job.name == "police10" and Player.PlayerData.job.onduty) then
                PoliceCount = PoliceCount + 1
            end

            -- if ((Player.PlayerData.job.name == "ems" or Player.PlayerData.job.name == "ems1") and Player.PlayerData.job.onduty) then
            if (Player.PlayerData.job.name == "ambulance" or Player.PlayerData.job.name == "ems1" or Player.PlayerData.job.name == "ems2" or Player.PlayerData.job.name == "ems3" or Player.PlayerData.job.name == "ems4" or Player.PlayerData.job.name == "ems5" or Player.PlayerData.job.name == "ems6" or Player.PlayerData.job.name == "ems7" or Player.PlayerData.job.name == "ems8" or Player.PlayerData.job.name == "ems9" or Player.PlayerData.job.name == "ems10" and Player.PlayerData.job.onduty) then    
                AmbulanceCount = AmbulanceCount + 1
            end
        end
    end

    cb(PoliceCount, AmbulanceCount)
end)

QBCore.Functions.CreateCallback('qb-scoreboardmenu:server:GetConfig', function(source, cb)
    cb(Config.IllegalActions)
end)

QBCore.Functions.CreateCallback('qb-scoreboardmenu:server:GetPlayersArrays', function(source, cb)
    local players = {}
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            players[Player.PlayerData.source] = {}
            players[Player.PlayerData.source].permission = QBCore.Functions.IsOptin(Player.PlayerData.source)
        end
    end
    cb(players)
end)

RegisterServerEvent('qb-scoreboardmenu:server:SetActivityBusy')
AddEventHandler('qb-scoreboardmenu:server:SetActivityBusy', function(activity, bool)
    Config.IllegalActions[activity].busy = bool
    TriggerClientEvent('qb-scoreboardmenu:client:SetActivityBusy', -1, activity, bool)
end)