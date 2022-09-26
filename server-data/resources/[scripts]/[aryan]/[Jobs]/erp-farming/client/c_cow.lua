QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('erp-farming:client:CollectRawMilk', function()
	
    if Config.New_Core then 
        local milk_container = QBCore.Functions.HasItem('milk_container')
  
        if milk_container then
            TriggerEvent('dpemote:custom:animation', {"mechanic4"})
            QBCore.Functions.Progressbar("get_item",'Collecting Milk...', Config["ProgressBarTime"]["Harvest"], false, true, {
                disableMovement = false,
                disableCarMovement = false,
		        disableMouse = false,
		        disableCombat = true,
            }, {}, {}, {}, function()
            TriggerEvent('dpemote:custom:animation', {"c"})
            TriggerServerEvent('erp-farming:server:GetRawMilk')
            end, function()
                TriggerEvent('dpemote:custom:animation', {"c"})    
            end)
        else
            QBCore.Functions.Notify(Lang:t('error.dont_have_container'), 'error')
        end
    else
        TriggerEvent('dpemote:custom:animation', {"mechanic4"})
        QBCore.Functions.Progressbar("get_item",'Collecting Milk...', Config["ProgressBarTime"]["Harvest"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
        TriggerEvent('dpemote:custom:animation', {"c"})
        TriggerServerEvent('erp-farming:server:GetRawMilk')
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    end
end)


CreateThread(function()
    RequestModel( GetHashKey( "a_c_cow" ) )
    while ( not HasModelLoaded( GetHashKey( "a_c_cow" ) ) ) do
        Wait( 1 )
    end
    pedcow1 = CreatePed(1, 0xFCFA9E1E, Config.LocationCow1, 233.01, false, true) 
    pedcow2 = CreatePed(1, 0xFCFA9E1E, Config.LocationCow2, 233.01, false, true)
    pedcow3 = CreatePed(1, 0xFCFA9E1E, Config.LocationCow3, 233.01, false, true)
    pedcow4 = CreatePed(1, 0xFCFA9E1E, Config.LocationCow4, 233.01, false, true)
    pedcow5 = CreatePed(1, 0xFCFA9E1E, Config.LocationCow5, 44.51, false, true)
    pedcow6 = CreatePed(1, 0xFCFA9E1E, Config.LocationCow6, 44.51, false, true)
    pedcow7 = CreatePed(1, 0xFCFA9E1E, Config.LocationCow7, 44.51, false, true)
    pedcow8 = CreatePed(1, 0xFCFA9E1E, Config.LocationCow8, 44.51, false, true)
end)


