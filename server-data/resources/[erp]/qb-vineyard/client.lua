local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = {}

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
		end)
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

local tasking = false
local startVineyard = false
local random = 0
local pickedGrapes = 0
local blip = 0
local winetimer = Config.wineTimer
local loadIngredients = false
local wineStarted = false
local finishedWine = false

local grapeLocations = {
	[1] = vector3(-1875.41, 2099.37, 138.86),
	[2] = vector3(-1908.64, 2106.64, 132.91),
	[3] = vector3(-1866.04, 2111.64, 134.41),
	[4] = vector3(-1907.67, 2124.55, 125.59),
	[5] = vector3(-1850.31, 2141.95, 122.30),
	[6] = vector3(-1888.06, 2163.78, 116.09),
	[7] = vector3(-1835.52, 2179.59, 104.88),
	[8] = vector3(-1892.55, 2207.71, 96.1),
	[9] = vector3(-1720.37, 2181.03, 106.18),
	[10] = vector3(-1808.52, 2172.14, 107.63),
	[11] = vector3(-1784.22, 2221.80, 92.86),
	[12] = vector3(-1889.8, 2249.44, 80.98),
	[13] = vector3(-1861.16, 2253.32, 81.04),
	[14] = vector3(-1886.75, 2271.80, 70.81),
	[15] = vector3(-1845.49, 2273.63, 73.33),
	[16] = vector3(-1687.28, 2194.76, 97.87),
	[17] = vector3(-1741.18, 2172.22, 114.39),
	[18] = vector3(-1744.27, 2141.32, 121.85),
	[19] = vector3(-1814.73, 2089.99, 134.49),
	[20] = vector3(-1699.49, 2151.02, 110.91),
}

local function log(debugMessage)
	print(('^6[^3qb-vineyard^6]^0 %s'):format(debugMessage))
end

local function CreateBlip()
	if tasking then
		blip = AddBlipForCoord(grapeLocations[random].x,grapeLocations[random].y,grapeLocations[random].z)
	end
    SetBlipSprite(blip, 465)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Drop Off")
    EndTextCommandSetBlipName(blip)
end

local function nextTask()
	if tasking then
		return
	end
	random = math.random(#grapeLocations)
	tasking = true
	CreateBlip()
end

local function startVinyard()
	local amount = math.random(Config.PickAmount.min, Config.PickAmount.max)
	exports['Roda_Notifications']:showNotify(Lang:t("text.start_shift"), "info", 6000)
	while startVineyard do
		if tasking then
			Wait(5000)
		else
			nextTask()
			pickedGrapes = pickedGrapes + 1
			if pickedGrapes == amount then
				nextTask()
				Wait(20000)
				startVineyard = false
				pickedGrapes = 0
				QBCore.Functions.Notify(Lang:t("text.end_shift"))
			end
		end
		Wait(5)
	end
end

local function DeleteBlip()
	if DoesBlipExist(blip) then
		RemoveBlip(blip)
	end
end

local function pickProcess()
    QBCore.Functions.Progressbar("pick_grape", Lang:t("progress.pick_grapes"), math.random(6000,8000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
		tasking = false
        TriggerServerEvent("qb-vineyard:server:getGrapes")
		DeleteBlip()
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
		exports['Roda_Notifications']:showNotify(Lang:t("task.cancel_task"), "error", 6000)
    end)
end

local function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(1)
    end
end

local function PickAnim()
    local ped = PlayerPedId()
    LoadAnim('amb@prop_human_bum_bin@idle_a')
    TaskPlayAnim(ped, 'amb@prop_human_bum_bin@idle_a', 'idle_a', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
end

local grapeZones = {}
for k=1, #grapeLocations do
	local label = ("GrapeZone-%s"):format(k)
	grapeZones[k] = {
		isInside = false,
		zone = BoxZone:Create(grapeLocations[k], 3, 4, {
			name=label,
			minZ = grapeLocations[k].z-4.0,
			maxZ = grapeLocations[k].z+4.0,
			debugPoly=Config.Debug,
		})
	}
	grapeZones[k].zone:onPlayerInOut(function(isPointInside)
		grapeZones[k].isInside = isPointInside
		if grapeZones[k].isInside then
			if Config.Debug then
				log(Lang:t("text.zone_entered",{zone=label}))
				if k == random then log(Lang:t("text.valid_zone")) else log(Lang:t("text.invalid_zone")) end
			end

			if k==random then
				CreateThread(function()
					while grapeZones[k].isInside and k==random do
						exports['qb-core']:DrawText(Lang:t("task.start_task"),'right')
						if not IsPedInAnyVehicle(PlayerPedId()) and IsControlJustReleased(0,38) then
							PickAnim()
							pickProcess()
							exports['qb-core']:HideText()
							random = 0
						end
						Wait(1)
					end
				end)
			end
		else
			if Config.Debug then log(Lang:t("text.zone_exited",{zone=label})) end
			exports['qb-core']:HideText()
		end
	end)
end

local function StartWineProcess()
    CreateThread(function()
        wineStarted = true
        while winetimer > 0 do
            winetimer = winetimer - 1
            Wait(1000)
		end
		wineStarted = false
		finishedWine = true
		winetimer = Config.wineTimer
    end)
end


local function PrepareAnim()
    local ped = PlayerPedId()
    LoadAnim('amb@code_human_wander_rain@male_a@base')
    TaskPlayAnim(ped, 'amb@code_human_wander_rain@male_a@base', 'static', 6.0, -6.0, -1, 47, 0, 0, 0, 0)
end

local function grapeJuiceProcess()
    QBCore.Functions.Progressbar("grape_juice", Lang:t("progress.process_grapes"), math.random(15000,20000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent("qb-vineyard:server:receiveGrapeJuice")
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
		exports['Roda_Notifications']:showNotify(Lang:t("task.cancel_task"), "error", 6000)
    end)
end

local Zones = {}
Zones[1] = {
	isInside = false,
	zone = PolyZone:Create(Config.Vineyard.start.zones, {
		name="Vineyard-Start",
		minZ = Config.Vineyard.start.minZ,
		maxZ = Config.Vineyard.start.maxZ,
		debugPoly = Config.Debug
	})
}
Zones[1].zone:onPlayerInOut(function(isPointInside)
	Zones[1].isInside = isPointInside
	if isPointInside then
		if Config.Debug then log(Lang:t("text.zone_entered",{zone="Start"})) end
		if not startVineyard and PlayerJob.name == "vineyard" then
			exports['qb-core']:DrawText(Lang:t("task.start_task"),'right')
			CreateThread(function()
				while Zones[1].isInside do
					if IsControlJustReleased(0,38) and not startVineyard then
						startVineyard = true
						startVinyard()
					end
					Wait(1)
				end
			end)

		end
	else
		if Config.Debug then log(Lang:t("text.zone_exited",{zone="Start"})) end
		exports['qb-core']:HideText()
	end
end)

Zones[2] = {
	isInside = false,
	zone = PolyZone:Create(Config.Vineyard.wine.zones, {
		name="Vineyard-Wine",
		minZ = Config.Vineyard.wine.minZ,
		maxZ = Config.Vineyard.wine.maxZ,
		debugPoly = Config.Debug
	})
}
Zones[2].zone:onPlayerInOut(function(isPointInside)
	Zones[2].isInside = isPointInside
	if isPointInside then
		if Config.Debug then log(Lang:t("text.zone_entered",{zone="Wine"})) end
		
		if not startVineyard and PlayerJob.name == "vineyard" then
			CreateThread(function()
				while Zones[2].isInside do
					if not wineStarted then
						if not loadIngredients then
							exports['qb-core']:DrawText(Lang:t("task.load_ingrediants"),'right')
							if IsControlJustPressed(0, 38) and not LocalPlayer.state.inv_busy then
								QBCore.Functions.TriggerCallback('qb-vineyard:server:loadIngredients', function(result)
									if result then loadIngredients = true end
								end)
								
							end
						else
							if not finishedWine then
								exports['qb-core']:DrawText(Lang:t("task.wine_process"),'right')
								if IsControlJustPressed(0, 38) and not LocalPlayer.state.inv_busy then
									StartWineProcess()
								end
							else
								exports['qb-core']:DrawText(Lang:t("task.get_wine"),'right')
								if IsControlJustPressed(0, 38) and not LocalPlayer.state.inv_busy then
									TriggerServerEvent("qb-vineyard:server:receiveWine")
									finishedWine = false
									loadIngredients = false
									wineStarted = false
									exports['Roda_Notifications']:showNotify('You can consume the wine or sell it on Wallmart', 'info', 6000)
							    end
							end
						end
					else
						exports['qb-core']:DrawText(Lang:t("task.countdown",{time=winetimer}),'right')
						Wait(999)
					end
					Wait(1)
				end
			end)

		end
	else
		if Config.Debug then log(Lang:t("text.zone_exited",{zone="Wine"})) end
		exports['qb-core']:HideText()
	end
end)

Zones[3] = {
	isInside = false,
	zone = PolyZone:Create(Config.Vineyard.grapejuice.zones, {
		name="Vineyard-GrapeJuice",
		minZ = Config.Vineyard.grapejuice.minZ,
		maxZ = Config.Vineyard.grapejuice.maxZ,
		debugPoly = Config.Debug
	})
}
Zones[3].zone:onPlayerInOut(function(isPointInside)
	Zones[3].isInside = isPointInside
	if isPointInside then
		if Config.Debug then log(Lang:t("text.zone_entered",{zone="Juice"})) end
		if not startVineyard and PlayerJob.name == "vineyard" then
			CreateThread(function()
				while Zones[3].isInside do
					exports['qb-core']:DrawText(Lang:t("task.make_grape_juice"),'right')
					if IsControlJustPressed(0, 38) and not LocalPlayer.state.inv_busy then
						QBCore.Functions.TriggerCallback('qb-vineyard:server:grapeJuice', function(result)
							if result then PrepareAnim() grapeJuiceProcess() end
						end)
					end
					Wait(1)
				end
			end)
		end
	else
		if Config.Debug then log(Lang:t("text.zone_exited",{zone="Juice"})) end
		exports['qb-core']:HideText()
	end
end)