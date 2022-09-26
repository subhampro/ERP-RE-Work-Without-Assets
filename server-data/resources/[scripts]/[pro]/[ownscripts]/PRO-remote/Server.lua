local lastdata = nil
QBCore = exports['qb-core']:GetCoreObject()
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest("https://discordapp.com/api/" .. endpoint,
                       function(errorCode, resultData, resultHeaders)
        data = {data = resultData, code = errorCode, headers = resultHeaders}
    end, method, #jsondata > 0 and json.encode(jsondata) or "", {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "Bot " .. "OTEzODU0MTQ2MTU3ODc5Mjk3.YaEi_w.B7OffjAj57OaqP3BW7bZOLGjIdg"})

    while data == nil do Citizen.Wait(0) end

    return data
end

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(600000)
--         PerformHttpRequest(Config.WebHook, function(err, text, headers) end,
--                            'POST', json.encode(
--                                {
--                 username = Config.ReplyUserName,
--                 content = "Discord Bot Heart Beat Received ",
--                 avatar_url = Config.AvatarURL
--             }), {['Content-Type'] = 'application/json'})
--     end
-- end)

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function mysplit(inputstr, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

function GetRealPlayerName(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    return xPlayer.PlayerData.charinfo.firstname
end

function ExecuteCOMM(command)
    if string.starts(command, Config.Prefix) then

        -- Get Player Count
        if string.starts(command, Config.Prefix .. "playercount") then

            sendToDiscord("Player Counts", "Current players in server : " ..
                              GetNumPlayerIndices(), 16711680)

            -- Kick Someone

        elseif string.starts(command, Config.Prefix .. "kick") then

            local t = mysplit(command, " ")

            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                sendToDiscord("KICKED Succesfully",
                              "Succesfuly Kicked " .. GetPlayerName(t[2]),
                              16711680)
                DropPlayer(t[2], "KICKED BY Anonymous")

            else

                sendToDiscord("Could Not Find",
                              "Could Not Find An ID. Make Sure To Input Valid ID",
                              16711680)

            end

            -- kill Someone

        elseif string.starts(command, Config.Prefix .. "kill") then

            local t = mysplit(command, " ")

            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then

                TriggerClientEvent("discordc:kill", t[2])
                TriggerEvent('chat:addMessage', t[2], {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {
                        "Anonymous",
                        "You Have Been Killed By Anonymous"
                    }
                })
                sendToDiscord("Killed Succesfully",
                              "Succesfuly Killed " .. GetPlayerName(t[2]),
                              16711680)

            else

                sendToDiscord("Could Not Find",
                              "Could Not Find An ID. Make Sure To Input Valid ID",
                              16711680)

            end

            -- Return Player List
        elseif string.starts(command, Config.Prefix .. "playerlist") then

            local count = 0
            local xPlayers = QBCore.Functions.GetPlayers()
            local players = "Players: "
            for i = 1, #xPlayers, 1 do
                local xPlayer = QBCore.Functions.GetPlayer(xPlayers[i])
                local job = xPlayer.PlayerData.charinfo.job
                discord = "Not Found"
                for _, id in ipairs(GetPlayerIdentifiers(xPlayers[i])) do
                    if string.match(id, "discord:") then
                        discord = string.gsub(id, "discord:", "")
                        break
                    end
                end
                count = count + 1
                local players = players .. GetPlayerName(xPlayers[i]) ..
                                    " | " .. GetRealPlayerName(xPlayers[i]) ..
                                    "|ID " .. xPlayers[i] .. " |"
            end
            if count == 0 then
                sendToDiscord("PLAYER LIST", "There is 0 Player In Server",
                              16711680)
            else
                PerformHttpRequest(Config.WebHook,
                                   function(err, text, headers) end, 'POST',
                                   json.encode(
                                    {
                        username = 'Current Player Counts : ' .. count,
                        content = players,
                        avatar_url = Config.AvatarURL
                    }), {['Content-Type'] = 'application/json'})
            end

            -- revive
        elseif string.starts(command, Config.Prefix .. "revive") then

            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                TriggerClientEvent("hospital:client:Revive",t[2]) 
                sendToDiscord("Revived Succesfully",
                              "Succesfuly Revived " .. GetPlayerName(t[2]),
                              16711680)
            else
                sendToDiscord("Could Not Find",
                              "Could Not Find An ID. Make Sure To Input Valid ID",
                              16711680)
            end


        elseif string.starts(command,Config.Prefix .. "dv") then

            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                TriggerClientEvent('QBCore:Command:DeleteVehicle', t[2])
                sendToDiscord("Vehicle Deleted Succesfully",
                              "of " .. GetPlayerName(t[2]),
                              16711680)
            else
                sendToDiscord("Could Not Find","Could Not Find An ID. Make Sure To Input Valid ID", 16711680)
            end

        elseif string.starts(command,Config.Prefix .. "car") then

            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                TriggerClientEvent('QBCore:Command:SpawnVehicle', t[2], t[3])
                sendToDiscord("Car : "..t[3].."", " Spawned Succesfully at " .. GetPlayerName(t[2]), 16711680)
            else
                sendToDiscord("Could Not Find","Could Not Find An ID. Make Sure To Input Valid ID", 16711680)
            end

        elseif string.starts(command,Config.Prefix .. "fix") then

            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                TriggerClientEvent('qb:repair', t[2])
                TriggerClientEvent('vehiclemod:client:fixEverything', t[2])
                sendToDiscord("Vehicle Fixed Succesfully",
                              "of " .. GetPlayerName(t[2]),
                              16711680)
            else
                sendToDiscord("Could Not Find","Could Not Find An ID. Make Sure To Input Valid ID", 16711680)
            end

            -- setjob

        elseif string.starts(command, Config.Prefix .. "setjob") then


            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                if xPlayer then

                    if t[3] then
                        xPlayer.Functions.SetJob(tostring(t[3]))
                        sendToDiscord("Discord BOT",
                                      "You Succesfuly Changed " ..
                                          GetPlayerName(t[2]) .. 'Job',
                                      16711680)
                    else
                        sendToDiscord("Discord BOT",
                                      "Nothing Specified",
                                      16711680)
                    end

                end

            else

                sendToDiscord("Could Not Find",
                              "Could Not Find An ID. Make Sure To Input Valid ID",
                              16711680)

            end

        -- getjob

    elseif string.starts(command, Config.Prefix .. "getjob") then

        local t = mysplit(command, " ")
        if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
            local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
            if xPlayer then

                money = xPlayer.PlayerData.job.label
                if money then
                    sendToDiscord("Discord Bot",
                                  "Target Currently Has : " .. money ..
                                      "Job", 16711680)

                end
            end

        else

            sendToDiscord("Could Not Find",
                          "Could Not Find An ID. Make Sure To Input Valid ID",
                          16711680)

        end


            -- getmoney

        elseif string.starts(command, Config.Prefix .. "getmoney") then

                local t = mysplit(command, " ")
                if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                    local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                    if xPlayer then

                        money = xPlayer.PlayerData.money["cash"]
                        if money then
                            sendToDiscord("Discord Bot",
                                          "Target Currently Has : " .. money ..
                                              "$ in their pocket", 16711680)

                        end
                    end

                else

                    sendToDiscord("Could Not Find",
                                  "Could Not Find An ID. Make Sure To Input Valid ID",
                                  16711680)

                end


            -- getbank
        elseif string.starts(command, Config.Prefix .. "getbank") then

                local t = mysplit(command, " ")
                if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                    local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                    if xPlayer then

                        money = xPlayer.PlayerData.money["bank"]
                        if money then
                            sendToDiscord("Discord Bot",
                                          "Target Currently Has : " ..
                                              money ..
                                              "$ in their bank account",
                                          16711680)

                        end
                    end

                else

                    sendToDiscord("Could Not Find",
                                  "Could Not Find An ID. Make Sure To Input Valid ID",
                                  16711680)

                end

            -- removeMoney 

        elseif string.starts(command, Config.Prefix .. "removemoney") then


                local t = mysplit(command, " ")
                if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                    local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                    if xPlayer then

                        if t[3] then
                            xPlayer.Functions.RemoveMoney('cash', tonumber(t[3])) 
                            sendToDiscord("Discord BOT",
                                          "You Succesfuly removed " ..
                                              GetPlayerName(t[2]) .. ' money',
                                          16711680)
                        else
                            sendToDiscord("Discord BOT",
                                          "ID OR Money Input is invalid make sure you are writing like this: \n prefix + removemoney + id + money",
                                          16711680)
                        end

                    end

                else

                    sendToDiscord("Could Not Find",
                                  "Could Not Find An ID. Make Sure To Input Valid ID",
                                  16711680)

                end


            -- addMoney

        elseif string.starts(command, Config.Prefix .. "addmoney") then


                local t = mysplit(command, " ")
                if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                    local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                    if xPlayer then

                        if t[3] then
                            xPlayer.Functions.AddMoney('cash',tonumber(t[3]))
                            sendToDiscord("Discord BOT",
                                          "You Succesfuly added to " .. tonumber(t[3]) ..
                                              GetPlayerName(t[2]) .. ' money',
                                          16711680)
                        else
                            sendToDiscord("Discord BOT",
                                          "ID OR Money Input is invalid make sure you are writing like this: \n prefix + addmoney + id + money",
                                          16711680)
                        end

                    end

                else

                    sendToDiscord("Could Not Find",
                                  "Could Not Find An ID. Make Sure To Input Valid ID",
                                  16711680)

                end


            -- add to bank account

        elseif string.starts(command, Config.Prefix .. "addbank") then


                local t = mysplit(command, " ")
                if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                    local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                    if xPlayer then

                        if t[3] then
                            xPlayer.Functions.AddMoney('bank',tonumber(t[3]))
                            sendToDiscord("Discord BOT",
                                          "You Succesfuly added to " ..
                                              GetPlayerName(t[2]) .. ' bank money',
                                          16711680)
                        else
                            sendToDiscord("Discord BOT",
                                          "ID OR Money Input is invalid make sure you are writing like this: \n prefix + addbank + id + money",
                                          16711680)
                        end

                    end

                else

                    sendToDiscord("Could Not Find",
                                  "Could Not Find An ID. Make Sure To Input Valid ID",
                                  16711680)

                end


            -- remove bank money

        elseif string.starts(command, Config.Prefix .. "removebank") then


                local t = mysplit(command, " ")
                if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                    local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                    if xPlayer then

                        if t[3] then
                            xPlayer.Functions.RemoveMoney('bank', tonumber(t[3])) 
                            sendToDiscord("Discord BOT",
                                          "You Succesfuly removed from " ..
                                              GetPlayerName(t[2]) .. ' bank money',
                                          16711680)
                        else
                            sendToDiscord("Discord BOT",
                                          "ID OR Money Input is invalid make sure you are writing like this: \n prefix + removebank + id + money",
                                          16711680)
                        end

                    end

                else

                    sendToDiscord("Could Not Find",
                                  "Could Not Find An ID. Make Sure To Input Valid ID",
                                  16711680)

                end


            -- notific
        elseif string.starts(command, Config.Prefix .. "multi") then

            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                QBCore.Player.Logout(tonumber(t[2]))
                TriggerClientEvent('qb-multicharacter:client:chooseChar', tonumber(t[2]))
                if xPlayer then
                        sendToDiscord("Discord Bot",
                                      "Character Menu Given" , 16711680)
                end

            else

                sendToDiscord("Could Not Find",
                              "Could Not Find An ID. Make Sure To Input Valid ID",
                              16711680)

            end

        elseif string.starts(command, Config.Prefix .. "noclip") then

            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                -- QBCore.Player.Logout(tonumber(t[2]))
                -- TriggerClientEvent('hh_select:client:chooseChar', tonumber(t[2]))
                TriggerClientEvent('qb-adminmenu:client:toggleNoclip', tonumber(t[2]))
                if xPlayer then
                        sendToDiscord("Discord Bot",
                                      "Noclip Given To Player" , 16711680)
                end

            else

                sendToDiscord("Could Not Find",
                              "Could Not Find An ID. Make Sure To Input Valid ID",
                              16711680)

            end

        elseif string.starts(command, Config.Prefix .. "freeze") then

            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                -- QBCore.Player.Logout(tonumber(t[2]))
                -- TriggerClientEvent('hh_select:client:chooseChar', tonumber(t[2]))
                TriggerEvent('qb-adminmenu:server:Freeze', tonumber(t[2]))
                if xPlayer then
                        sendToDiscord("Discord Bot",
                                      "Player Freezed" , 16711680)
                end

            else

                sendToDiscord("Could Not Find",
                              "Could Not Find An ID. Make Sure To Input Valid ID",
                              16711680)

            end

        elseif string.starts(command, Config.Prefix .. "cloth") then

            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
                local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                -- QBCore.Player.Logout(tonumber(t[2]))
                TriggerClientEvent('qb-clothing:client:openMenu', tonumber(t[2]))
                if xPlayer then
                        sendToDiscord("Discord Bot",
                                      "Clothing Menu Given" , 16711680)
                end

            else

                sendToDiscord("Could Not Find",
                              "Could Not Find An ID. Make Sure To Input Valid ID",
                              16711680)

            end

        elseif string.starts(command, Config.Prefix .. "saveall") then
            for k, v in pairs(QBCore.Functions.GetPlayers()) do
                local Player = QBCore.Functions.GetPlayer(v)
                if Player ~= nil then 
                    QBCore.Player.Save(Player.PlayerData.source)
                end
            end
            sendToDiscord("Discord Bot", "Saved All Players" , 16711680)

        elseif string.starts(command, Config.Prefix .. "notific") then

            local safecom = command
            local t = mysplit(command, " ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil and t[3] ~= nil then

                TriggerClientEvent('chat:addMessage', t[2], {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {
                        "Anonymous",
                        "^1 " ..
                            string.gsub(safecom, "!notific " .. t[2] .. " ", "")
                    }
                })

                sendToDiscord("Sended Succesfully",
                              "Succesfuly Sended " ..
                                  string.gsub(safecom,
                                              "!notific " .. t[2] .. " ", "") ..
                                  " To " .. GetPlayerName(t[2]), 16711680)

            else

                sendToDiscord("Could Not Find", "Invalid InPut", 16711680)
            end


            -- giveitem

        elseif string.starts(command,Config.Prefix .. "giveitem") then

            local t = mysplit(command," ")
            if t[2] ~= nil and GetPlayerName(t[2]) ~= nil then
              if t[3] ~= nil and t[4] ~= nil then
                local xPlayer = QBCore.Functions.GetPlayer(tonumber(t[2]))
                --local xPlayer = QBCore.Functions.GetPlayer(t[2])
                xPlayer.Functions.AddItem(t[3], t[4])
                   sendToDiscord("Add Item Succesfully", "Succesfully added item to " .. GetPlayerName(t[2]) .."\nItem: ".. t[3] .. "\nQuantity: " .. t[4],16711680)
              end
            else
              sendToDiscord("Could Not Find","Could Not Find An ID. Make Sure To Input Valid ID",16711680)
            end


            -- announce

        elseif string.starts(command, Config.Prefix .. "announce") then

            local safecom = command
            local t = mysplit(command, " ")
            if t[2] ~= nil then

                args = string.gsub(safecom, Config.Prefix .. "announce","")
                TriggerClientEvent("announce", -1, args)
                sendToDiscord("Sended Succesfully", "Succesfuly Sended : " .. string.gsub(safecom, Config.Prefix .. "announce","") .. " | To " .. GetNumPlayerIndices() ..  " Player in The Server",16711680)
   
            else

                sendToDiscord("Could Not Find", "Invalid InPut", 16711680)
            end

            -- Command Not Found
        else

            sendToDiscord("Discord Command",
                          "Command Not Found. Please Make Sure You Are Entering A Valid Command",
                          16711680)

        end
    end

end

Citizen.CreateThread(function()

    PerformHttpRequest(Config.WebHook, function(err, text, headers) end, 'POST',
                       json.encode({
        username = Config.ReplyUserName,
        content = "Discord Bot Is Now Online",
        avatar_url = Config.AvatarURL
    }), {['Content-Type'] = 'application/json'})
    while true do

        local chanel =
            DiscordRequest("GET", "channels/" .. Config.ChannelID, {})
        if chanel.data then
            local data = json.decode(chanel.data)
            local lst = data.last_message_id
            local lastmessage = DiscordRequest("GET", "channels/" ..
                                                   Config.ChannelID ..
                                                   "/messages/" .. lst, {})
            if lastmessage.data then
                local lstdata = json.decode(lastmessage.data)
                if lastdata == nil then lastdata = lstdata.id end

                if lastdata ~= lstdata.id and lstdata.author.username ~=
                    Config.ReplyUserName then

                    ExecuteCOMM(lstdata.content)
                    lastdata = lstdata.id
                    --	sendToDiscord('New Message Recived',lstdata.content,16711680)

                end
            end
        end
        Citizen.Wait(Config.WaitEveryTick)
    end
end)

function sendToDiscord(name, message, color)
    local connect = {
        {
            ["color"] = color,
            ["title"] = "**" .. name .. "**",
            ["description"] = message,
            ["footer"] = {["text"] = "ERP Discord Admin"}
        }
    }
    PerformHttpRequest(Config.WebHook, function(err, text, headers) end, 'POST',
                       json.encode({
        username = Config.ReplyUserName,
        embeds = connect,
        avatar_url = Config.AvatarURL
    }), {['Content-Type'] = 'application/json'})
end

