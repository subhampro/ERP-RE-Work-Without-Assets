local QBCore = exports['qb-core']:GetCoreObject()
local Routes = {}

QBCore.Functions.CreateCallback("garbagejob:server:NewShift", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid
    local shouldContinue = false
    local nextStop = 0
    local totalNumberOfStops = 0
    local bagNum = 0

    if Player.Functions.RemoveMoney("bank", Config.TruckPrice, "garbo-truck-dep") then
        math.randomseed(os.time())
        local MaxStops = math.random(Config.MinStops, #Config.Locations["trashcan"])
        local allStops = {}

        for i=1, MaxStops do
            local stop = math.random(#Config.Locations["trashcan"])
            local newBagAmount = math.random(Config.MinBagsPerStop, Config.MaxBagsPerStop)
            allStops[#allStops+1] = {stop = stop, bags = newBagAmount}
        end

        Routes[CitizenId] = {
            stops = allStops,
            currentStop = 1,
            started = true,
            currentDistance = 0,
            depositPay = Config.TruckPrice,
            actualPay = 0,
            stopsCompleted = 0,
            totalNumberOfStops = #allStops
        }

        nextStop = allStops[1].stop
        shouldContinue = true
        totalNumberOfStops = #allStops
        bagNum = allStops[1].bags
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("error.not_enough", {value = Config.TruckPrice}), 'error', 6000)
    end
    cb(shouldContinue, nextStop, bagNum, totalNumberOfStops)
end)


QBCore.Functions.CreateCallback("garbagejob:server:NextStop", function(source, cb, currentStop, currentStopNum, currLocation)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid

    local currStopCoords = Config.Locations["trashcan"][currentStop].coords
    currStopCoords = vector3(currStopCoords.x, currStopCoords.y, currStopCoords.z)

    local distance = #(currLocation - currStopCoords)
    local newStop = 0
    local shouldContinue = false
    local newBagAmount = 0

    if(math.random(100) >= Config.CryptoStickChance) and Config.GiveCryptoStick then
        Player.Functions.AddItem("cryptostick", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["cryptostick"], 'add')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("info.found_crypto"), 'info', 6000)
    end
    if(math.random(100) >= Config.waterChance) and Config.GiveWater then
        Player.Functions.AddItem("water_bottle", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["water_bottle"], 'add')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("info.found_waterbottle"), 'info', 6000)
    end
     if(math.random(100) >= Config.BreadChance) and Config.GiveBread then
        Player.Functions.AddItem("tosti", 2, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["tosti"], 'add')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("info.found_bread"), 'info', 6000)
    end
    if(math.random(100) >= Config.pistolChance) and Config.GivePistol then
        Player.Functions.AddItem("weapon_ceramicpistol", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weapon_ceramicpistol"], 'add')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("info.found_pistol"), 'info', 6000)
    end
    if(math.random(100) >= Config.PistolammoChance) and Config.GivePistolammo then
        Player.Functions.AddItem("pistol_ammo", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["pistol_ammo"], 'add')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("info.found_pistolammo"), 'info', 6000)
        
    end
    if(math.random(100) >= Config.kevlarfiberChance) and Config.Givekevlarfiber then    
        Player.Functions.AddItem("kevlarfiber", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["kevlarfiber"], 'add')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("info.found_kevlarfiber"), 'info', 6000)
    end
    if(math.random(100) >= Config.potassiumChance) and Config.Givepotassium then    
        Player.Functions.AddItem("potassium_nitrate", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["potassium_nitrate"], 'add')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("info.found_potassium"), 'info', 6000)
    end
    if(math.random(100) >= Config.echipChance) and Config.Giveechip then    
        Player.Functions.AddItem("electronickit", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["electronickit"], 'add')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("info.found_echip"), 'info', 6000)
    end

    if distance <= 20 then
        if currentStopNum >= #Routes[CitizenId].stops then
            Routes[CitizenId].stopsCompleted = tonumber(Routes[CitizenId].stopsCompleted) + 1
            newStop = currentStop
        else
            newStop = Routes[CitizenId].stops[currentStopNum+1].stop
            newBagAmount = Routes[CitizenId].stops[currentStopNum+1].bags
            shouldContinue = true
            local bagAmount = Routes[CitizenId].stops[currentStopNum].bags
            local totalNewPay = 0

            for i = 1, bagAmount do
                totalNewPay = totalNewPay + math.random(Config.BagLowerWorth, Config.BagUpperWorth)
            end

            Routes[CitizenId].actualPay = math.ceil(Routes[CitizenId].actualPay + totalNewPay)
            Routes[CitizenId].stopsCompleted = tonumber(Routes[CitizenId].stopsCompleted) + 1
        end
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("error.too_far"), 'error', 6000)
    end
    cb(shouldContinue,newStop,newBagAmount)
end)

QBCore.Functions.CreateCallback('garbagejob:server:EndShift', function(source, cb, location)
    local Player = QBCore.Functions.GetPlayer(source)
    local CitizenId = Player.PlayerData.citizenid
    local status = false
    if Routes[CitizenId] ~= nil then status = true end
    cb(status)
end)

RegisterNetEvent('garbagejob:server:PayShift', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid
    if Routes[CitizenId] ~= nil then
        local depositPay = Routes[CitizenId].depositPay
        if tonumber(Routes[CitizenId].stopsCompleted) < tonumber(Routes[CitizenId].totalNumberOfStops) then
            -- local totalComplete = math.floor((Routes[CitizenId].stopsCompleted/Routes[CitizenId].totalNumberOfStops) * 100)
            -- depositPay = math.ceil((totalComplete/Routes[CitizenId].depositPay) * 100)
            depositPay = 0
            TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("error.early_finish", {Completed = Routes[CitizenId].stopsCompleted, total = Routes[CitizenId].totalNumberOfStops}), 'error', 6000)
        end

        local totalToPay = depositPay + Routes[CitizenId].actualPay
        local payoutDeposit = Lang:t("info.payout_deposit", {value = depositPay})
        if depositPay == 0 then
            payoutDeposit = ""
        end

        Player.Functions.AddMoney("bank", totalToPay , 'garbage-payslip')
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("success.pay_slip", {total = totalToPay, deposit = payoutDeposit}), 'success', 6000)
        Routes[CitizenId] = nil
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("error.never_clocked_on"), 'error', 6000)
    end
end)

QBCore.Commands.Add("cleargarbroutes", "Removes garbo routes for user (admin only)", {{name="id", help="Player ID (may be empty)"}}, false, function(source, args)
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local CitizenId = Player.PlayerData.citizenid
    local count = 0
    for k,v in pairs(Routes) do
        if k == CitizenId then
            count = count + 1
        end
    end
    TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("success.clear_routes", {value = count}), 'success', 6000)
    Routes[CitizenId] = nil
end, "admin")
