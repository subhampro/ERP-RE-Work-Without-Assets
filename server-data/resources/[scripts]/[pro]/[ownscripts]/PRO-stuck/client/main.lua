RegisterCommand('stuck', function()
    TriggerEvent('pro-stuck:PlayerTeleport')
    TriggerEvent('pro-stuck:SendImage')
end, false)

RegisterNetEvent('pro-stuck:PlayerTeleport')
AddEventHandler('pro-stuck:PlayerTeleport', function()
    TriggerServerEvent('pro-stuck:DiscordNotify')
    exports['progressBars']:startUI(8500, "Teleporting to Ground...")
    Wait(8500)
    DoScreenFadeOut(650)
    while not IsScreenFadedOut() do
       Wait(0)
    end
    SetEntityCoords(PlayerPedId(-1), Config.TeleportLocation.x, Config.TeleportLocation.y, Config.TeleportLocation.z)
    DoScreenFadeIn(650)
    Notif("You were teleported to ground")
    TriggerEvent('pro-stuck:SendImage')
end)

RegisterServerEvent('pro-stuck:SendImage')
AddEventHandler("pro-stuck:SendImage", function()
    if Config.SendMessages == 'true' then
        exports['screenshot-basic']:requestScreenshotUpload(Config.Webhook, 'files[]', {encoding = 'jpg'}, function(data)
            local resp = json.decode(data)
            table.insert(resp.attachments[1].url)
        end)
    elseif Config.SendMessages == 'false' then
        print("^4[PRO]^0 - Image sending was disabled in script config so image wasnt sended!")
    end
end)

-- RegisterServerEvent('pro-stuck:SendImage')
-- AddEventHandler("pro-stuck:SendImage", function()
--     if Config.SendMessages == 'true' then
--         exports['screenshot-basic']:requestClientScreenshot(GetPlayers()[1],Config.Webhook, 'files[]', {encoding = 'jpg'},  {
--             fileName = 'cache/screenshot.jpg'
--         }, function(err, data)
--             print('err', err)
--             print('data', data)
--             local resp = json.decode(data)
--             table.insert(resp.attachments[1].url)
--         end)
--     elseif Config.SendMessages == 'false' then
--         print("^4[PRO]^0 - Image sending was disabled in script config so image wasnt sended!")
--     end
-- end)

function Notif(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
