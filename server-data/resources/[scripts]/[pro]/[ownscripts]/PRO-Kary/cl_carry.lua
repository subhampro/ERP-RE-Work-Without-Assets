local carryingBackInProgress = false
local carryAnimNamePlaying = ""
local carryAnimDictPlaying = ""
local carryControlFlagPlaying = 0
local playerIsDead = false


isDead = false

AddEventHandler('reload_death:onPlayerDeath', function(data)
	OnPlayerDeath()
	isDead = true
end)

AddEventHandler('reload_death:onPlayerRevive', function(data)
	isDead = false
end)


Citizen.CreateThread(function()
	DecorRegister('BEING_CARRIED_BOOL',2)
	DecorRegister('CARRYING_BOOL',2)
	DecorRegister('CARRIER',3)
	DecorRegister('CARRYING',3)
end)

RegisterCommand("carry",function(source, args)
	local p = DecorGetBool(PlayerPedId(),"CARRYING_BOOL")
	if p == nil then 
		p = false
		DecorSetBool(PlayerPedId(),"CARRYING_BOOL",false)
	end
	local lib = 'missfinale_c2mcs_1'
	local anim1 = 'fin_c2_mcs_1_camman'
	local lib2 = 'nm'
	local anim2 = 'firemans_carry'
	local distans = 0.15
	local distans2 = 0.27
	local height = 0.63
	local spin = 0.0		
	local length = 100000
	local controlFlagMe = 49
	local controlFlagTarget = 33
	local animFlagTarget = 1
	if not p then
		local player = PlayerPedId()	
		local closestPlayer = GetClosestPlayer(3)
		local target = GetPlayerServerId(closestPlayer)
		local tPed = GetPlayerPed(closestPlayer) 
        if closestPlayer ~= -1 and closestPlayer ~= nil and not IsPedInAnyVehicle(PlayerPedId(),true) and not IsPedInAnyVehicle(tPed,true) then
            TriggerEvent('reload_death:stopAnim')
			if DecorGetBool(tPed,"ON_TRUNK") then
				TriggerServerEvent('HideOnTrunk:RemoveFromTrunk',target)
				Wait(1100)
				DecorSetBool(PlayerPedId(),"CARRYING_BOOL",true)
				DecorSetInt(PlayerPedId(),'CARRYING',target)
				TriggerServerEvent('CarryPeople:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
				SetCurrentPedWeapon(PlayerPedId(),`WEAPON_UNARMED`,true)
			else
				if not DecorGetBool(tPed,'BEING_CARRIED_BOOL') and not DecorGetBool(tPed,'CARRYING_BOOL') then
					DecorSetBool(PlayerPedId(),"CARRYING_BOOL",true)
					DecorSetInt(PlayerPedId(),'CARRYING',target)
					TriggerServerEvent('CarryPeople:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
					SetCurrentPedWeapon(PlayerPedId(),`WEAPON_UNARMED`,true)
				else
					drawNativeNotification("Carry ka bug idhar mat exploit kar xD .")
				end
			end
		else
			drawNativeNotification("No one nearby to carry!")
		end
	else
		ClearPedSecondaryTask(PlayerPedId())
		
		local target = DecorGetInt(PlayerPedId(),'CARRYING')
        if target ~= 0 then 
            TriggerEvent('reload_death:startAnim')
			TriggerServerEvent("CarryPeople:stop",target)
			DecorSetBool(PlayerPedId(),'CARRYING_BOOL',false)
			DecorSetInt(PlayerPedId(),'CARRYING',0)
			SetCurrentPedWeapon(PlayerPedId(),`WEAPON_UNARMED`,true)
		end
	end
end,false)

RegisterNetEvent('CarryPeople:syncTarget')
AddEventHandler('CarryPeople:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	ClearPedSecondaryTask(PlayerPedId())
	ClearPedTasksImmediately(PlayerPedId())
	ClearPedTasks(PlayerPedId())
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation2
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
	DecorSetBool(PlayerPedId(),'BEING_CARRIED_BOOL',true)
	DecorSetInt(PlayerPedId(),"CARRIER",target)
	SetCurrentPedWeapon(PlayerPedId(),`WEAPON_UNARMED`,true)
end)

RegisterNetEvent('CarryPeople:syncMe')
AddEventHandler('CarryPeople:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = PlayerPedId()
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:cl_stop')
AddEventHandler('CarryPeople:cl_stop', function(target)
	local ped = GetPlayerPed(GetPlayerFromServerId(target))
	if ped == PlayerPedId() then
		DetachEntity(PlayerPedId(), true, false)
		DecorSetBool(PlayerPedId(),'BEING_CARRIED_BOOL',false)
		DecorSetInt(PlayerPedId(),"CARRIER",0)
	end
	--make all players sync it
	ClearPedSecondaryTask(ped)
	ClearPedTasksImmediately(ped)
	ClearPedTasks(ped)
end)

Citizen.CreateThread(function()
    local being_carried = false
    local carrying = false
    while true do
        being_carried = DecorGetBool(PlayerPedId(),"BEING_CARRIED_BOOL")
        carrying = DecorGetBool(PlayerPedId(),"CARRYING_BOOL")
		if being_carried or carrying then 
			while not IsEntityPlayingAnim(PlayerPedId(), carryAnimDictPlaying, carryAnimNamePlaying, 3) do
				ClearPedSecondaryTask(PlayerPedId())
				ClearPedTasksImmediately(PlayerPedId())
				ClearPedTasks(PlayerPedId())
				TaskPlayAnim(PlayerPedId(), carryAnimDictPlaying, carryAnimNamePlaying, 8.0, -8.0, 100000, carryControlFlagPlaying, 0, false, false, false)
				Citizen.Wait(10)
            end
            DisableControlAction(0,24)
            DisableControlAction(0,25)
            SetCurrentPedWeapon(PlayerPedId(),`WEAPON_UNARMED`,true)
            if carrying then
                Wait(1000)
            elseif being_carried then
                Wait(0)
            end
		else
			Citizen.Wait(1000)
		end
		
	end
end)

function GetPlayers()
    local players = {}

    for _, player in ipairs(GetActivePlayers()) do
		table.insert(players,player)
	end

    return players
end

function GetClosestPlayer(radius)
	local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
	local ped
	local player
	for i = 1, #players do
		ped = GetPlayerPed(players[i])
		player = players[i]
        if(ped ~= ply) then
            local targetCoords = GetEntityCoords(ped)
			local distance = #(targetCoords-plyCoords)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = player
                closestDistance = distance
            end
        end
    end
	--print("closest player is dist: " .. tostring(closestDistance))
	if closestDistance <= radius then
		return closestPlayer,radius
	else
		return nil
	end
end

function drawNativeNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end