local QBCore = exports['qb-core']:GetCoreObject()

local chicken = vehicleBaseRepairCost

RegisterNetEvent('qb-customs:attemptPurchase', function(type, upgradeLevel)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local balance = nil
    -- if Player.PlayerData.job.name == "mechanic" then
        -- balance = exports['qb-bossmenu']:GetAccount(Player.PlayerData.job.name)
    -- else
        balance = Player.Functions.GetMoney(moneyType)
    -- end
    -- if type == "repair" then
    --     if balance >= chicken then
    --         if Player.PlayerData.job.name == "mechanic" then
    --             TriggerEvent('qb-bossmenu:server:removeAccountMoney', Player.PlayerData.job.name, chicken)
    --         else
    --             Player.Functions.RemoveMoney(moneyType, chicken, "bennys")
    --         end
    --         TriggerClientEvent('qb-customs:purchaseSuccessful', source)
    --     else
    --         TriggerClientEvent('qb-customs:purchaseFailed', source)
    --     end
    if type == "performance" then
        if balance >= vehicleCustomisationPrices[type].prices[upgradeLevel] then
            TriggerClientEvent('qb-customs:purchaseSuccessful', source)
            -- if Player.PlayerData.job.name == "mechanic" then
                -- TriggerEvent('qb-bossmenu:server:removeAccountMoney', Player.PlayerData.job.name, vehicleCustomisationPrices[type].prices[upgradeLevel])
            -- else
                Player.Functions.RemoveMoney(moneyType, vehicleCustomisationPrices[type].prices[upgradeLevel], "bennys")
                TriggerEvent('qb-bossmenu:server:addAccountMoney', "mechanic", vehicleCustomisationPrices[type].prices[upgradeLevel])
            -- end
        else
            TriggerClientEvent('qb-customs:purchaseFailed', source)
        end
    else
        if balance >= vehicleCustomisationPrices[type].price then
            TriggerClientEvent('qb-customs:purchaseSuccessful', source)
            -- if Player.PlayerData.job.name == "mechanic" then
                -- TriggerEvent('qb-bossmenu:server:removeAccountMoney', Player.PlayerData.job.name,
                    -- vehicleCustomisationPrices[type].price)
            -- else
                Player.Functions.RemoveMoney(moneyType, vehicleCustomisationPrices[type].price, "bennys")
                TriggerEvent('qb-bossmenu:server:addAccountMoney', "mechanic", vehicleCustomisationPrices[type].price)

            -- end
        else
            TriggerClientEvent('qb-customs:purchaseFailed', source)
        end
    end
end)

RegisterNetEvent('qb-customs:updateRepairCost', function(cost)
    chicken = cost
end)

RegisterNetEvent("updateVehicle", function(myCar)
    local src = source
    if IsVehicleOwned(myCar.plate) then
        MySQL.Async.execute('UPDATE player_vehicles SET mods = ? WHERE plate = ?', {json.encode(myCar), myCar.plate})
    end
end)

QBCore.Commands.Add('customs', 'help text here', {}, false, function(source, args)
    local player = tonumber(args[1])
    if player ~= nil then
        local Player = QBCore.Functions.GetPlayer(player)
        if Player ~= nil then
            TriggerClientEvent('event:openfor:admins', player)
        else
            TriggerClientEvent("QBCore:Notify", source, "Player Not Online", "error", 3000)
        end
    else
        TriggerClientEvent('event:openfor:admins', source)
    end
end, 'god')

function IsVehicleOwned(plate)
    local retval = false
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        retval = true
    end
    return retval
end