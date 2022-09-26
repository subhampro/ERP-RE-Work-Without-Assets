local QBCore = exports['qb-core']:GetCoreObject()
local hasShot = false
local ignoreShooting = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ped = PlayerPedId()
        if IsPedShooting(ped) then
            local currentWeapon = GetSelectedPedWeapon(ped)
            for _,k in pairs(Config.weaponChecklist) do
                if currentWeapon == k then
                    ignoreShooting = true
                    break
                end
            end
            
            if not ignoreShooting then
                TriggerServerEvent('GSR:SetGSR', timer)
                hasShot = true
                ignoreShooting = false
                Citizen.Wait(Config.gsrUpdate)
            end
			ignoreShooting = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if Config.waterClean and hasShot then
            ped = PlayerPedId()
            if IsEntityInWater(ped) then
                QBCore.Functions.Notify("The Gun Powder is being Cleaned... Stay in water")
                Wait(100)
                QBCore.Functions.Progressbar("gsrtest", "Washing Off Gun Powder", Config.waterCleanTime, false, false, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {}, {}, {}, function() -- Done
            		if IsEntityInWater(ped) then
                    	hasShot = false
                    	TriggerServerEvent('GSR:Remove')
                        QBCore.Functions.Notify("You washed off all the Gun Powder in the water","success")
                    else
                        QBCore.Functions.Notify("You left the water too early and did not wash off the Gun Powder.", "error")
                    end
                end)
				Citizen.Wait(Config.waterCleanTime)
            end
        end
    end
end)

function status()
    if hasShot then
        QBCore.Functions.TriggerCallback('GSR:Status', function(cb)
            if not cb then
                hasShot = false
            end
        end)
    end
end

function updateStatus()
    status()
    SetTimeout(Config.gsrUpdateStatus, updateStatus)
end

updateStatus()
