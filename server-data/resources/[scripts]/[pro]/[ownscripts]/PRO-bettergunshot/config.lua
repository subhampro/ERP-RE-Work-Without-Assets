Config = {}

--[[
──────────────────────────────────────────────────────────────────

	BetterGunShots (server.lua) - Created by SubhamPROYT

	Support - SubhamPROYT#3729 on Discord

──────────────────────────────────────────────────────────────────
]]--

-- Sets the time in milliseconds the blip will remain on the map after a gunshot is detected.
Config.BlipTime = 25000 

-- Sets the time in milliseconds needed for the ShotSpotter to detect a gunshot and put out an alert notification.
Config.NotifyTime = 7000 
--5 seconds
-- Sets the minimum time in milliseconds between gunshots alert notifications.
-- If you are getting too many alert notifications when multiple gunshots are detected, you may want to increase the value.
Config.AlertCooldown = 7000 

-- Sets the radius of the blip on the map. Bigger value = bigger radius.
-- The value must be a decimal value, so make sure to keep the decimal point.
Config.BlipRadius = 400.0

-- Sets the color of the blip on the map (default is red).
-- For the list of colors: https://docs.fivem.net/docs/game-references/blips/#blip-colors
Config.BlipColor = 1

-- Sets the weapons the ShotSpotter won't detected.
-- For the weapon names: https://wiki.rage.mp/index.php?title=Weapons
-- Melee weapons won't be detected at all, so no need to put them in the list.
Config.Blacklist = {
	`WEAPON_STUNGUN`,
	`WEAPON_FLAREGUN`,
	`WEAPON_BZGAS`,
	`WEAPON_MOLOTOV`,
	`WEAPON_SNOWBALL`,
	`WEAPON_BALL`,
	`WEAPON_SMOKEGRENADE`,
	`WEAPON_FLARE`,
	`WEAPON_PETROLCAN`,
	`WEAPON_HAZARDCAN`,
	`WEAPON_FIREEXTINGUISHER`
}
