local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("bodycam", function(source)
    TriggerClientEvent("BodyCam:Toggle", source)
end)

RegisterNetEvent('bodycam:getClock', function(data)
    local time = os.date("*t")
    TriggerClientEvent('bodycam:getClock_c', source, time)
end)