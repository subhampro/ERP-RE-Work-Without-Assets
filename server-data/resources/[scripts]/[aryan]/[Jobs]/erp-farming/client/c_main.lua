QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('erp-farming:client:GeneralMenu')
AddEventHandler('erp-farming:client:GeneralMenu', function()
    
	exports[Config.Menu]:openMenu({
        {
            header = Lang:t('menu.main_header'),
            isMenuHeader = true
        },
		{
            header = Lang:t('menu.farm_store'),
            txt = "Buy products for farming!",
            params = {
                event = "erp-farming:FarmingStore",
            }
        },
		{
            header = Lang:t('menu.rent_veh'),
			txt = "Rent a tractor for ez",
            params = {
                event = "erp-farming:client:SpawnTrator",
            }
        },  
        {
            header = Lang:t('menu.return_veh'),
			txt = "Return your tractor",
            params = {
                event = "erp-farming:client:ReturnVeh",
            }
        }, 
        {
            header = Lang:t('menu.upgrade_kit'),
			txt = "Upgrade your Farming Kit",
            params = {
                event = "erp-farming:client:UpgradeKit",
            }
        }, 
        {
            header = Lang:t('menu.close_menu'),
            txt = "",
            params = {
                event = "closeMenu"
            }
        },
    })
end)

--//Grapeseed Veh Spawn
RegisterNetEvent('erp-farming:client:SpawnTrator', function(data)
   
    local grapeseedcoords = vector4(2311.79, 4890.34, 41.93, 43.57)
    
	if IsAnyVehicleNearPoint(2311.79, 4890.34, 41.93, 3.5) then
        QBCore.Functions.Notify(Lang:t('error.veh_spawn_block'), 'error')
    else
	    QBCore.Functions.SpawnVehicle('tractor2', function(veh)
            SetVehicleNumberPlateText(veh, 'FARM'..tostring(math.random(1000, 9999)))
            SetEntityHeading(veh, grapeseedcoords.w)
            exports[Config.Fuel]:SetFuel(veh, 100.0)
		    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
		    SetVehicleEngineOn(veh, true, true)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        end, grapeseedcoords, true)
	end
end)

--//Vehicle Delete
RegisterNetEvent('erp-farming:client:ReturnVeh', function()
    local inVehicle = IsPedInAnyVehicle(PlayerPedId())

	if inVehicle then
		DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
	else
		QBCore.Functions.Notify('You are not in a vehicle', 'error')	
    end
end)

--//Open Store
RegisterNetEvent('erp-farming:FarmingStore', function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "Farming_Store", Config.Items)
end)


