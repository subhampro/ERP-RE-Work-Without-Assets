QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('erp-fishing:server:RemoveBait', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = Player.Functions.GetItemByName('fishingbait')
    if not Player then return end
    if Player.Functions.RemoveItem('fishingbait', 1) then
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['fishingbait'], 'remove', 1)
    end
end)

RegisterNetEvent('erp-fishing:server:ReceiveFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = Player.Functions.GetItemByName(item)
    if not Player then return end

    local random = math.random(1, 100) -- Random number from 1 to 100
    local item

    if random >= 1 and random <= 45 then -- 45%
        item = 'fish'
    elseif random >= 45 and random <= 55 then -- 10%
        item = 'fish2'
    elseif random >= 55 and random <= 60 then -- 5%
        item = 'catfish'
    elseif random >= 60 and random <= 65 then -- 5%
        item = 'goldfish'
    elseif random >= 65 and random <= 70 then -- 5%
        item = 'largemouthbass'
    elseif random >= 70 and random <= 75 then -- 5%
        item = 'redfish'
    elseif random >= 75 and random <= 80 then -- 5%
        item = 'salmon'
    elseif random >= 80 and random <= 85 then -- 5%
        item = 'stingray'
    elseif random >= 85 and random <= 90 then -- 5%
        item = 'stripedbass'
    elseif random >= 90 and random <= 95 then -- 5%
        item = 'whale'
    elseif random >= 95 and random <= 100 then -- 5%
        item = 'whale2'
    end

    if Player.Functions.AddItem(item, 1) then
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[item], 'add', 1)
        TriggerEvent('qb-log:server:CreateLog', 'fishing', 'Received Fish', 'blue', "**"..Player.PlayerData.name .. " (citizenid: "..Player.PlayerData.citizenid.." | id: "..Player.PlayerData.source..")** received 1x "..QBCore.Shared.Items[item].label)
    else
        TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Your inventory is full already..', 'error', 2500)
    end
end)

QBCore.Functions.CreateUseableItem('fishingrod', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not Player.Functions.GetItemByName('fishingrod') then return end
    TriggerClientEvent('erp-fishing:client:FishingRod', src)
end)
