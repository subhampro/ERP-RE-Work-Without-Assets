QBCore = exports['qb-core']:GetCoreObject()

local RentingCar = false
local Vehspawn = nil
local VehPlate = nil
local currentvehicle = nil
local currentcatagory = nil
local time = 0
local currentfee = 0
local Account = "none"

CreateThread(function()
    for k,v in pairs(Config.Locations) do
        if Config.Locations[k].BlipEnabled then
            RentalVehicle = AddBlipForCoord(Config.Locations[k].GetVehicle.x, Config.Locations[k].GetVehicle.y, Config.Locations[k].GetVehicle.z)
            SetBlipSprite(RentalVehicle, Config.Locations[k].BlipIcon)
            SetBlipScale(RentalVehicle, Config.Locations[k].BlipSize)
            SetBlipDisplay(RentalVehicle, 4)
            SetBlipColour(RentalVehicle, Config.Locations[k].BlipColor)
            SetBlipAsShortRange(RentalVehicle, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Locations[k].BlipLabel)
            EndTextCommandSetBlipName(RentalVehicle)
        end
    end
end)


function GetPlrMoney(currentfee)
    local PlrCash = QBCore.Functions.GetPlayerData().money["cash"]
    local PlrBank = QBCore.Functions.GetPlayerData().money["bank"]
    
    if PlrCash >= currentfee then
        Account = "cash"
    elseif PlrBank >= currentfee then
        Account = "bank"
    else
        Account = "none"
    end
end

function GetVehicleSpawn()
    for k,v in pairs(Config.Locations) do
        local PlrCoords = GetEntityCoords(PlayerPedId())
        local RenCoords = Config.Locations[k].GetVehicle
        local dist = #(vector3(PlrCoords) - vector3(RenCoords))

        if dist < 10 then
            Vehspawn = Config.Locations[k].VehicleSpawn
        end
    end
end

function GenerateLicensePlate()
    VehPlate = "RENT"..math.random(1000, 9999)
end

CreateThread(function()
    while true do
        if RentingCar then
            if Config.Rental.CheckForEngineDamage then
                if GetVehicleEngineHealth(currentvehicle) <= 0 then
                    RentingCar = false
                    TriggerServerEvent('erp-rentals:server:removemoney', src, Config.Rental.RentalVehicleDamagedFee, "bank")
                    exports['Roda_Notifications']:showNotify("You rental is destroyed & you were charged $ "..Config.Rental.RentalVehicleDamagedFee, 'error', 6000)
                
                end
            end

            if Config.Rental.CheckForUnderWaterVeh then
                if currentcatagory ~= 3 then
                    if IsEntityInWater(currentvehicle) then
                        Wait(5000)
                        if not GetIsVehicleEngineRunning(currentvehicle) then
                            RentingCar = false
                            TriggerServerEvent('erp-rentals:server:removemoney', src, Config.Rental.RentalVehicleDamagedFee, "bank")
                            exports['Roda_Notifications']:showNotify("You rental is destroyed & you were charged $ "..Config.Rental.RentalVehicleDamagedFee, 'error', 6000)
                        end
                    end
                end
            end
        end
    Wait(1000)
    end
end)

RegisterNetEvent('erp-rentals:client:spawncar', function(data)
    if not RentingCar then
        currentfee = data.fee
        GetPlrMoney(currentfee)
        if Account == "cash" or Account == "bank" then
            local src = PlayerPedId()
            local PlayerFirstName = QBCore.Functions.GetPlayerData().charinfo.firstname
            local PlayerLastName = QBCore.Functions.GetPlayerData().charinfo.lastname
            TriggerServerEvent('erp-rentals:server:removemoney', src, data.fee, Account)
            GetVehicleSpawn()
            GenerateLicensePlate()
            currentcatagory = data.catagory
            RentingCar = true
            QBCore.Functions.SpawnVehicle(data.vehicle, function(rentvehicle)
                currentvehicle = rentvehicle
                SetVehicleNumberPlateText(rentvehicle, VehPlate)
                SetEntityHeading(rentvehicle, Vehspawn.w)
                exports[Config.FuelScript]:SetFuel(rentvehicle, 100.0)
                TaskWarpPedIntoVehicle(PlayerPedId(), rentvehicle, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", VehPlate)
                SetVehicleEngineOn(rentvehicle, true, true)
            end, Vehspawn, true)
            TriggerServerEvent('erp-rentals:server:givedocument', src, PlayerFirstName, PlayerLastName, data.label, VehPlate)
            TriggerEvent("qb-log:server:CreateLog", "rental", "Take Rental Car Succesfully CAR::"..data.label , "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) ")

            exports['Roda_Notifications']:showNotify("You have successfully rented "..data.label, 'success', 6000)
        else
            exports['Roda_Notifications']:showNotify("You don't have enough money!", 'error', 6000)
        end
    else
        exports['Roda_Notifications']:showNotify("You cannot get another rental, please return your previous rental", 'error', 6000)
    end
end)

RegisterNetEvent('erp-rentals:client:returncar', function()
    if currentvehicle ~= nil then
        local PlrCoords = GetEntityCoords(PlayerPedId())
        local VehCoords = GetEntityCoords(currentvehicle)
        local dist = #(vector3(PlrCoords) - vector3(VehCoords))
        if dist < 20 then
            if Config.Rental.ChrgPlrFeeIfRtrnDmged then
                if (GetVehicleBodyHealth(currentvehicle) <= 980 or GetVehicleEngineHealth(currentvehicle) <= 980) then
                    TriggerServerEvent('erp-rentals:server:removemoney', src, Config.Rental.RentalVehicleRtrnDmgFee, "bank")
                    exports['Roda_Notifications']:showNotify("You have been charged $ "..Config.Rental.RentalVehicleRtrnDmgFee.." for damaging the vehicle", 'error', 6000)
                end
            end
            DeleteEntity(currentvehicle)
            exports['Roda_Notifications']:showNotify("You have returned your rental", 'success', 6000)
            RentingCar = false
            TriggerServerEvent('erp-rentals:server:removedocument', src)
        else
            exports['Roda_Notifications']:showNotify("Your rental vehicle is not nearby..", 'error', 6000)
        end
    else
        exports['Roda_Notifications']:showNotify("Your are not renting any vehicle", 'error', 6000)
    end
end)

RegisterNetEvent('erp-rentals:client:openmenu', function(Catagory)
    local rentvehicleMenu = {
        {
            header = "ERP RENTALS",
            isMenuHeader = true
        }
    }
    if Catagory == 1 then
        for k,v in pairs(Config.RentableVehicles.Catagorys[1]) do
            rentvehicleMenu[#rentvehicleMenu+1] = {
                header = {Config.RentableVehicles.Catagorys[1][k].Label},
                txt = "$ "..Config.RentableVehicles.Catagorys[1][k].RentFee,
                params = {
                    event = "erp-rentals:client:spawncar",
                    args = {
                        vehicle = Config.RentableVehicles.Catagorys[1][k].SpawnName,
                        label = Config.RentableVehicles.Catagorys[1][k].Label,
                        fee = Config.RentableVehicles.Catagorys[1][k].RentFee,
                        catagory = 1
                    }
                }
            }
        end
    elseif Catagory == 2 then
        for k,v in pairs(Config.RentableVehicles.Catagorys[2]) do
            rentvehicleMenu[#rentvehicleMenu+1] = {
                header = {Config.RentableVehicles.Catagorys[2][k].Label},
                txt = "$ "..Config.RentableVehicles.Catagorys[2][k].RentFee,
                params = {
                    event = "erp-rentals:client:spawncar",
                    args = {
                        vehicle = Config.RentableVehicles.Catagorys[2][k].SpawnName,
                        label = Config.RentableVehicles.Catagorys[2][k].Label,
                        fee = Config.RentableVehicles.Catagorys[2][k].RentFee,
                        catagory = 2
                    }
                }
            }
        end
    elseif Catagory == 3 then
        for k,v in pairs(Config.RentableVehicles.Catagorys[3]) do
            rentvehicleMenu[#rentvehicleMenu+1] = {
                header = {Config.RentableVehicles.Catagorys[3][k].Label},
                txt = "$ "..Config.RentableVehicles.Catagorys[3][k].RentFee,
                params = {
                    event = "erp-rentals:client:spawncar",
                    args = {
                        vehicle = Config.RentableVehicles.Catagorys[3][k].SpawnName,
                        label = Config.RentableVehicles.Catagorys[3][k].Label,
                        fee = Config.RentableVehicles.Catagorys[3][k].RentFee,
                        catagory = 3
                    }
                }
            }
        end
    end

    rentvehicleMenu[#rentvehicleMenu+1] = {
        header = "✘ Close",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }
    exports['qb-menu']:openMenu(rentvehicleMenu)
end)

CreateThread(function()
    for k,v in pairs(Config.Locations) do
            Ped = type(Config.Locations[k].TargetPed) == "string" and GetHashKey(Config.Locations[k].TargetPed) or Ped
            RequestModel(Ped)

            while not HasModelLoaded(Ped) do
                Wait(0)
            end

            RentalPed = CreatePed(0, Ped, Config.Locations[k].GetVehicle.x, Config.Locations[k].GetVehicle.y, Config.Locations[k].GetVehicle.z-1, Config.Locations[k].GetVehicle.w, false, false)
            TaskStartScenarioInPlace(RentalPed, Config.Locations[k].TargetPedScenario, true)
            FreezeEntityPosition(RentalPed, true)
            SetEntityInvincible(RentalPed, true)
            SetBlockingOfNonTemporaryEvents(RentalPed, true)

            if Config.Locations[k].VehicleCatagory == 1 then
                exports['qb-target']:AddTargetEntity(RentalPed, {
                    options = {
                        {
                            label = "RENT A VEHICLE",
                            icon = "fa-solid fa-car",
                            action = function()
                                TriggerEvent('erp-rentals:client:openmenu', 1)
                                GetVehicleSpawn()
                            end
                        },
                        {
                            label = "RETURN",
                            icon = "fa fa-long-arrow-left",
                            action = function()
                                TriggerEvent('erp-rentals:client:returncar')
                                GetVehicleSpawn()
                            end
                        }
                    },
                    distance = 2.0,
                }) 
            elseif Config.Locations[k].VehicleCatagory == 2 then
                exports['qb-target']:AddTargetEntity(RentalPed, {
                    options = {
                        {
                            label = "RENT A AIRCRAFT",
                            icon = "fas fa-plane",
                            action = function()
                                TriggerEvent('erp-rentals:client:openmenu', 2)
                                GetVehicleSpawn()
                            end
                        },
                        {
                            label = "RETURN",
                            icon = "fa fa-long-arrow-right",
                            action = function()
                                TriggerEvent('erp-rentals:client:returncar')
                                GetVehicleSpawn()
                            end
                        }
                    },
                    distance = 2.0,
                }) 
            elseif Config.Locations[k].VehicleCatagory == 3 then
                exports['qb-target']:AddTargetEntity(RentalPed, {
                    options = {
                        {
                            label = "RENT A BOAT",
                            icon = "fas fa-water",
                            action = function()
                                TriggerEvent('erp-rentals:client:openmenu', 3)
                                GetVehicleSpawn()
                            end
                        },
                        {
                            label = "RETURN",
                            icon = "fa fa-long-arrow-right",
                            action = function()
                                TriggerEvent('erp-rentals:client:returncar')
                                GetVehicleSpawn()
                            end
                        }
                    },
                    distance = 2.0,
                }) 
            end
    end
end)