local QBCore = exports['qb-core']:GetCoreObject() -- We've ALWAYS got to grab our core object

local currentjob = {}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
	local Player=QBCore.Functions.GetPlayerData()
    local job = Player.job
    -- print(json.encode(Player.job))
    currentjob = job
    if job == "police" or job == "ambulance" or job == "mechanic" or job == "lawyer" or job == "cardealer" then -- job's name here
        TriggerServerEvent("PRO-shiftlog:userjoined", job)
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    Wait(100)
    
    if job.name == "police" or job.name == "ambulance" or job.name == "mechanic" or job.name == "lawyer" or job.name == "cardealer" then -- job's name here
        if job.onduty then
            TriggerEvent("PRO-shiftlog:jobchanged", job, job, 1, src)
        else
            TriggerEvent("PRO-shiftlog:jobchanged2", job, job, 1, src)
        end
           
    end
    currentjob = job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent("PRO-shiftlog:jobchanged2", currentjob, currentjob, 1, src)
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(val)
    if currentjob.name == "police" or currentjob.name == "ambulance" or currentjob.name == "mechanic" or currentjob.name == "lawyer" or currentjob.name == "cardealer" then -- job's name here
        if not val then
            TriggerServerEvent("PRO-shiftlog:jobchanged2", currentjob, currentjob, 1, src)
        else
            TriggerServerEvent("PRO-shiftlog:jobchanged", currentjob, currentjob, 0, src)  
        end
    end
    onDuty = val
end)