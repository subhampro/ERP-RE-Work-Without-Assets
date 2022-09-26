RegisterNUICallback("dataPost", function(data, cb)
    SetNuiFocus(false)
    if data.isServer then
        TriggerServerEvent(data.event, data.args)
    else
        TriggerEvent(data.event, data.args)
    end
    cb('ok')
end)

RegisterNUICallback("cancel", function()
    SetNuiFocus(false)
end)


RegisterNetEvent('PRO-context:sendMenu', function(data)
    if not data then return end
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "OPEN_MENU",
        data = data
    })
end)



RegisterCommand('cont', function()
    MailNotify(1, 2 ,3, 4, 5, 6, 7)
end)

function MailNotify(cbdata,pro, car, level, xp)         ----Yo Can Change this to ur confort phone mesagges/mail sysyem anything (Default: Chat)
    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)	
    TriggerEvent('chat:addMessage', {
        template = '<div class="chat-message warning"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Your Reputation = </strong> {1} <br><strong> Your XP = </strong> {2} (100XP = 1 Reputation)<br><strong> Delivery Vehicle = </strong> {3} <strong><br>  Reputation for Vehicle Search = </strong> {4} <strong><br> Rewards = XP: </strong> {5} <strong>, Money: </strong> {5} <strong><br>Note: Higher Reputation, Higher Vehicles, Higher Rewards</div></div>',
        args = {'Car Thief', cbdata, pro, car, level, xp, money}
    })
end  