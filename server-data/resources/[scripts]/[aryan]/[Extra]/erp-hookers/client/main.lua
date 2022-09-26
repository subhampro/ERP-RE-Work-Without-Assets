local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local spawn                 = 0
local HookerSpawned         = false
local OnRouteToHooker       = false
local HookerInCar           = false

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData            = {}
local peds = {}
    
Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(0)
    end

    while QBCore.Functions.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerData.job = job
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function (Player)
    PlayerData = Player
end)

CreateThread(function()

    for k, v in pairs(Config.Locations) do
			
		local blip = AddBlipForCoord(vector3(130.66, -1307.65, 29.15))
		SetBlipAsShortRange(blip, true)
		SetBlipSprite(blip, 121)
		SetBlipColour(blip, 5)
		SetBlipScale(blip, 0.5)
		SetBlipDisplay(blip, 6)
		BeginTextCommandSetBlipName('STRING')
	    AddTextComponentString('Vanilla Unicorn')
	    EndTextCommandSetBlipName(blip)
       
        RequestModel('s_m_m_bouncer_01') while not HasModelLoaded('s_m_m_bouncer_01') do Wait(0) end
		peds[#peds+1] = CreatePed(0, 's_m_m_bouncer_01', v.coords.x, v.coords.y, v.coords.z, v.coords[4], false, false)
        SetEntityInvincible(peds[#peds], true)
		SetBlockingOfNonTemporaryEvents(peds[#peds], true)
		FreezeEntityPosition(peds[#peds], true)

        exports['qb-target']:AddTargetModel('s_m_m_bouncer_01', {
            options = {
                {
                    type  = "client",
				    event = "erp-hookers:OpenPimpMenu",
				    icon  = "fa-duotone fa-mobile",
				    label = "Order a Hookers",
                },
			},
            distance = 2.0
        })
    end
end)


RegisterNetEvent("erp-hookers:OpenPimpMenu")
AddEventHandler("erp-hookers:OpenPimpMenu", function ()
    SetNuiFocus(true, true)
    Citizen.Wait(100)
    SendNUIMessage({
        type = "openPimpMenu",
    })
end)

RegisterNetEvent("erp-hookers:OpenHookerMenu")
AddEventHandler("erp-hookers:OpenHookerMenu", function ()
    SetNuiFocus(true, true)
    Citizen.Wait(100)
    SendNUIMessage({
        type    = "openHookerMenu",
        blowjob = Config.BlowjobPrice,    
        sex     = Config.SexPrice,
    })
end)

RegisterNUICallback("CloseMenu", function (data, callback)
    SetNuiFocus(false, false)
    callback("ok")
end)

RegisterNUICallback("ChooseCathrine", function (data, callback)
    SetNuiFocus(false, false)
    callback("ok")
    TriggerEvent("erp-hookers:ChosenHooker", "s_f_y_hooker_01")
    QBCore.Functions.Notify('Tanisha Chowdhury Is Marked On Your GPS, Go & Fuck Her!', 'primary')
    OnRouteToHooker = true
end)

RegisterNUICallback("ChooseTatiana", function (data, callback)
    SetNuiFocus(false, false)
    callback("ok")
    TriggerEvent("erp-hookers:ChosenHooker", "s_f_y_hooker_02")
    QBCore.Functions.Notify('Afia Nawar Is Marked On Your GPS, Go & Fuck Her!', 'primary')
    OnRouteToHooker = true
end)

RegisterNUICallback("ChooseBootylicious", function (data, callback)
    SetNuiFocus(false, false)
    callback("ok")
    TriggerEvent("erp-hookers:ChosenHooker", "s_f_y_hooker_03") 
    QBCore.Functions.Notify('Marzia Alam Is Marked On Your GPS, Go & Fuck Her!', 'primary')
    OnRouteToHooker = true
end)

RegisterNUICallback("ChooseVennesa", function (data, callback)
    SetNuiFocus(false, false)
    callback("ok")
    TriggerEvent("erp-hookers:ChosenHooker", "s_f_y_hooker_02")
    QBCore.Functions.Notify('Shefa Khan Is Marked On Your GPS, Go & Fuck Her!', 'primary')
    OnRouteToHooker = true
end)

RegisterNUICallback("ChooseBlowjob", function (data, callback)
    SetNuiFocus(false, false)
    callback("ok")
    HookerInCar = false
    TriggerServerEvent("erp-hookers:pay", true)
end)

RegisterNUICallback("ChooseSex", function (data, callback)
    SetNuiFocus(false, false)
    callback("ok")
    HookerInCar = false
    TriggerServerEvent("erp-hookers:pay", false)
end)

RegisterNUICallback("CloseServiceMenu", function (data, callback)
    SetNuiFocus(false, false)
    callback("ok")
    HookerInCar = true
end)
 
RegisterNetEvent("erp-hookers:noMoney")
AddEventHandler("erp-hookers:noMoney", function()
    HookerInCar = true
end)

RegisterNetEvent("erp-hookers:startBlowjob")
AddEventHandler("erp-hookers:startBlowjob", function()
    local ped = PlayerPedId()
    hookerAnim(Hooker,"oddjobs@towing","f_blow_job_loop")
    playerAnim(ped,"oddjobs@towing","m_blow_job_loop")

    Citizen.Wait(2000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral_Fem", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Oral_Fem", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Finished", "Speech_Params_Force_Shouted_Clear")
    ClearPedTasks(ped)
    ClearPedTasks(Hooker)
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Hooker_Offer_Again", "Speech_Params_Force_Shouted_Clear")
    HookerInCar = true
end)

RegisterNetEvent("erp-hookers:startSex")
AddEventHandler("erp-hookers:startSex", function()
    local ped = PlayerPedId()
    hookerAnim(Hooker,"mini@prostitutes@sexlow_veh","low_car_sex_loop_female")
    playerAnim(ped,"mini@prostitutes@sexlow_veh","low_car_sex_loop_player")

    Citizen.Wait(2000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic", "Speech_Params_Force_Normal_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic", "Speech_Params_Force_Normal_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic", "Speech_Params_Force_Normal_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic_Fem", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Generic_Fem", "Speech_Params_Force_Shouted_Clear")
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Sex_Finished", "Speech_Params_Force_Shouted_Clear")
    ClearPedTasks(ped)
    ClearPedTasks(Hooker)
    Citizen.Wait(5000)
    PlayAmbientSpeech1(Hooker, "Hooker_Offer_Again", "Speech_Params_Force_Shouted_Clear")
    HookerInCar = true
end)

function DrawText3Ds(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function CreateHooker(model)
    spawn = math.random(1,12)

    loadmodel(model)
    loaddict("switch@michael@parkbench_smoke_ranger")

    Hooker =  CreatePed("PED_TYPE_PROSTITUTE", model, Config.Hookerspawns[spawn].x, Config.Hookerspawns[spawn].y, Config.Hookerspawns[spawn].z, Config.Hookerspawns[spawn].heading, true, true)
    FreezeEntityPosition(Hooker, true)
    SetEntityInvincible(Hooker, true)
    SetBlockingOfNonTemporaryEvents(Hooker, true)
    TaskStartScenarioInPlace(Hooker, "WORLD_HUMAN_SMOKING", 0, false)

    HookerBlip = AddBlipForCoord(Config.Hookerspawns[spawn].x, Config.Hookerspawns[spawn].y, Config.Hookerspawns[spawn].z)
    SetBlipSprite(HookerBlip, 280)
    SetNewWaypoint(Config.Hookerspawns[spawn].x, Config.Hookerspawns[spawn].y)
end
 
RegisterNetEvent("erp-hookers:ChosenHooker")
AddEventHandler("erp-hookers:ChosenHooker", function(model)
    if HookerSpawned then
        QBCore.Functions.Notify('You have allready chosen a hooker!', 'error')
    else
        HookerSpawned = true
        CreateHooker(model)
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(5)
                local Coords, letSleep  = GetEntityCoords(PlayerPedId()), true
                if OnRouteToHooker then 
                    if GetDistanceBetweenCoords(Coords, Config.Hookerspawns[spawn].x,Config.Hookerspawns[spawn].y,Config.Hookerspawns[spawn].z, true) < Config.DrawMarker then
                        letSleep = false
                        local ped = GetPlayerPed(PlayerId())
                        local vehicle = GetVehiclePedIsIn(ped, false)
                        if GetPedInVehicleSeat(vehicle, -1) and IsPedInVehicle(ped, vehicle, true) and IsVehicleSeatFree(vehicle, 0) and not IsVehicleSeatFree(vehicle, -1) then
                            DrawText3Ds(Config.Hookerspawns[spawn].x,Config.Hookerspawns[spawn].y,Config.Hookerspawns[spawn].z+1.0, '[~b~E~w~] To signal Hooker')
                            if IsControlJustPressed(0, Keys["E"]) then
                                RemoveBlip(HookerBlip)
                                signalHooker()
                                PlayAmbientSpeech1(Hooker, "Generic_Hows_It_Going", "Speech_Params_Force")
                                HookerInCar = true
                                OnRouteToHooker = false
                            end
                        end
                    end
                end
                if HookerInCar then
                    local ped = GetPlayerPed(PlayerId())
                    local vehicle = GetVehiclePedIsIn(ped, false)
                    if GetPedInVehicleSeat(vehicle, -1) and IsPedInVehicle(ped, vehicle, true) and not IsVehicleSeatFree(vehicle, 0) and not IsVehicleSeatFree(vehicle, -1) then
                        letSleep = false
                        local ped = GetPlayerPed(PlayerId())
                        if IsVehicleStopped(vehicle) then
                            DrawText3Ds(Coords.x, Coords.y, Coords.z+1.0, '[~b~E~w~] To open Services [~r~H~w~] Tell hooker to Leave')
                            if IsControlJustPressed(0, Keys["E"]) then
                                PlayAmbientSpeech1(Hooker, "Hooker_Offer_Service", "Speech_Params_Force_Shouted_Clear")
                                TriggerEvent("erp-hookers:OpenHookerMenu")
                            end
                            if IsControlJustPressed(0, Keys["H"]) then
                                HookerInCar = false
                                PlayAmbientSpeech1(Hooker, "Hooker_Had_Enough", "Speech_Params_Force_Shouted_Clear")
                                hookerGoHome()
                                break
                            end
                        else
                            DrawText3Ds(Coords.x, Coords.y, Coords.z+1.0, 'Drive to a safe spot')
                        end
                    end
                end
                if letSleep then
                    Citizen.Wait(1000)
                end
            end
        end)
    end   
end)

function hookerGoHome()
    TaskLeaveVehicle(Hooker, vehicle, 0)
    SetPedAsNoLongerNeeded(Hooker)
    HookerSpawned = false
end

function signalHooker()
    local ped = PlayerPedId()
    FreezeEntityPosition(Hooker, false)
    SetEntityAsMissionEntity(Hooker)
    SetBlockingOfNonTemporaryEvents(Hooker, true)
    TaskEnterVehicle(Hooker, GetVehiclePedIsIn(ped, false), -1, 0, 1.0, 1, 0)
end

function hookerAnim(Hooker, animDictionary, animationName, time)
    if (DoesEntityExist(Hooker) and not IsEntityDead(Hooker)) then
        loaddict(animDictionary)
        TaskPlayAnim(Hooker, animDictionary, animationName, 1.0, -1.0, -1, 1, 1, true, true, true)
    end
end

function playerAnim(ped, animDictionary, animationName, time)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
        loaddict(animDictionary)
        TaskPlayAnim(ped, animDictionary, animationName, 1.0, -1.0, -1, 1, 1, true, true, true)
    end
end

function loadmodel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(10)
    end
end

function loaddict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end
