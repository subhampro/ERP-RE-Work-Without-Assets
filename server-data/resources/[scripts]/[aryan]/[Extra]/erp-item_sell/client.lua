local ped = nil

local function open(value)
    exports[Config.Menu]:openMenu(value)
end

RegisterNetEvent('erp-item_sell:client:OpenMenu', function()
    local Menu = {
        {
            isMenuHeader = true,
            header = "Farmer's Selling Point",
            txt = "Sell your farming product's here",
        },
    }
    for i = 1 , #Config.Menus do
        Menu[#Menu + 1] = {
            header = Config.Menus[i].label,
            txt    = Config.Menus[i].description,
            params = {
                event = 'erp-item_sell:ShowOptions',
                args = {
                    header  = Config.Menus[i].label,
                    description  = Config.Menus[i].description,
                    options = Config.Menus[i].SubMenus
                }
            }
        }
    end
    Menu[#Menu + 1] = {
        header = "✘ Close",
        params = {
            event = "closeMenu"
        }
    }
    open(Menu)
end)

RegisterNetEvent('erp-item_sell:ShowOptions', function(data)
    local Options = {
        {
            isMenuHeader = true,
            header = data.header,
            txt = data.description,
        },
    }
    Options[#Options + 1] = {
        header = '< GO BACK',
        params = {
            event = 'erp-item_sell:client:OpenMenu'
        }
    }
    for i = 1, #data.options do
        local priceRandom = math.random(data.options[i].price.min,data.options[i].price.max)
        Options[#Options + 1] = {
            header = data.options[i].label,
            txt    = "Sell for $ "..priceRandom.." each",
            params = {
                isServer = true,
                event = 'erp-item_sell:server:SellItems',
                args = {
                    name = data.options[i].name,
                    price  = priceRandom,
                    label  = data.options[i].label
                }
            }
        }
    end
    open(Options)
end)

CreateThread(function()
    RequestModel('a_m_y_genstreet_02') while not HasModelLoaded('a_m_y_genstreet_02') do Wait(0) end
    ped = CreatePed(0, 'a_m_y_genstreet_02', vector4(-581.19, -582.92, 33.68, 187.61), false, false)
    SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    
    exports[Config.Target]:AddBoxZone('SellingPoint', vector3(-581.19, -582.92, 33.68), 0.7, 0.7, {
        name = 'SellingPoint',
        heading = 187.61,
        minZ = 33.68 ,
        maxZ = 35.48,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "erp-item_sell:client:OpenMenu",
                icon = 'fas fa-seedling',
                label = 'Talk with employee',
            },
        },
        distance = 1.5,
    })
end)