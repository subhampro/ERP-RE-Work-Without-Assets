local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.General.PolesModels, {
        options = {
            {
                event = 'erp-robwire:server:searchpoles',
                type = 'server',
                icon = "fa-solid fa-utility-pole",
                label = Lang:t('info.rob'),
            },
        },
        distance = Config.General.SearchDistance,
    })
end)

RegisterNetEvent('erp-robwire:client:searchpoles', function(poleId)
    QBCore.Functions.Progressbar('erp-robwire:robbingpoles', Lang:t("progressbar.robbing"), Config.General.DurationOfSearch, false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        TriggerEvent('dpemote:custom:animation', {"mechanic4"})
    }, {}, {}, function() -- Play When Done
        -- Clear ped task
        ClearPedTasks(PlayerPedId())

        TriggerServerEvent('erp-robwire:server:robedPole', poleId)

        -- Add stress
        if Config.Stress.AddStress then
            TriggerServerEvent('hud:server:GainStress', math.random(Config.Stress.MinStress, Config.Stress.MaxStress))
        end
    end, function() -- Play When Cancel
        -- Clear ped task
        ClearPedTasks(PlayerPedId())
    end)
end)