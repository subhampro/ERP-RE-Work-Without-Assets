local QBCore = exports['qb-core']:GetCoreObject()

-- Code

Citizen.CreateThread(function()
    Config.Currentcms_warehouse = math.random(1, #Config.Locations["cms_warehouse"])
end)

QBCore.Functions.CreateCallback('erp-cms_warehouse:server:GetData', function(source, cb)
    local cms_warehouseData = {
        Currentcms_warehouse = Config.Currentcms_warehouse
    }
    cb(cms_warehouseData)
end)

QBCore.Functions.CreateUseableItem("storekey", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local LabKey = item.info.lab ~= nil and item.info.lab or 1

    TriggerClientEvent('erp-cms_warehouse:client:Usecms_warehouseKey', source, LabKey)
end)

function GenerateRandomcms_warehouse()
    local cms_warehouse = math.random(1, #Config.Locations["cms_warehouse"])
    return cms_warehouse
end

