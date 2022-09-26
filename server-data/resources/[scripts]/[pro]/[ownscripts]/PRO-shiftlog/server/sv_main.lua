local QBCore = exports['qb-core']:GetCoreObject() -- Grabs our core object

local timers = { -- if you want more job shifts add table entry here same as the examples below
    ambulance = {
    },
    police = {
    },
    mechanic = {
    },
    lawyer = {
    },
    cardealer = {
    },
    -- fbi = {}
}

local currentjob = {}


local dcname = "Shift Logger" -- bot's name
local http = Config.policeWebhook -- webhook for police
local httpAmbulance = Config.ambulanceWebhook -- webhook for ems (you can add as many as you want)
local httpMechanic = Config.mechanicWebhook
local httpGov = Config.govWebhook
local httpcardealer = Config.cardealerWebhook
local httpres = Config.resWebhook
local avatar = "" -- bot's avatar

function DiscordLog(name, message, color, job)
    local connect = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
            ["text"] = "PRO-shiftlog",
            },
        }
    }
    if job == "police" then
        PerformHttpRequest(http, function(err, text, headers) end, 'POST', json.encode({username = dcname, embeds = connect, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
    elseif job == "ambulance" then
        PerformHttpRequest(httpAmbulance, function(err, text, headers) end, 'POST', json.encode({username = dcname, embeds = connect, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
    elseif job == "mechanic" then
        PerformHttpRequest(httpMechanic, function(err, text, headers) end, 'POST', json.encode({username = dcname, embeds = connect, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
    elseif job == "lawyer" then
        PerformHttpRequest(httpGov, function(err, text, headers) end, 'POST', json.encode({username = dcname, embeds = connect, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
    elseif job == "cardealer" then
        PerformHttpRequest(httpcardealer, function(err, text, headers) end, 'POST', json.encode({username = dcname, embeds = connect, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
    elseif job == "res" then
        PerformHttpRequest(httpres, function(err, text, headers) end, 'POST', json.encode({username = dcname, embeds = connect, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
    end
end

RegisterServerEvent("PRO-shiftlog:userjoined")
AddEventHandler("PRO-shiftlog:userjoined", function(job)
    local id = source
    local xPlayer = QBCore.Functions.GetPlayer(id)

    if job.onduty == true then
        table.insert(timers[job.name], {id = id, citizenid = xPlayer.citizenid, name = xPlayer.charinfo.firstname.." "..xPlayer.charinfo.lastname, time = os.time(), date = os.date("%d/%m/%Y %X"), callsign = xPlayer.metadata['callsign']})
    end
end)

RegisterServerEvent("PRO-shiftlog:userLeave")
AddEventHandler("PRO-shiftlog:userLeave", function()
    local id = source
    local header = nil
    local color = nil

    for k, v in pairs(timers) do
        for n = 1, #timers[k], 1 do
            if timers[k][n].id == id then
                local duration = os.time() - timers[k][n].time
                local date = timers[k][n].date
                local timetext = nil

                if k == "police" then
                    header = "Police Shift"
                    color = 3447003
                elseif k == "ambulance" then
                    header = "EMS Shift"
                    color = 15158332
                elseif k == "mechanic" then
                    header = "Mechanic Shift"
                    color = 13400320
                elseif k == "lawyer" then
                    header = "Gov Shift"
                    color = 3447003
                elseif k == "cardealer" then
                    header = "Cardealer Shift"
                    color = 3447003
                end
                if duration > 0 and duration < 60 then
                    timetext = tostring(math.floor(duration)).." seconds"
                elseif duration >= 60 and duration < 3600 then
                    timetext = tostring(math.floor(duration / 60)).." minutes"
                elseif duration >= 3600 then
                    timetext = tostring(math.floor(duration / 3600).." hours, "..tostring(math.floor(math.fmod(duration, 3600)) / 60)).." minutes"
                end
                if k == "police" then
                    DiscordLog(header, "Name: **"..timers[k][n].name.."**\nCallsign: **"..timers[k][n].callsign.."**\ncitizenid: **"..timers[k][n].citizenid.."**\n Shift duration: **__"..timetext.."__**\n Start date: **"..date.."**\n End date: **"..os.date("%d/%m/%Y %X").."**", color, k)
                else
                    DiscordLog(header, "Name: **"..timers[k][n].name.."**\ncitizenid: **"..timers[k][n].citizenid.."**\n Shift duration: **__"..timetext.."__**\n Start date: **"..date.."**\n End date: **"..os.date("%d/%m/%Y %X").."**", color, k)
                end
                table.remove(timers[k], n)
                return
            end
        end
    end
end)

RegisterServerEvent("PRO-shiftlog:jobchanged")
AddEventHandler("PRO-shiftlog:jobchanged", function(old, new, method,src)
    if src == nil then
        src = source
    end
    local xPlayer = QBCore.Functions.GetPlayer(src)
    xPlayer=xPlayer.PlayerData
    local header = nil
    local color = nil
    if old.name == "police" then
        header = "Police Shift" -- Header
        color = 3447003 -- Color
    elseif old.name == "ambulance" then
        header = "EMS Shift"
        color = 15158332
    elseif old.name == "mechanic" then
        header = "Mechanic Shift"
        color = 13400320
    elseif old.name == "lawyer" then
        header = "Gov Shift"
        color = 3447003
    elseif old.name == "cardealer" then
        header = "Cardealer Shift"
        color = 3447003
    end
    if method == 1 then
        for i,v in ipairs(timers[old.name]) do
            if v.citizenid == xPlayer.citizenid then
                local duration = os.time() - v.time
                local date = v.date
                local timetext = nil

                if duration > 0 and duration < 60 then
                    timetext = tostring(math.floor(duration)).." seconds"
                elseif duration >= 60 and duration < 3600 then
                    timetext = tostring(math.floor(duration / 60)).." minutes"
                elseif duration >= 3600 then
                    timetext = tostring(math.floor(duration / 3600).." hours, "..tostring(math.floor(math.fmod(duration, 3600)) / 60)).." minutes"
                end
                DiscordLog(header , "Name: **"..v.name.."**\ncitizenid: **"..v.citizenid.."**\n Shift duration: **__"..timetext.."__**\n Start date: **"..date.."**\n End date: **"..os.date("%d/%m/%Y %X").."**", color, old.name)
                table.remove(timers[old.name], i)
                break
            end
        end
    end
    if not (timers[new.name] == nil) then
        for t, l in pairs(timers[new.name]) do
            if l.citizenid == xPlayer.citizenid then
                table.remove(timers[new.name], t)
            end
        end
    end
    if new.name == "police" or new.name == "ambulance" or new.name =="mechanic" or new.name =="lawyer" or new.name =="cardealer" then
        table.insert(timers[new.name], {citizenid = xPlayer.citizenid, name = xPlayer.charinfo.firstname.." "..xPlayer.charinfo.lastname, time = os.time(), date = os.date("%d/%m/%Y %X"), callsign = xPlayer.metadata['callsign']})
    end
end)

RegisterServerEvent("PRO-shiftlog:jobchanged2")
AddEventHandler("PRO-shiftlog:jobchanged2", function(old, new, method,src)
    if src == nil then
        src = source
    end
    local xPlayer = QBCore.Functions.GetPlayer(src)
    xPlayer=xPlayer.PlayerData
    local header = nil
    local color = nil
    if old.name == "police" then
        header = "Police Shift" -- Header
        color = 3447003 -- Color
    elseif old.name == "ambulance" then
        header = "EMS Shift"
        color = 15158332
    elseif old.name == "mechanic" then
        header = "Mechanic Shift"
        color = 13400320
    elseif old.name == "lawyer" then
        header = "Gov Shift"
        color = 3447003
    elseif old.name == "cardealer" then
        header = "Cardealer Shift"
        color = 3447003
    end
    if method == 1 then
        for i,v in ipairs(timers[old.name]) do
            if v.citizenid == xPlayer.citizenid then
                local duration = os.time() - v.time
                local date = v.date
                local timetext = nil

                if duration > 0 and duration < 60 then
                    timetext = tostring(math.floor(duration)).." seconds"
                elseif duration >= 60 and duration < 3600 then
                    timetext = tostring(math.floor(duration / 60)).." minutes"
                elseif duration >= 3600 then
                    timetext = tostring(math.floor(duration / 3600).." hours, "..tostring(math.floor(math.fmod(duration, 3600)) / 60)).." minutes"
                end
                if old.name == "police" then
                    DiscordLog(header , "Name: **"..v.name.."**\nCallsign: **"..v.callsign.."**\ncitizenid: **"..v.citizenid.."**\n Shift duration: **__"..timetext.."__**\n Start date: **"..date.."**\n End date: **"..os.date("%d/%m/%Y %X").."**", color, old.name)
                else
                    DiscordLog(header , "Name: **"..v.name.."**\ncitizenid: **"..v.citizenid.."**\n Shift duration: **__"..timetext.."__**\n Start date: **"..date.."**\n End date: **"..os.date("%d/%m/%Y %X").."**", color, old.name)
                end
                table.remove(timers[old.name], i)
                break
            end
        end
    end
    if not (timers[new.name] == nil) then
        for t, l in pairs(timers[new.name]) do
            if l.citizenid == xPlayer.citizenid then
                table.remove(timers[new.name], t)
            end
        end
    end
end)





-- AddEventHandler("playerDropped", function(reason)
--     local id = source
--     local header = nil
--     local color = nil

--     for k, v in pairs(timers) do
--         for n = 1, #timers[k], 1 do
--             if timers[k][n].id == id then
--                 local duration = os.time() - timers[k][n].time
--                 local date = timers[k][n].date
--                 local timetext = nil

--                 if k == "police" then
--                     header = "Police Shift"
--                     color = 3447003
--                 elseif k == "ambulance" then
--                     header = "EMS Shift"
--                     color = 15158332
--                 elseif old.name == "mechanic" then
--                     header = "Mechanic Shift"
--                     color = 13400320
--                 --elseif job == "fbi" then
--                     --header = "FBI Shift"
--                     --color = 3447003
--                 end
--                 if duration > 0 and duration < 60 then
--                     timetext = tostring(math.floor(duration)).." seconds"
--                 elseif duration >= 60 and duration < 3600 then
--                     timetext = tostring(math.floor(duration / 60)).." minutes"
--                 elseif duration >= 3600 then
--                     timetext = tostring(math.floor(duration / 3600).." hours, "..tostring(math.floor(math.fmod(duration, 3600)) / 60)).." minutes"
--                 end
--                 DiscordLog(header, "Name: **"..timers[k][n].name.."**\ncitizenid: **"..timers[k][n].identifier.."**\n Shift duration: **__"..timetext.."__**\n Start date: **"..date.."**\n End date: **"..os.date("%d/%m/%Y %X").."**", color, k)
--                 table.remove(timers[k], n)
--                 return
--             end
--         end
--     end
-- end)

DiscordLog("[PRO-shiftlog]", "Shift logger started!", 3447003, "res")