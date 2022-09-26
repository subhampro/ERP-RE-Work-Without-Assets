RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent("lambra-antiCL:server:registerCitizen")
end)

function loadClothes(clothes, ped)
    TriggerEvent('qb-clothing:client:loadPlayerClothing', clothes, ped)
end