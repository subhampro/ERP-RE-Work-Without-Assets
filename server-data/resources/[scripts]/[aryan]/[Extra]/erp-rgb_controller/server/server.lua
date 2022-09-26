local QBCore = exports["qb-core"]:GetCoreObject()

QBCore.Functions.CreateUseableItem("rgb_controller", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("erp-rgb_controller:client:OpenController", src, item.name)
    end
end)