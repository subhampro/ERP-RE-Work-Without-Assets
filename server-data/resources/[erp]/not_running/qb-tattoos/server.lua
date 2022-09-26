QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-tattoos:GetPlayerTattoos', function(source, cb)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)

	if xPlayer then
		local db = MySQL.Sync.fetchAll('SELECT tattoos FROM players WHERE citizenid = ?', {xPlayer.PlayerData.citizenid})
    	if db ~= nil then
			if db[1] ~= nil then
				if db[1].tattoos then
					cb(json.decode(db[1].tattoos))
				else
					cb()
				end
			end
		end
	else
		cb()
	end
end)

QBCore.Functions.CreateCallback('qb-tattoos:GetPlayerTattoosMC', function(source, cb, citizenid)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	local db = MySQL.Sync.fetchAll('SELECT tattoos FROM players WHERE citizenid = ?', {citizenid})
    if db ~= nil then
		if db[1].tattoos then
			cb(json.decode(db[1].tattoos))
		else
			cb()
		end
	end
end)

QBCore.Functions.CreateCallback('qb-tattoos:PurchaseTattoo', function(source, cb, tattooList, price, tattoo, tattooName)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)

	if xPlayer.PlayerData.money.cash >= price then
		xPlayer.Functions.RemoveMoney('cash', price, "tattoo-shop")
		table.insert(tattooList, tattoo)
		
		MySQL.Async.execute('UPDATE players SET tattoos = ? WHERE citizenid = ?', {json.encode(tattooList), xPlayer.PlayerData.citizenid})

		TriggerClientEvent('QBCore:Notify', src, "You have the tattoo " .. tattooName .. " bought for $" .. price, 'success', 3500)
		cb(true)
	elseif xPlayer.PlayerData.money.bank >= price then
		xPlayer.Functions.RemoveMoney('bank', price, "tattoo-shop")
		table.insert(tattooList, tattoo)
		MySQL.Async.execute('UPDATE players SET tattoos = ? WHERE citizenid = ?', {json.encode(tattooList), xPlayer.PlayerData.citizenid})

		TriggerClientEvent('QBCore:Notify', src, "You have the tattoo " .. tattooName .. " bought for $" .. price, 'success', 3500)
		cb(true)
	else
		TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money for this tattoo.', 'error', 3500)
		cb(false)
	end
end)

RegisterServerEvent('qb-tattoos:RemoveTattoo')
AddEventHandler('qb-tattoos:RemoveTattoo', function (tattooList)
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	MySQL.Async.execute('UPDATE players SET tattoos = ? WHERE citizenid = ?', {json.encode(tattooList), xPlayer.PlayerData.citizenid})
end)