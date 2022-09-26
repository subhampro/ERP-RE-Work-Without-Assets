local QBCore = exports['qb-core']:GetCoreObject()

local isMelting = false
local canTake = false
local meltTime
local meltedItem = {}

---// Pawnshop Target

exports['qb-target']:AddBoxZone("Pawnshop", vector3(173.15, -1322.13, 29.36), 0.45, 0.45, {
	name = "Pawnshop",
	heading = 335,
	debugPoly = false,
    minZ = 25.76,
    maxZ = 29.76,
}, {
	options = {
		{
            type = "client",
            event = "erp-pawnshop:client:openMenu",
            icon = "fa-solid fa-ring",
            label = "Pawnshop"
        },
	},
	distance = 2.5
})




------------------------------------------------------------------------- P A W N   S H O P -------------------------------------------------------------------------

RegisterNetEvent('erp-pawnshop:client:openMenu', function()
    
        
    local pawnShop = {
        {
            header = Lang:t('info.title'), --- PAWN SHOP
            isMenuHeader = true,
        },
        {
            header = Lang:t('info.sell'),  ---SELL ITEMS
            txt = Lang:t('info.sell_pawn'),
            params = {
                event = "erp-pawnshop:client:openPawn",
                args = {
                items = Config.PawnItems
                }
            }
        }
    }
    exports['qb-menu']:openMenu(pawnShop)
    
end)



RegisterNetEvent('erp-pawnshop:client:openPawn', function(data)   ---- PAWN SHOP ITEMS SHOW UP
    QBCore.Functions.TriggerCallback('erp-pawnshop:server:getInv', function(inventory)
        local PlyInv = inventory
        local pawnMenu = {
            {
                header = Lang:t('info.title'),
                isMenuHeader = true,
            }
        }

        for _, v in pairs(PlyInv) do
            for i = 1, #data.items do
                if v.name == data.items[i].item then
                    pawnMenu[#pawnMenu +1] = {
                        header = QBCore.Shared.Items[v.name].label,
                        txt = Lang:t('info.sell_items', {value = data.items[i].price}),
                        params = {
                            event = "erp-pawnshop:client:pawnitems",
                            args = {
                                label = QBCore.Shared.Items[v.name].label,
                                price = data.items[i].price,
                                name = v.name,
                                amount = v.amount
                            }
                        }
                    }
                end
            end
        end

        pawnMenu[#pawnMenu+1] = {
            header = Lang:t('info.back'),
            params = {
                event = "erp-pawnshop:client:openMenu"
            }
        }
        exports['qb-menu']:openMenu(pawnMenu)
    end)
end)

RegisterNetEvent("erp-pawnshop:client:pawnitems", function(item)
    local sellingItem = exports['qb-input']:ShowInput({
        header = Lang:t('info.title'),
        submitText = Lang:t('info.sell'),
        inputs = {
            {
                type = 'number',
                isRequired = false,
                name = 'amount',
                text = Lang:t('info.max', {value = item.amount})
            }
        }
    })

    if sellingItem then
        if not sellingItem.amount then
            return
        end

        if tonumber(sellingItem.amount) > 0 then
            TriggerServerEvent('erp-pawnshop:server:sellPawnItems', item.name, sellingItem.amount, item.price)
        else
            exports['Roda_Notifications']:showNotify(Lang:t('error.negative'), 'error', 6000)
        end
    end
end)




