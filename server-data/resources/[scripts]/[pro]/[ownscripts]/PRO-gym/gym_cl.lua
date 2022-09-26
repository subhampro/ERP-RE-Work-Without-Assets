local Keys = {["E"] = 38, ["SPACE"] = 22, ["F"] = 23}
local canExercise = false
local exercising = false
local procent = 0
local motionProcent = 0
local doingMotion = false
local motionTimesDone = 0

Citizen.CreateThread(function()
    while true do
        local sleep = 500
        local coords = GetEntityCoords(PlayerPedId())
            for i, v in pairs(Config.Locations) do
                local pos = Config.Locations[i]
                local dist = GetDistanceBetweenCoords(pos["x"], pos["y"], pos["z"] + 0.98, coords, true)
                if dist <= 1.5 and not exercising then
                    sleep = 5
                    DrawText3D(pos["x"], pos["y"], pos["z"] + 0.98, "[E] " .. pos["exercise"])
                    if IsControlJustPressed(0, Keys["E"]) then
                        startExercise(Config.Exercises[pos["exercise"]], pos)
                    end
                    else if dist <= 3.0 and not exercising then
                        sleep = 8
                        DrawText3D(pos["x"], pos["y"], pos["z"] + 0.98, pos["exercise"])
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

function startExercise(animInfo, pos)
    local playerPed = PlayerPedId()

    LoadDict(animInfo["idleDict"])
    LoadDict(animInfo["enterDict"])
    LoadDict(animInfo["exitDict"])
    LoadDict(animInfo["actionDict"])

    if pos["h"] ~= nil then
        SetEntityCoords(playerPed, pos["x"], pos["y"], pos["z"])
        SetEntityHeading(playerPed, pos["h"])
    end

    TaskPlayAnim(playerPed, animInfo["enterDict"], animInfo["enterAnim"], 8.0, -8.0, animInfo["enterTime"], 0, 0.0, 0, 0, 0)
    Citizen.Wait(animInfo["enterTime"])

    canExercise = true
    exercising = true

    Citizen.CreateThread(function()
        while exercising do
            Citizen.Wait(8)
            if procent <= 24.99 then
                color = "~r~"
            elseif procent <= 49.99 then
                color = "~o~"
            elseif procent <= 74.99 then
                color = "~b~"
            elseif procent <= 100 then
                color = "~r~"
            end
            DrawText2D(0.505, 0.925, 1.0,1.0,0.33, "Percentage: " .. color..procent .. "%", 255, 102, 0, 255)
            DrawText2D(0.505, 0.95, 1.0,1.0,0.33, "Press ~r~[SPACE]~w~ to start exercising", 255, 102, 0, 255)
            DrawText2D(0.505, 0.975, 1.0,1.0,0.33, "Press ~r~[F]~w~ to stop training", 255, 102, 0, 255)
        end
    end)

    Citizen.CreateThread(function()
        while canExercise do
            Citizen.Wait(8)
            local playerCoords = GetEntityCoords(playerPed)
            if procent <= 99 then
                TaskPlayAnim(playerPed, animInfo["idleDict"], animInfo["idleAnim"], 8.0, -8.0, -1, 0, 0.0, 0, 0, 0)
                if IsControlJustPressed(0, Keys["SPACE"]) then -- press space to train
                    canExercise = false
                    TaskPlayAnim(playerPed, animInfo["actionDict"], animInfo["actionAnim"], 8.0, -8.0, animInfo["actionTime"], 0, 0.0, 0, 0, 0)
                    AddProcent(animInfo["actionProcent"], animInfo["actionProcentTimes"], animInfo["actionTime"] - 70)
                    canExercise = true
                    TriggerServerEvent('hud:server:RelieveStress', 1)
                end
                if IsControlJustPressed(0, Keys["F"]) then -- press F to exit training
                    ExitTraining(animInfo["exitDict"], animInfo["exitAnim"], animInfo["exitTime"])
                    
                end
            else
                ExitTraining(animInfo["exitDict"], animInfo["exitAnim"], animInfo["exitTime"])
                
                -- Here u can put a event to update some sort of skill or something.
                -- this is when u finished your exercise
            end
        end
    end)
end

RegisterCommand("motion", function()
    motionProcent = 0
    doingMotion = not doingMotion  

    Citizen.CreateThread(function()
        while doingMotion do
            Citizen.Wait(7) 
            if IsPedSprinting(PlayerPedId()) then
                motionProcent = motionProcent + 9
            elseif IsPedRunning(PlayerPedId()) then
                motionProcent = motionProcent + 6
            elseif IsPedWalking(PlayerPedId()) then
                motionProcent = motionProcent + 3
            end
            
            DrawText2D(0.505, 0.95, 1.0,1.0,0.4, "~b~Percentage:~w~ " .. tonumber(string.format("%.1f", motionProcent/1000)) .. "%", 255, 102, 0, 255)
            if motionProcent >= 100000 then
                doingMotion = false
                motionProcent = 0
                Notify("You ~r~finished~w~ your exercise session.")
            end
        end
    end)

    if doingMotion then
        motionTimesDone = motionTimesDone + 1
        if motionTimesDone <= 2 then
            Notify("You ~y~started~w~ your exercise session.")
            print(motionTimesDone)
        else
            Notify("You are too ~r~moe~w~ to do this!")
            doingMotion = false
        end
    else
        Notify("You ~r~stopped~w~ your exercise session.")
    end
end)

function ExitTraining(exitDict, exitAnim, exitTime)
    TaskPlayAnim(PlayerPedId(), exitDict, exitAnim, 8.0, -8.0, exitTime, 0, 0.0, 0, 0, 0)
    Citizen.Wait(exitTime)
    canExercise = false
    exercising = false
    procent = 0
end

function AddProcent(amount, amountTimes, time)
    for i=1, amountTimes do
        Citizen.Wait(time/amountTimes)
        procent = procent + amount
    end
end

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 102, 0, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 90)
end
      
function DrawText2D(x, y, width, height, scale, text, r, g, b, a, outline)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

Citizen.CreateThread(function()
    for i=1, #Config.xBlips, 1 do
        local Blip = Config.xBlips[i]
        xblip = AddBlipForCoord(Blip["x"], Blip["y"], Blip["z"])
        SetBlipSprite(xblip, Blip["id"])
        SetBlipDisplay(xblip, 4)
        SetBlipScale(xblip, Blip["scale"])
        SetBlipColour(xblip, Blip["color"])
        SetBlipAsShortRange(xblip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Blip["text"])
        EndTextCommandSetBlipName(xblip)
    end
end)

function Notify(msg)
    SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName(msg)
	DrawNotification(false, true)
end


function GetNearbyPed()
	local retval = nil
	local PlayerPeds = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        PlayerPeds[#PlayerPeds+1] = ped
    end
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
	local closestPed, closestDistance = QBCore.Functions.GetClosestPed(coords, PlayerPeds)
	if not IsEntityDead(closestPed) and closestDistance < 2.0 then
		retval = closestPed
	end
	return retval
end

-- RegisterCommand('takehostage', function()
--     local animDict = "anim@scripted@anim_yacht@yacht_ig1_hostage@"
--     local ped = PlayerPedId()
--     local throw = "mp_m_bogdangoon"
--     local x,y,z = table.unpack(GetEntityCoords(ped))

--     coords = GetEntityCoords(ped)

--     RequestAnimDict(animDict)
--     RequestModel(throw)

--     while not HasAnimDictLoaded(animDict) or not HasModelLoaded(throw) do
--         Citizen.Wait(100)
--     end

--     -- local thrown = CreatePed(26, GetHashKey(throw), targetPosition, false, true)
--     local thrown = GetNearbyPed()

--     if thrown == nil then
--         return
--     end

--     print('Hostage: '..thrown)

--     ClearPedTasks(thrown)
--     TaskStandStill(thrown, 3000)

--     local pedCoords = GetEntityCoords(thrown)

--     print('Ped Rot:', GetEntityRotation(ped))
--     local targetPosition = vec3(coords)
--     print('Rotation: ', GetEntityRotation(ped))
--     print('Anim Offset:', GetAnimInitialOffsetRotation(animDict, 'trans_crouch_to_humanshield_captain_gangstertwo'))
--     local targetRotation = GetEntityRotation(ped) - GetAnimInitialOffsetRotation(animDict, 'trans_crouch_to_humanshield_captain_gangstertwo') - vec3(0.0, 0.0, 16.5)
--     print('New Ped Rot:', targetRotation)
--     TaskGoStraightToCoord(ped, targetPosition, 0.025, 5000, targetRotation[3], 0.05)

--     Citizen.Wait(1000)

--     FreezeEntityPosition(ped, true)
--     FreezeEntityPosition(thrown, true)

--     local netScene = NetworkCreateSynchronisedScene(targetPosition.x, targetPosition.y, targetPosition.z - 1, targetRotation, 2, true, false, 1065353216, 0, 1065353216)
--     NetworkAddPedToSynchronisedScene(ped, netScene, animDict, "trans_crouch_to_humanshield_captain_gangstertwo", 1.0, -4.0, 157, 92, 1148846080, 0)
--     NetworkAddPedToSynchronisedScene(thrown, netScene, animDict, "trans_crouch_to_humanshield_captain_captain", 1.0, -4.0, 157, 92, 1148846080, 0)
--     -- NetworkForceLocalUseOfSyncedSceneCamera(netScene, "mp_arresting", "cam_b_arrest_on_floor")

--     local netScene2 = NetworkCreateSynchronisedScene(targetPosition.x, targetPosition.y, targetPosition.z - 1, targetRotation, 2, false, true, 1065353216, 0, 1065353216)
--     NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, "loop_humanshield_captain_gangstertwo", 1.0, -4.0, 157, 92, 1148846080, 0)
--     NetworkAddPedToSynchronisedScene(thrown, netScene2, animDict, "loop_humanshield_captain_captain", 1.0, -4.0, 157, 92, 1148846080, 0)

--     local netScene3 = NetworkCreateSynchronisedScene(targetPosition.x, targetPosition.y, targetPosition.z - 1, targetRotation, 2, true, false, 1065353216, 0, 1065353216)
--     NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, "hostage_killed_captain_gangstertwo", 1.0, -4.0, 157, 92, 1148846080, 0)
--     NetworkAddPedToSynchronisedScene(thrown, netScene3, animDict, "hostage_killed_captain_captain", 1.0, -4.0, 157, 92, 1148846080, 0)

--     local netScene4 = NetworkCreateSynchronisedScene(targetPosition.x, targetPosition.y, targetPosition.z - 1, targetRotation, 2, false, false, 1065353216, 0, 1065353216)
--     -- NetworkAddPedToSynchronisedScene(ped, netScene4, animDict, "hostage_killed_captain_gangstertwo", 1.0, -4.0, 157, 92, 1148846080, 0)
--     NetworkAddPedToSynchronisedScene(thrown, netScene4, animDict, "quick_exit_captain_captain", 1.0, -4.0, 157, 92, 1148846080, 0)


--     NetworkStartSynchronisedScene(netScene)
--     print('Starting 1')
--     Wait(GetAnimDuration(animDict, "trans_crouch_to_humanshield_bar_lady_gangsterone") * 1000)
--     print('Starting 2')
--     NetworkStartSynchronisedScene(netScene2)
--     animshit = true
--     CreateThread(function()
--         while animshit do
--             Wait(1)
--             -- DrawText3D(coords.x, coords.y, coords.z, '[E] - Kill Hostage')
--             -- DrawText3D(coords.x, coords.y, coords.z + 0.5, '[BACKSPACE] - Let Go')
--             if IsControlJustPressed(0, 38) then
--                 print('Shot')
--                 SetPedShootsAtCoord(PlayerPedId(), 0.0, 0.0, 0.0, 0)
--                 NetworkStartSynchronisedScene(netScene3)
--                 Wait(GetAnimDuration(animDict, "hostage_killed_bar_lady_barlady") * 1000)
--                 SetEntityHealth(thrown, 0)
--                 NetworkStopSynchronisedScene(netScene3)
--                 animshit = false
--             elseif IsControlJustPressed(0, 177) then
--                 print('Back')
--                 ClearPedTasks(ped)
--                 -- NetworkStartSynchronisedScene(netScene4)
--                 TaskSmartFleePed(thrown, ped, 100.0, -1)
--                 animshit = false
--             end
--         end
--     end)
--     FreezeEntityPosition(ped, false)
--     FreezeEntityPosition(thrown, false)
--     -- Wait(5000)
--     -- print('Stopping All')
--     -- NetworkStopSynchronisedScene(netScene2)
--     -- FreezeEntityPosition(ped, false)
--     -- RemoveAnimDict(animDict)
--     -- -- DeleteEntity(thrown)
--     -- ClearPedTasks(thrown)
-- end)