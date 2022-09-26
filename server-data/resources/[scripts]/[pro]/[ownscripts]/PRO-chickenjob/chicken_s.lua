local QBCore = exports['qb-core']:GetCoreObject()
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('PRO-chickenjob:getNewChicken')
AddEventHandler('PRO-chickenjob:getNewChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)


      if TriggerClientEvent("QBCore:Notify", src, "You Received 3 Alive chicken!", "Success", 8000) then
          Player.Functions.AddItem('alivechicken', 3)
          TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['alivechicken'], "add")
      end
end)

RegisterServerEvent('PRO-chickenjob:getcutChicken')
AddEventHandler('PRO-chickenjob:getcutChicken', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('alivechicken')

	if Item.amount >= 1 then
		Player.Functions.RemoveItem('alivechicken', 1)---
		Player.Functions.AddItem('slaughteredchicken', 1)--
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['alivechicken'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['slaughteredchicken'], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, 'You don\'t have Alive Chicken in YOur Inventory', "error") 
	end


end)

-- RegisterServerEvent('PRO-chickenjob:getcutChicken')
-- AddEventHandler('PRO-chickenjob:getcutChicken', function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)


--       if TriggerClientEvent("QBCore:Notify", src, "Well! You slaughtered chicken.", "Success", 8000) then
--           Player.Functions.RemoveItem('alivechicken', 1)
--           Player.Functions.AddItem('slaughteredchicken', 1)
--           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['alivechicken'], "remove")
--           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['slaughteredchicken'], "add")
--       end
-- end)

RegisterServerEvent('PRO-chickenjob:startChicken')
AddEventHandler('PRO-chickenjob:startChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

      if TriggerClientEvent("QBCore:Notify", src, "You Paid $100!", "Success", 8000) then
        Player.Functions.RemoveMoney('bank', 100)
          
      end
end)

RegisterServerEvent('PRO-chickenjob:getpackedChicken')
AddEventHandler('PRO-chickenjob:getpackedChicken', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('slaughteredchicken')

	if Item.amount >= 1 then
		Player.Functions.RemoveItem('slaughteredchicken', 1)---
		Player.Functions.AddItem('packagedchicken', 1)--
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['slaughteredchicken'], "remove")
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['packagedchicken'], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, 'You don\'t have Slaughteredchicken in YOur Inventory', "error") 
	end


end)

-- RegisterServerEvent('PRO-chickenjob:getpackedChicken')
-- AddEventHandler('PRO-chickenjob:getpackedChicken', function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
  

--       if TriggerClientEvent("QBCore:Notify", src, "You Packed Slaughtered chicken .", "Success", 8000) then
--           Player.Functions.RemoveItem('slaughteredchicken', 1)
--           Player.Functions.AddItem('packagedchicken', 1)
--           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['slaughteredchicken'], "remove")
--           TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['packagedchicken'], "add")
--       end
-- end)


local ItemList = {
    ["packagedchicken"] = math.random(500, 550),
}


RegisterServerEvent('PRO-chickenjob:sell')
AddEventHandler('PRO-chickenjob:sell', function()
    local src = source
    local price = 0
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price + (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                end
            end
        end
        Player.Functions.AddMoney("cash", price, "sold-items")
        TriggerClientEvent('QBCore:Notify', src, "You have sold your items")
    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have items")
    end
end)


