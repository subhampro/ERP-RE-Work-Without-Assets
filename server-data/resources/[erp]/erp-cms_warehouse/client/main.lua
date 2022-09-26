local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
end)

-- Code

-- local washing = false
-- local timer = 0
-- local collect = false
-- local washer = 0

local Insidecms_warehouse = false
local Closestcms_warehouse = 0

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function SetClosestcms_warehouse()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
    for id, cms_warehouse in pairs(Config.Locations["cms_warehouse"]) do
        if current ~= nil then
            if(Vdist(pos, Config.Locations["cms_warehouse"][id].coords.x, Config.Locations["cms_warehouse"][id].coords.y, Config.Locations["cms_warehouse"][id].coords.z, true) < dist)then
                current = id
                dist = Vdist(pos, Config.Locations["cms_warehouse"][id].coords.x, Config.Locations["cms_warehouse"][id].coords.y, Config.Locations["cms_warehouse"][id].coords.z, true)
            end
        else
            dist = Vdist(pos, Config.Locations["cms_warehouse"][id].coords.x, Config.Locations["cms_warehouse"][id].coords.y, Config.Locations["cms_warehouse"][id].coords.z, true)
            current = id
        end
    end
    Closestcms_warehouse = current
end

Citizen.CreateThread(function()
    Wait(500)
    QBCore.Functions.TriggerCallback('erp-cms_warehouse:server:GetData', function(data)
        Config.Currentcms_warehouse = data.Currentcms_warehouse
    end)

    while true do
        SetClosestcms_warehouse()
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    Config.Currentcms_warehouse = math.random(1, #Config.Locations["cms_warehouse"])

    while true do
        local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        -- Exit distance check
        if Insidecms_warehouse then
            if(Vdist(pos, Config.Locations["exit"].coords.x, Config.Locations["exit"].coords.y, Config.Locations["exit"].coords.z, true) < 20)then
                inRange = true
                if(Vdist(pos, Config.Locations["exit"].coords.x, Config.Locations["exit"].coords.y, Config.Locations["exit"].coords.z, true) < 1)then
                    DrawText3Ds(Config.Locations["exit"].coords.x, Config.Locations["exit"].coords.y, Config.Locations["exit"].coords.z, '~g~E~w~ - Leave cms_warehouse')
                    if IsControlJustPressed(0, Keys["E"]) then
                        Exitcms_warehouse()
                    end
                end
            end
        end
        if not inRange then
            Citizen.Wait(1000)
        end
        Citizen.Wait(3)
    end
end)

RegisterNetEvent('erp-cms_warehouse:client:Usecms_warehouseKey')
AddEventHandler('erp-cms_warehouse:client:Usecms_warehouseKey', function(storekey)
    if Closestcms_warehouse == Config.Currentcms_warehouse then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        local dist = Vdist(pos, Config.Locations["cms_warehouse"][Closestcms_warehouse].coords.x, Config.Locations["cms_warehouse"][Closestcms_warehouse].coords.y, Config.Locations["cms_warehouse"][Closestcms_warehouse].coords.z, true)
        if dist < 1 then
            if storekey == Closestcms_warehouse then
                Entercms_warehouse()
            else
                exports['Roda_Notifications']:showNotify('This isn\'t the right key..', 'error', 6000)
            end
        end
    end
end)

function Entercms_warehouse()
    local ped = PlayerPedId()

    OpenDoorAnimation()
    Insidecms_warehouse = true
    Citizen.Wait(500)
    DoScreenFadeOut(250)
    Citizen.Wait(250)
    SetEntityCoords(ped, Config.Locations["exit"].coords.x, Config.Locations["exit"].coords.y, Config.Locations["exit"].coords.z - 0.98)
    SetEntityHeading(ped, Config.Locations["exit"].coords.h)
    Citizen.Wait(1000)
    DoScreenFadeIn(250)
end

function Exitcms_warehouse()
    local ped = PlayerPedId()
    local dict = "mp_heists@keypad@"
    local anim = "idle_a"
    local flag = 0
    local keypad = {
        coords = {x = 895.96, y = -3245.798, z = -98.24, h = 265.75, r = 1.0},
    }
    OpenDoorAnimation()
    Citizen.Wait(500)
    DoScreenFadeOut(250)
    Citizen.Wait(250)
    SetEntityCoords(ped, Config.Locations["cms_warehouse"][Config.Currentcms_warehouse].coords.x, Config.Locations["cms_warehouse"][Config.Currentcms_warehouse].coords.y, Config.Locations["cms_warehouse"][Config.Currentcms_warehouse].coords.z - 0.98)
    SetEntityHeading(ped, Config.Locations["cms_warehouse"][Config.Currentcms_warehouse].coords.h)
    Insidecms_warehouse = false
    Citizen.Wait(1000)
    DoScreenFadeIn(250)
end

function LoadAnimationDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

function OpenDoorAnimation()
    local ped = PlayerPedId()
    LoadAnimationDict("anim@heists@keycard@") 
    TaskPlayAnim(ped, "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0)
    Citizen.Wait(400)
    ClearPedTasks(ped)
end

function noSpace(str)
    local normalisedString = string.gsub(str, "%s+", "")
    return normalisedString
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end



