local QBCore = exports['qb-core']:GetCoreObject()

local lastAnimals = {}
local animals = {
    {model = "a_c_deer", hash = -664053099, item = "meat_deer", id = 35},
    {model = "a_c_pig", hash = -1323586730, item = "meat_pig", id = 36},
    {model = "a_c_boar", hash = -832573324, item = "meat_boar", id = 37},
    {model = "a_c_mtlion", hash = 307287994, item = "meat_mtlion",id = 38},
    {model = "a_c_sharkhammer", hash = 015224100, item = "meat_hshark", id = 39},
    {model = "a_c_sharktiger", hash = 113504370, item = "meat_shark", id = 40},
    {model = "a_c_stingray", hash = -1589092019, item = "meat_stingray", id = 41},
    {model = "a_c_coyote", hash = 1682622302, item = "meat_coyote", id = 42},
    {model = "a_c_rabbit_01", hash = -541762431, item = "meat_rabbit", id = 43},
    {model = "a_c_dolphin", hash = -1950698411, item = "meat_dolphin", id = 44},
    {model = "a_c_killerwhale", hash = 1920284487, item = "meat_whale", id = 45},
	{model = "a_c_cormorant", hash = 1457690978, item = "meatcormorant", id = 46},
	{model = "a_c_chickenhawk", hash = -1430839454, item = "meatchickenhawk", id = 47},
}

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerGang = PlayerData.gang
    PlayerJob = PlayerData.job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    PlayerGang = gang
end)

-- Functions for catching animals thread

function getAnimalMatch(hash)
    for _, v in pairs(animals) do if (v.hash == hash) then return v end end
end

function removeEntity(entity)
    local delidx = 0

    for i = 1, #lastAnimals do
        if (lastAnimals[i].entity == entity) then delidx = i end
    end

    if (delidx > 0) then table.remove(lastAnimals, delidx) end
end

function lastAnimalExists(entity)
    for _, v in pairs(lastAnimals) do
        if (v.entity == entity) then return true end
    end
end

function handleDecorator(animal)
    if (DecorExistOn(animal, "lastshot")) then
        DecorSetInt(animal, "lastshot", GetPlayerServerId(PlayerId()))
    else
        DecorRegister("lastshot", 3)
        DecorSetInt(animal, "lastshot", GetPlayerServerId(PlayerId()))
    end
end

function isKillMine(animal)
    if (DecorExistOn(animal, "lastshot")) then
        local aid = DecorGetInt(animal, "lastshot")
        local id = GetPlayerServerId(PlayerId())

        return aid == id
    end
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end

------

-- Thread to catch the animal

Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed(-1)
        Wait(1)
        if (IsAimCamActive()) and not IsPedInAnyVehicle(ped, false) then
            local _, ent = GetEntityPlayerIsFreeAimingAt(PlayerId(), Citizen.ReturnResultAnyway())
            if (ent and not IsEntityDead(ent)) then
                if (IsEntityAPed(ent)) then
                    local model = GetEntityModel(ent)
                    local animal = getAnimalMatch(model)
                    if (model and animal) then
                        handleDecorator(ent)
                        if (not lastAnimalExists(ent)) then
                            if (#lastAnimals > 5) then
                                table.remove(lastAnimals, 1)
                            end
                            local newAnim = {}
                            newAnim.entity = ent
                            newAnim.data = animal
                            table.insert(lastAnimals, newAnim)
                        end
                    end
                end
            end
        end
        if (#lastAnimals > 0) then
            for _, v in pairs(lastAnimals) do
                local pos = GetEntityCoords(ped)
                local rpos = GetEntityCoords(v.entity)
                if (GetDistanceBetweenCoords(pos, rpos.x, rpos.y, rpos.z, true) <
                    40 and isKillMine(v.entity)) then
                    if (DoesEntityExist(v.entity)) then
                        if (IsEntityDead(v.entity)) then
                            if (GetDistanceBetweenCoords(pos, rpos.x, rpos.y, rpos.z, true) < 1.1) then
                                exports['erp-drawtext']:DrawText('[E] HUNT ANIMAL','left')
                                if IsControlJustPressed(0, 38) and
                                    GetSelectedPedWeapon(ped) ==
                                    GetHashKey("WEAPON_KNIFE") then
                                    local random = math.random(5, 10)
                                    loadAnimDict('amb@medic@standing@kneel@base')
                                    loadAnimDict('anim@gangops@facility@servers@bodysearch@')
                                    TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
                                    TaskPlayAnim(GetPlayerPed(-1), "anim@gangops@facility@servers@bodysearch@", "player_search", 8.0, -8.0, -1, 48, 0, false, false, false)
                                    QBCore.Functions.Progressbar('apanhar_animal', 'CUTTING ANIMAL...', 5000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }, {}, {}, {}, function() -- Play When Done
                                    removeEntity(v.entity)
                                    DeleteEntity(v.entity)
                                    exports['erp-drawtext']:HideText()
                                    ClearPedTasks(GetPlayerPed(-1))
                                    TriggerServerEvent('hud:server:GainStress', math.random(1,3))
                                    TriggerServerEvent('erp-hunting:server:AddItem', v.data.id, random)
                                    Citizen.Wait(1500)
                                    end)
                                end
                            end
                        end
                    else
                        removeEntity(v.entity)
                        DeleteEntity(v.entity)
                    end
                end
            end
        end
    end
end)

-----

-- Hunt shop events

RegisterNetEvent('erp-hunting:client:HuntStore')
AddEventHandler('erp-hunting:client:HuntStore', function()
   TriggerEvent('erp-hunting:client:MenuStore')
end)

RegisterNetEvent('erp-hunting:client:BuySniper')
AddEventHandler('erp-hunting:client:BuySniper', function(data)
    TriggerServerEvent('erp-hunting:server:BuySniper')
end)

RegisterNetEvent('erp-hunting:client:BuyBullets')
AddEventHandler('erp-hunting:client:BuyBullets', function(data)
    TriggerServerEvent('erp-hunting:server:BuyBullets')
end)

RegisterNetEvent('erp-hunting:client:BuyKnife')
AddEventHandler('erp-hunting:client:BuyKnife', function(data)
    TriggerServerEvent('erp-hunting:server:BuyKnife')
end)

RegisterNetEvent('erp-hunting:client:MenuStore')
AddEventHandler('erp-hunting:client:MenuStore', function()
    exports['qb-menu']:openMenu({
        {
            header = "Hunting shop",
            isMenuHeader = true,
        },
        {
            header = "Buy sniper rifle",
            txt = "Price: 1000$",
            params = {
                event = "erp-hunting:client:BuySniper",
            }
        },
        {
            header = "Buy sniper ammo",
            txt = "Price: 10$",
            params = {
                event = "erp-hunting:client:BuyBullets",
            }
        },
        {
            header = "Buy knife",
            txt = "Price: 500$",
            params = {
                event = "erp-hunting:client:BuyKnife",
            }
        },
        {
            header = "✘",
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
    })
end)



------