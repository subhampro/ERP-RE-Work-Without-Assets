
local inpaintballmatch = false

RegisterNetEvent("Pug:client:InPaintBallMatchWL")
AddEventHandler("Pug:client:InPaintBallMatchWL", function() -- put this in you police calls for not recieving shots fired while playing paintball
    inpaintballmatch = true
end)

RegisterNetEvent("Pug:client:InPaintBallMatchWLFalse")
AddEventHandler("Pug:client:InPaintBallMatchWLFalse", function() -- put this in you police calls for recieving shots fired again after exiting paintball
    inpaintballmatch = false
end)
CreateThread(function()
	local vehicleWhitelist = {[0]=true,[1]=true,[2]=true,[3]=true,[4]=true,[5]=true,[6]=true,[7]=true,[8]=true,[9]=true,[10]=true,[11]=true,[12]=true,[17]=true,[19]=true,[20]=true}
	local sleep = 100
	while true do
        playerPed = PlayerPedId()
        if (not isPlayerWhitelisted or Config.Debug) then
            for k, v in pairs(Config.Timer) do
                if v > 0 then Config.Timer[k] = v - 1 end
            end
            if GetVehiclePedIsUsing(playerPed) ~= 0 then
                local vehicle = GetVehiclePedIsUsing(playerPed, true)
                    if vehicleWhitelist[GetVehicleClass(vehicle)] then
                        local driver = GetPedInVehicleSeat(vehicle, -1)
                        if Config.Timer['Shooting'] == 0 and not BlacklistedWeapon(playerPed) and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) then
                            sleep = 10
                            if IsPedShooting(playerPed) then
                                local vehicle = vehicleData(vehicle)
                                exports['qb-dispatch']:VehicleShooting(vehicle)
                                Config.Timer['Shooting'] = Config.Shooting.Success
                            else
                                Config.Timer['Shooting'] = Config.Shooting.Fail
                            end
                        elseif Config.Timer['Speeding'] == 0 and playerPed == driver then
                            sleep = 150
                            if (GetEntitySpeed(vehicle) * 3.6) >= (160 + (math.random(30,60))) then
                                Wait(400)
                                if IsPedInAnyVehicle(playerPed, true) and ((GetEntitySpeed(vehicle) * 3.6) >= 160) then
                                    local vehicle = vehicleData(vehicle)
                                    exports['qb-dispatch']:SpeedingVehicle(vehicle)
                                    Config.Timer['Speeding'] = Config.Speeding.Success
                                end
                            else
                                Config.Timer['Speeding'] = Config.Speeding.Fail
                            end
                        else 
                            sleep = 100 
                        end
                end
            else
                if Config.Timer['Shooting'] == 0  and not IsPedCurrentWeaponSilenced(playerPed) and IsPedArmed(playerPed, 4) then
                    if not inpaintballmatch then
                        sleep = 10
                        if IsPedShooting(playerPed) and not BlacklistedWeapon(playerPed) then
                            exports['qb-dispatch']:Shooting()
                            Config.Timer['Shooting'] = Config.Shooting.Success
                        else
                            Config.Timer['Shooting'] = Config.Shooting.Fail
                        end
                    end
                elseif Config.Timer['Melee'] == 0 and IsPedInMeleeCombat(playerPed) and HasPedBeenDamagedByWeapon(GetMeleeTargetForPed(playerPed), 0, 1) then
                    sleep = 50
                    exports['qb-dispatch']:Fight()
                    Config.Timer['Melee'] = Config.Melee.Success
                else sleep = 10 end
            end
        end
		Wait(sleep)
	end
end)