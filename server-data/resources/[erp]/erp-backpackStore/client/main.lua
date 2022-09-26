local QBCore = exports["qb-core"]:GetCoreObject()
local inChips = false
local currentShop, currentData
local pedSpawned = false
local ShopPed = {}

-- Functions
local function SetupItems(shop)
    local products = Config.Locations[shop].products
    local playerJob = QBCore.Functions.GetPlayerData().job.name
    local items = {}
    for i = 1, #products do
        if not products[i].requiredJob then
            items[#items + 1] = products[i]
        else
            for i2 = 1, #products[i].requiredJob do
                if playerJob == products[i].requiredJob[i2] then
                    items[#items + 1] = products[i]
                end
            end
        end
    end
    return items
end

local function createBlips()
    for store, _ in pairs(Config.Locations) do
        if Config.Locations[store]["showblip"] then
            StoreBlip = AddBlipForCoord(Config.Locations[store]["coords"]["x"], Config.Locations[store]["coords"]["y"], Config.Locations[store]["coords"]["z"])
            SetBlipSprite(StoreBlip, Config.Locations[store]["blipsprite"])
            SetBlipScale(StoreBlip, 0.55)
            SetBlipDisplay(StoreBlip, 4)
            SetBlipColour(StoreBlip, Config.Locations[store]["blipcolor"])
            SetBlipAsShortRange(StoreBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Locations[store]["label"])
            EndTextCommandSetBlipName(StoreBlip)
        end
    end
end

-- Events
RegisterNetEvent("erp-backpacStore:client:UpdateShop", function(shop, itemData, amount)
    TriggerServerEvent("erp-backpacStore:server:UpdateShopItems", shop, itemData, amount)
end)

RegisterNetEvent("erp-backpacStore:client:SetShopItems", function(shop, shopProducts)
    Config.Locations[shop]["products"] = shopProducts
end)

RegisterNetEvent("erp-backpacStore:client:RestockShopItems", function(shop, amount)
    if Config.Locations[shop]["products"] ~= nil then
        for k, v in pairs(Config.Locations[shop]["products"]) do
            Config.Locations[shop]["products"][k].amount = Config.Locations[shop]["products"][k].amount + amount
        end
    end
end)

local function openShop(shop, data)
    local products = data.products
    local ShopItems = {}
    ShopItems.items = {}

    ShopItems.label = data["label"]
       
    ShopItems.items = SetupItems(shop)
       
    for k, v in pairs(ShopItems.items) do
        ShopItems.items[k].slot = k
    end
    ShopItems.slots = 30
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Itemshop_" .. shop, ShopItems)
    
end

local function createPeds()
    if pedSpawned then return end
    for k, v in pairs(Config.Locations) do
        if not ShopPed[k] then ShopPed[k] = {} end
        local current = v["ped"]
        current = type(current) == 'string' and GetHashKey(current) or current
        RequestModel(current)

        while not HasModelLoaded(current) do
            Wait(0)
        end
        ShopPed[k] = CreatePed(0, current, v["coords"].x, v["coords"].y, v["coords"].z-1, v["coords"].w, false, false)
        TaskStartScenarioInPlace(ShopPed[k], v["scenario"], true)
        FreezeEntityPosition(ShopPed[k], true)
        SetEntityInvincible(ShopPed[k], true)
        SetBlockingOfNonTemporaryEvents(ShopPed[k], true)

      
        exports['qb-target']:AddTargetEntity(ShopPed[k], {
            options = {
                {
                    label = v["targetLabel"],
                    icon = v["targetIcon"],
                    item = v["item"],
                    action = function()
                        openShop(k, Config.Locations[k])
                    end,
                    job = v["job"],
                    gang = v["gang"],
                }
            },
            distance = 2.0
        })
        
    end

    pedSpawned = true
end

local function deletePeds()
    if pedSpawned then
        for k, v in pairs(ShopPed) do
            DeletePed(v)
        end
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    createBlips()
    createPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    deletePeds()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        createBlips()
        createPeds()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        deletePeds()
    end
end)
