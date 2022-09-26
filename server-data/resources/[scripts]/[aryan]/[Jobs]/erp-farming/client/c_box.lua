
QBCore = exports["qb-core"]:GetCoreObject()



RegisterNetEvent('erp-farming:client:CreateSmallBox', function(smallboxid)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'SmallBox_'..smallboxid, {maxweight = Config.WeightSmallBox, slots = Config.Slots})
    TriggerEvent("inventory:client:SetCurrentStash", 'SmallBox_'..smallboxid) 
end) 

RegisterNetEvent('erp-farming:client:CreateMedBox', function(medboxid)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'MedBox_'..medboxid, {maxweight = Config.WeightMedBox, slots = Config.Slots})
    TriggerEvent("inventory:client:SetCurrentStash", 'MedBox_'..medboxid) 
end) 

RegisterNetEvent('erp-farming:client:CreateBigBox', function(bigboxid)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", 'BigBox_'..bigboxid, {maxweight = Config.WeightBigBox, slots = Config.Slots})
    TriggerEvent("inventory:client:SetCurrentStash", 'BigBox_'..bigboxid) 
end) 

