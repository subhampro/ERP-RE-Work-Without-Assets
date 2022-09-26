local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('erp-backpacStore:server:UpdateShopItems', function(shop, itemData, amount)
    Config.Locations[shop]["products"][itemData.slot].amount = Config.Locations[shop]["products"][itemData.slot].amount - amount
    if Config.Locations[shop]["products"][itemData.slot].amount <= 0 then
        Config.Locations[shop]["products"][itemData.slot].amount = 0
    end
    TriggerClientEvent('erp-backpacStore:client:SetShopItems', -1, shop, Config.Locations[shop]["products"])
end)

