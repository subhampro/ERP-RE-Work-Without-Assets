local QBCore = exports['qb-core']:GetCoreObject()
local plate = nil
local oldplate = ""
local sexy = nil


RegisterNetEvent('PRO-plate')
AddEventHandler('PRO-plate', function()
  ChaneP()
end)

function ChaneP()
  oldplate = GetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()))
  SetNuiFocus(true, true)
  SendNUIMessage({
    action = "open"
  })
end

function ChaneA()
  if plate ~= nil then
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    if IsPedInVehicle(PlayerPedId(), vehicle, false) then
      QBCore.Functions.TriggerCallback('PRO-plate:update', function(cb)
        if cb == 'found' then
          SetVehicleNumberPlateText(vehicle, plate)
          Citizen.Wait(100)
          QBCore.Functions.TriggerCallback('qb-garages:server:checkVehicleOwner', function(bsdk)
            if not bsdk then
              local ped = GetPlayerPed(-1)
              local veh = GetVehiclePedIsIn(ped)
              local mo = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
              local sex = string.lower(mo)
              if veh ~= nil and veh ~= 0 then
                local props = QBCore.Functions.GetVehicleProperties(vehicle)
                local hash = props.model
                TriggerServerEvent('PRO-plate:server:SaveCar', props, sex, hash, GetVehicleNumberPlateText(vehicle), oldplate)
              else
                QBCore.Functions.Notify('You are not in a vehicle', 'error')
              end
            else
              SetVehicleNumberPlateText(vehicle, oldplate)
              QBCore.Functions.Notify("Plate Already Taken", "error")
            end
          end, GetVehicleNumberPlateText(vehicle))
          TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
          Citizen.Wait(1000)
          TriggerServerEvent("lscustoms:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(vehicle))
          plate = nil
        elseif cb == 'error' then
          print ("hallow")
          QBCore.Functions.Notify("You Dont own this Vehicle", "error")
        end
      end, oldplate, plate)
    else
      QBCore.Functions.Notify("You must be in a Vehicle", "error")
    end
  else
    QBCore.Functions.Notify("Cant apply empty plate", "error")
  end
end



RegisterNUICallback('escape', function(data, cb)
	SetNuiFocus(false, false)
  QBCore.Functions.Notify("Canceled", "error")
end)

RegisterNUICallback('enter', function(data, cb)
  plate = data.number
	SetNuiFocus(false, false)
  ChaneA()
end)






















--how long you want the thing to last for. in seconds.
announcestring = false
lastfor = 7

--DO NOT TOUCH BELOW THIS LINE OR YOU /WILL/ FUCK SHIT UP.
--DO NOT BE STUPID AND WHINE TO ME ABOUT THIS BEING BROKEN IF YOU TOUCHED THE LINES BELOW.
RegisterNetEvent('announce')
announcestring = false
AddEventHandler('announce', function(msg)
	announcestring = msg
	PlaySoundFrontend(-1, "DELETE","HUD_DEATHMATCH_SOUNDSET", 1)
	Citizen.Wait(lastfor * 2000)
	announcestring = false
end)

function Initialize(scaleform)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
	PushScaleformMovieFunctionParameterString("~b~ERP Announcement")
    PushScaleformMovieFunctionParameterString(announcestring)
    PopScaleformMovieFunctionVoid()
    return scaleform
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if announcestring then
            scaleform = Initialize("mp_big_message_freemode")
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
        end
    end
end)

