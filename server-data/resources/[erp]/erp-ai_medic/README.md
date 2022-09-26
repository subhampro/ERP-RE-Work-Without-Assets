You need to add this in your qb-ambulancejob client/main.lua
```
RegisterNetEvent('hospital:client:npcHospital', function()
    print("Hello")
    local bedId = GetAvailableBed()
    print(bedId)
    if bedId then
        TriggerServerEvent("hospital:server:SendToBed", bedId, true)
    else
        QBCore.Functions.Notify(Lang:t('error.beds_taken'), "error")
    end
end)


```