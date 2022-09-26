QBCore = exports['qb-core']:GetCoreObject()

local photo = nil


QBCore.Commands.Add("registeridcard", "Register and Add Photo To ID", {{name="playerid", help="Player ID"},{name="url", help="Photo ID URL"}}, true, function(source, args)
	local Player = QBCore.Functions.GetPlayer(source)
	local playerid = tonumber(args[1])
	local url = tostring(args[2])

	local target = QBCore.Functions.GetPlayer(playerid)
	local fetchcitizen = target.PlayerData.citizenid

    if Player.PlayerData.job.name == "lawyer" then

		MySQL.Async.execute('UPDATE players SET photo = ? WHERE citizenid = ?', {url, fetchcitizen})
		MySQL.Async.execute('UPDATE players SET mdw_image = ? WHERE citizenid = ?', {url, fetchcitizen})
		-- MySQL.Async.execute('UPDATE players SET pp = ? WHERE citizenid = ?', {url, fetchcitizen})
		local db = MySQL.Sync.fetchAll('SELECT * FROM mdt_data WHERE cid = ?',{fetchcitizen})
		if db[1] ~= nil then
			MySQL.Async.execute('UPDATE mdt_data SET pfp = ? WHERE cid = ?', {url, fetchcitizen})
		else
			MySQL.Async.insert('INSERT INTO mdt_data (cid, tags, gallery, pfp) VALUES (?, ?, ?, ?)',{fetchcitizen, '[]', '[]', url})
		end
	else
		TriggerClientEvent('QBCore:Notify', source, "You don't have Permission!", "error")
	end
end)


RegisterServerEvent('qb-idcard:server:fetchPhoto')
AddEventHandler('qb-idcard:server:fetchPhoto', function()
	local src     		= source
	local qb 		= QBCore.Functions.GetPlayer(src)
	local db = MySQL.Sync.fetchAll('SELECT * FROM players WHERE citizenid = ?', {qb.PlayerData.citizenid})
	if db ~= nil then
		for k,v in pairs(db) do
			photo = v.photo
		end
	end
end)




