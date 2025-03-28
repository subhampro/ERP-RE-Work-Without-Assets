local QBCore = exports['qb-core']:GetCoreObject()
local Zone = nil
local TextShown = false
local AcitveZone = {}
local CurrentVehicle = {}
local SpawnZone = {}
local EntityZones = {}
local occasionVehicles = {}
local peds = {}

-- Functions

local function spawnOccasionsVehicles(vehicles)
    if Zone then
        local oSlot = Config.Zones[Zone].VehicleSpots
        if not occasionVehicles[Zone] then occasionVehicles[Zone] = {} end
        if vehicles then
            for i = 1, #vehicles, 1 do
                local model = GetHashKey(vehicles[i].model)
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(0)
                end
                occasionVehicles[Zone][i] = { 
                    car   = CreateVehicle(model, oSlot[i].x, oSlot[i].y, oSlot[i].z, false, false),
                    loc   = vector3(oSlot[i].x, oSlot[i].y, oSlot[i].z),
                    price = vehicles[i].price,
                    owner = vehicles[i].seller,
                    model = vehicles[i].model,
                    plate = vehicles[i].plate,
                    oid   = vehicles[i].occasionid,
                    desc  = vehicles[i].description,
                    mods  = vehicles[i].mods
                }

                QBCore.Functions.SetVehicleProperties(occasionVehicles[Zone][i].car, json.decode(occasionVehicles[Zone][i].mods))

                SetModelAsNoLongerNeeded(model)
                SetVehicleOnGroundProperly(occasionVehicles[Zone][i].car)
                SetEntityInvincible(occasionVehicles[Zone][i].car,true)
                SetEntityHeading(occasionVehicles[Zone][i].car, oSlot[i].w)
                SetVehicleDoorsLocked(occasionVehicles[Zone][i].car, 3)
                SetVehicleNumberPlateText(occasionVehicles[Zone][i].car, occasionVehicles[Zone][i].oid)
                FreezeEntityPosition(occasionVehicles[Zone][i].car,true)
                if Config.UseTarget then
                    if not EntityZones then EntityZones = {} end
                    EntityZones[i] = exports[Config.Target]:AddTargetEntity(occasionVehicles[Zone][i].car, {
                        options = {
                            {
                                type = "client",
                                event = "qb-vehiclesales:client:OpenContract",
                                icon = "fas fa-car",
                                label = "View Contract",
                                Contract = i
                            }
                        },
                        distance = 2.0
                    })
                end
            end
        end
    end
end

local function despawnOccasionsVehicles()
    if not Zone then return end
    local oSlot = Config.Zones[Zone].VehicleSpots
    for i = 1, #oSlot, 1 do
        local loc = oSlot[i]
        local oldVehicle = GetClosestVehicle(loc.x, loc.y, loc.z, 1.3, 0, 70)
        
        if oldVehicle then
            QBCore.Functions.DeleteVehicle(oldVehicle)
        end

        if EntityZones[i] and Config.UseTarget then
            exports[Config.Target]:RemoveZone(EntityZones[i])
        end
    end
    EntityZones = {}
end

local function openSellContract(bool)
    local pData = QBCore.Functions.GetPlayerData()

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "sellVehicle",
        bizName = Config.Zones[Zone].BusinessName,
        sellerData = {
            firstname = pData.charinfo.firstname,
            lastname = pData.charinfo.lastname,
            account = pData.charinfo.account,
            phone = pData.charinfo.phone
        },
        plate = QBCore.Functions.GetPlate(GetVehiclePedIsUsing(PlayerPedId()))
    })
end

local function openBuyContract(sellerData, vehicleData)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "buyVehicle",
        bizName = Config.BusinessName,
        sellerData = {
            firstname = sellerData.charinfo.firstname,
            lastname = sellerData.charinfo.lastname,
            account = sellerData.charinfo.account,
            phone = sellerData.charinfo.phone
        },
        vehicleData = {
            desc = vehicleData.desc,
            price = vehicleData.price
        },
        plate = vehicleData.plate
    })
end

local function sellVehicleWait(price)
    DoScreenFadeOut(250)
    Wait(250)
    QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
    Wait(1500)
    DoScreenFadeIn(250)
    exports['Roda_Notifications']:showNotify(Lang:t('success.car_up_for_sale', { value = price }), 'success', 6000)
    PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
end

local function SellData(data,model)
    QBCore.Functions.TriggerCallback("qb-vehiclesales:server:CheckModelName",function(DataReturning)
        local vehicleData = {}
        vehicleData.ent = GetVehiclePedIsUsing(PlayerPedId())
        vehicleData.model = DataReturning
        vehicleData.plate = model
        vehicleData.mods = QBCore.Functions.GetVehicleProperties(vehicleData.ent)
        vehicleData.desc = data.desc
        TriggerServerEvent('qb-occasions:server:sellVehicle', data.price, vehicleData)
        sellVehicleWait(data.price)
    end, model)
end


local function Listen4Control(spot) 

    CreateThread(function()
   
        if spot then
            local data = {Contract = spot}
            TriggerEvent('qb-vehiclesales:client:OpenContract', data)
        else
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                TriggerEvent('qb-occasions:client:MainMenu')
            else
                exports['Roda_Notifications']:showNotify("You must be sitting inside a vehicle!", 'error', 6000)
            end
        end
    
    end)
end


---- ** Main Zone Functions ** ----

local function CreateZones()
    for k, v in pairs(Config.Zones) do
        local SellSpot = PolyZone:Create(v.PolyZone, {
            name = k,
            minZ = 	v.MinZ,
            maxZ = v.MaxZ,
            debugPoly = false
        })

        SellSpot:onPlayerInOut(function(isPointInside)
            if isPointInside and zone ~= k then
                Zone = k
                QBCore.Functions.TriggerCallback('qb-occasions:server:getVehicles', function(vehicles)
                    despawnOccasionsVehicles()
                    spawnOccasionsVehicles(vehicles)
                end)
            else
                despawnOccasionsVehicles()
                Zone = nil
            end
        end)
        AcitveZone[k] = SellSpot
    end
end

local function DeleteZones()
    for k, v in pairs(AcitveZone) do
        AcitveZone[k]:destroy()
    end
    AcitveZone = {}
end

local function IsCarSpawned(Car)
    local bool = false

    if occasionVehicles then
        for k, v in pairs(occasionVehicles[Zone]) do
            if k == Car then
                bool = true
                break
            end
        end
    end
    return bool
end

-- NUI Callbacks

RegisterNUICallback('sellVehicle', function(data, cb)
    local plate = QBCore.Functions.GetPlate(GetVehiclePedIsUsing(PlayerPedId())) --Getting the plate and sending to the function
    SellData(data,plate)
    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('buyVehicle', function(data, cb)
    TriggerServerEvent('qb-occasions:server:buyVehicle', CurrentVehicle)
    cb('ok')
end)

-- Events

RegisterNetEvent('qb-occasions:client:BuyFinished', function(vehdata)
    local vehmods = json.decode(vehdata.mods)

    DoScreenFadeOut(250)
    Wait(500)
    QBCore.Functions.SpawnVehicle(vehdata.model, function(veh)
        SetVehicleNumberPlateText(veh, vehdata.plate)
        SetEntityHeading(veh, Config.Zones[Zone].BuyVehicle.w)
        SetVehicleFuelLevel(veh, 100)
        exports['Roda_Notifications']:showNotify(Lang:t('success.vehicle_bought'), 'success', 6000)
        TriggerEvent("vehiclekeys:client:SetOwner", vehdata.plate)
        SetVehicleEngineOn(veh, true, true)
        Wait(500)
        QBCore.Functions.SetVehicleProperties(veh, vehmods)
    end, Config.Zones[Zone].BuyVehicle, true)
    Wait(500)
    DoScreenFadeIn(250)
    CurrentVehicle = {}
end)
 
RegisterNetEvent('qb-occasions:client:SellBackCar', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicleData = {}
        local vehicle = GetVehiclePedIsIn(ped, false)
        vehicleData.model = GetEntityModel(vehicle)
        vehicleData.plate = GetVehicleNumberPlateText(vehicle)
        QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
            if owned then
                TriggerServerEvent('qb-occasions:server:sellVehicleBack', vehicleData)
                QBCore.Functions.DeleteVehicle(vehicle)
            else
                exports['Roda_Notifications']:showNotify(Lang:t('error.not_your_vehicle'), 'error', 6000)
            end
        end, vehicleData.plate)
    else
        exports['Roda_Notifications']:showNotify("You must be sitting inside a vehicle!", 'error', 6000)
    end
end)

RegisterNetEvent('qb-occasions:client:ReturnOwnedVehicle', function(vehdata)
    local vehmods = json.decode(vehdata.mods)
    DoScreenFadeOut(250)
    Wait(500)
    QBCore.Functions.SpawnVehicle(vehdata.model, function(veh)
        SetVehicleNumberPlateText(veh, vehdata.plate)
        SetEntityHeading(veh, Config.Zones[Zone].BuyVehicle.w)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        SetVehicleFuelLevel(veh, 100)
        exports['Roda_Notifications']:showNotify(Lang:t('info.vehicle_returned'), 'info', 6000)
        TriggerEvent("vehiclekeys:client:SetOwner", vehdata.plate)
        SetVehicleEngineOn(veh, true, true)
        Wait(500)
        QBCore.Functions.SetVehicleProperties(veh, vehmods)
    end, Config.Zones[Zone].BuyVehicle, true)
    Wait(500)
    DoScreenFadeIn(250)
    CurrentVehicle = {}
end)

RegisterNetEvent('qb-occasion:client:refreshVehicles', function()
    if Zone then
        QBCore.Functions.TriggerCallback('qb-occasions:server:getVehicles', function(vehicles)
            despawnOccasionsVehicles()
            spawnOccasionsVehicles(vehicles)
        end)
    end
end)

RegisterNetEvent('qb-vehiclesales:client:SellVehicle', function()
    local VehiclePlate = QBCore.Functions.GetPlate(GetVehiclePedIsIn(PlayerPedId()))
    QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
        if owned then
            QBCore.Functions.TriggerCallback('qb-occasions:server:getVehicles', function(vehicles)
                if vehicles == nil or #vehicles < #Config.Zones[Zone].VehicleSpots then
                    openSellContract(true)
                else
                    exports['Roda_Notifications']:showNotify(Lang:t('error.no_space_on_lot'), 'error', 6000)
                end
            end)
        else
            exports['Roda_Notifications']:showNotify(Lang:t('error.not_your_vehicle'), 'error', 6000)
        end
    end, VehiclePlate)
end)

RegisterNetEvent('qb-vehiclesales:client:OpenContract', function(data)
    CurrentVehicle = occasionVehicles[Zone][data.Contract]
    if CurrentVehicle then
        QBCore.Functions.TriggerCallback('qb-occasions:server:getSellerInformation', function(info)
            if info then
                info.charinfo = json.decode(info.charinfo)
            else
                info = {}
                info.charinfo = {
                    firstname = Lang:t('charinfo.firstname'),
                    lastname = Lang:t('charinfo.lastname'),
                    account = Lang:t('charinfo.account'),
                    phone = Lang:t('charinfo.phone')
                }
            end

            openBuyContract(info, CurrentVehicle)
        end, CurrentVehicle.owner)
    else
        exports['Roda_Notifications']:showNotify("This vehicle is not on sale!", 'error', 6000)
    end
end)

RegisterNetEvent('qb-occasions:client:MainMenu', function()
    local MainMenu = {
        {
            isMenuHeader = true,
            header = "RV Sales"
        },
        {
            header = "Sell Vehicle",
            txt = "Put your vehicle on sale!",
            params = {
                event = 'qb-vehiclesales:client:SellVehicle',
            }
        }
    }
    exports[Config.Menu]:openMenu(MainMenu)
end)

RegisterNetEvent('qb-vehiclesales:aryan', function()
    Listen4Control()
end)

-- Threads

CreateThread(function()
    for _, cars in pairs(Config.Zones) do 
        local OccasionBlip = AddBlipForCoord(1235.61, 2733.44, 37.4)
        SetBlipSprite (OccasionBlip, 326)
        SetBlipDisplay(OccasionBlip, 4)
        SetBlipScale  (OccasionBlip, 0.75)
        SetBlipAsShortRange(OccasionBlip, true)
        SetBlipColour(OccasionBlip, 3)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Lang:t('info.used_vehicle_lot'))
        EndTextCommandSetBlipName(OccasionBlip)
    end
end)

CreateThread(function()
    
    for k, v in pairs(Config.Peds) do
		RequestModel('a_m_y_smartcaspat_01') while not HasModelLoaded('a_m_y_smartcaspat_01') do Wait(0) end
		peds[#peds+1] = CreatePed(0, 'a_m_y_smartcaspat_01',v.coords.x, v.coords.y, v.coords.z, v.coords[4], false, false)
        SetEntityInvincible(peds[#peds], true)
		SetBlockingOfNonTemporaryEvents(peds[#peds], true)
		FreezeEntityPosition(peds[#peds], true)

        exports[Config.Target]:AddTargetModel('a_m_y_smartcaspat_01', {
            options = {
                {
                    type = "client",
                    icon = "fa-solid fa-car",
                    event = "qb-vehiclesales:aryan",
                    label = "Put your vehicle on sale!",
                }
            },
            distance = 5.0
        })
    end
end)

---- ** Mostly just to ensure you can restart resources live without issues, also improves the code slightly. ** ----

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    CreateZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    DeleteZones()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        CreateZones()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteZones()
        despawnOccasionsVehicles()
    end
end)