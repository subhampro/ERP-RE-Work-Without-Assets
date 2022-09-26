local Translations = {
    error = {
        ["missing_something"] = "It looks like you are missing something...",
        ["not_enough_police"] = "You can't Steal Right Now..High Alert Ongoing Try Again Later.",
        ["door_open"] = "The door is already open..",
        ["process_cancelled"] = "Process Canceled..",
        ["didnt_work"] = "It did not work..",
        ["emty_box"] = "The Box Is Empty..",
    },
    success = {
        ["worked"] = "It worked!",
    }
}
Lang = Locale:new({
phrases = Translations,
warnOnMissing = true})