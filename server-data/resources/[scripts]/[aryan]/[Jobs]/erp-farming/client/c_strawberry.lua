QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('erp-farming:client:HarvestStrawberry', function()
	
    if Config.New_Core then 
        local trowel = QBCore.Functions.HasItem('trowel')
  
        if trowel then
            TriggerEvent('dpemote:custom:animation', {"garden"})
            QBCore.Functions.Progressbar("get_item",'Harvesting Strawberries...', Config["ProgressBarTime"]["Harvest"], false, true, {
                disableMovement = false,
                disableCarMovement = false,
		        disableMouse = false,
		        disableCombat = true,
            }, {}, {}, {}, function()
                TriggerEvent('dpemote:custom:animation', {"c"})
                TriggerServerEvent('erp-farming:server:GetStrawberry')
            end, function()
                TriggerEvent('dpemote:custom:animation', {"c"})    
            end)
        else
            QBCore.Functions.Notify(Lang:t('error.dont_have_trowel'), 'error')
        end
    else
        TriggerEvent('dpemote:custom:animation', {"garden"})
        QBCore.Functions.Progressbar("get_item",'Harvesting Strawberries...', Config["ProgressBarTime"]["Harvest"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('dpemote:custom:animation', {"c"})
            TriggerServerEvent('erp-farming:server:GetStrawberry')
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    end
end)


