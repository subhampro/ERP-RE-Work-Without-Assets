QBCore = exports["qb-core"]:GetCoreObject()


QBCore.Functions.CreateUseableItem('smallbox', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("erp-farming:client:CreateSmallBox", source, item.info.smallboxid)
    end
end)

QBCore.Functions.CreateUseableItem('medbox', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("erp-farming:client:CreateMedBox", source, item.info.medboxid)
    end
end)

QBCore.Functions.CreateUseableItem('bigbox', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("erp-farming:client:CreateBigBox", source, item.info.bigboxid)
    end
end)