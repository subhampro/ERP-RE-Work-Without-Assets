local Translations = {
    error = {
        dont_work            = 'You dont work on farming',
        dont_have_items      = "You don't have the necessary items",
        dont_have_picker     = "You don't have any fruit picker with you",
        dont_have_trowel     = "You don't have any trowel with you",
        dont_have_container  = "You don't have any milk container with you",
        veh_spawn_block      = "There is a vehicle blocking the spawn",
        nothing_to_sell      = "You dont have anything to sell",
        missing_something    = "Something is missing...",
        wrong_items          = "Wrong items",
        failed               = "You failed!",
        not_enough_items     = "You don't have enough items"

    
    },
   
    success = {
        all_done        = "All Done!",
    },
    
    menu = {
        main_header   = 'Los Santos Farming Assc.',
        farm_store    = "Open Store",
        upgrade_kit   = 'Upgrade Farming Kit',
        rent_veh      = "Rent a Tractor",
        return_veh    = "Return Tractor",
        sell_item     = "Sell items",
        close_menu    = "✘ Close",
    },
    
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
