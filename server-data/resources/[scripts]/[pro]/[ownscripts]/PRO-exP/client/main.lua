RegisterCommand("ndd", function(source, args, raw)
    print("HALLOW")
    -- TASK_VEHICLE_DRIVE_WANDER
TaskVehicleDriveWander(
	GetPlayerPed(-1) --[[ Ped ]],
	60 --[[ number ]], 
	447 --[[ integer ]]
)

end)