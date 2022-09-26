Config = {}
local Prefix = "PRO Queue "
Config.ServerName = "PRO Queue" -- Enter your server name.
Config.DiscordServerID = 959067219550146600 -- Change To Your Server ID
Config.DiscordBotToken = "OTEzODU0MTQ2MTU3ODc5Mjk3.YaEi_w.B7OffjAj57OaqP3BW7bZOLGjIdg" -- Discord Bot Token. You can create one on https://discord.com/developers/applications
Config.ApiLink = "" -- If you are using API.
Config.ApiKey = ""
Config.maxServerSlots = 48
Config.Roles = {
    Support = {
        roleID = "960228649523621910",
        points = 1,
        name = "Staff Members"
    },

    Developer = {
        roleID = "960877021444059156",
        points = 10,
        name = "Managment Team"
    },

    Bronge = {
        roleID = "974405079937458316",
        points = 2,
        name = "BRONZE"
    },
    
    Silver = {
        roleID = "962336078881226782",
        points = 3,
        name = "SILVER"
    },

    Gold = {
        roleID = "962336024783097887",
        points = 4,
        name = "Gold"
    },
    
    Plat = {
        roleID = "962335982882000966",
        points = 5,
        name = "Platinum"
    },

    Diamond = {
        roleID = "962335888153641040",
        points = 6,
        name = "Diamond"
    },

    Ruby = {
        roleID = "962336174557511700",
        points = 7,
        name = "Ruby"
    },

    Palladium = {
        roleID = "962336542494457856",
        points = 8,
        name = "Palladium"
    },
}

Config.Colors = {
	"accent",
	"good",
	"warning",
	"attention",
}
Config.Verifiying = Prefix .. "Please wait, Downloading content from PRO-database."
Config.VerifiyingLauncher = Prefix .. "Please wait, Verifiying you entered through the launcher."
Config.VerifiyingDiscord = Prefix .. "Please wait, Verifiying your Discord ID."
Config.VerifiyingSteam = Prefix .. "Please wait, Verifiying your Steam."
Config.VerifiyingQueue = Prefix .. "Please wait, Adding you to the queue."

Config.NotWhitelisted = Prefix .. "Sorry, I didn't find you in our database."
Config.NoDiscord = Prefix .. "Please make sure your Discord is open."
Config.NoSteam = Prefix .. "Please make sure your Steam is open."
Config.NoLauncher = Prefix .. "The server can only be accessed through its launcher."
Config.Blacklisted = Prefix .. "You're blacklisted from the server, f**K off please."

Config.Welcome = Prefix .. "Welcome Sir."
Config.Error = Prefix .. "Error, Please try again later."
Config.HandshakingWith = Prefix .. "Open STEAM in Background and Join Discord If you Stuck Here ! Link : https://discord.io/ELAPSED"
