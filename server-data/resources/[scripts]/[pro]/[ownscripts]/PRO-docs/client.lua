local QBCore = exports['qb-core']:GetCoreObject()

local PlayerData                = {}
local USER_DOCUMENTS = {}
local CURRENT_DOCUMENT = nil
local DOCUMENT_FORMS = nil


Citizen.CreateThread(function()
	while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
	end
    PlayerData = QBCore.Functions.GetPlayerData()
    DOCUMENT_FORMS = Config.Documents['en']
    GetAllUserForms()
    SetNuiFocus(false, false)
end)


AddEventHandler('qb-core:documents:open', function()
    TriggerEvent('PRO-context:sendMenu', {
        {
            id = 1,
            header = _U('public_documents'),
            txt = '',
            params = {
                event = "documents:menu",
                args = {
                    menu = 'normal'
                }
            }
        },
        {
            id = 2,
            header = _U('job_documents'),
            txt = '',
            params = {
                event = "documents:menu",
                args = {
                    menu = 'job'
                }
            }
        },
        {
            id = 3,
            header = _U('saved_documents'),
            txt = '',
            params = {
                event = "documents:menu",
                args = {
                    menu = 'view'
                }
            }
        },
    })
end)


RegisterNetEvent('documents:menu')
AddEventHandler('documents:menu', function( data )
    if data.menu == 'normal' then
        for i=1, #DOCUMENT_FORMS["public"], 1 do
            
            TriggerEvent('PRO-context:sendMenu', {
                {
                    id = i,
                    header = DOCUMENT_FORMS["public"][i].headerTitle,
                    txt = '',
                    params = {
                        event = "documents:menu2",
                        args = {
                            test = DOCUMENT_FORMS["public"][i]
                        }
                    }
                },
            })
        end
    elseif data.menu == 'job' then
        PlayerData = QBCore.Functions.GetPlayerData()
        if DOCUMENT_FORMS[PlayerData.job.name] ~= nil then
            for i=1, #DOCUMENT_FORMS[PlayerData.job.name], 1 do
                
                TriggerEvent('PRO-context:sendMenu', {
                    {
                        id = i,
                        header = DOCUMENT_FORMS[PlayerData.job.name][i].headerTitle,
                        txt = '',
                        params = {
                            event = "documents:menu2",
                            args = {
                                test = DOCUMENT_FORMS[PlayerData.job.name][i]
                            }
                        }
                    },
                })
            end
        end
    elseif data.menu == 'view' then
        for i=#USER_DOCUMENTS, 1, -1 do
            local date_created = ""
            if USER_DOCUMENTS[i].data.headerDateCreated ~= nil then
                date_created = USER_DOCUMENTS[i].data.headerDateCreated
            end
            TriggerEvent('PRO-context:sendMenu', {
                {
                    id = i,
                    header = USER_DOCUMENTS[i].data.headerTitle,
                    txt = date_created,
                    params = {
                        event = "documents:view",
                        args = {
                            test = USER_DOCUMENTS[i]
                        }
                    }
                },
            })
        end
    end
end)

RegisterNetEvent('documents:menu2')
AddEventHandler('documents:menu2', function( test )
    local aDocument = test.test
    PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.TriggerCallback('documents:getPlayerDetails', function (cb_player_details)
        if cb_player_details ~= nil then
            SetNuiFocus(true, true)
            aDocument.headerFirstName = cb_player_details.firstname
            aDocument.headerLastName = cb_player_details.lastname
            aDocument.headerDateOfBirth = cb_player_details.dateofbirth
            aDocument.headerJobLabel = PlayerData.job.label
            aDocument.headerJobGrade = PlayerData.job.gradename
            aDocument.locale = 'en'
            SendNUIMessage({
                type = "createNewForm",
                data = aDocument
            })
        else
            print ("Received nil from newely created scale object.")
        end
    end, data)
end)


RegisterNetEvent('documents:view')
AddEventHandler('documents:view', function(data)
    TriggerEvent('PRO-context:sendMenu', {
        {
            id = 1,
            header = _U('view_bt'),
            txt = '',
            params = {
                event = "documents:shownear",
                args = {
                    menu = data.test,
                    me = 'view'
                }
            }
        },
        {
            id = 2,
            header = _U('show_bt'),
            txt = '',
            params = {
                event = "documents:shownear",
                args = {
                    menu = data.test,
                    me = 'show'
                }
            }
        },
        {
            id = 3,
            header = _U('give_copy'),
            txt = '',
            params = {
                event = "documents:shownear",
                args = {
                    menu = data.test,
                    me = 'give'
                }
            }
        },
        {
            id = 4,
            header = _U('delete_bt'),
            txt = '',
            params = {
                event = "documents:shownear",
                args = {
                    menu = data.test,
                    me = 'delete'
                }
            }
        },
    })
end)


RegisterNetEvent('documents:shownear')
AddEventHandler('documents:shownear', function( data )
    if data.me == 'show' or data.me == 'give' then
        local players_clean = GetNeareastPlayers()
        CURRENT_DOCUMENT = data.menu.data
        if #players_clean > 0 then
            for i=1, #players_clean, 1 do 
                if data.me == 'show' then
                    TriggerEvent('PRO-context:sendMenu', {
                        {
                            id = 1,
                            header = players_clean[i].playerName .. "[" .. tostring(players_clean[i].playerId) .. "]",
                            txt = '',
                            params = {
                                event = "documents:showgive",
                                args = {
                                    menu = players_clean[i].playerId,
                                    me = 'show'
                                }
                            }
                        },
                    })
                elseif data.me == 'give' then
                    TriggerEvent('PRO-context:sendMenu', {
                        {
                            id = 1,
                            header = players_clean[i].playerName .. "[" .. tostring(players_clean[i].playerId) .. "]",
                            txt = '',
                            params = {
                                event = "documents:showgive",
                                args = {
                                    menu = players_clean[i].playerId,
                                    me = 'give'
                                }
                            }
                        },
                    })
                end
            end    
        end
    elseif data.me == 'view' then
        ViewDocument(data.menu.data)
    elseif data.me == 'delete' then
        TriggerEvent('PRO-context:sendMenu', {
            {
                id = 1,
                header = _U('yes_delete'),
                txt = '',
                params = {
                    event = "documents:showgive",
                    args = {
                        menu = data.menu,
                        me = 'delete'
                    }
                }
            },
        })
    end
end)

RegisterNetEvent('documents:showgive')
AddEventHandler('documents:showgive', function( data )
    if data.me == 'show' then
        TriggerServerEvent('documents:ShowToPlayer', data.menu, CURRENT_DOCUMENT)
        CURRENT_DOCUMENT = nil
    elseif data.me == 'give' then
        TriggerServerEvent('documents:CopyToPlayer', data.menu, CURRENT_DOCUMENT)
        CURRENT_DOCUMENT = nil
    elseif data.me == 'delete' then
        local key_to_remove = nil

        QBCore.Functions.TriggerCallback('documents:deleteDocument', function (cb)
            if cb == true then
                for i=1, #USER_DOCUMENTS, 1 do
                    if USER_DOCUMENTS[i].id == data.menu.id then
                        key_to_remove = i
                    end
                end
    
                if key_to_remove ~= nil then
                    table.remove(USER_DOCUMENTS, key_to_remove)
                end
            end
        end, data.menu.id)
    end
end)










RegisterNetEvent('documents:viewDocument')
AddEventHandler('documents:viewDocument', function( data )
    ViewDocument(data)
end)

function ViewDocument(aDocument)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "ShowDocument",
        data = aDocument
    })
end

RegisterNetEvent('documents:copyForm')
AddEventHandler('documents:copyForm', function( data )
    table.insert(USER_DOCUMENTS, data)
end)


function GetAllUserForms()
    QBCore.Functions.TriggerCallback('documents:getPlayerDocuments', function (cb_forms)
        if cb_forms ~= nil then
            USER_DOCUMENTS = cb_forms
        else
            print ("Received nil from newely created scale object.")
        end
    end, data)
end


RegisterNUICallback('form_close', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('form_submit', function(data, cb)
    QBCore.Functions.TriggerCallback('documents:submitDocument', function (cb_form)
        if cb_form ~= nil then
            table.insert(USER_DOCUMENTS, cb_form)
            OpenFormPropertiesMenu(cb_form)
        else
            print ("Received nil from newely created scale object.")
        end
    end, data)
    SetNuiFocus(false, false)
end)


function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players, nearbyPlayer = QBCore.Functions.GetPlayersFromCoords()

    local players_clean = {}
    local found_players = false

    for i=1, #players, 1 do
        if players[i] ~= PlayerId() then
            found_players = true
            table.insert(players_clean, {playerName = GetPlayerName(players[i]), playerId = GetPlayerServerId(players[i])} )
        end
    end
    return players_clean
end

