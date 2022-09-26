local QBCore = exports["qb-core"]:GetCoreObject()

local menuOpen = false

local savedColor = {
    r = 255,
    g = 0,
    b = 0,
}

RegisterNUICallback('NUIReady', function(data, cb)
    if not Config.AllowHeadlights then
        SendNUIMessage({
            event = "disallowHeadlights",
        })
    end
    cb(true)
end)

RegisterNUICallback('CloseMenu', function(data, cb)
    CloseMenu()
    cb(true)
end)

function CloseMenu()
    menuOpen = false
    ToggleMenu()
end

function ToggleMenu()
    SendNUIMessage({
        event = "show",
        state = menuOpen
    })
    SetNuiFocus(menuOpen, menuOpen)
    SetNuiFocusKeepInput(true)
end

RegisterNUICallback('SetRGB', function(data, cb)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)

    animStep = 1
    anim = nil
    animVehicle = nil

    savedColor = {
        r = data.r,
        g = data.g,
        b = data.b,
    }

    RGB(veh, data.r, data.g, data.b)
    cb(true)
end)

function RGB(veh, r, g, b)
    SetVehicleNeonLightsColour(veh, tonumber(r), tonumber(g), tonumber(b))
end

RegisterNUICallback('SetXenon', function(data, cb)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if IsToggleModOn(veh, 22) then
        Xenon(veh, data.color)
    else
        QBCore.Functions.Notify('Vehicle requires Xenon headlights to change the color', 'error')
    end

    cb(true)
end)

function Xenon(veh, color)
    SetVehicleXenonLightsColor(veh, tonumber(color))
end

Citizen.CreateThread(function()
    while true do
        local sleep = 100
        if menuOpen then
            sleep = 0
            DisableControlAction(0, 1, menuOpen)
            DisableControlAction(0, 2, menuOpen)
            DisableControlAction(0, 14, menuOpen)
            DisableControlAction(0, 15, menuOpen)
            DisableControlAction(0, 16, menuOpen)
            DisableControlAction(0, 17, menuOpen)
            DisableControlAction(0, 50, menuOpen)
            DisableControlAction(0, 81, menuOpen)
            DisableControlAction(0, 82, menuOpen)
            DisableControlAction(0, 96, menuOpen)
            DisableControlAction(0, 97, menuOpen)
            DisableControlAction(0, 99, menuOpen)
            DisableControlAction(0, 198, menuOpen)
            DisableControlAction(0, 142, menuOpen)
            DisableControlAction(0, 263, menuOpen)
            DisableControlAction(0, 262, menuOpen)
            DisableControlAction(0, 264, menuOpen)
            DisableControlAction(0, 257, menuOpen)
            DisableControlAction(0, 332, menuOpen)
            DisableControlAction(0, 333, menuOpen)
            DisableControlAction(0, 336, menuOpen)
        end

        Citizen.Wait(sleep)
    end
end)

function ShowTooltip(message)
    SetTextComponentFormat("STRING")
    AddTextComponentString(message)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

RegisterNetEvent('erp-rgb_controller:client:OpenController', function()
    if IsPedInAnyVehicle(PlayerPedId()) then
        menuOpen = not menuOpen
        ToggleMenu()
    else
        QBCore.Functions.Notify('You are not inside a vehicle', 'error')
    end 
end)
