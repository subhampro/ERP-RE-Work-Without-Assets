local QBCore = exports['qb-core']:GetCoreObject()

local players = {}
-- Key = entity id
-- Value = time of the search
local searechBins = {}

local function hasCooldownPassed(src)
    local last = players[src]
    if last then
        local now = GetGameTimer()
        if now - last < Config.General.SearchCooldown then
            return false
        end
    end
    return true
end

local function hasBeenRobbed(poleId)
    local last = searechBins[poleId]
    if last then
        local now = GetGameTimer()
        if now - last < Config.General.RefillTime then
            return true
        end
    end
    return false
end

local function isLegit(src)
    local playersLastSearch = players[src]
    if not playersLastSearch then
        return true
    end

    if GetGameTimer() - playersLastSearch >= Config.General.DurationOfSearch then
        return true
    end

    return false
end

RegisterNetEvent('erp-robwire:server:searchpoles', function(data)
    local src = source

    -- If cooldown didnt pass display error message to a player with the remaining
    -- time to wait
    if not hasCooldownPassed(src) then
        local timeLeft = ((players[src] + Config.General.SearchCooldown - GetGameTimer()) / 1000)
        
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("error.cooldown", { time = math.floor(timeLeft) }), 'error', 6000)
        return
    end

    -- If player has already searched trash in the last 10 minutes
    -- display error message
    local poleId = data.entity
    if hasBeenRobbed(poleId) then
        TriggerClientEvent('Roda_Notifications:showNotification', source,Lang:t("error.hasBeenRobbed"), 'error', 6000)
        return
    end

    TriggerClientEvent('erp-robwire:client:searchpoles', src, poleId)
end)

local function rollPrecentage(precantage)
    local roll = math.random(1, 100)
    if roll <= precantage then
        return true
    end
    return false
end

-- Register NetEvent erp-robwire:server:robedPole
RegisterNetEvent('erp-robwire:server:robedPole', function(poleId)
    local src = source

    -- Check if player is legit
    if not isLegit(src) then
        TriggerClientEvent("qb-anticheat:client:ban", src, "erp-robwire -> Player " .. GetPlayerName(src) .. " tried to bypass cooldown")
        error("erp-robwire -> Player tried to bypass cooldown")
    end

    local player = QBCore.Functions.GetPlayer(src)

    -- Set last search time
    players[src] = GetGameTimer()

    -- Set last search time
    searechBins[poleId] = GetGameTimer()

    if not rollPrecentage(Config.Reward.Chance) then
        TriggerClientEvent('Roda_Notifications:showNotification', source, Lang:t("error.nothingFound"), 'error', 6000)
        return
    end

    local items = {}

    for i = 1, math.random(Config.Reward.MinNumberOfItems, Config.Reward.MaxNumberOfItems) do
        local item = Config.Reward.ItemList[math.random(1, #Config.Reward.ItemList)]
        items[#items + 1] = item
    end

    for k, v in pairs(items) do
        player.Functions.AddItem(v, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[v], "add")
    end
end)
