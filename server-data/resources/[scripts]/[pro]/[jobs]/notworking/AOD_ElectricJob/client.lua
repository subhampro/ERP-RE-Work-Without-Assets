local Instartzone, Inspawnvehicle, Indeletecar, duty, needJob, atjobSite, jobComplete, hasJob = false, false, false, false, false, false, false,false


local QBCore = exports['qb-core']:GetCoreObject()


--customise these below

Notify = function(text)
    --SetNotificationTextEntry('STRING') -- Standalone notification
    --AddTextComponentString(text) -- Standalone notification
    --DrawNotification(0,1) -- Standalone notification
    --ESX.ShowNotification(text) -- ESX Notification
    QBCore.Functions.Notify(text, "success") -- QB Notify
    -- add your own and hash off others.
end

DrawTextUI = function(text)
    exports['qb-core']:DrawText(text, 'left')
    --exports['qb-drawtext']:DrawText(text, 'left')
    -- TriggerEvent('cd_drawtextui:ShowUI', 'show', text)
end

HideTextUI = function()
    exports['qb-core']:HideText()
    --exports['qb-drawtext']:HideText()
    -- TriggerEvent('cd_drawtextui:HideUI')
end
--stop that shit

--if you don't really know what you're doing like, leave this alone please.
Citizen.CreateThread(function()
    blip = AddBlipForCoord(Config.Start)
    SetBlipSprite(blip, 354)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, 30)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Strings.jobName)
    EndTextCommandSetBlipName(blip)
end)

local startzone = CircleZone:Create(vector3(729.68, -1974.24, 29.29), 2.0, {
    name = "Start",
    useZ = false,
    debugPoly = false
})

local spawnvehicle = CircleZone:Create(vector3(731.04, -1962.9, 29.29), 2.0, {
    name = "spawnVeh",
    useZ = false,
   debugPoly = false
})

local deletecar = CircleZone:Create(vector3(740.21, -1910.67, 29.29), 2.0, {
    name = "circle",
    useZ = false,
    debugPoly = false
})

spawnWorkVehicle = function()
    if vehicleOut then
        Notify(Config.Strings.alreadyCar)
        return
    end
        local coords = Config.VehSpawn
        QBCore.Functions.SpawnVehicle("boxville", function(veh)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            SetVehicleEngineOn(veh, true, true)
            SetVehicleNumberPlateText(veh, "ELEC"..tostring(math.random(1000, 9999)))
            SetEntityHeading(veh, coords.w)
            exports[Config.Fuel]:SetFuel(veh, 100.0)
            SetEntityAsMissionEntity(veh, true, true)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
            vehicleout = true
            Notify(Config.Strings.goTo)
            blip = AddBlipForEntity(veh)
            SetBlipSprite(blip, 354)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, 1.0)
            SetBlipColour(blip, 30)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.Strings.workCar)
            EndTextCommandSetBlipName(blip)
            needJob = true
        end, coords, true)
    end
end

deleteworkVehicle = function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped,false)
    local validTarget = GetEntityModel(vehicle)
    if validTarget == `boxville` then
        if NetworkHasControlOfEntity(vehicle) then
            TaskLeaveVehicle(ped, vehicle, 0)
            Wait(2000)
            SetEntityAsMissionEntity(vehicle)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            Wait(100)
            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
            SetEntityAsNoLongerNeeded(vehicle)
            DeleteEntity(vehicle)
            DeleteVehicle(vehicle)
            needJob = false
            vehicleOut = false
            atJobSite = false
            hasJob = false
            activeJob:destroy()
            createJobBlip(false, false)
        end
    end
end

giveJob = function()
    Wait(10000)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped,false)
    local validTarget = GetEntityModel(vehicle)
    if needJob and validTarget ~= `boxville` then
        Notify(Config.Strings.needCar)
        Wait(5000)
        return
    end    
    Notify(Config.Strings.lookWork)
    Wait(Config.WaitForJobTime)
    Notify(Config.Strings.workFound)
    local jobLoc = Config.JobLocations[math.random(1,#Config.JobLocations)]
    SetNewWaypoint(jobLoc.x, jobLoc.y)
    createJobBlip(jobLoc, true)    
   activeJob = CircleZone:Create(jobLoc, 2.0, {
        name = "jobZone",
        useZ = false,
        debugPoly = false
    })
    needJob = false
    hasJob = true
    activeJob:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
        if isPointInside and duty then
            atjobSite = true
            DrawTextUI(Config.Strings.lightPole)
                else
            atjobSite = false
            HideTextUI()
        end
    end)
end

fixPole = function()
    local ped = PlayerPedId()
    local loc = GetEntityCoords(ped)
    local lightpole = GetClosestObjectOfType(loc, 3.0, GetHashKey('prop_streetlight_01'), false, false, false)
    local spot = GetEntityCoords(lightpole)
    if lightpole ~= 0 then
        TaskTurnPedToFaceEntity(ped, lightpole, 2000)
        Wait(2000)
        ClearPedTasksImmediately(ped)
        TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_WELDING', 0, true)
        exports['progressBars']:startUI(Config.FixTime, Config.Strings.fixPole)
        Wait(Config.FixTime)
        ClearPedTasksImmediately(ped)
        TriggerServerEvent("setlight:on", spot)
        needJob = true
        jobComplete = true
        atJobSite = false
        TriggerServerEvent('GetPaid')
        createJobBlip(false, false)
        Notify(Config.Strings.jobDone)
        activeJob:destroy()
        hasJob = false
    else
        Notify('You are not at the lightpole!')
    end
end

createJobBlip = function(place,toggle)
    if toggle and place then
    blip3 = AddBlipForCoord(place)
    SetBlipSprite(blip3, 354)
    SetBlipDisplay(blip3, 4)
    SetBlipScale(blip3, 1.0)
    SetBlipColour(blip3, 30)
    SetBlipAsShortRange(blip3, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Strings.yourPole)
    EndTextCommandSetBlipName(blip3)
    else
     RemoveBlip(blip3)
    end
end

addBlip = function(toggle)
    if toggle then
        blip1 = AddBlipForCoord(Config.Veh)
        SetBlipSprite(blip1, 354)
        SetBlipDisplay(blip1, 4)
        SetBlipScale(blip1, 1.0)
        SetBlipColour(blip1, 30)
        SetBlipAsShortRange(blip1, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Strings.spawnVeh)
        EndTextCommandSetBlipName(blip1)
        blip2 =  AddBlipForCoord(Config.VehDelete)
        SetBlipSprite(blip2, 354)
        SetBlipDisplay(blip2, 4)
        SetBlipScale(blip2, 1.0)
        SetBlipColour(blip2, 30)
        SetBlipAsShortRange(blip2, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Strings.deleteVeh)
        EndTextCommandSetBlipName(blip2)
    else
        RemoveBlip(blip1)
        RemoveBlip(blip2)
    end
end

Citizen.CreateThread(function()
    while true do
        sleep = 1000
        local plyPed = PlayerPedId()
        local coord = GetEntityCoords(plyPed)
        Instartzone = startzone:isPointInside(coord)
        Inspawnvehicle = spawnvehicle:isPointInside(coord)
        Indeletecar = deletecar:isPointInside(coord)
        if Instartzone then
            sleep = 0
            if IsControlJustReleased(0, 38) and not duty then
                duty = true
                Notify(Config.Strings.onDuty)
                addBlip(true)
                HideTextUI()
            elseif IsControlJustReleased(0, 38) and duty then
                duty = false
                Notify(Config.Strings.offDuty)
                addBlip(false)
                HideTextUI()
                hasJob = false
            end
        end
        if Config.EnableMarkers then
            if #(coord - Config.Start) < 15 then
                sleep = 0
                DrawMarker(21, Config.Start, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 255, 255, 0, true, 0, 0)
            end
            if #(coord - Config.Veh) < 15 and duty then
                sleep = 0
                DrawMarker(21, Config.Veh, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 255, 255, 0, true, 0, 0)
            end
            if #(coord - Config.VehDelete) < 15 and duty then
                sleep = 0
                DrawMarker(21, Config.VehDelete, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 255, 255, 0, true, 0, 0)
            end
        end
        if Inspawnvehicle and duty then
            sleep = 0
         if IsControlJustReleased(0, 38) and duty then
            spawnWorkVehicle()
            end
        end
        if Indeletecar then
            sleep = 0
            if IsControlJustReleased(0, 38) and duty then
            deleteworkVehicle()
            HideTextUI()
            end
        end
        if needJob and duty then
            giveJob()
        end
        if atjobSite and duty then
            sleep = 0           
            if IsControlJustReleased(0, 38) and duty then
                local location = GetEntityCoords(PlayerPedId())
                TriggerServerEvent("setlight:off", location)
                HideTextUI()				
                fixPole()
            end
        end
        Wait(sleep)        
    end
end)

spawnvehicle:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside and duty then
        DrawTextUI(Config.Strings.dtSpawn)
            else
         HideTextUI()
    end
end)

startzone:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        DrawTextUI(Config.Strings.dtDuty)
    else
        HideTextUI()
    end
end)

deletecar:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
        DrawTextUI(Config.Strings.dtDelete)
    else
        HideTextUI()
    end
end)

RegisterNetEvent("setlight:on")
AddEventHandler("setlight:on",function(pos)
	Wait(2000)
    local poop = GetClosestObjectOfType(pos, 25.0, GetHashKey('prop_streetlight_01'), false, false, false)
    SetEntityLights(poop,false)
end)

RegisterNetEvent("setlight:off")
AddEventHandler("setlight:off",function(pos)
	Wait(2000)
    local poop = GetClosestObjectOfType(pos, 25.0, GetHashKey('prop_streetlight_01'), false, false, false)
    SetEntityLights(poop,true)
end)

RegisterCommand('cancelEJob', function()
    needJob = false
    vehicleOut = false
    atJobSite = false
    duty = false
    addBlip(false)
    if hasJob then
        activeJob:destroy()
    end
end, false)

RegisterKeyMapping('cancelEJob', 'Cancel Electric Job', 'keyboard', 'home')
