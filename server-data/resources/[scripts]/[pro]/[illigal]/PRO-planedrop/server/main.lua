local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-wepdrop:server:recieveItems", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    local chance2 = math.random(1, 100)
    if Player then
        if chance >= 0 and chance <= 49 then
            if chance2 < 50 then
                Player.Functions.AddItem(Config.PistolTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward1], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get 8xPisttol Ammo At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.PistolTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward1], 'add')
                Player.Functions.AddItem(Config.PistolTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward1], 'add')
                Player.Functions.AddItem(Config.PistolTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward1], 'add')
                Player.Functions.AddItem(Config.PistolTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward1], 'add')
                Player.Functions.AddItem(Config.PistolTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward1], 'add')
                Player.Functions.AddItem(Config.PistolTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward1], 'add')
                Player.Functions.AddItem(Config.PistolTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward1], 'add')
                Player.Functions.AddItem(Config.StoneTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward1], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Aqua Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.StoneTierReward2, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward2], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Soul Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
            elseif chance2 >= 50 then
                Player.Functions.AddItem(Config.PistolTierReward2, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward2], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Walther P99 At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                -- Player.Functions.AddItem(Config.PistolTierReward2, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward2], 'add')
                -- Player.Functions.AddItem(Config.PistolTierReward2, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward2], 'add')
                -- Player.Functions.AddItem(Config.PistolTierReward2, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PistolTierReward2], 'add')
                Player.Functions.AddItem(Config.StoneTierReward3, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward3], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Power Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.StoneTierReward4, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward4], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Time Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")

            end
        elseif chance >= 50 and chance <= 79 then
            if chance2 < 50 then
                Player.Functions.AddItem(Config.SmgTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SmgTierReward1], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get ARMOR x 4 At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.SmgTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SmgTierReward1], 'add')
                Player.Functions.AddItem(Config.SmgTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SmgTierReward1], 'add')
                Player.Functions.AddItem(Config.SmgTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SmgTierReward1], 'add')
                Player.Functions.AddItem(Config.StoneTierReward5, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward5], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Space Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.StoneTierReward6, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward6], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Fire Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")

            elseif chance2 >= 50 then
                Player.Functions.AddItem(Config.SmgTierReward2, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SmgTierReward2], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Vintage Pistol At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.StoneTierReward7, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward7], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Light Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")

                -- Player.Functions.AddItem(Config.SmgTierReward2, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SmgTierReward2], 'add')
                -- Player.Functions.AddItem(Config.SmgTierReward2, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SmgTierReward2], 'add')
                -- Player.Functions.AddItem(Config.SmgTierReward2, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.SmgTierReward2], 'add')
            end
        elseif chance >= 80 and chance <= 100 then
            if chance2 < 50 then
                Player.Functions.AddItem(Config.ARTierReward1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ARTierReward1], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get HEAVY PISTOL At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.StoneTierReward8, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward8], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Tanzanite Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")

                -- Player.Functions.AddItem(Config.ARTierReward1, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ARTierReward1], 'add')
                -- Player.Functions.AddItem(Config.ARTierReward1, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ARTierReward1], 'add')
                -- Player.Functions.AddItem(Config.ARTierReward1, 1)
                -- TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ARTierReward1], 'add')
            elseif chance2 >= 50 then
                Player.Functions.AddItem(Config.ARTierReward2, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ARTierReward2], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get ARMOR x 4 At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.ARTierReward2, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ARTierReward2], 'add')
                Player.Functions.AddItem(Config.ARTierReward2, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ARTierReward2], 'add')
                Player.Functions.AddItem(Config.ARTierReward2, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ARTierReward2], 'add')
                Player.Functions.AddItem(Config.StoneTierReward5, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward5], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Space Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem(Config.StoneTierReward6, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StoneTierReward6], 'add')
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "Player Get Fire Stone At Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")

            end
        end
    end
end)

RegisterServerEvent('qb-wepdrop:server:getDropPhone', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if Player.Functions.GetItemByName('emptydropphone') then
            if Player.Functions.GetMoney('cash') >= Config.DropPhonePrice then
                Player.Functions.RemoveItem('emptydropphone', 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['emptydropphone'], 'remove')
                Player.Functions.RemoveMoney('cash', Config.DropPhonePrice)
                TriggerEvent("qb-log:server:CreateLog", "gundrop", "DropPhone Added", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
                Player.Functions.AddItem('dropphone', 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dropphone'], 'add')
            else
                TriggerClientEvent('QBCore:Notify', src, 'You don\'t have enough money!', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'You don\'t have the EmptyDropPhone!', 'error')
        end
    end
end)

RegisterServerEvent('drop:server:startCooldown', function()
    local src = source
    TriggerClientEvent('drop:client:dropFalse', -1)
    SetTimeout(Config.GlobalCooldown * (60 * 1000), function()
        TriggerClientEvent('drop:client:dropTrue', -1)
    end)
end)

QBCore.Functions.CreateCallback('qb-wepdrop:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then 
            if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
                amount = amount + 1
            end
        end
	end
	cb(amount)
end)

QBCore.Functions.CreateUseableItem("dropphone", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("qb-wepdrop:client:CreateDrop", src, true, 400)
    end
end)