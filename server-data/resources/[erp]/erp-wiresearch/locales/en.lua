local Translations = {
    info = {
        rob = 'Rob wires',
    },
    error = {
        cooldown = 'You have to wait %{time} seconds to rob wires again',
        hasBeenRobbed = "This pole already has be robbed",
        nothingFound = "You didn't managed to rob the wires!",
    },
    progressbar = {
        robbing = "Robbing wires from the electric box",
    }
   
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})