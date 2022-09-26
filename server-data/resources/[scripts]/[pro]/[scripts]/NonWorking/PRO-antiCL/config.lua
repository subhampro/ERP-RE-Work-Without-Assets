Config = {}

Config.DisplaySettings = {
    time = 150000 -- time in ms for the ped being displayed
}


Config.PedSettings = {
    collision = true, --set true to enable the ped collision
    pedAlpha = 200, --invisibility of the ped, 0 to 255
    boardAlpha = 200, --invisibility of the board, 0 to 255
}

Locales = {
    ["pressinfo"] = "[~b~E~w~] Copy ~y~Info and Create Ticket On Discord For Report For Combact Login !!",
    ["detailClipboard"] = "Details copied to clipboard"
}

function DrawNotify(text, type)
    --Depending on your notification system you can work with type
    -- There are 3 types
    -- "error"
    -- "success"
    -- nil (for information))

    SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end