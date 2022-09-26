local speakers = {}

local coords = {}
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("boombox", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	TriggerClientEvent('PRO-boombox:place', source)
	
end)

RegisterServerEvent('PRO-boombox:loadSpeaker')
AddEventHandler('PRO-boombox:loadSpeaker', function(speaker)
    speakers[speaker.speaker] = speaker
    speakers[speaker.speaker].switch = false
    speakers[speaker.speaker].volchange = false
    speakers[speaker.speaker].volval = 100
    speaker.switch = false
    speaker.volchange = false
    speaker.volval = 100
    TriggerClientEvent('PRO-boombox:loadSpeakerClient', -1, speaker)
end)

local id = 0

RegisterServerEvent('PRO-boombox:removeSpeaker')
AddEventHandler('PRO-boombox:removeSpeaker', function(speaker)
    id = id - 1
    TriggerClientEvent("PRO-boombox:removeClient", -1, speaker)
end)


RegisterServerEvent('PRO-boombox:placedSpeaker')
AddEventHandler('PRO-boombox:placedSpeaker', function(spawncoords, speakerid)
    id = id + 1
    local speaker = {}
    speaker.speakerid = speakerid
    speaker.coords = spawncoords
    speaker.speaker = id
    table.insert(speakers, speaker)
    TriggerClientEvent('PRO-boombox:loadSpeakerClient', -1, speaker)
end)

RegisterServerEvent('PRO-boombox:joined')
AddEventHandler('PRO-boombox:joined', function()
    local src = source
    for i=1, #speakers do
        --print(speakers[i].coords)
        --print(speakers[i].speaker)
        --print(speakers[i].volchange)
        --print(speakers[i].videoStatus)
        --print(speakers[i].time)
    end
    TriggerClientEvent("PRO-boombox:joined", src, speakers)
end)



RegisterServerEvent('PRO-boombox:switchVideo')
AddEventHandler('PRO-boombox:switchVideo', function(id, videoStatus, time)
    local src = source
    TriggerClientEvent("PRO-boombox:switchVideoClient", -1, id, videoStatus, time)
    speakers[id].switch = true
    speakers[id].videoStatus = videoStatus
    speakers[id].time = time - speakers[id].time
end)



RegisterServerEvent('PRO-boombox:changeVol')
AddEventHandler('PRO-boombox:changeVol', function(id, vol)
    local src = source
    speakers[id].volval = vol
    TriggerClientEvent("PRO-boombox:changeVolClient", -1, id, vol)
end)