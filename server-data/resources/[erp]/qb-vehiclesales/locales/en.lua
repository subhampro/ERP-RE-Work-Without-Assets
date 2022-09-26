local Translations = {
    error = {
        not_your_vehicle = 'This is not your vehicle!',
        vehicle_does_not_exist = "Vehicle does't exist!",
        not_enough_money = 'You dont have enough money!',
        no_space_on_lot = 'Rv Sales lot is full!'
    },
    success = {
        sold_car_for_price = 'You have sold your car for $%{value}',
        car_up_for_sale = 'Your vehicle has been put on sale for - $%{value}',
        vehicle_bought = 'Vehicle Bought'
    },
    info = {
        confirm_cancel = '~g~Y~w~ - Confirm / ~r~N~w~ - Cancel ~g~',
        vehicle_returned = 'Vehicle Returned',
        used_vehicle_lot = 'Used Car Lot',
        sell_vehicle_to_dealer = '[~g~E~w~] - Sell Vehicle To Dealer For ~g~$%{value}',
        view_contract = '[~g~E~w~] - View Vehicle Contract',
        cancel_sale = '[~r~G~w~] - Cancel Vehicle Sale',
        model_price = '%{value}, Price: ~g~$%{value2}',
        are_you_sure = 'Are you sure you no longer want to sell your vehicle?',
        yes_no = '[~g~7~w~] - Yes | [~r~8~w~] - No',
        place_vehicle_for_sale = '[~g~E~w~] - Place Vehicle For Sale By Owner'
    },
    charinfo = {
        firstname = 'not',
        lastname = 'known',
        account = 'Account not known..',
        phone = 'telephone number not known..'
    },
    mail = {
        sender = 'RV Sales',
        subject = 'You have sold a vehicle!',
        message = 'You made $%{value} from the sale of your %{value2}.'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
