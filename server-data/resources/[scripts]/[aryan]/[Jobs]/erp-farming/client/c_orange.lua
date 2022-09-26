QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('erp-farming:client:PickOrange', function()
	
    if Config.New_Core then 
        local fruit_picker = QBCore.Functions.HasItem('fruit_picker')
  
        if fruit_picker then
            TriggerEvent('dpemote:custom:animation', {"mechanic5"})
            QBCore.Functions.Progressbar("get_item",'Picking Oranges', Config["ProgressBarTime"]["Harvest"], false, true, {
                disableMovement = false,
                disableCarMovement = false,
		        disableMouse = false,
		        disableCombat = true,
            }, {}, {}, {}, function()
            TriggerEvent('dpemote:custom:animation', {"c"})
            TriggerServerEvent('erp-farming:server:GetOrange')
            end, function()
                TriggerEvent('dpemote:custom:animation', {"c"})    
            end)
        else
            QBCore.Functions.Notify(Lang:t('error.dont_have_picker'), 'error')
        end
    else
        TriggerEvent('dpemote:custom:animation', {"mechanic5"})
        QBCore.Functions.Progressbar("get_item",'Picking Oranges', Config["ProgressBarTime"]["Harvest"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
        TriggerEvent('dpemote:custom:animation', {"c"})
        TriggerServerEvent('erp-farming:server:GetOrange')
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    end
end)


