local open = false
QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(10)
        if QBCore == nil then
            TriggerEvent("QBCore:GetObject", function(obj) QBCore = obj end)    
            Citizen.Wait(200)
        end
    end
end)



RegisterNetEvent('inventory:client:ShowId')
AddEventHandler('inventory:client:ShowId', function(sourceId, citizenid, data, type )
		local targ = GetPlayerFromServerId(sourceId)
		if targ ~= nil and targ ~= -1 then
			local sourcePos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(sourceId)), false)
			local pos = GetEntityCoords(GetPlayerPed(-1), false)
			local gender = "Male"
			if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
				gender = "Female"
			end
			if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, sourcePos.x, sourcePos.y, sourcePos.z, true) < 2.0) then
				open = true
				SendNUIMessage({
					action = "open",
					array  = data,
					gender = gender,
					type   = type
				})
			end
		end
end)



Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)





RegisterNetEvent("aa:open")
AddEventHandler("aa:open", function()
	local ped = GetPlayerPed(-1)
    --TaskGoStraightToCoord(ped, vector3(-547.01, -190.83, 38.22), 0.2,-1, 119.2608,0)
	takePhotos()
end)

frontCam = false

function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end


function takePhotos()
	CreateMobilePhone(1)
  	CellCamActivate(true, true)
  	takePhoto = true
  	Citizen.Wait(0)
  	if hasFocus == true then
    	SetNuiFocus(false, false)
    	hasFocus = false
  	end
	while takePhoto do
	   DisplayHelpText("Press ~g~[ARROW UP]~w~ For Selfie Mode Press ~g~[Mouse Left]~w~ To Take Pic")
    	Citizen.Wait(0)
		if IsControlJustPressed(1, 27) then -- Toogle Mode
			frontCam = not frontCam
			CellFrontCamActivate(frontCam)
    	elseif IsControlJustPressed(1, 177) then -- CANCEL
			DestroyMobilePhone()
			CellCamActivate(false, false)
      		takePhoto = false
    	elseif IsControlJustPressed(1, 176) then -- TAKE.. PIC
			exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/960479956641660928/l6WN1xRfmM0doh_vO9PgiWLTHS74t-1xM3caud9yFPUINvQk77Qzwdo7vXhBg561Sb4v", "files[]", function(data)
				local image = json.decode(data)
				DestroyMobilePhone()
				CellCamActivate(false, false)
				local url = image.attachments[1].proxy_url
				TriggerServerEvent("give:aadhar1", url)
				Citizen.Wait(1000)
				TriggerServerEvent("picupload:server:takem", url)
                QBCore.Functions.Notify('ID Card Registered for $ 250', 'success')
			end)
      		takePhoto = false
			HideHudComponentThisFrame(7)
			HideHudComponentThisFrame(8)
			HideHudComponentThisFrame(9)
			HideHudComponentThisFrame(6)
			HideHudComponentThisFrame(19)
			HideHudAndRadarThisFrame()
		end
  	end
  	Citizen.Wait(1000)
end


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

