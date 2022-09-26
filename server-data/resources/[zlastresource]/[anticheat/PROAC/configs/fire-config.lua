
--------[-----------------------------------]--------
--------[-----------------------------------]--------
--------[---- Copyright 2022 by SubhamPRO® ----]--------
--------[-----------------------------------]--------
--------[------ Dev By AmIrReZa#2080 -------]--------
--------[-----------------------------------]--------



FIREAC = {}
--                                           * 𝗧𝗜𝗣 𝟭 *
--                               𝗧𝘆𝗽𝗲 𝗼𝗳 𝗽𝘂𝗻𝗶𝘀𝗵𝗺𝗲𝗻𝘁𝘀 : BAN | KICK | WARN
--
--                                           * 𝗧𝗜𝗣 𝟮 *
--                                           𝗦𝗰𝗿𝗲𝗲𝗻𝘀𝗵𝗼𝘁
--                              𝗙𝗼𝗿 𝗘𝗻𝗮𝗯𝗹𝗲 𝗦𝗰𝗿𝗲𝗲𝗻𝘀𝗵𝗼𝘁 𝗼𝗽𝘁𝗶𝗼𝗻 𝗱𝗼𝘄𝗻𝗹𝗼𝗮𝗱 𝘁𝗵𝗶𝘀
--   (https://github.com/jaimeadf/discord-screenshot/releases/download/1.3.6/discord-screenshot-1.3.6.zip)
--                                𝗔𝗗𝗗 𝟭 𝗥𝗘𝗦𝗢𝗨𝗥𝗖𝗘 𝗢𝗡 𝗬𝗢𝗨𝗥 𝗦𝗘𝗥𝗩𝗘𝗥

--【 𝗩𝗲𝗿𝘀𝗶𝗼𝗻 𝗖𝗵𝗲𝗰𝗸 𝗳𝗼𝗿 𝘂𝗽𝗱𝗮𝘁𝗲𝘀 】--
FIREAC.Version   = 6.1
FIREAC.Port      = "30120"

--【 𝗟𝗼𝗴 𝗙𝗼𝗿 𝗦𝗲𝗻𝗱 𝗶𝗻 𝗗𝗶𝘀𝗰𝗼𝗿𝗱 】--
FIREAC.Log = {
    Ban        = "https://discord.com/api/webhooks/993398288822841424/LHBer6DaDrXc8filfI6bvr-DYLxx1sJnaoSEmznE-3UxgQXdDM9h5ma--HVUMC_XBKLo",
    Connect    = "https://discord.com/api/webhooks/993398429092958298/mkIMvjt3VtLSoXhZ6UvxRB5-iazkVo9c0MceeiU1EGQC6NK6rwvq2LI8dcp5X2cZ1OmF",
    Disconnect = "https://discord.com/api/webhooks/993398529076764682/ovSaIgs9uDU2sBVava-93sQlkjmwzwSWtgbR650EVSJVLnwTkgY99gNYiYvR_XgkPzOP",
    Exoplosion = "https://discord.com/api/webhooks/993398611587125248/QceQK4_o9ZV0zNNMDPGhkWuKhUuehGYfgSK1pcHI_PwV_kP51m4xGKOHPjmnB5lKKISN",
    Error      = "https://discord.com/api/webhooks/993398707947044884/B2k78FZnTAeLuHAaX9vcAIEV7N63R49Pj2rxf5sDaGUP9Wz77fn6rD-vLZuKi3oo5Gge"
}

--【 𝗦𝗰𝗿𝗲𝗲𝗻𝗦𝗵𝗼𝘁 】--  (𝗧𝗜𝗣 𝟮)
FIREAC.ScreenShot = {
    Enable  = true,
    Format  = "PNG",
    Quality = 1,
    Log     = "https://discord.com/api/webhooks/993398140474507344/ybL6SS7rAU2G4an7p--t8JE1W4-q362iwxgj-7mx0VlcslsX9v0RLLM4Nvc0mTAdoJ0U"
}

--【 𝗖𝗼𝗻𝗻𝗲𝗰𝘁𝗶𝗼𝗻 𝗦𝗲𝘁𝘁𝗶𝗻𝗴𝘀 】--
FIREAC.Connection = {
    AntiBlackListName = false,
    AntiVPN           = false,
    Log               = "https://discord.com/api/webhooks/971779966545047602/7VDRoHYniA9f9c9XMavZgSga1gD8CfXhAKOyg5OLN2zD4F67Nag33aMz7Z-y2MsJUWhv"
}

--【 𝗠𝗲𝘀𝘀𝗮𝗴𝗲 】--
FIREAC.Message = {
    Kick = "You Are ⚡️ Kicked From Server Protection By SubhamPRO® Don't Try For Cheat in this server Join https://discord.gg/UtJqaPsrQB",
    Ban  = "You Are ⛔️ Banned Form Server Please Make Ticket in Discord® https://discord.gg/UtJqaPsrQB",
}

--【 𝗔𝗱𝗺𝗶𝗻 𝗠𝗲𝗻𝘂 】--
FIREAC.AdminMenu = {
    Enable         = false,
    Key            = "INSERT",
    MenuPunishment = "KICK"
}

--【 𝗔𝗻𝘁𝗶 𝗧𝗿𝗮𝗰𝗸 𝗣𝗹𝗮𝘆𝗲𝗿 】--
FIREAC.AntiTrackPlayer = false
FIREAC.MaxTrack        = 10
FIREAC.TrackPunishment = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗛𝗲𝗮𝗹𝘁𝗵 𝗛𝗮𝗰𝗸 】--
FIREAC.AntiHealthHack   = true
FIREAC.MaxHealth        = 200
FIREAC.HealthPunishment = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗔𝗿𝗺𝗼𝗿 𝗛𝗮𝗰𝗸 】--
FIREAC.AntiArmorHack   = false
FIREAC.MaxArmor        = 100
FIREAC.ArmorPunishment = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗧𝗮𝘀𝗸𝘀 】--
FIREAC.AntiBlacklistTasks = false
FIREAC.TasksPunishment    = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗣𝗹𝗮𝘆 𝗔𝗻𝗶𝗺𝘀 】--
FIREAC.AntiBlacklistAnims = false
FIREAC.AnimsPunishment    = "KICK"

--【 𝗦𝗮𝗳𝗲 𝗣𝗹𝗮𝘆𝗲𝗿𝘀 】--
FIREAC.SafePlayers      = false
FIREAC.AntiInfinityAmmo = false

--【 𝗔𝗻𝘁𝗶 𝗦𝗽𝗲𝗰𝘁𝗮𝘁𝗲 】--
FIREAC.AntiSpactate       = false
FIREAC.SpactatePunishment = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗪𝗲𝗮𝗽𝗼𝗻 】--
FIREAC.AntiBlackListWeapon  = false
FIREAC.AntiAddWeapon        = false
FIREAC.AntiRemoveWeapon     = false
FIREAC.AntiWeaponsExplosive = false
FIREAC.WeaponPunishment     = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗚𝗼𝗱𝗠𝗼𝗱𝗲 】--
FIREAC.AntiGodMode    = false
FIREAC.GodPunishment  = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗜𝗻𝘃𝗶𝘀𝗶𝗯𝗹𝗲 】--
FIREAC.AntiInvisble         = false
FIREAC.InvisiblePunishment  = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗦𝗽𝗲𝗲𝗱 】--
FIREAC.AntiChangeSpeed = false
FIREAC.SpeedPunishment = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗙𝗿𝗲𝗲 𝗖𝗮𝗺 】--
FIREAC.AntiFreeCam   = false
FIREAC.CamPunishment = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗥𝗮𝗶𝗻𝗯𝗼𝘄 𝗩𝗲𝗵𝗶𝗰𝗹𝗲 】--
FIREAC.AntiRainbowVehicle  = false
FIREAC.RainbowPunishment   = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗔𝗶𝗺 𝗕𝗼𝘁 】--
FIREAC.AntiAimBot       = false
FIREAC.AimBotPunishment = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗣𝗹𝗮𝘁𝗲 】--
FIREAC.AntiPlateChanger   = false
FIREAC.AntiBlackListPlate = false
FIREAC.PlatePunishment    = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗩𝗶𝘀𝗶𝗼𝗻 】--
FIREAC.AntiNightVision   = false
FIREAC.AntiThermalVision = false
FIREAC.VisionPunishment  = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗦𝘂𝗽𝗲𝗿 𝗝𝘂𝗺𝗽 】--
FIREAC.AntiSuperJump  = false
FIREAC.JumpPunishment = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗧𝗲𝗹𝗲𝗽𝗼𝗿𝘁 】--
FIREAC.AntiTeleport        = false
FIREAC.MaxFootDistence     = 200
FIREAC.MaxVehicleDistence  = 600
FIREAC.TeleportPunishment  = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗣𝗲𝗱 𝗖𝗵𝗮𝗻𝗴𝗲𝗿 】--
FIREAC.AntiPedChanger       = false
FIREAC.PedChangePunishment  = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗜𝗻𝗳𝗶𝗻𝗶𝘁𝗲 𝗦𝘁𝗮𝗺𝗶𝗻𝗮 】--
FIREAC.AntiInfiniteStamina    = false
FIREAC.InfinitePunishment     = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗥𝗮𝗴𝗱𝗼𝗹𝗹 】--
FIREAC.AntiRagdoll           =  false
FIREAC.RagdollPunishment     = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗠𝗲𝗻𝘆𝗼𝗼 】--
FIREAC.AntiMenyoo           =  false
FIREAC.MenyooPunishment     = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗔𝗶𝗺 𝗔𝘀𝘀𝗶𝘀𝘁 】--
FIREAC.AntiAimAssist        =  false
FIREAC.AimAssistPunishment  = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗥𝗲𝘀𝗼𝘂𝗿𝗰𝗲 】--
FIREAC.AntiResourceStoper     = true
FIREAC.AntiResourceStarter    = false
FIREAC.AntiResourceRestarter  = false
FIREAC.ResourcePunishment     = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗙𝗹𝗮𝗴 】--
FIREAC.AntiTinyPed        = false
FIREAC.PedFlagPunishment  = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗦𝘂𝗶𝗰𝗶𝗱𝗲 】--
FIREAC.AntiSuicide   = false
FIREAC.SuiPunishment = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗼𝗹𝗹𝗲𝗰𝘁𝗲𝗱 𝗣𝗶𝗰𝗸𝘂𝗽 】--
FIREAC.AntiCollectedPickup = false
FIREAC.PickupePunishment   = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝘁 】--
FIREAC.AntiSpamChat          = false
FIREAC.MaxMessage            = 10
FIREAC.CoolDownSec           = 3
FIREAC.ChatPunishment        = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗖𝗼𝗺𝗺𝗮𝗻𝗱 】--
FIREAC.AntiBlackListCommands = false
FIREAC.CMDPunishment         = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗗𝗮𝗺𝗮𝗴𝗲 】--
FIREAC.AntiWeaponDamageChanger   = false
FIREAC.AntiVehicleDamageChanger  = false
FIREAC.DamagePunishment          = "KICK"

--【 𝗔𝗻𝘁𝗶 𝗪𝗼𝗿𝗱 】--
FIREAC.AntiBlackListWord   = false
FIREAC.WordPunishment      = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗕𝗿𝗶𝗻𝗴 𝗔𝗹𝗹 】--
FIREAC.AntiBringAll       = true
FIREAC.BringAllPunishment = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗧𝗿𝗶𝗴𝗴𝗲𝗿 】--
FIREAC.AntiBlackListTrigger = true
FIREAC.AntiSpamTrigger      = true
FIREAC.TriggerPunishment    = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗹𝗲𝗮𝗿 𝗣𝗲𝗱 𝗧𝗮𝘀𝗸𝘀 】--
FIREAC.AntiClearPedTasks   = false
FIREAC.MaxClearPedTasks    = 5
FIREAC.CPTPunishment       = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗧𝗮𝘇𝗲 𝗣𝗹𝗮𝘆𝗲𝗿𝘀 】--
FIREAC.AntiTazePlayers = false
FIREAC.MaxTazeSpam     = 4
FIREAC.TazePunishment  = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗜𝗻𝗷𝗲𝗰𝘁 】--
FIREAC.AntiInject        = false
FIREAC.InjectPunishment  = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗘𝘅𝗽𝗹𝗼𝘀𝗶𝗼𝗻 】--
FIREAC.AntiBlackListExplosion   = false
FIREAC.AntiExplosionSpam        = false
FIREAC.MaxExplosion             = 6
FIREAC.ExplosionSpamPunishment  = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗘𝗻𝘁𝗶𝘁𝘆 𝗦𝗽𝗮𝘄𝗻𝗲𝗿 】--
FIREAC.AntiBlackListObject   = false
FIREAC.AntiBlackListPed      = false
FIREAC.AntiBlackListBuilding = false
FIREAC.AntiBlackListVehicle  = false
FIREAC.EntityPunishment      = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗘𝗻𝘁𝗶𝘁𝘆 𝗦𝗽𝗮𝗺𝗲𝗿 】--
FIREAC.AntiSpawnNPC      = false

FIREAC.AntiSpamVehicle   = false
FIREAC.MaxVehicle        = 10

FIREAC.AntiSpamPed       = false
FIREAC.MaxPed            = 10

FIREAC.AntiSpamObject    = false
FIREAC.MaxObject         = 15

FIREAC.SpamPunishment    = "WARN"

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗣𝗲𝗿𝗺 】--
FIREAC.AntiChangePerm    = false
FIREAC.PermPunishment    = "BAN"

--【 𝗔𝗻𝘁𝗶 𝗣𝗹𝗮𝘆 𝗦𝗼𝘂𝗻𝗱 】--
FIREAC.AntiPlaySound    = false
FIREAC.SoundPunishment  = "WARN"