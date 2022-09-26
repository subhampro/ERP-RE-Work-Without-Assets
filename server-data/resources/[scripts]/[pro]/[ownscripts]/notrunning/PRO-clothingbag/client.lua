local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('PRO-clothingbag:client:PousarMala', function()
    QBCore.Functions.Progressbar('name_here', 'PUTTING BAG ON FLOOR...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerEvent('PRO-clothingbag:client:SpawnMala')
    end)
end)

RegisterNetEvent('PRO-clothingbag:client:SpawnMala', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = `prop_big_bag_01`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityAsMissionEntity(obj)

    Wait(500)

    TriggerEvent('PRO-clothingbag:client:AbrirMala', obj)
end)

RegisterNetEvent('PRO-clothingbag:client:AbrirMala', function(obj)
    QBCore.Functions.Progressbar('name_here', 'OPENING BAG...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        anim = 'machinic_loop_mechandplayer',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerEvent('PRO-clothingbag:client:ProgressDespawnMala', obj)
    end)
end)

RegisterNetEvent('PRO-clothing:client:AbrirMenu', function()
    if Config.ClothingMenu == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:openOutfitMenu')
    elseif Config.ClothingMenu == 'fivem-appearance' then
        TriggerEvent('fivem-appearance:pickNewOutfit')
    end
end)

RegisterNetEvent('PRO-clothingbag:client:ProgressDespawnMala', function(obj)
    QBCore.Functions.Progressbar('name_here', 'TAKING CLOTHES FROM BAG...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()

        Wait(500)

        QBCore.Functions.Progressbar('name_here', 'PICKING UP BAG...', 2000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'random@domestic',
            anim = 'pickup_low',
            flags = 16,
        }, {}, {}, function()
            TriggerEvent('PRO-clothingbag:client:DespawnMala', obj)
        end)
    end)
end)

RegisterNetEvent('PRO-clothingbag:client:DespawnMala', function(obj)
    DeleteObject(obj)
    TriggerServerEvent('PRO-clothingbag:server:RemoverMala')
    TriggerEvent('PRO-clothing:client:AbrirMenu')
end)
