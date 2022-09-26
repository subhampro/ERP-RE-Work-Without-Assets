local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-drugs:server:cornerselling:getAvailableDrugs', function(source, cb)
    local AvailableDrugs = {}
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        for i = 1, #Config.CornerSellingDrugsList, 1 do
            local item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

            if item ~= nil then
                AvailableDrugs[#AvailableDrugs+1] = {
                    item = item.name,
                    amount = item.amount,
                    label = QBCore.Shared.Items[item.name]["label"]
                }
            end
        end
        if next(AvailableDrugs) ~= nil then
            cb(AvailableDrugs)
        else
            cb(nil)
        end
    end
end)

RegisterNetEvent('qb-drugs:server:sellCornerDrugs', function(item, amount, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local hasItem = Player.Functions.GetItemByName(item)
        local AvailableDrugs = {}
        if hasItem.amount >= amount then
            TriggerClientEvent('QBCore:Notify', src, Lang:t("success.offer_accepted"), 'success')
            TriggerEvent("qb-log:server:CreateLog", "drugsales", "Sell Drugs Succesfully", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
            Player.Functions.RemoveItem(item, amount)
            Player.Functions.AddMoney('cash', price, "sold-cornerdrugs")
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
            for i = 1, #Config.CornerSellingDrugsList, 1 do
                item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])

                if item ~= nil then
                    AvailableDrugs[#AvailableDrugs+1] = {
                        item = item.name,
                        amount = item.amount,
                        label = QBCore.Shared.Items[item.name]["label"]
                    }
                end
            end
            TriggerClientEvent('qb-drugs:client:refreshAvailableDrugs', src, AvailableDrugs)
            TriggerEvent("qb-log:server:CreateLog", "drugsales", "Try to Sell Drugs ! Dont Have Enough Drugs", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")
        else
            TriggerClientEvent('qb-drugs:client:cornerselling', src)
        end
    end
end)

RegisterNetEvent('qb-drugs:server:robCornerDrugs', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local AvailableDrugs = {}
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
        for i = 1, #Config.CornerSellingDrugsList, 1 do
            item = Player.Functions.GetItemByName(Config.CornerSellingDrugsList[i])
            if item then
                AvailableDrugs[#AvailableDrugs+1] = {
                    item = item.name,
                    amount = item.amount,
                    label = QBCore.Shared.Items[item.name]["label"]
                }
            end
        end
        TriggerClientEvent('qb-drugs:client:refreshAvailableDrugs', src, AvailableDrugs)
    end
end)