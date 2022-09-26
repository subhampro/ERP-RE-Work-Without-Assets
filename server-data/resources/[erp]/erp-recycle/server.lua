local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then 
		for k, v in pairs(Config.Prices) do if not QBCore.Shared.Items[k] then print("Missing Item from QBCore.Shared.Items: '"..k.."'") end end
		if not QBCore.Shared.Items["recyclablematerial"] then print("Missing Item from QBCore.Shared.Items: 'recyclablematerial'") end		
	end
end)

--- Event For Getting Recyclable Material----
RegisterServerEvent("erp-recycle:getrecyclablematerial", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = math.random(4, 6)
    Player.Functions.AddItem("recyclablematerial", amount, false, {["quality"] = nil})
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'add', amount)
    Citizen.Wait(500)
end)

RegisterServerEvent("erp-recycle:TradeItems", function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local randItem = ""
	local amount = 0
	if data == 1 then
		if Player.Functions.GetItemByName('recyclablematerial') ~= nil and Player.Functions.GetItemByName('recyclablematerial').amount >= 10 then
			Player.Functions.RemoveItem("recyclablematerial", 10)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'remove', 10)
			Citizen.Wait(1000)
			for i = 1, 3 do
				randItem = Config.TradeTable[math.random(1, #Config.TradeTable)]
				amount = math.random(Config.tenmin, Config.tenmax)
				Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
			end
		else
			TriggerClientEvent('Roda_Notifications:showNotification', source, "You Don't Have Enough Items", 'error', 6000)
		end
	elseif data == 2 then
		if Player.Functions.GetItemByName('recyclablematerial') ~= nil and Player.Functions.GetItemByName('recyclablematerial').amount >= 100 then
			Player.Functions.RemoveItem("recyclablematerial", "100")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["recyclablematerial"], 'remove', 100)
			Citizen.Wait(500)
			for i = 1, 8 do
				randItem = Config.TradeTable[math.random(1, #Config.TradeTable)]
				amount = math.random(Config.bulkmin, Config.bulkmax)
				Player.Functions.AddItem(randItem, amount, false, {["quality"] = nil})
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randItem], 'add', amount)
				Citizen.Wait(500)
			end
		else
			TriggerClientEvent('Roda_Notifications:showNotification', source, "You Don't Have Enough Items", 'error', 6000)
		end
    end
end)



