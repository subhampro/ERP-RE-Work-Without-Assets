--[[[
        -----------------------------------
        -----------------------------------
        ---- Copyright 2022 by FIREAC® ----
        -----------------------------------
        ------ Dev By AmIrReZa#2080 -------
        -----------------------------------

]]

local COLORS    = math.random(1, 9)
local SERVER_NAME   = "Elapsed Roleplay"
local SPAWNED   = {}
local SPAMLIST  = {}

--【 𝗦𝘁𝗮𝗿𝘁𝗶𝗻𝗴 】--
Citizen.CreateThread(function()
    StartAntiCheat()
end)


--【 𝗕𝗮𝗻 𝗘𝘃𝗲𝗻𝘁 𝗙𝗼𝗿 𝗖𝗹𝗶𝗲𝗻𝘁 】--  
RegisterNetEvent("FIREAC:BanFromClient")
AddEventHandler("FIREAC:BanFromClient", function (ACTION ,REASON, DETAILS)
    local SRC = source
    if REASON ~= nil and ACTION ~= nil then
        if not FIREAC_WHITELIST(SRC) then
            FIREAC_ACTION(SRC, ACTION, REASON, DETAILS)
            FIREAC_ADD_SPAMLIST(SRC, ACTION, REASON, DETAILS)
        end
    else
        FIREAC_ERROR(SERVER_NAME, "FIREAC:BanFromClient : REASON or ACTION (Not Found)")
    end
end)

--【𝗕𝗮𝗻 𝗘𝘃𝗲𝗻𝘁 𝗙𝗼𝗿 𝗜𝗻𝗷𝗲𝗰𝘁 】--
RegisterNetEvent("FIREAC:BanForInject")
AddEventHandler("FIREAC:BanForInject", function (REASON, DETAILS, RESOURCE)
    local SRC = source
    if REASON ~= nil and RESOURCE ~= nil then
        if not FIREAC_WHITELIST(SRC) then
            FIREAC_ACTION(SRC, FIREAC.InjectPunishment, "Anti Inject", DETAILS)
        end
    else
        FIREAC_ERROR(SERVER_NAME, "FIREAC:BanForInject : REASON or RESOURCE (Not Found)")
    end
end)

RegisterNetEvent("FIREAC:AntiInject")
AddEventHandler("FIREAC:AntiInject", function(resource, info)
    local SRC = source
    if resource ~= nil and info ~= nil then
        FIREAC_ACTION(SRC, FIREAC.InjectPunishment, "Anti Inject", "Try For Inject in **"..resource.."** Type: "..info.."")
     end
end)

--【 𝗔𝗱𝗺𝗶𝗻 𝗠𝗲𝗻𝘂 】--
RegisterNetEvent("FIREAC:CheckIsAdmin")
AddEventHandler("FIREAC:CheckIsAdmin", function ()
    local SRC = source
    if FIREAC_ADMINMENU(SRC) then
        local DATA = {
            NAME = GetPlayerName(SRC),
            ID   = SRC
        }
        TriggerClientEvent("FIREAC:AddAdminOption", SRC, DATA)
    end
end)

RegisterNetEvent("FIREAC:MenuOpened")
AddEventHandler("FIREAC:MenuOpened", function ()
    local SRC = source
    if not FIREAC_ADMINMENU(SRC) then
        FIREAC_ACTION(SRC, FIREAC.AdminMenu.MenuPunishment, "Anti Open Admin Menu", "Try For Open Admin Menu (Not Admin)")
    else
        local PlayerList = {}
        for _, value in pairs(GetPlayers()) do
            table.insert(PlayerList, {
                name = GetPlayerName(value),
                id   = value
            })
        end
        TriggerClientEvent("FIREAC:GetPlayerList", SRC, PlayerList)
    end
end)

RegisterNetEvent("FIREAC:DeleteEntitys")
AddEventHandler("FIREAC:DeleteEntitys", function (TYPE)
    local SRC = source
    if TYPE ~= nil then
        if FIREAC_ADMINMENU(SRC) then
            if TYPE == "VEHCILE" then
                for _, VEH in ipairs(GetAllVehicles()) do
                    if DoesEntityExist(VEH) then
                        DeleteEntity(VEH)
                    end
                end
            elseif TYPE == "PEDS" then
                for _, PEDS in ipairs(GetAllPeds()) do
                    if DoesEntityExist(PEDS) then
                        DeleteEntity(PEDS)
                    end
                end
            elseif TYPE == "PROP" then
                for _, OBJ in ipairs(GetAllObjects()) do
                    if DoesEntityExist(OBJ) then
                        DeleteEntity(OBJ)
                    end
                end
            end
        else
            FIREAC_ACTION(SRC, FIREAC.AdminMenu.MenuPunishment, "Anti Delete Entity", "Try For Delete Entitys")
        end
    end
end)

RegisterNetEvent("FIREAC:TeleportToPlayer")
AddEventHandler("FIREAC:TeleportToPlayer", function (SV_ID)
    local SRC = source
    if tonumber(SRC) then
        if tonumber(SV_ID) then
            local TPED    = GetPlayerPed(SV_ID)
            local PED     = GetPlayerPed(SRC)
            local TCOORDS = GetEntityCoords(TPED)
            if FIREAC_ADMINMENU(SRC) then
                SetEntityCoords(PED, TCOORDS.x, TCOORDS.y, TCOORDS.z, true, true, true)
            else
                FIREAC_ACTION(SRC, FIREAC.AdminMenu.MenuPunishment, "Anti Teleport", "Try For Teleport to ped by admin menu (not admin)")
            end
        end
    end
end)

RegisterNetEvent("FIREAC:GiveVehicleToPlayer")
AddEventHandler("FIREAC:GiveVehicleToPlayer", function (VEH_NAME, SV_ID)
    local SRC = source
    if tonumber(SRC) then
        if tonumber(SV_ID) then
            local TPED    = GetPlayerPed(SV_ID)
            local TCOORDS = GetEntityCoords(TPED)
            local HEADING = GetEntityHeading(TPED)
            if FIREAC_ADMINMENU(SRC) then
                local VEH = CreateVehicle(GetHashKey(VEH_NAME), TCOORDS, HEADING, true, true)
                Wait(1000)
                SetPedIntoVehicle(TPED, VEH, -1)
            else
                FIREAC_ACTION(SRC, FIREAC.AdminMenu.MenuPunishment, "Anti Spawn Vehicle", "Try For Spawn Vehicle By Admin Menu (not admin)")
            end
        end
    end
end)

RegisterNetEvent("FIREAC:GetScreenShot")
AddEventHandler("FIREAC:GetScreenShot", function (P_ID)
    local SRC = source
    if tonumber(SRC) then
        if tonumber(P_ID) then
              if FIREAC_ADMINMENU(SRC) then
                FIREAC_SCREENSHOT(P_ID, "By Admin Menu", "By "..GetPlayerName(SRC).."", "WARN")
            else
                FIREAC_ACTION(SRC, FIREAC.AdminMenu.MenuPunishment, "Anti Get ScreenShot", "Try For Get Screen Shot By Menu (not admin)")
            end
        end
    end
end)

RegisterNetEvent("FIREAC:BanByMenu")
AddEventHandler("FIREAC:BanByMenu", function (P_ID)
    local SRC = source
    local Target = P_ID
    if tonumber(SRC) then
        if tonumber(Target) then
            if FIREAC_ADMINMENU(SRC) then
                FIREAC_ACTION(Target, "BAN", "Ban By Admin Menu", "Player Ban By Menu : **"..GetPlayerName(SRC).."**")
            else
                FIREAC_ACTION(SRC, FIREAC.AdminMenu.MenuPunishment, "Anti Ban Players", "Try For Ban Player By Admin Menu (not admin)")
            end
        end
    end
end)

RegisterServerEvent("FIREAC:ReqSpectate")
AddEventHandler("FIREAC:ReqSpectate", function(id)
    local SRC = source
    local Target = id
    local TPED   = GetPlayerPed(Target)
    local COORDS = GetEntityCoords(TPED)
    if tonumber(SRC) then
        if tonumber(Target) then
            if FIREAC_ADMINMENU(SRC) then
                TriggerClientEvent("FIREAC:SpectatePlayer", SRC, Target, COORDS)
            else
                FIREAC_ACTION(SRC, FIREAC.AdminMenu.MenuPunishment, "Anti Spectate Players", "Try For Spectate Player By Admin Menu (not admin)")
            end
        end
    end
end)
--【 𝗦𝘂𝗽𝗲𝗿𝗝𝘂𝗺𝗽 𝗖𝗵𝗲𝗰𝗸 】--
RegisterNetEvent("FIREAC:CheckJumping")
AddEventHandler("FIREAC:CheckJumping", function (ACTION ,REASON, DETAILS)
    local SRC = source
    if IsPlayerUsingSuperJump(SRC) and tonumber(SRC) then
        if not FIREAC_WHITELIST(SRC) then
            FIREAC_ACTION(SRC, ACTION, REASON, DETAILS)
        end
    end
end)

RegisterNetEvent("FIREAC:ScreenShotFromClient")
AddEventHandler("FIREAC:ScreenShotFromClient", function (URL, REASON, DETAILS)
    local SRC = source
    if tonumber(SRC) ~= nil and GetPlayerName(SRC) ~= nil then
        local NAME    = GetPlayerName(SRC)
        local COORDS  = GetEntityCoords(GetPlayerPed(SRC))
        local STEAM   = "Not Found"
        local DISCORD = "Not Found"
        local FIVEML  = "Not Found"
        local LIVE    = "Not Found"
        local XBL     = "Not Found"
        local ISP     = "Not Found"
        local CITY    = "Not Found"
        local COUNTRY = "Not Found"
        local PROXY   = "Not Found"
        local HOSTING = "Not Found"
        local IP      = GetPlayerEndpoint(SRC)
        IP = (string.gsub(string.gsub(string.gsub(IP,  "-", ""), ",", ""), " ", ""):lower())
        local g, f = IP:find(string.lower("192.168"))
        if g or f then
           IP = "178.131.122.181"
        end
        for _, DATA in ipairs(GetPlayerIdentifiers(SRC)) do
            if DATA:match("steam") then
                STEAM = DATA
            elseif DATA:match("discord") then
                DISCORD = DATA:gsub("discord:", "")
            elseif DATA:match("license") then
                FIVEML = DATA
            elseif DATA:match("live") then
                LIVE = DATA
            elseif DATA:match("xbl") then
                XBL = DATA
            end
        end
        if DISCORD ~= "Not Found" then
            DISCORD = "<@"..DISCORD..">"
        else
            DISCORD = "Not Found"
        end
        PerformHttpRequest("http://ip-api.com/json/"..IP.."?fields=66846719", function(ERROR, DATA, RESULT)
            if DATA ~= nil then
                local TABLE = json.decode(DATA)
                if TABLE ~= nil then
                    ISP     = TABLE["isp"]
                    CITY    = TABLE["city"]
                    COUNTRY = TABLE["country"]
                    if TABLE["proxy"] == true then
                        PROXY   =  "ON"
                    else
                        PROXY   = "OFF"
                    end
                    if TABLE["hosting"] == true then
                        HOSTING   =  "ON"
                    else
                        HOSTING   = "OFF"
                    end
                        if URL ~= nil then
                           PerformHttpRequest(FIREAC.ScreenShot.Log, function(ERROR, DATA, RESULT)
                            end, "POST", json.encode({
                                embeds = {
                                    {
                                        author = {
                                            name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                            url = "https://discord.gg/8zGyDhtbcg",
                                            icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                        },
                                        image =  {
                                            url = URL,
                                        },
                                        footer = {
                                            text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                            icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                        },
                                        title = ""..Emoji.VPN.." ScreenShot "..Emoji.VPN.."",
                                        description = "**Player:** "..NAME.."\n**Reason:** "..REASON.."\n**Details:** "..DETAILS.."\n**Coords:** "..COORDS.."\n**Steam Hex:** "..STEAM.."\n**Discord :**  "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                        color = 10181046
                                    }
                                }
                            }), {
                                ["Content-Type"] = "application/json"
                            })
                        end
                    end
                end
            end)
        else
        FIREAC_ERROR(SERVER_NAME, "FIREAC:ScreenShotFromClient (SRC not found)")
    end
end)

--【 𝗗𝗿𝗼𝗽𝗣𝗹𝗮𝘆𝗲𝗿 𝗘𝘃𝗲𝗻𝘁 】--
AddEventHandler("playerDropped", function(REASON)
    local SRC = source
    print("^"..COLORS.."FIREAC^0: ^1Player ^3"..GetPlayerName(SRC).." ^1Disconnected ...  |  Reason : ^0(^6"..REASON.."^0)^0")
    if GetPlayerName(SRC) and REASON ~= nil then
        FIREAC_SENDLOG(SRC, FIREAC.Log.Disconnect, "DISCONNECT", REASON)
     else
        FIREAC_ERROR(SERVER_NAME, "playerDropped : REASON or SRC (Not Found)")
    end
end)

--【 𝗪𝗲𝗮𝗽𝗼𝗻 𝗘𝘃𝗲𝗻𝘁 】--
AddEventHandler("giveWeaponEvent", function(SRC, DATA)
    if FIREAC.AntiAddWeapon then
        if tonumber(SRC) ~= nil and GetPlayerName(SRC) ~= nil then
            if not FIREAC_WHITELIST(SRC) then
                CancelEvent()
                FIREAC_ACTION(SRC, FIREAC.WeaponPunishment, "Anti Add Weapon", "Try for add weapon for player")
            end
        else
            FIREAC_ERROR(SERVER_NAME, "giveWeaponEvent : SRC (Not Found)")
        end
    end
end)

--【 𝗥𝗲𝗺𝗼𝘃𝗲 𝗪𝗲𝗮𝗽𝗼𝗻 】--
AddEventHandler("RemoveWeaponEvent", function(SRC, DATA)
    if FIREAC.AntiRemoveWeapon then
        if tonumber(SRC) ~= nil and GetPlayerName(SRC) ~= nil then
            if not FIREAC_WHITELIST(SRC) then
                CancelEvent()
                FIREAC_ACTION(SRC, FIREAC.WeaponPunishment, "Anti Remove Weapon", "Try for remove weapon for player")
            end
        else
            FIREAC_ERROR(SERVER_NAME, "giveWeaponEvent : SRC (Not Found)")
        end
    end
end)

--【 𝗥𝗲𝗺𝗼𝘃𝗲 𝗔𝗹𝗹 𝗪𝗲𝗮𝗽𝗼𝗻 】--
AddEventHandler("RemoveAllWeaponsEvent",function(SRC, DATA)
    if FIREAC.AntiRemoveWeapon then
        if tonumber(SRC) ~= nil and GetPlayerName(SRC) ~= nil then
            if not FIREAC_WHITELIST(SRC) then
                CancelEvent()
                FIREAC_ACTION(SRC, FIREAC.WeaponPunishment, "Anti Remove All Weapon", "Try for remove all weapon for player")
            end
        else
            FIREAC_ERROR(SERVER_NAME, "giveWeaponEvent : SRC (Not Found)")
        end
    end
end)

RegisterNetEvent("FIREAC:AddToSpawnList")
AddEventHandler("FIREAC:AddToSpawnList", function()
    local SRC = tonumber(source)
    if SRC ~= nil then
        if SPAWNED[SRC] == nil then
            SPAWNED[SRC] = true
        end
    end
end)

--【 𝗧𝗿𝗶𝗴𝗴𝗲𝗿 𝗠𝗮𝗻𝗮𝗴𝗲𝗺𝗲𝗻𝘁 】--
local EVENTS = {}
local isSpamTrigger = false
if FIREAC.AntiSpamTigger then
	for i = 1, #SpamCheck do
		local TNAME  =  SpamCheck[i].EVENT
		local MTIME  =  SpamCheck[i].MAX_TIME
		RegisterNetEvent(TNAME)
		AddEventHandler(TNAME, function()
            local SRC = source
			if EVENTS[TNAME] == nil then
				EVENTS[TNAME] = {
					count = 1,
					time = os.time()
				}
			else
				EVENTS[TNAME].count = EVENTS[TNAME].count + 1
			end
				if EVENTS[TNAME].count > MTIME then
					local distime = os.time() - EVENTS[TNAME].time
					if distime >= 10 then
						EVENTS[TNAME].count = 1
					else
						isSpamTrigger = true
					end
					if GetPlayerName(source) and isSpamTrigger then
                        FIREAC_ACTION(SRC, FIREAC.TriggerPunishment, "Anti Spam Trigger", "Try For Spam Trigger : `"..TNAME.."`")
                        CancelEvent()
					end
				end
		end)
	end
end

--【 𝗖𝗼𝗺𝗺𝗮𝗻𝗱 𝗠𝗮𝗻𝗮𝗴𝗲𝗺𝗲𝘁 】--
local SERVER_CMDS = {}
for index, bcmd in ipairs(Commands) do
    RegisterCommand(bcmd, function (SRC, ARGS)
        if FIREAC.AntiBlackListCommands then
            FIREAC_ACTION(SRC, FIREAC.TriggerPunishment, "Anti Black List Commands", "Try For Use Black List Command : **"..bcmd.."**")
            return
        end
    end)
end

--【 𝗖𝗵𝗮𝘁 𝗠𝗮𝗻𝗮𝗴𝗲𝗺𝗲𝗻𝘁 】--
local MESSAGE = {}
AddEventHandler("chatMessage", function(SRC, NA, WORD)
    local HWID = SRC
    if FIREAC.AntiBlackListWord then
        for _, S in pairs(Words) do
            for S in WORD:lower():gmatch("%s?"..string.lower(S).."%s") do
                FIREAC_ACTION(SRC, FIREAC.WordPunishment, "Anti Bad Word", "Try say : **"..WORD.."**")
                return
            end
        end
    end
    if FIREAC.AntiSpamChat then
        if MESSAGE[HWID] ~= nil then
            MESSAGE[HWID].COUNT = MESSAGE[HWID].COUNT + 1
            if os.time() - MESSAGE[HWID].TIME >= FIREAC.CoolDownSec then
                MESSAGE[HWID] = nil
            else
                TriggerClientEvent("chatMessage", SRC, "[FIREAC]", {255, 0, 0}, "You are spam message for "..MESSAGE[HWID].COUNT..", Please Wait for "..FIREAC.CoolDownSec.." secend")
                if MESSAGE[HWID].COUNT >= FIREAC.MaxMessage then
                    FIREAC_ACTION(SRC, FIREAC.ChatPunishment, "Anti Spam Chat", "Try For Spam in chat : **"..WORD.."**")
                    return
                end
            end
        else
            MESSAGE[HWID] = {
                COUNT = 1,
                TIME  = os.time()
            }
        end
    end
end)

if FIREAC.AntiBlackListTrigger then
    for i = 1 , #Events do
        RegisterNetEvent(Events[i])
        AddEventHandler(Events[i], function()
			local SRC = source
			local ENAME = Events[i]
	        FIREAC_ACTION(SRC, FIREAC.TriggerPunishment, "Anti Black List Trigger", "Try For Run Black List Trigger : "..ENAME.."")
            CancelEvent()
		end)
    end
end

--【 𝗔𝗻𝘁𝗶 𝗖𝗵𝗮𝗻𝗴𝗲 𝗣𝗲𝗿𝗺 】--
AddEventHandler("db:updateUser", function(data)
	if FIREAC.AntiChangePerm then
		if not data.playerName or not data.dateofbirth then
            FIREAC_ACTION(SRC, FIREAC.PermPunishment, "Anti Change Perm", "Try Change Perm, Data = `"..json.encode(data).."`")
            CancelEvent()
		end
	end
end)

--【 𝗔𝗻𝘁𝗶 𝗘𝘅𝗽𝗹𝗼𝘀𝗶𝗼𝗻 】--
local EXPLOSION = {}
AddEventHandler("explosionEvent", function(SRC, DATA)
    if tonumber(SRC) then
        local HWID = GetPlayerToken(SRC, 0)
        if DATA ~= nil then
     --【 𝗕𝗹𝗮𝗰𝗸 𝗟𝗶𝘀𝘁 𝗠𝗮𝗻𝗮𝗴𝗲 】--
     local TABLE = Explosion[DATA.explosionType]
     if TABLE ~= nil then
         local NAME = TABLE.NAME
        if TABLE.Log then
            FIREAC_SENDLOG(SRC, FIREAC.Log.Exoplosion, "EXPLOSION", NAME)
          end
        if TABLE.Punishment ~= nil and TABLE.Punishment ~= false  then
            if TABLE.Punishment == "WARN" then
                FIREAC_ACTION(SRC, TABLE.Punishment, "Anti Explosion", "Try For Create Black List Explosion : **"..NAME.."**")
                CancelEvent()
            elseif TABLE.Punishment == "KICK" then
                FIREAC_ACTION(SRC, TABLE.Punishment, "Anti Explosion", "Try For Create Black List Explosion : **"..NAME.."**")
                CancelEvent()
            elseif TABLE.Punishment == "BAN" then
                FIREAC_ACTION(SRC, TABLE.Punishment, "Anti Explosion", "Try For Create Black List Explosion : **"..NAME.."**")
                CancelEvent()
            end
        end
     end
     --【 𝗦𝗽𝗮𝗺 𝗖𝗵𝗲𝗰𝗸 】--
     if FIREAC.AntiExplosionSpam then
        if EXPLOSION[HWID] ~= nil then
            EXPLOSION[HWID].COUNT = EXPLOSION[HWID].COUNT + 1
            if os.time() - EXPLOSION[HWID].TIME <= 10 then
                EXPLOSION[HWID] = nil
            else
                if EXPLOSION[HWID].COUNT >= FIREAC.MaxExplosion then
                    FIREAC_ACTION(SRC, FIREAC.ExplosionSpamPunishment, "Anti Spam Explosion", "Try For Spam Explosion Type: "..DATA.explosionType.." for "..EXPLOSION[HWID].COUNT.." times.")
                    CancelEvent()
                end
            end
         else
            EXPLOSION[HWID] = {
                COUNT = 1,
                TIME  = os.time()
            }
         end
     end
        else
            CancelEvent()
        end
    else
        CancelEvent()
    end
end)


--【 𝗔𝗻𝘁𝗶 𝗣𝗹𝗮𝘆 𝗦𝗼𝘂𝗻𝗱 】--
-- AddEventHandler("InteractSound_SV:PlayWithinDistance", function(maxDistance, soundFile, soundVolume)
-- 	local SRC = source
-- 	if FIREAC.AntiPlaySound then
-- 		if maxDistance == 10000 and soundFile == "handcuff" then
--             FIREAC_ACTION(SRC, FIREAC.SoundPunishment, "Anti Play Sound", "Try For Play **handcuff** sound in **"..maxDistance.."** Distance")
--             CancelEvent()
-- 		elseif maxDistance == 1000 and soundFile == "Cuff" then
--             FIREAC_ACTION(SRC, FIREAC.SoundPunishment, "Anti Play Sound", "Try For Play **Cuff** sound in **"..maxDistance.."** Distance")
--             CancelEvent()
-- 		elseif maxDistance == 103232 and soundFile == "lock" then
--             FIREAC_ACTION(SRC, FIREAC.SoundPunishment, "Anti Play Sound", "Try For Play **Lock** sound in **"..maxDistance.."** Distance")
--             CancelEvent()
-- 		elseif maxDistance == 10 and soundFile == "szajbusek" then
--             FIREAC_ACTION(SRC, FIREAC.SoundPunishment, "Anti Play Sound", "Try For Play **szajbusek** sound in **"..maxDistance.."** Distance")
--             CancelEvent()
-- 		elseif maxDistance == 5 and soundFile == "alarm" then
--             FIREAC_ACTION(SRC, FIREAC.SoundPunishmentt, "Anti Play Sound", "Try For Play **alarm** sound in **"..maxDistance.."** Distance")
--             CancelEvent()
-- 		elseif maxDistance == 13232 and soundFile == "pasysound" then
--             FIREAC_ACTION(SRC, FIREAC.SoundPunishment, "Anti Play Sound", "Try For Play **pasysound** sound in **"..maxDistance.."** Distance")
--             CancelEvent()
--         elseif maxDistance == 5000 and soundFile == "demo" then
--             FIREAC_ACTION(SRC, FIREAC.SoundPunishment, "Anti Play Sound", "Try For Play **pasysound** sound in **"..maxDistance.."** Distance")
--             CancelEvent() 
-- 		end
-- 	end
-- end)

--【 𝗔𝗻𝘁𝗶 𝗧𝗮𝘇𝗲 𝗣𝗹𝗮𝘆𝗲𝗿"𝘀 】--
local TAZE = {}
AddEventHandler("weaponDamageEvent", function(SRC, DATA)
    if FIREAC.AntiTazePlayers then
        local HWID = GetPlayerToken(SRC, 0)
        if DATA.weaponType == 911657153 then
            if TAZE[HWID] ~= nil then
                TAZE[HWID].COUNT = TAZE[HWID].COUNT + 1
                if os.time() - TAZE[HWID].TIME <= 10 then
                    TAZE[HWID] = nil
                else
                    if TAZE[HWID].COUNT >= FIREAC.MaxTazeSpam then
                        FIREAC_ACTION(SRC, FIREAC.TazePunishment, "Anti Spam Tazer", "Try For Spam Tazer for **"..TAZE[HWID].COUNT.."** times.")
                        CancelEvent()
                    end
                end
            else
                TAZE[HWID] = {
                    COUNT = 1,
                    TIME  = os.time()
                }
            end
        end
    end
end)

--【 𝗔𝗻𝘁𝗶 𝗖𝗹𝗲𝗮𝗿 𝗣𝗲𝗱 𝗧𝗮𝘀𝗸𝘀 】--
local FREEZE = {}
AddEventHandler("clearPedTasksEvent", function(SRC, DATA)
    local HWID = GetPlayerToken(SRC, 0)
    if FIREAC.AntiClearPedTasks then
        if FREEZE[HWID] ~= nil then
            FREEZE[HWID].COUNT = FREEZE[HWID].COUNT + 1
            if os.time() - FREEZE[HWID].TIME <= 10 then
                FREEZE[HWID] = nil
            else
                if FREEZE[HWID].COUNT >= FIREAC.MaxClearPedTasks then
                    FIREAC_ACTION(SRC, FIREAC.CPTPunishment, "Anti Clear Ped Tasks", "Try Clear Ped Tasks for "..FREEZE[HWID].TIME..".")
                    CancelEvent()
                end
            end
        else
            FREEZE[HWID] = {
                COUNT = 1,
                TIME  = os.time()
            }
        end
    end
end)

--【 𝗔𝗻𝘁𝗶 𝗕𝗿𝗶𝗻𝗴 𝗔𝗹𝗹 𝗣𝗹𝗮𝘆𝗲𝗿"𝘀 】--
RegisterNetEvent("esx_ambulancejob:syncDeadBody")
AddEventHandler("esx_ambulancejob:syncDeadBody", function(PED, TARGET)
	if FIREAC.AntiBringAll then
        FIREAC_ACTION(SRC, FIREAC.BringAllPunishment, "Anti Bring All Players", "Try For Bring All Players")
        CancelEvent()
	end
end)

AddEventHandler("onResourceStarting", function(RES)
	FIREAC_REFRESHCMD()
end)
AddEventHandler("onResourceStop", function(RES)
    FIREAC_REFRESHCMD()
end)

--【 𝗖𝗼𝗻𝗻𝗲𝗰𝘁𝗶𝗻𝗴 𝗘𝘃𝗲𝗻𝘁 】--
AddEventHandler("playerConnecting", function (name, setKickReason, deferrals)
    local SRC      = source
    local IP      = GetPlayerEndpoint(SRC)
    local STEAM   = "Not Found"
    local DISCORD = "Not Found"
    local FIVEML  = "Not Found"
    local LIVE    = "Not Found"
    local XBL     = "Not Found"
    local ISP     = "Not Found"
    local CITY    = "Not Found"
    local COUNTRY = "Not Found"
    local PROXY   = "Not Found"
    local HOSTING = "Not Found"
    local LON     = "Not Found"
    local LAT     = "Not Found"
    local HWID    = GetPlayerToken(SRC, 0)
    IP = (string.gsub(string.gsub(string.gsub(IP,  "-", ""), ",", ""), " ", ""):lower())
    local g, f = IP:find(string.lower("192.168"))
    if g or f then
        IP = "178.131.122.181"
    end
    for _, DATA in ipairs(GetPlayerIdentifiers(SRC)) do
        if DATA:match("steam") then
            STEAM = DATA
        elseif DATA:match("discord") then
            DISCORD = DATA:gsub("discord:", "")
        elseif DATA:match("license") then
            FIVEML = DATA
        elseif DATA:match("live") then
            LIVE = DATA
        elseif DATA:match("xbl") then
            XBL = DATA
        end
    end
    print("^"..COLORS.."SubhamPRO Anticheat^0: ^2Player ^3"..name.." ^2Connecting ...^0")
    --【 𝗕𝗮𝗻 𝗣𝗹𝗮𝘆𝗲𝗿 】--
    local BANFILE = LoadResourceFile(GetCurrentResourceName(), "banlist/fireac.json")
    if BANFILE ~= nil then
        local TABLE = json.decode(BANFILE)
        if TABLE ~= nil and type(TABLE) == "table" then
            if tonumber(SRC) ~= nil then
                local STEAM   = "Not Found"
                local DISCORD = "Not Found"
                local FIVEML  = "Not Found"
                local LIVE    = "Not Found"
                local XBL     = "Not Found"
                local IP = GetPlayerEndpoint(SRC)
                local BANID   =  "Not Found"
                local REASON  = "Not Found"
                local BANNED  = false
                IP = (string.gsub(string.gsub(string.gsub(IP,  "-", ""), ",", ""), " ", ""):lower())
                local g, f = IP:find(string.lower("192.168"))
                if g or f then
                    IP = "178.131.122.181"
                end
                for _, DATA in ipairs(GetPlayerIdentifiers(SRC)) do
                    if DATA:match("steam") then
                        STEAM = DATA
                    elseif DATA:match("discord") then
                        DISCORD = DATA:gsub("discord:", "")
                    elseif DATA:match("license") then
                        FIVEML = DATA
                    elseif DATA:match("live") then
                        LIVE = DATA
                    elseif DATA:match("xbl") then
                        XBL = DATA
                    end
                end
                for i = 0, GetNumPlayerTokens(SRC) do
                    for _, BANLIST in ipairs(TABLE)	do
                        if
                        BANLIST.STEAM == STEAM or
                        BANLIST.DISCORD == DISCORD or
                        BANLIST.LICENSE == FIVEML or
                        BANLIST.LIVE == LIVE or
                        BANLIST.XBL == XBL or
                        BANLIST.HWID ==  GetPlayerToken(SRC, i) or
                        BANLIST.IP == IP then
                            BANID  = BANLIST.BANID
                            REASON = BANLIST.REASON
                            BANNED  = true
                            setKickReason( "\n["..Emoji.Fire.."SubhamPRO Anticheat"..Emoji.Fire.."]\n".. FIREAC.Message.Ban .."\nReason: "..BANLIST.REASON.."\nBan ID: "..BANLIST.BANID.."")
                            CancelEvent()
                            break
                        end
                    end
                end
                if BANNED then
                    print("^"..COLORS.."SubhamPRO Anticheat^0: ^1Player ^3"..GetPlayerName(SRC).." ^3Try For Join But ^0| ^3Ban ID: ^3 "..BANID.."^0")
                    FIREAC_SENDLOG(SRC, FIREAC.Log.Connect, "TFJ", BANID, REASON)
                end
            end
        else
            FIREAC_RELOADFILE()
        end
    else
        FIREAC_RELOADFILE()
    end
    --【 𝗕𝗹𝗮𝗰𝗸 𝗟𝗶𝘀𝘁 𝗡𝗮𝗺𝗲 】--
    if FIREAC.Connection.AntiBlackListName == true then
        name = (string.gsub(string.gsub(string.gsub(name,  "-", ""), ",", ""), " ", ""):lower())
        for index, value in ipairs(Names) do
            local g, f = name:find(string.lower(value))
            if g or f  then
                print("^"..COLORS.."FIREAC^0: ^1Player ^3"..name.." ^3Try For Join ^0| ^3Black List Word in name: ^3 "..value.."^0")
                FIREAC_SENDLOG(SRC, FIREAC.Log.Connect, "BLN", "Black List Name", "We are Found "..value.." in the name off this player")
                setKickReason( "\n["..Emoji.Fire.."SubhamPRO AntiCheat"..Emoji.Fire.."]\nYou Can not Join Server:\n We Are Find ("..value..") in your Name Please Remove That Or Change Your Name ☺️")
                CancelEvent()
            end
        end
    end
    deferrals.defer()
    --【 𝗔𝗻𝘁𝗶 𝗩𝗣𝗡 】--
    if FIREAC.Connection.AntiVPN then
        PerformHttpRequest("http://ip-api.com/json/"..IP.."?fields=66846719", function(ERROR, DATA, RESULT)
            if DATA ~= nil then
                local TABLE = json.decode(DATA)
                if TABLE ~= nil then
                    ISP     = TABLE["isp"]
                    CITY    = TABLE["city"]
                    COUNTRY = TABLE["country"]
                    if TABLE["proxy"] == true then
                        PROXY   =  "ON"
                    else
                        PROXY   = "OFF"
                    end
                    if TABLE["hosting"] == true then
                        HOSTING   =  "ON"
                    else
                        HOSTING   = "OFF"
                    end
                    LON     = TABLE["lon"]
                    LAT     = TABLE["lat"]
                    if PROXY == "ON" or HOSTING == "ON" then
                       local card = {
                        type = "AdaptiveCard",
                        version = "1.2",
                        body = { {
                          type = "Image",
                          url = "https://cache.ip-api.com/"..LON..","..LAT..",10",
                          horizontalAlignment = "Center"
                        }, {
                            type = "TextBlock",
                            text = ""..Emoji.Fire.."  SubhamPRO AntiCheat  "..Emoji.Fire.."",
                            wrap = true,
                            horizontalAlignment = "Center",
                            separator = true,
                            height = "stretch",
                            fontType = "Default",
                            size = "Large",
                            weight = "Bolder",
                            color = "Light"
                        }, {
                            type = "TextBlock",
                            text = "Your VPN is on Plase Turn off that\nIP: "..IP.."\nVPN: "..PROXY.."\nHosting: "..HOSTING.."\nISP: "..ISP.."\nCountry: "..COUNTRY.."\nCity: "..CITY.."",
                            wrap = true,
                            horizontalAlignment = "Center",
                            separator = true,
                            height = "stretch",
                            fontType = "Default",
                            size = "Medium",
                            weight = "Bolder",
                            color = "Light"
                        },
                      }
                    }
                    print("^"..COLORS.."SubhamPRO Anticheat^0: ^1Player ^3"..GetPlayerName(SRC).." ^3Try For Join ^0| ^3VPN Availble ^3 ISP: "..ISP.."/ Country:"..COUNTRY.."/ City: "..CITY.."^0")
                    FIREAC_SENDLOG(SRC, FIREAC.Log.Connect, "VPN")
                    deferrals.presentCard(card, "XD")
                    Wait(15000)
                    deferrals.done("["..Emoji.Fire.."SubhamPRO Anticheat"..Emoji.Fire.."]\nPlease Turn off your vpn and rejoin !")
                else
                    FIREAC_SENDLOG(SRC, FIREAC.Log.Connect, "CONNECT")
                    deferrals.update("\n["..Emoji.Fire.."SubhamPRO Anticheat"..Emoji.Fire.."] Your Information\nName: "..name.."\nLicense : "..FIVEML.."\nSteam : "..STEAM.."\nDiscord ID: "..DISCORD.."\nLive ID: "..LIVE.."\nXbox ID: "..XBL.."\nIP: "..IP.."\nHWID : "..HWID.."")
                    Wait(2000)
                    deferrals.done()
                    end
                else
                    FIREAC_ERROR(SERVER_NAME, "playerConnecting (TABLE Not Found)")
                end
            else
                FIREAC_ERROR(SERVER_NAME, "playerConnecting (DATA Not Found)")
            end
        end)
    else
        FIREAC_SENDLOG(SRC, FIREAC.Log.Connect, "CONNECT")
        deferrals.update("\n["..Emoji.Fire.."SubhamPRO Anticheat"..Emoji.Fire.."] Your Information\nName: "..name.."\nLicense : "..FIVEML.."\nSteam : "..STEAM.."\nDiscord ID: "..DISCORD.."\nLive ID: "..LIVE.."\nXbox ID: "..XBL.."\nIP: "..IP.."\nHWID : "..HWID.."")
        Wait(2000)
        deferrals.done()
    end
end)

--【 𝗘𝗻𝘁𝗶𝘁𝘆 𝗠𝗮𝗻𝗮𝗴𝗲𝗺𝗲𝗻𝘁 】--
local SV_VEHICLES = {}
local SV_PEDS = {}
local SV_OBJECT = {}

AddEventHandler("entityCreated", function(ENTITY)
    if DoesEntityExist(ENTITY) then
        local TYPE  = GetEntityType(ENTITY)
        local OWNER = NetworkGetFirstEntityOwner(ENTITY)
        local NETID = NetworkGetNetworkIdFromEntity(ENTITY)
        local MODEL = GetEntityModel(ENTITY)
        local HWID  = GetPlayerToken(OWNER, 0)
        --【 𝗕𝗹𝗮𝗰𝗸 𝗟𝗶𝘀𝘁 𝗠𝗮𝗻𝗮𝗴𝗲 】--
        if FIREAC.AntiBlackListObject and TYPE == 3 then
            for index, value in ipairs(Objects) do
                if MODEL == GetHashKey(value) then
                    if DoesEntityExist(ENTITY) then
                        DeleteEntity(ENTITY)
                        Wait(1000)
                        FIREAC_ACTION(OWNER, FIREAC.EntityPunishment, "Anti Spawn Object", "Try For Spawn Object")
                    end
                end
            end
        end
        if FIREAC.AntiBlackListPed and TYPE == 1 then
            for index, value in ipairs(Peds) do
                if MODEL == GetHashKey(value) then
                    if DoesEntityExist(ENTITY) then
                        DeleteEntity(ENTITY)
                        Wait(1000)
                        -- FIREAC_ACTION(OWNER, FIREAC.EntityPunishment, "Anti Spawn Ped", "Try For Spawn Ped")
                    end
                end
            end
        end
        if FIREAC.AntiBlackListVehicle and TYPE == 2 then
            for index, value in ipairs(Vehicle) do
                if MODEL == GetHashKey(value) then
                    if DoesEntityExist(ENTITY) then
                        DeleteEntity(ENTITY)
                        Wait(1000)
                        FIREAC_ACTION(OWNER, FIREAC.EntityPunishment, "Anti Spawn Vehicle", "Try For Spawn Vehicle")
                    end
                end
            end
        end
        local ENT = NetworkGetEntityFromNetworkId(NETID)
       --【 𝗦𝗽𝗮𝗺 𝗠𝗮𝗻𝗮𝗴𝗲𝗺𝗲𝗻𝘁 】--
       local TYPE2 = GetEntityType(ENT)
        if TYPE == 2 and FIREAC.AntiSpamVehicle then
            if SV_VEHICLES[HWID] ~= nil then
                SV_VEHICLES[HWID].COUNT = SV_VEHICLES[HWID].COUNT + 1
                if os.time() - SV_VEHICLES[HWID].TIME >= 10 then
                    SV_VEHICLES[HWID] = nil
                else
                    if SV_VEHICLES[HWID].COUNT >= FIREAC.MaxVehicle then
                        for _, vehilce in ipairs(GetAllVehicles()) do
                            local ENO = NetworkGetFirstEntityOwner(vehilce)
                            if ENO == OWNER then
                                if DoesEntityExist(vehilce) then
                                   DeleteEntity(vehilce)
                                end
                            end
                        end
                        FIREAC_ACTION(OWNER, FIREAC.SpamPunishment, "Anti Spam Vehicle", "Try For Spam "..SV_VEHICLES[HWID].COUNT.."")
                    end
                end
            else
                SV_VEHICLES[HWID] = {
                    COUNT = 1,
                    TIME  = os.time()
                }
            end
        elseif TYPE == 1 and FIREAC.AntiSpamPed then
            if SV_PEDS[HWID] ~= nil then
                SV_PEDS[HWID].COUNT = SV_PEDS[HWID].COUNT + 1
                if os.time() - SV_PEDS[HWID].TIME >= 10 then
                    SV_PEDS[HWID] = nil
                else
                    for _, peds in ipairs(GetAllPeds()) do
                        local ENO = NetworkGetFirstEntityOwner(peds)
                        if ENO == OWNER then
                            if DoesEntityExist(peds) then
                                DeleteEntity(peds)
                            end
                        end
                    end
                    if SV_PEDS[HWID].COUNT >= FIREAC.MaxPed then
                        FIREAC_ACTION(OWNER, FIREAC.SpamPunishment, "Anti Spam Ped", "Try For Spam "..SV_PEDS[HWID].COUNT.."")  
                    end
                end
            else
                SV_PEDS[HWID] = {
                    COUNT = 1,
                    TIME  = os.time()
                }
            end
        -- elseif TYPE == 3 and FIREAC.AntiSpamObject then
        --     if SV_OBJECT[HWID] ~= nil then
        --         SV_OBJECT[HWID].COUNT = SV_OBJECT[HWID].COUNT + 1
        --         if os.time() - SV_OBJECT[HWID].TIME >= 10 then
        --             SV_OBJECT[HWID] = nil
        --         else
        --             if SV_OBJECT[HWID].COUNT >= FIREAC.MaxObject then
        --                 for _, objects in ipairs(GetAllObjects()) do
        --                     local ENO = NetworkGetFirstEntityOwner(objects)
        --                     if ENO == OWNER then
        --                         if DoesEntityExist(objects) then
        --                             DeleteEntity(objects)
        --                         end
        --                     end
        --                 end
        --                 FIREAC_ACTION(OWNER, FIREAC.SpamPunishment, "Anti Spam Object", "Try For Spam "..SV_OBJECT[HWID].COUNT.." Objects")
        --             end
        --         end
        --     else
        --         SV_OBJECT[HWID] = {
        --             COUNT = 1,
        --             TIME  = os.time()
        --         }
        --     end
        -- end
    end
end
end)

--【 𝗙𝘂𝗻𝗰𝘁𝗶𝗼𝗻 】--
function StartAntiCheat()
        local fire_config     =  LoadResourceFile(GetCurrentResourceName(), "configs/fire-config.lua")
        local fire_event      =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-event.lua")
        local fire_explosions =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-explosions.lua")
        local fire_name       =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-name.lua")
        local fire_object     =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-object.lua")
        local fire_peds       =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-peds.lua")
        local fire_plate      =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-plate.lua")
        local fire_vehicle    =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-vehicle.lua")
        local fire_weapon     =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-weapon.lua")
        local fire_words      =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-words.lua")
        local fire_task       =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-task.lua")
        local fire_anim       =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-anim.lua")
        local fire_emoji      =  LoadResourceFile(GetCurrentResourceName(), "tables/fire-emoji.lua")
        local fire_white      =  LoadResourceFile(GetCurrentResourceName(), "whitelists/fire-white.lua")
        if
        fire_config and
        fire_event and
        fire_explosions and
        fire_name and
        fire_object and
        fire_peds and
        fire_plate and
        fire_vehicle and
        fire_weapon and
        fire_words and
        fire_white and
        fire_task and
        fire_anim and
        fire_emoji
        then
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-config.lua     LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-event.lua      LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-explosions.lua LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-name.lua       LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-anim.lua       LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-task.lua       LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-emoji.lua      LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-object.lua     LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-peds.lua       LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-plate.lua      LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-vehicle.lua    LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-weapon.lua     LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-words.lua      LOADED !^0")
    print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^2 fire-white.lua      LOADED !^0")
    print("^"..COLORS.."")
    -- print([[
    --  .sSSSSs.    SSSSS .sSSSSs.    .sSSSSs.    .sSSSSs.    .sSSSSs.    
    --  SSSSSSSSSs. SSSSS SSSSSSSSSs. SSSSSSSSSs. SSSSSSSSSs. SSSSSSSSSs. 
    --  S SSS SSSS  S SSS S SSS SSSSS S SSS SSSS" S SSS SSSSS S SSS SSSSS 
    --  S  SS       S  SS S  SS SSSS" S  SS       S  SS SSSSS S  SS SSSS" 
    --  S..SSsss    S..SS S..SSsSSSa. S..SSsss    S..SSsSSSSS S..SS       
    --  S:::SSSS    S:::S S:::S SSSSS S:::SSSS    S:::S SSSSS S:::S SSSSS 
    --  S;;;S       S;;;S S;;;S SSSSS S;;;S       S;;;S SSSSS S;;;S SSSSS 
    --  S%%%S       S%%%S S%%%S SSSSS S%%%S SSSSS S%%%S SSSSS S%%%S SSSSS 
    --  SSSSS       SSSSS SSSSS SSSSS SSSSSsSS;:" SSSSS SSSSS SSSSSsSSSSS                                                            
    --                 ]])
        PerformHttpRequest("http://localhost:"..FIREAC.Port.."/info.json", function(ERROR, DATA, RESULT)
            if DATA ~= nil then
                local TABLE = json.decode(DATA)
                local ART1 = TABLE["server"]
                local ART2 = string.gsub(ART1, "FXServer", " ")
                local ART3 = string.gsub(ART2, "-master", " ")
                local ART4 = string.gsub(ART3, " SERVER", " ")	
                local ART5 = string.gsub(ART4, "v1.0.0.", " ")
                local ART6 = string.gsub(ART5, "win32", "")
                local ART7 = string.gsub(ART6, " ", "")
                print("^"..COLORS.."[SubhamPRO AntiCheat]^0: ^3Server Build : "..ART7.."")
              PerformHttpRequest(FIREAC.Log.Ban, function(ERROR, DATA, RESULT)
            end, "POST", json.encode({
                embeds = {
                    {
                        author = {
                            name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                            url = "https://discord.gg/8zGyDhtbcg",
                            icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                        },
                        footer = {
                            text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                            icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                        },
                        title = "FIREAC "..FIREAC.Version.."",
                        description = "**Current Version:** "..FIREAC.Version.."\n**License:** "..SERVER_NAME.."\n**Server Build:** "..ART7.."\nStarted successfully...",
                        color = math.random(0, 16776960)
                    }
                }
            }), {
                ["Content-Type"] = "application/json"
            })
            else
                FIREAC_ERROR(SERVER_NAME, "function StartAntiCheat (Server Port is wronge)")
            end
        end)
    else
        print("^"..COLORS.."[FIREAC]^0: ^1 Some File Of your FIREAC Not Found! Please Replice or Repair That^0")
        Wait(1000)
        print("^"..COLORS.."[FIREAC]^0: ^1 Some File Of your FIREAC Not Found! Please Replice or Repair That^0")
        Wait(1000)
        print("^"..COLORS.."[FIREAC]^0: ^1 Some File Of your FIREAC Not Found! Please Replice or Repair That^0")
        Wait(1000)
        print("^"..COLORS.."[FIREAC]^0: ^1 Some File Of your FIREAC Not Found! Please Replice or Repair That^0")
        Wait(1000)
        print("^"..COLORS.."[FIREAC]^0: ^1 Some File Of your FIREAC Not Found! Please Replice or Repair That^0")
        Wait(1000)
        print("^"..COLORS.."[FIREAC]^0: ^1 Some File Of your FIREAC Not Found! Please Replice or Repair That^0")
    end
end


function FIREAC_WHITELIST(SRC)
     if tonumber(SRC) ~= nil then
        local WHITE   = false
        local ids = ExtractIdentifiers(SRC)
        local playerIP = ids.ip
        local playerSteam = ids.steam
        local playerLicense = ids.license
        local playerXbl = ids.xbl
        local playerLive = ids.live
        local playerDisc = ids.discord
        for i = 1, #WhiteList do
            local id =  WhiteList[i]
            if id == playerLicense then
                WHITE = true
            elseif id == playerSteam then
                WHITE = true
            elseif id == playerXbl then
                WHITE = true
            elseif id == playerLive then
                WHITE = true
            elseif id == playerDisc then
                WHITE = true
            elseif id == playerIP then
                WHITE = true
            end
        end
        return WHITE
    else
        FIREAC_ERROR(SERVER_NAME, "function FIREAC_WHITELIST (SRC Not Found)")
    end
end

function FIREAC_ADMINMENU(SRC)
    if tonumber(SRC) ~= nil then
        local ISADMIN = false
        local STEAM   = "Not Found"
        local DISCORD = "Not Found"
        local FIVEML  = "Not Found"
        local LIVE    = "Not Found"
        local XBL     = "Not Found"
        local IP     = GetPlayerEndpoint(SRC)
        for _, DATA in ipairs(GetPlayerIdentifiers(SRC)) do
            if DATA:match("steam") then
                STEAM = DATA
            elseif DATA:match("discord") then
                DISCORD = DATA:gsub("discord:", "")
            elseif DATA:match("license") then
                FIVEML = DATA
            elseif DATA:match("live") then
                LIVE = DATA
            elseif DATA:match("xbl") then
                XBL = DATA
            end
        end
        for _, WID in ipairs(AdminMenu) do
            if STEAM == WID or DISCORD == WID or FIVEML == WID or LIVE == WID or XBL == WID or IP == WID then
                ISADMIN = true
            else
                ISADMIN = false
            end
        end
        return ISADMIN
    else
        FIREAC_ERROR(SERVER_NAME, "function FIREAC_WHITELIST (SRC Not Found)")
    end
end

function FIREAC_ERROR(SERVER_NAME, ERROR)
    if SERVER_NAME ~= nil then
        if ERROR ~= nil then
            PerformHttpRequest(FIREAC.Log.Error, function(ERROR, DATA, RESULT)
            end, "POST", json.encode({
                embeds = {
                    {
                        author = {
                            name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                            url = "https://discord.gg/8zGyDhtbcg",
                            icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                        },
                        footer = {
                            text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                            icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                        },
                        title = ""..Emoji.Warn.." Warning "..Emoji.Warn.."",
                        description = "**Error**: `"..ERROR.."`\n**License:** "..SERVER_NAME.."",
                        color = 1769216
                    }
                }
            }), {
                ["Content-Type"] = "application/json"
            })
            else
            FIREAC_ERROR(SERVER_NAME, "function FIREAC_ERROR (ERROR Not Found)")
        end
    else
        FIREAC_ERROR(SERVER_NAME, "function FIREAC_ERROR (SERVER_NAME Not Found)")
    end
end

function FIREAC_BAN(SRC, REASON)
    local BANFILE = LoadResourceFile(GetCurrentResourceName(), "banlist/fireac.json")
    if BANFILE ~= nil then
        local TABLE = json.decode(BANFILE)
        if TABLE and type(TABLE) == "table" then

            local STEAM   = "N/A"
            local DISCORD = "N/A"
            local FIVEML  = "N/A"
            local LIVE    = "N/A"
            local XBL     = "N/A"
            local IP = GetPlayerEndpoint(SRC)
            for _, DATA in ipairs(GetPlayerIdentifiers(SRC)) do
                if DATA:match("steam") then
                    STEAM = DATA
                elseif DATA:match("discord") then
                    DISCORD = DATA:gsub("discord:", "")
                elseif DATA:match("license") then
                    FIVEML = DATA
                elseif DATA:match("live") then
                    LIVE = DATA
                elseif DATA:match("xbl") then
                    XBL = DATA
                end
            end
            local BANLIST = {
                ["STEAM"]   = STEAM,
                ["DISCORD"] = DISCORD,  
                ["LICENSE"] = FIVEML,
                ["LIVE"]    = LIVE,
                ["XBL"]     = XBL,
                ["IP"]      = IP,
				["HWID"]    = GetPlayerToken(SRC, 0),
				["BANID"] = "#"..math.random(tonumber(1000), tonumber(9999)).."",
				["REASON"] = REASON
            }
            Wait(1000)
            if not FIREAC_INBANLIST(SRC) then
				table.insert(TABLE, BANLIST)
				SaveResourceFile(GetCurrentResourceName(), "banlist/fireac.json", json.encode(TABLE, {indent = true}), tonumber("-1"))
			end
        else
            FIREAC_RELOADFILE()
        end
    else
        FIREAC_RELOADFILE()
    end
end


function FIREAC_INBANLIST(SRC)
    local DEFULT = false
    local BANFILE = LoadResourceFile(GetCurrentResourceName(), "banlist/fireac.json")
    if BANFILE ~= nil then
        local TABLE = json.decode(BANFILE)
        if TABLE ~= nil and type(TABLE) == "table" then
            if tonumber(SRC) ~= nil then
                local STEAM   = "Not Found"
                local DISCORD = "Not Found"
                local FIVEML  = "Not Found"
                local LIVE    = "Not Found"
                local XBL     = "Not Found"
                local IP      = GetPlayerEndpoint(SRC)
                for _, DATA in ipairs(GetPlayerIdentifiers(SRC)) do
                    if DATA:match("steam") then
                        STEAM = DATA
                    elseif DATA:match("discord") then
                        DISCORD = DATA:gsub("discord:", "")
                    elseif DATA:match("license") then
                        FIVEML = DATA
                    elseif DATA:match("live") then
                        LIVE = DATA
                    elseif DATA:match("xbl") then
                        XBL = DATA
                    end
                end
                for i = 0, GetNumPlayerTokens(SRC) do
                    for _, BANLIST in ipairs(TABLE)	do
                        if
                        BANLIST.STEAM == STEAM or
                        BANLIST.DISCORD == DISCORD or
                        BANLIST.LICENSE == FIVEML or
                        BANLIST.LIVE == LIVE or
                        BANLIST.XBL == XBL or
                        BANLIST.HWID ==  GetPlayerToken(SRC, i) or
                        BANLIST.IP == IP then
                            DEFULT = true
                        end
                    end
                end
            end
        else
            FIREAC_RELOADFILE()
        end
    else
        FIREAC_RELOADFILE()
    end
    return DEFULT
end

function FIREAC_RELOADFILE()
	local BANFILE = LoadResourceFile(GetCurrentResourceName(), "banlist/fireac.json")
	if not BANFILE or BANFILE == "" then
		SaveResourceFile(GetCurrentResourceName(), "banlist/fireac.json", "[]", tonumber("-1"))
		print("^"..COLORS.."SubhamPRO AntiCheat^0: ^3Warning! ^0Your ^1fireac.json ^0is missing, Regenerating your ^1fireac.json ^0file!")
	else	
		local JSON_TABLE = json.decode(BANFILE)
		if JSON_TABLE == nil then
			print("\27[101;93m^"..COLORS.."SubhamPRO AntiCheat:\27[0m^1Error Was Detection in line 317 plase connect our support team in FIREAC Discord")
			FIREACError("Error Was Detection in line **317**")
			print("\27[101;93m YOUR TEXT HERE \27[0m")
		end
		if not JSON_TABLE then
			SaveResourceFile(GetCurrentResourceName(), "banlist/fireac.json", "[]", tonumber("-1"))
			JSON_TABLE = {}
			print("^"..COLORS.."SubhamPRO AntiCheat^0: ^3Warning! ^0Your ^1fireac.json ^0is corrupted, Regenerating your ^1fireac.json ^0file!")
		end
	end
end

function FIREAC_ACTION(SRC, ACTION, REASON, DETAILS)
    if REASON ~= nil and DETAILS ~= nil then
        if tonumber(SRC) ~= nil and tonumber(SRC) > 0 and GetPlayerName(SRC) ~= nil then
            if not FIREAC_WHITELIST(SRC) and not FIREAC_IS_SPAMLIST(SRC, ACTION, REASON, DETAILS) then
                if ACTION == "WARN" or ACTION == "KICK" or ACTION == "BAN" then
                    if FIREAC.ScreenShot.Enable == true then
                        if FIREAC.ScreenShot.Log ~= nil then
                            FIREAC_SCREENSHOT(SRC, REASON, DETAILS, ACTION)
                        else
                            FIREAC_ERROR(SERVER_NAME, "function FIREAC_ACTION (FIREAC.ScreenShot.Log is nil)")
                        end
                    end
                    if ACTION == "WARN" then
                        FIREAC_SENDLOG(SRC, FIREAC.Log.Ban, ACTION, REASON, DETAILS)
                        FIREAC_MEESAGE(SRC, ACTION, GetPlayerName(SRC), REASON)
                    elseif ACTION == "KICK" then
                        print("^"..COLORS.."FIREAC^0: ^1Player ^3"..GetPlayerName(SRC).." ^3Kicked From Server ^0| ^3Reason: ^3 "..REASON.."^0")
                        FIREAC_SENDLOG(SRC, FIREAC.Log.Ban, ACTION, REASON, DETAILS)
                        FIREAC_MEESAGE(SRC, ACTION, GetPlayerName(SRC), REASON)
                        DropPlayer(SRC, "\n["..Emoji.Fire.." SubhamPRO AntiCheat "..Emoji.Fire.."]\n"..FIREAC.Message.Kick.."\nReason: "..REASON.."")
                    elseif ACTION == "BAN" then
                        print("^"..COLORS.."FIREAC^0: ^1Player ^3"..GetPlayerName(SRC).." ^1Banned From Server ^0| ^1Reason: ^3 "..REASON.."^0")
                        FIREAC_SENDLOG(SRC, FIREAC.Log.Ban, ACTION, REASON, DETAILS)
                        FIREAC_MEESAGE(SRC, ACTION, GetPlayerName(SRC), REASON)
                        FIREAC_BAN(SRC, REASON)
                        DropPlayer(SRC, "\n["..Emoji.Fire.." SubhamPRO AntiCheat "..Emoji.Fire.."]\n".. FIREAC.Message.Ban .."\nReason: "..REASON.."")
                    end
                else
	    	    	print("^"..COLORS.."SubhamPRO AntiCheat^0: ^3Warning! ^0invalid type of punishment :^1"..ACTION.."^0!")
                end
            end
        end
    else
        FIREAC_ERROR(SERVER_NAME, "function FIREAC_ACTION (REASON and DETAILS Not Found)")
    end
end

function FIREAC_MEESAGE(SRC, TYPE, NAME, REASON)
    if TYPE ~= nil then
        if NAME ~= nil then
            if REASON ~= nil then
                if TYPE == "WARN" then
                    TriggerClientEvent('chat:addMessage', -1, {
                        template = '<div style="padding: 0.5vw; margiDATA: 0.5vw; background-image: url(https://s19.picofile.com/file/8433022734/Red.png); border-radius: 13px;"><i class="far fa-newspaper"></i> '..Emoji.Fire..' SubhamPRO AntiCheat '..Emoji.Fire..' :<br>  {1}</div>',
                        args = {"Console", ""..Emoji.Warn.." Warning | Player ^1".. NAME .."(".. SRC ..")^0 Cheating From Server : ^5".. REASON .. " " }
                    })
                    elseif TYPE == "KICK" then
                    TriggerClientEvent('chat:addMessage', -1, {
                        template = '<div style="padding: 0.5vw; margiDATA: 0.5vw; background-image: url(https://s18.picofile.com/file/8433022718/Yellow.png); border-radius: 13px;"><i class="far fa-newspaper"></i> '..Emoji.Fire..' SubhamPRO AntiCheat '..Emoji.Fire..' <br>  {1}</div>',
                        args = {"Console", ""..Emoji.Kick.." Kick | Player ^1".. NAME .."(".. SRC ..")^0 Cheating From Server : ^5".. REASON .. " " }
                    })
                    elseif TYPE == "BAN" then
                    TriggerClientEvent('chat:addMessage', -1, {
                        template = '<div style="padding: 0.5vw; margiDATA: 0.5vw; background-image: url(https://s18.picofile.com/file/8433022700/Black.png); border-radius: 13px;"><i class="far fa-newspaper"></i> '..Emoji.Fire..' SubhamPRO AntiCheat '..Emoji.Fire..' <br>  {1}</div>',
                        args = {"Console", ""..Emoji.Ban.." Banned | Player ^1".. NAME .."(".. SRC ..")^0 Cheating From Server : ^5".. REASON .. " " }
                    })
                end
            else
                FIREAC_ERROR(SERVER_NAME, "function FIREAC_MEESAGE (REASON Not Found)")
            end
            else
            FIREAC_ERROR(SERVER_NAME, "function FIREAC_MEESAGE (NAME Not Found)")
        end
    else
        FIREAC_ERROR(SERVER_NAME, "function FIREAC_MEESAGE (TYPE Not Found)")
    end
end

function FIREAC_SENDLOG(SRC, URL, TYPE, REASON, DETAILS)
    if URL ~= nil and GetPlayerName(SRC) ~= nil and tonumber(SRC) then
        local NAME    = GetPlayerName(SRC)
        local COORDS  = GetEntityCoords(GetPlayerPed(SRC))
        local STEAM   = "Not Found"
        local DISCORD = "Not Found"
        local FIVEML  = "Not Found"
        local LIVE    = "Not Found"
        local XBL     = "Not Found"
        local ISP     = "Not Found"
        local CITY    = "Not Found"
        local COUNTRY = "Not Found"
        local PROXY   = "Not Found"
        local HOSTING = "Not Found"
        local LON     = "Not Found"
        local LAT     = "Not Found"
        local IP      = GetPlayerEndpoint(SRC)
        IP = (string.gsub(string.gsub(string.gsub(IP,  "-", ""), ",", ""), " ", ""):lower())
        local g, f = IP:find(string.lower("192.168"))
        if g or f then
           IP = "178.131.122.181"
        end
        for _, DATA in ipairs(GetPlayerIdentifiers(SRC)) do
            if DATA:match("steam") then
                STEAM = DATA
            elseif DATA:match("discord") then
                DISCORD = DATA:gsub("discord:", "")
            elseif DATA:match("license") then
                FIVEML = DATA
            elseif DATA:match("live") then
                LIVE = DATA
            elseif DATA:match("xbl") then
                XBL = DATA
            end
        end
        if DISCORD ~= "Not Found" then
            DISCORD = "<@"..DISCORD..">"
        else
            DISCORD = "Not Found"
        end
        PerformHttpRequest("http://ip-api.com/json/"..IP.."?fields=66846719", function(ERROR, DATA, RESULT)
            if DATA ~= nil then
                local TABLE = json.decode(DATA)
                if TABLE ~= nil then
                    ISP     = TABLE["isp"]
                    CITY    = TABLE["city"]
                    COUNTRY = TABLE["country"]
                    if TABLE["proxy"] == true then
                        PROXY   =  "ON"
                    else
                        PROXY   = "OFF"
                    end
                    if TABLE["hosting"] == true then
                        HOSTING   =  "ON"
                    else
                        HOSTING   = "OFF"
                    end
                    LON     = TABLE["lon"]
                    LAT     = TABLE["lat"]
                    if TYPE == "CONNECT" then
                       PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.Connect.." Connecting "..Emoji.Connect.."",
                                    description = "**Player:** "..NAME.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 1769216
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    elseif TYPE == "DISCONNECT" then
                        PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.Disconnect.." Disconnect "..Emoji.Disconnect.."",
                                    description = "**Player:** "..NAME.."\n**Reason:**: "..REASON.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 16711680
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    elseif TYPE == "BAN" then
                        PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.Ban.." Banned "..Emoji.Ban.."",
                                    description = "**Player:** "..NAME.."\n**Reason:**: "..REASON.."\n**Details:** "..DETAILS.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 16711680
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    elseif TYPE == "KICK" then
                        PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.Kick.." Kicked "..Emoji.Kick.."",
                                    description = "**Player:** "..NAME.."\n**Reason:**: "..REASON.."\n**Details:** "..DETAILS.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 16760576
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    elseif TYPE == "WARN" then
                        PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.Warn.." Warning "..Emoji.Warn.."",
                                    description = "**Player:** "..NAME.."\n**Reason:**: "..REASON.."\n**Details:** "..DETAILS.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 1769216
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    elseif TYPE == "EXPLOSION" then
                        PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.Exoplosion.." Explosion "..Emoji.Exoplosion.."",
                                    description = "**Player:** "..NAME.."\n**Explosion Type:**: "..REASON.."\n**Coords:** "..COORDS.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 16711680
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    elseif TYPE == "TFJ" then
                        PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    image =  {
                                        url = "https://cache.ip-api.com/"..LON..","..LAT..",10",
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.TFJ.." Try For Join "..Emoji.TFJ.."",
                                    description = "**Player:** "..NAME.."\n**Ban ID:** "..REASON.."\n**Details:** "..DETAILS.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 15844367
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    elseif TYPE == "BLN" then
                        PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    image =  {
                                        url = "https://cache.ip-api.com/"..LON..","..LAT..",10",
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.BLN.." Black List Name Found ! "..Emoji.BLN.."",
                                    description = "**Player:** "..NAME.."\n**Reason:** "..REASON.."\n**Details:** "..DETAILS.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 16711680
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    elseif TYPE == "VPN" then
                        PerformHttpRequest(URL, function(ERROR, DATA, RESULT)
                        end, "POST", json.encode({
                            embeds = {
                                {
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        url = "https://discord.gg/8zGyDhtbcg",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    image =  {
                                        url = "https://cache.ip-api.com/"..LON..","..LAT..",10",
                                    },
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                    title = ""..Emoji.VPN.." VPN Blocked "..Emoji.VPN.."",
                                    description = "**Player:** "..NAME.."\n**Details:** Try For Join By VPN\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    color = 10181046
                                }
                            }
                        }), {
                            ["Content-Type"] = "application/json"
                        })
                    end
                else
                    FIREAC_ERROR(SERVER_NAME, " FIREAC_SENDLOG (in IP API DATA Not Found )")
                end
            end
        end)
    else
        print("^"..COLORS.."FIREAC^0: ^3Your Discord Webhok Not Set for send it!")
    end
end

function FIREAC_REFRESHCMD()
    local CMDS = GetRegisteredCommands()
    for index, CMD in ipairs(CMDS) do
        if SERVER_CMDS ~= nil then
            table.insert(SERVER_CMDS, CMD)
        else
            SERVER_CMDS = {}
            table.insert(SERVER_CMDS, CMD)
        end
    end
end

function FIREAC_ISPLAYERLOAD(source)
    local SRC    = tonumber(source)
    local PED    = GetPlayerPed(SRC)
    local STATUS = false
    if SRC ~= nil then
       if DoesEntityExist(PED) then
            if SPAWNED[SRC] ~= nil then
                STATUS = true
            else
                STATUS = false
            end
            else
                STATUS = false
            end
        else
        STATUS = false
    end
    return STATUS
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        for index in pairs (SPAMLIST) do
            SPAMLIST[index] = nil
        end
        Citizen.Wait(0)
    end
end)

function FIREAC_ADD_SPAMLIST(SRC, ACTION, REASON, DETAILS)
    if tonumber(SRC) then
        if ACTION and REASON and DETAILS then
            if ACTION ~= "BAN" or ACTION ~= "KICK" then
                table.insert(SPAMLIST, {
                    ID      = SRC,
                    REASON  = REASON,
                    DETAILS = DETAILS,
                })
            end
        end
    end
end

function FIREAC_IS_SPAMLIST(SRC, ACTION, REASON, DETAILS)
    local status = false
    if tonumber(SRC) then
        if SPAMLIST[SRC] ~= nil then
            for i = 1, #SPAMLIST do
               if SPAMLIST[i] ~= nil then
                if SPAMLIST[i].SRC == SRC then
                    if SPAMLIST[i].REASON == REASON and SPAMLIST[i].DETAILS == DETAILS then
                        status = true
                    else
                        status = false
                    end
                else
                    status = false
                end
                else
                status = false
               end
            end
        else
            status = false
        end
    end
    return status
end


function FIREAC_SCREENSHOT(SRC, REASON, DETAILS, ACTION)
    if tonumber(SRC) ~= nil then
        if REASON ~= nil and DETAILS ~= nil and ACTION ~= nil then
        local COLORS = {
            WARN = 1769216,
            KICK = 16760576,
            BAN  = 16711680,
        }
        local SSO = {
            encoding = FIREAC.ScreenShot.Format,
            quality  = FIREAC.ScreenShot.Quality
        }
        local NAME    = GetPlayerName(SRC)
        local COORDS  = GetEntityCoords(GetPlayerPed(SRC))
        local PING    = GetPlayerPing(SRC)
        local STEAM   = "Not Found"
        local DISCORD = "Not Found"
        local FIVEML  = "Not Found"
        local LIVE    = "Not Found"
        local XBL     = "Not Found"
        local ISP     = "Not Found"
        local CITY    = "Not Found"
        local COUNTRY = "Not Found"
        local PROXY   = "Not Found"
        local HOSTING = "Not Found"
        local IP      = GetPlayerEndpoint(SRC)
        IP = (string.gsub(string.gsub(string.gsub(IP,  "-", ""), ",", ""), " ", ""):lower())
        local g, f = IP:find(string.lower("192.168"))
        if g or f then
           IP = "178.131.122.181"
        end
        for _, DATA in ipairs(GetPlayerIdentifiers(SRC)) do
            if DATA:match("steam") then
                STEAM = DATA
            elseif DATA:match("discord") then
                DISCORD = DATA:gsub("discord:", "")
            elseif DATA:match("license") then
                FIVEML = DATA
            elseif DATA:match("live") then
                LIVE = DATA
            elseif DATA:match("xbl") then
                XBL = DATA
            end
        end
        if DISCORD ~= "Not Found" then
            DISCORD = "<@"..DISCORD..">"
        else
            DISCORD = "Not Found"
        end
        PerformHttpRequest("http://ip-api.com/json/"..IP.."?fields=66846719", function(ERROR, DATA, RESULT)
            if DATA ~= nil then
                local TABLE = json.decode(DATA)
                    if TABLE ~= nil then
                        ISP     = TABLE["isp"]
                        CITY    = TABLE["city"]
                        COUNTRY = TABLE["country"]
                        if TABLE["proxy"] == true then
                            PROXY   =  "ON"
                        else
                            PROXY   = "OFF"
                        end
                        if TABLE["hosting"] == true then
                            HOSTING   =  "ON"
                        else
                            HOSTING   = "OFF"
                        end
                        exports["discord-screenshot"]:requestCustomClientScreenshotUploadToDiscord(SRC, FIREAC.ScreenShot.Log, SSO, {
                            username = ""..Emoji.Fire.." FIREAC "..Emoji.Fire.."",
                            avatar_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                            embeds = {
                                {
                                    color = COLORS[ACTION],
                                    author = {
                                        name = ""..Emoji.Fire.."| SubhamPRO™ | "..Emoji.Fire.."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png"
                                    },
                                    title = "Screenshot ",
                                    description = "**Player:** "..NAME.."\n**ID:** "..SRC.."\n**Reason:** "..REASON.."\n**Steam Hex:** "..STEAM.."\n**Discord:** "..DISCORD.. "\n**License:** "..FIVEML.."\n**Live:** "..LIVE.."\n**Xbox:** "..XBL.."\n**ISP:** "..ISP.."\n**Country:** "..COUNTRY.."\n**City:** "..CITY.."\n**Ping:** ".. PING .."\n**IP:** "..IP.."\n**VPN:** "..PROXY.."\n**Hosting:** "..HOSTING.."",
                                    footer = {
                                        text = "SubhamPRO Anticheat "..Emoji.Fire.." | "..os.date("%Y/%m/%d | %X").."",
                                        icon_url = "https://cdn.discordapp.com/attachments/837386511920922694/838343457700839434/3928fa3aa4971eeb3d88482c62540344.png",
                                    },
                                }
                            }
                        })
                    end
                end
            end)
        end
    end
end

function ExtractIdentifiers(src)
    
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.sub(id, 1, string.len("discord:")) == "discord:" then
            discordid = string.sub(id, 9)
            identifiers.discord = "<@" .. discordid .. ">"
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end
