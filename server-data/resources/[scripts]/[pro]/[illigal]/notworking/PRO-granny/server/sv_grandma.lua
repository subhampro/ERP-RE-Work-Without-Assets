local QBCore = exports['qb-core']:GetCoreObject()


-- Charge the player from bank.

RegisterServerEvent('PRO-granny:server:grandmafee')
AddEventHandler('PRO-granny:server:grandmafee', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney('bank', 2000) --$2000 is the current price, change it to whatever.
end)
