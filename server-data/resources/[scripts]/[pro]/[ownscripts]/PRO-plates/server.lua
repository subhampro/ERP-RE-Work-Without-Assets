local QBCore = exports['qb-core']:GetCoreObject()

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end


QBCore.Functions.CreateCallback('PRO-plate:update', function(source, cb, oldP, newP)
  local oldplate = string.upper(tostring(oldP):match("^%s*(.-)%s*$"))
  local newplate = string.upper(newP)
  local some = string.upper(tostring(newplate):match("^%s*(.-)%s*$"))
  local xPlayer  = QBCore.Functions.GetPlayer(source)

  -- QBCore.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..oldplate.."'", function(result)
  --   if result[1] ~= nil then
      local count = xPlayer.Functions.GetItemByName('licenseplate')
      if count ~= nil or count.amount > 0 then
        xPlayer.Functions.RemoveItem('licenseplate', 1)
        cb('found')
      end
  --   else
  --     cb('error')
  --   end
  -- end)
end)


RegisterServerEvent('PRO-plate:server:SaveCar')
AddEventHandler('PRO-plate:server:SaveCar', function(mods, vehicle, hash, plate, dupecar)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    QBCore.Functions.ExecuteSql(false, "SELECT * FROM `player_vehicles` WHERE `plate` = '"..plate.."'", function(result)
        if result[1] == nil then
            QBCore.Functions.ExecuteSql(false, "INSERT INTO `player_vehicles` (`steam`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `state`) VALUES ('"..Player.PlayerData.steam.."', '"..Player.PlayerData.citizenid.."', '"..vehicle.."', '"..hash.."', '"..json.encode(mods).."', '"..plate.."', 0)")
            QBCore.Functions.ExecuteSql(false, "UPDATE `trunkitems` SET `plate`='"..plate.."'  WHERE `plate`='"..dupecar.."'")
            QBCore.Functions.ExecuteSql(false, "UPDATE `gloveboxitems` SET `plate`='"..plate.."'  WHERE `plate`='"..dupecar.."'")
            if dupecar ~= nil then
              QBCore.Functions.ExecuteSql(true, "DELETE FROM `player_vehicles` WHERE `plate` = '"..dupecar.."' AND `vehicle` = '"..vehicle.."'")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'This vehicle is already yours..', 'error', 3000)
        end
    end)
end)





QBCore.Functions.CreateUseableItem("licenseplate", function(source)
	TriggerClientEvent('PRO-plate', source)
end)


