CreateThread(function()

    for k, v in pairs(Config.Blips) do
			
		local blip = AddBlipForCoord(v.coords.x,v.coords.y,v.coords.z)
		SetBlipAsShortRange(blip, true)
		SetBlipSprite(blip, v.sprite)
		SetBlipColour(blip, v.colour)
		SetBlipScale(blip, v.scale)
		SetBlipDisplay(blip, 6)
		BeginTextCommandSetBlipName('STRING')
	    AddTextComponentString(v.name)
	    EndTextCommandSetBlipName(blip)
    
	end

end)
