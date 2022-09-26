-- Variables
local QBCore = exports['qb-core']:GetCoreObject()
local financetimer = {}
local paymentDue = false

-- Handlers

-- Store game time for player when they load
RegisterNetEvent('qb-vehicleshop:server:addPlayer', function(citizenid, gameTime)
    financetimer[citizenid] = gameTime
end)

-- Deduct stored game time from player on logout
-- RegisterNetEvent('qb-vehicleshop:server:removePlayer', function(citizenid)
--     if financetimer[citizenid] then
--         local playTime = financetimer[citizenid]
--         local financetime = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {citizenid})
--         for k,v in pairs(financetime) do
--             if v.balance >= 1 then
--                 local newTime = math.floor(v.financetime - (((GetGameTimer() - playTime) / 1000) / 60))
--                 if newTime < 0 then newTime = 0 end
--                 MySQL.Async.execute('UPDATE player_vehicles SET financetime = ? WHERE plate = ?', {newTime, v.plate})
--             end
--         end
--     end
--     financetimer[citizenid] = nil
-- end)

-- Deduct stored game time from player on quit because we can't get citizenid
-- AddEventHandler('playerDropped', function()
--     local src = source
--     for k,v in pairs(GetPlayerIdentifiers(src)) do
--         if string.sub(v, 1, string.len("license:")) == "license:" then
--             license = v
--         end
--     end
--     if license then
--         local vehicles = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE license = ?', {license})
--         if vehicles then
--             for k,v in pairs(vehicles) do
--                 local playTime = financetimer[v.citizenid]
--                 if v.balance >= 1 and playTime then
--                     local newTime = math.floor(v.financetime - (((GetGameTimer() - playTime) / 1000) / 60))
--                     if newTime < 0 then newTime = 0 end
--                     MySQL.Async.execute('UPDATE player_vehicles SET financetime = ? WHERE plate = ?', {newTime, v.plate})
--                 end
--             end
--             if vehicles[1] and financetimer[vehicles[1].citizenid] then financetimer[vehicles[1].citizenid] = nil end
--         end
--     end
-- end)

-- Functions

local function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end

local function calculateFinance(vehiclePrice, downPayment, paymentamount)
    local balance = vehiclePrice - downPayment
    local vehPaymentAmount = balance / paymentamount
    return round(balance), round(vehPaymentAmount)
end

local function calculateNewFinance(paymentAmount, vehData)
    local newBalance = tonumber(vehData.balance - paymentAmount)
    local minusPayment = vehData.paymentsLeft - 1
    local newPaymentsLeft = newBalance / minusPayment
    local newPayment = newBalance / newPaymentsLeft
    return round(newBalance), round(newPayment), newPaymentsLeft
end

local function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

local function comma_value(amount)
    local formatted = amount
    while true do
      formatted, k = string.gsub(formatted, '^(-?%d+)(%d%d%d)', '%1,%2')
      if (k==0) then
        break
      end
    end
    return formatted
end

-- Callbacks

QBCore.Functions.CreateCallback('qb-vehicleshop:server:getVehicles', function(source, cb)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player then
        local vehicles = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {player.PlayerData.citizenid})
        if vehicles[1] then
            cb(vehicles)
        end
    end
end)

-- Events

-- Sync vehicle for other players
RegisterNetEvent('qb-vehicleshop:server:swapVehicle', function(data)
    local src = source
    TriggerClientEvent('qb-vehicleshop:client:swapVehicle', -1, data)
    Wait(1500) -- let new car spawn
    TriggerClientEvent('qb-vehicleshop:client:homeMenu', src) -- reopen main menu
end)

-- Send customer for test drive
RegisterNetEvent('qb-vehicleshop:server:customTestDrive', function(vehicle, playerid)
    local src = source
    local target = tonumber(playerid)
    if not QBCore.Functions.GetPlayer(target) then
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Invalid Player Id Supplied', 'error', 6000)
        return
    end
    if #(GetEntityCoords(GetPlayerPed(src))-GetEntityCoords(GetPlayerPed(target)))<3 then
        TriggerClientEvent('qb-vehicleshop:client:customTestDrive', target, vehicle)
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'This player is not close enough', 'error', 6000)
    end
end)

-- Make a finance payment
-- RegisterNetEvent('qb-vehicleshop:server:financePayment', function(paymentAmount, vehData)
--     local src = source
--     local player = QBCore.Functions.GetPlayer(src)
--     local cash = player.PlayerData.money['cash']
--     local bank = player.PlayerData.money['bank']
--     local plate = vehData.vehiclePlate
--     local paymentAmount = tonumber(paymentAmount)
--     local minPayment = tonumber(vehData.paymentAmount)
--     local timer = (Config.PaymentInterval * 60)
--     local newBalance, newPaymentsLeft, newPayment = calculateNewFinance(paymentAmount, vehData)
--     if newBalance > 0 then
--         if player and paymentAmount >= minPayment then
--             if cash >= paymentAmount then
--                 player.Functions.RemoveMoney('cash', paymentAmount)
--                 MySQL.Async.execute('UPDATE player_vehicles SET balance = ?, paymentamount = ?, paymentsleft = ?, financetime = ? WHERE plate = ?', {newBalance, newPayment, newPaymentsLeft, timer, plate})
--             elseif bank >= paymentAmount then
--                 player.Functions.RemoveMoney('bank', paymentAmount)
--                 MySQL.Async.execute('UPDATE player_vehicles SET balance = ?, paymentamount = ?, paymentsleft = ?, financetime = ? WHERE plate = ?', {newBalance, newPayment, newPaymentsLeft, timer, plate})
--             else
--                 TriggerClientEvent('Roda_Notifications:showNotification', source, 'Not enough money', 'error', 6000)
--             end
--         else
--             TriggerClientEvent('Roda_Notifications:showNotification', source, 'Minimum payment allowed is $' ..comma_value(minPayment), 'error', 6000)
--         end
--     else
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'You overpaid', 'error', 6000)
--     end
-- end)


-- Pay off vehice in full
-- RegisterNetEvent('qb-vehicleshop:server:financePaymentFull', function(data)
--     local src = source
--     local player = QBCore.Functions.GetPlayer(src)
--     local cash = player.PlayerData.money['cash']
--     local bank = player.PlayerData.money['bank']
--     local vehBalance = data.vehBalance
--     local vehPlate = data.vehPlate
--     if player and vehBalance ~= 0 then
--         if cash >= vehBalance then
--             player.Functions.RemoveMoney('cash', vehBalance)
--             MySQL.Async.execute('UPDATE player_vehicles SET balance = ?, paymentamount = ?, paymentsleft = ?, financetime = ? WHERE plate = ?', {0, 0, 0, 0, vehPlate})
--         elseif bank >= vehBalance then
--             player.Functions.RemoveMoney('bank', vehBalance)
--             MySQL.Async.execute('UPDATE player_vehicles SET balance = ?, paymentamount = ?, paymentsleft = ?, financetime = ? WHERE plate = ?', {0, 0, 0, 0, vehPlate})
--         else
--             TriggerClientEvent('Roda_Notifications:showNotification', source, 'Not enough money', 'error', 6000)
            
--         end
--     else
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'Vehicle is already paid off', 'error', 6000)
--     end
-- end)

-- Buy public vehicle outright
RegisterNetEvent('qb-vehicleshop:server:buyShowroomVehicle', function(vehicle)
    local src = source
    local vehicle = vehicle.buyVehicle
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local cash = pData.PlayerData.money['cash']
    local bank = pData.PlayerData.money['bank']
    local vehiclePrice = QBCore.Shared.Vehicles[vehicle]['price']
    local plate = GeneratePlate()
    if cash > vehiclePrice then
        MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            0
        })
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Congratulations on your purchase!', 'success', 6000)
        TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
        pData.Functions.RemoveMoney('cash', vehiclePrice, 'vehicle-bought-in-showroom')
    elseif bank > vehiclePrice then
        MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            0
        })
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Congratulations on your purchase!', 'success', 6000)
        TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
        pData.Functions.RemoveMoney('bank', vehiclePrice, 'vehicle-bought-in-showroom')
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Not enough money', 'error', 6000)
    end
end)

-- Finance public vehicle
RegisterNetEvent('qb-vehicleshop:server:financeVehicle', function(downPayment, paymentAmount, vehicle)
    local src = source
    local downPayment = tonumber(downPayment)
    local paymentAmount = tonumber(paymentAmount)
    local pData = QBCore.Functions.GetPlayer(src)
    local cid = pData.PlayerData.citizenid
    local cash = pData.PlayerData.money['cash']
    local bank = pData.PlayerData.money['bank']
    local vehiclePrice = QBCore.Shared.Vehicles[vehicle]['price']
    local timer = (Config.PaymentInterval * 60)
    local minDown = tonumber(round((Config.MinimumDown/100) * vehiclePrice))
    if downPayment > vehiclePrice then return  TriggerClientEvent('Roda_Notifications:showNotification', source, 'Vehicle is not worth that much', 'error', 6000) end
    if downPayment < minDown then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'Down payment too small', 'error', 6000) end
    if paymentAmount > Config.MaximumPayments then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'Exceeded maximum payment amount', 'error', 6000) end
    local plate = GeneratePlate()
    local balance, vehPaymentAmount = calculateFinance(vehiclePrice, downPayment, paymentAmount)
    if cash >= downPayment then
        MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, balance, paymentamount, paymentsleft, financetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            0,
            balance,
            vehPaymentAmount,
            paymentAmount,
            timer
        })
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Congratulations on your purchase! - PDM', 'success', 6000)
        TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
        pData.Functions.RemoveMoney('cash', downPayment, 'vehicle-bought-in-showroom')
    elseif bank >= downPayment then
        MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, balance, paymentamount, paymentsleft, financetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            GetHashKey(vehicle),
            '{}',
            plate,
            0,
            balance,
            vehPaymentAmount,
            paymentAmount,
            timer
        })
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Congratulations on your purchase! - PDM', 'success', 6000)
        TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
        pData.Functions.RemoveMoney('bank', downPayment, 'vehicle-bought-in-showroom')
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Not enough money', 'error', 6000)
    end
end)

-- Sell vehicle to customer
RegisterNetEvent('qb-vehicleshop:server:sellShowroomVehicle', function(data, playerid)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local target = QBCore.Functions.GetPlayer(tonumber(playerid))

    if not target then
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Invalid Player Id Supplied', 'error', 6000)
        return
    end

    if #(GetEntityCoords(GetPlayerPed(src))-GetEntityCoords(GetPlayerPed(target.PlayerData.source)))<3 then
        local cid = target.PlayerData.citizenid
        local cash = target.PlayerData.money['cash']
        local bank = target.PlayerData.money['bank']
        local vehicle = data
        local vehiclePrice = QBCore.Shared.Vehicles[vehicle]['price']
        local commission = round(vehiclePrice * Config.Commission)
        local plate = GeneratePlate()
        if cash >= vehiclePrice then
            MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                target.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                0
            })
            TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', target.PlayerData.source, vehicle, plate)
            target.Functions.RemoveMoney('cash', vehiclePrice, 'vehicle-bought-in-showroom')
            player.Functions.AddMoney('bank', commission)
            TriggerClientEvent('Roda_Notifications:showNotification', source, 'You earned $'..comma_value(commission)..' in commission', 'success', 6000)
            exports['qb-management']:AddMoney(player.PlayerData.job.name, vehiclePrice)
            TriggerClientEvent('Roda_Notifications:showNotification', target.PlayerData.source, 'Congratulations on your purchase! -PDM', 'success', 6000)
        elseif bank >= vehiclePrice then
            MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                target.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                0
            })
            TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', target.PlayerData.source, vehicle, plate)
            target.Functions.RemoveMoney('bank', vehiclePrice, 'vehicle-bought-in-showroom')
            player.Functions.AddMoney('bank', commission)
            exports['qb-management']:AddMoney(player.PlayerData.job.name, vehiclePrice)
            TriggerClientEvent('Roda_Notifications:showNotification', source, 'You earned $'..comma_value(commission)..' in commission', 'success', 6000)
            TriggerClientEvent('Roda_Notifications:showNotification', target.PlayerData.source, 'Congratulations on your purchase! -PDM', 'success', 6000)
        else
            TriggerClientEvent('Roda_Notifications:showNotification', source, 'Not enough money', 'error', 6000)
        end
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'This player is not close enough', 'error', 6000)
    end
end)

-- Finance vehicle to customer
RegisterNetEvent('qb-vehicleshop:server:sellfinanceVehicle', function(downPayment, paymentAmount, vehicle, playerid)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    local target = QBCore.Functions.GetPlayer(tonumber(playerid))

    if not target then
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'Invalid Player Id Supplied', 'error', 6000)
        return
    end

    if #(GetEntityCoords(GetPlayerPed(src))-GetEntityCoords(GetPlayerPed(target.PlayerData.source)))<3 then
        local downPayment = tonumber(downPayment)
        local paymentAmount = tonumber(paymentAmount)
        local cid = target.PlayerData.citizenid
        local cash = target.PlayerData.money['cash']
        local bank = target.PlayerData.money['bank']
        local vehiclePrice = QBCore.Shared.Vehicles[vehicle]['price']
        local timer = (Config.PaymentInterval * 60)
        local minDown = tonumber(round((Config.MinimumDown/100) * vehiclePrice))
        if downPayment > vehiclePrice then return  TriggerClientEvent('Roda_Notifications:showNotification', source, 'Vehicle is not worth that much', 'error', 6000) end
        if downPayment < minDown then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'Down payment too small', 'error', 6000) end
        if paymentAmount > Config.MaximumPayments then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'Exceeded maximum payment amount', 'error', 6000) end
        local commission = round(vehiclePrice * Config.Commission)
        local plate = GeneratePlate()
        local balance, vehPaymentAmount = calculateFinance(vehiclePrice, downPayment, paymentAmount)
        if cash >= downPayment then
            MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, balance, paymentamount, paymentsleft, financetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', {
                target.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                0,
                balance,
                vehPaymentAmount,
                paymentAmount,
                timer
            })
            TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', target.PlayerData.source, vehicle, plate)
            target.Functions.RemoveMoney('cash', downPayment, 'vehicle-bought-in-showroom')
            player.Functions.AddMoney('bank', commission)
            TriggerClientEvent('Roda_Notifications:showNotification', source, 'You earned $'..comma_value(commission)..' in commission', 'success', 6000)
            exports['qb-management']:AddMoney(player.PlayerData.job.name, vehiclePrice)
            TriggerClientEvent('Roda_Notifications:showNotification', target.PlayerData.source, 'Congratulations on your purchase! - PDM', 'success', 6000)
        elseif bank >= downPayment then
            MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, balance, paymentamount, paymentsleft, financetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', {
                target.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                0,
                balance,
                vehPaymentAmount,
                paymentAmount,
                timer
            })
            TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', target.PlayerData.source, vehicle, plate)
            target.Functions.RemoveMoney('bank', downPayment, 'vehicle-bought-in-showroom')
            player.Functions.AddMoney('bank', commission)
            TriggerClientEvent('Roda_Notifications:showNotification', source, 'You earned $'..comma_value(commission)..' in commission', 'success', 6000)
            exports['qb-management']:AddMoney(player.PlayerData.job.name, vehiclePrice)
            TriggerClientEvent('Roda_Notifications:showNotification', target.PlayerData.source, 'Congratulations on your purchase! PDM', 'success', 6000)
        else
            TriggerClientEvent('Roda_Notifications:showNotification', source, 'Not enough money', 'error', 6000)
        end
    else
        TriggerClientEvent('Roda_Notifications:showNotification', source, 'This player is not close enough', 'error', 6000)
    end
end)

-- Check if payment is due
-- RegisterNetEvent('qb-vehicleshop:server:checkFinance', function()
--     local src = source
--     local player = QBCore.Functions.GetPlayer(src)
--     local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {player.PlayerData.citizenid})
--     for k,v in pairs(result) do
--         if v.balance >= 1 and v.financetime < 1 then
--             paymentDue = true
--         end
--     end
--     if paymentDue then
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'Your vehicle payment is due within '..Config.PaymentWarning..' minutes', 'error', 6000)
--         Wait(Config.PaymentWarning * 60000)
--         MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE citizenid = ?', {player.PlayerData.citizenid}, function(vehicles)
--             for k,v in pairs(vehicles) do
--                 if v.balance >= 1 and v.financetime < 1 then
--                     local plate = v.plate
--                     MySQL.Async.execute('DELETE FROM player_vehicles WHERE plate = @plate', {['@plate'] = plate})
--                     TriggerClientEvent('Roda_Notifications:showNotification', source, 'Your vehicle with plate '..plate..' has been repossessed', 'error', 6000)
--                 end
--             end
--         end)
--     end
-- end)

-- Check if payment is due
-- RegisterNetEvent('qb-vehicleshop:server:checkFinance', function()
--     local src = source
--     local player = QBCore.Functions.GetPlayer(src)
--     local query = 'SELECT * FROM player_vehicles WHERE citizenid = ? AND balance > 0 AND financetime < 1'
--     local result = MySQL.query.await(query, {player.PlayerData.citizenid})
--     if result[1] then
--         TriggerClientEvent('QBCore:Notify', src, Lang:t('general.paymentduein', {time = Config.PaymentWarning}))
--         Wait(Config.PaymentWarning * 60000)
--         local vehicles = MySQL.query.await(query, {player.PlayerData.citizenid})
--         for _, v in pairs(vehicles) do
--             local plate = v.plate
--             MySQL.query('DELETE FROM player_vehicles WHERE plate = @plate', {['@plate'] = plate})
--             --MySQL.update('UPDATE player_vehicles SET citizenid = ? WHERE plate = ?', {'REPO-'..v.citizenid, plate}) -- Use this if you don't want them to be deleted
--             TriggerClientEvent('QBCore:Notify', src, Lang:t('error.repossessed', {plate = plate}), 'error')
--         end
--     end
-- end)

-- Transfer vehicle to player in passenger seat
-- QBCore.Commands.Add('transferVehicle', 'Gift or sell your vehicle', {{name = 'ID', help = 'ID of buyer'}, {name = 'amount', help = 'Sell amount'}}, false, function(source, args)
--     local src = source
--     local buyerId = tonumber(args[1])
--     local sellAmount = tonumber(args[2])
--     if buyerId == 0 then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'Invalid played ID', 'error', 6000) end
--     local ped = GetPlayerPed(src)
--     local targetPed = GetPlayerPed(buyerId)
--     if targetPed == 0 then return  TriggerClientEvent('Roda_Notifications:showNotification', source, 'Couldn\'t get buyer info', 'error', 6000) end
--     local vehicle = GetVehiclePedIsIn(ped, false)
--     if vehicle == 0 then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'You must be inside the vehicle that you want to transfer', 'error', 6000) end
--     local plate = QBCore.Shared.Trim(GetVehicleNumberPlateText(vehicle))
--     if not plate then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'Couldn\'t get vehicle info','error', 6000) end
--     local player = QBCore.Functions.GetPlayer(src)
--     local target = QBCore.Functions.GetPlayer(buyerId)
--     local ownerCitizenID = MySQL.Sync.fetchScalar('SELECT citizenid FROM player_vehicles WHERE plate = ?', {plate})
--     if ownerCitizenID ~= player.PlayerData.citizenid then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'You dont own this vehicle', 'error', 6000) end
--     if #(GetEntityCoords(ped) - GetEntityCoords(targetPed)) > 5.0 then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'The person you are selling is too far away!!', 'error', 6000) end
--     if not target then return TriggerClientEvent('Roda_Notifications:showNotification', source, 'Couldn\'t get buyer info', 'error', 6000) end
--     if not sellAmount then
--         local targetcid = target.PlayerData.citizenid
--         MySQL.Async.execute('UPDATE player_vehicles SET citizenid = ? WHERE plate = ?', {targetcid, plate})
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'You  gifted your vehicle', 'success', 6000)
--         TriggerClientEvent('vehiclekeys:client:SetOwner', buyerId, plate)
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'You were gifted a vehicle', 'success', 6000)
--         return
--     end
--     if target.Functions.GetMoney('cash') > sellAmount then
--         local targetcid = target.PlayerData.citizenid
--         MySQL.Async.execute('UPDATE player_vehicles SET citizenid = ? WHERE plate = ?', {targetcid, plate})
--         player.Functions.AddMoney('cash', sellAmount)
--         target.Functions.RemoveMoney('cash', sellAmount)
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'You sold your vehicle for $'..comma_value(sellAmount), 'success', 6000)
--         TriggerClientEvent('vehiclekeys:client:SetOwner', buyerId, plate)
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'You bought a vehicle for $'..comma_value(sellAmount), 'success', 6000)
--     elseif target.Functions.GetMoney('bank') > sellAmount then
--         local targetcid = target.PlayerData.citizenid
--         MySQL.Async.execute('UPDATE player_vehicles SET citizenid = ? WHERE plate = ?', {targetcid, plate})
--         player.Functions.AddMoney('bank', sellAmount)
--         target.Functions.RemoveMoney('bank', sellAmount)
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'You sold your vehicle for $'..comma_value(sellAmount), 'success', 6000)
--         TriggerClientEvent('vehiclekeys:client:SetOwner', buyerId, plate)
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'You bought a vehicle for $'..comma_value(sellAmount), 'success', 6000)
--     else
--         TriggerClientEvent('Roda_Notifications:showNotification', source, 'The buyer doesnt have enough money ', 'error', 6000)
--     end
-- end)
