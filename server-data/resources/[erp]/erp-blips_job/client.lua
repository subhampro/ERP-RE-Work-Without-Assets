local PlayerData
local PlayerJob

local createdBlips = {}

Citizen.CreateThread(function()
	if Config.Framework == 'ESX' then
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end
		
		while ESX.GetPlayerData().job == nil do
			Citizen.Wait(10)
		end
		
		PlayerData = ESX.GetPlayerData()
		PlayerJob = PlayerData.job
	elseif Config.Framework == 'QBCORE' then
		QBCore = exports['qb-core']:GetCoreObject()
	end
	Wait(2000)
	loadBlips()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
	PlayerJob = JobInfo
	for k,v in pairs(createdBlips) do
		RemoveBlip(v)
	end
	Wait(500)
	loadBlips()
end)

function loadBlips()
	print(getJob())
	for k,v in pairs(Config.Blips) do
		local canSee = false
		if #v.AllowedJobs == 0 then
			canSee = true
		elseif #v.DeniedJobs == 0 then
			canSee = false
		end
		for ke,va in pairs(v.DeniedJobs) do
			if va == getJob() then
				canSee = false
			end
		end
		for key,val in pairs(v.AllowedJobs) do
			if val == getJob() then
				canSee = true
			end
		end
		if canSee then
			local blip = AddBlipForCoord(v.Coords.x, v.Coords.y, v.Coords.z)
			SetBlipSprite(blip, v.Blip.sprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale(blip, v.Blip.size)
			SetBlipColour(blip, v.Blip.color)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.Blip.name)
			EndTextCommandSetBlipName(blip)
			table.insert(createdBlips, blip)
		end
	end
end

function getJob()
	Config.Framework = 'QBCORE' 
	local Player = QBCore.Functions.GetPlayerData()
	PlayerJob = Player.job
	return PlayerJob.name
end

