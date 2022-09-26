QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('erp-farming:client:ProcessMenu')
AddEventHandler('erp-farming:client:ProcessMenu', function()
    
	exports[Config.Menu]:openMenu({
        {
            header = "LA Farm's Processing",
            isMenuHeader = true
        },
		{
            header = "🍎〢Pack Apples",
            txt = "Requires 10x apples",
            params = {
                event = "erp-farming:process:StartPackagedApple",
            }
        },
        {
            header = "🍊〢Pack Oranges",
            txt = "Requires 10x oranges",
            params = {
                event = "erp-farming:process:StartPackagedOrange",
            }
        },
        {
            header = "🍓〢Pack Strawberries",
            txt = "Requires 10x strawberries",
            params = {
                event = "erp-farming:process:StartPackagedStrawberry",
            }
        },
        {
            header = "🍌〢Pack Bananas",
            txt = "Requires 10x bananas",
            params = {
                event = "erp-farming:process:StartPackagedBananas",
            }
        },
        {
            header = "🌽〢Pack Maize",
            txt = "Requires 10x maize's",
            params = {
                event = "erp-farming:process:StartPackagedMaize",
            }
        },
        {
            header = "🥔〢Pack Potato",
            txt = "Requires 10x potatoes",
            params = {
                event = "erp-farming:process:StartPackagedPotato",
            }
        },
        {
            header = "🍅〢Pack Tomato",
            txt = "Requires 10x tomatoes",
            params = {
                event = "erp-farming:process:StartPackagedTomato",
            }
        },
        {
            header = "🎃〢Make Pumpkin Pie Box",
            txt = "Requires 10x pumpkins",
            params = {
                event = "erp-farming:process:StartPumpkinPieBox",
            }
        },
        {
            header = "🥛〢Pack Milk",
            txt = "Requires 1x raw milk",
            params = {
                event = "erp-farming:process:StartPackagedMilk",
            }
        },
        {
            header = "☕〢Pack Coffee",
            txt = "Requires 10x coffee beans",
            params = {
                event = "erp-farming:process:StartPackagedCoffee",
            }
        },
        {
            header = "🍹〢Make Apple Juice",
            txt = "Requires 10x apples",
            params = {
                event = "erp-farming:process:StartAppleJuice",
            }
        },
        {
            header = "🍹〢Make Orange Juice",
            txt = "Requires 10x oranges",
            params = {
                event = "erp-farming:process:StartOrangeJuice",
            }
        },
        {
            header = "🍹〢Make Strawberry Juice",
            txt = "Requires 10x strawberries",
            params = {
                event = "erp-farming:process:StartStrawberryJuice",
            }
        },
        {
            header = Lang:t('menu.close_menu'),
            txt = "",
            params = {
                event = "closeMenu"
            }
        },
    })
end)



RegisterNetEvent('erp-farming:process:StartPackagedApple', function()
    
    local hasItem = QBCore.Functions.HasItem("apple")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Apples...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedApple")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPackagedOrange', function()
    
    local hasItem = QBCore.Functions.HasItem("orange")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Oranges...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedOrange")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPackagedStrawberry', function()
    
    local hasItem = QBCore.Functions.HasItem("strawberry")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Strawberries...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedStrawberry")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPackagedBananas', function()
    
    local hasItem = QBCore.Functions.HasItem("banana")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Bananas...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedBananas")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPackagedMaize', function()
    
    local hasItem = QBCore.Functions.HasItem("maize")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Maize...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedMaize")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPackagedPotato', function()
    
    local hasItem = QBCore.Functions.HasItem("potato_raw")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Potatoes...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedPotato")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPackagedTomato', function()
    
    local hasItem = QBCore.Functions.HasItem("tomato")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Tomatoes...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedTomato")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPumpkinPieBox', function()
    
    local hasItem = QBCore.Functions.HasItem("raw_pumpkin")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Making Pumpking Pie Box...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPumpkinPieBox")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPackagedMilk', function()
    
    local hasItem = QBCore.Functions.HasItem("milk_raw")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Milk...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedMilk")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartPackagedCoffee', function()
    
    local hasItem = QBCore.Functions.HasItem("coffee_beans")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Packaging Coffee...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetPackagedCoffee")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartAppleJuice', function()
    
    local hasItem = QBCore.Functions.HasItem("apple")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Making Apple Juice...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetAppleJuice")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartOrangeJuice', function()
    
    local hasItem = QBCore.Functions.HasItem("orange")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Making Orange Juice...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetOrangeJuice")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)

RegisterNetEvent('erp-farming:process:StartStrawberryJuice', function()
    
    local hasItem = QBCore.Functions.HasItem("strawberry")
 
    if hasItem then
        TriggerEvent('dpemote:custom:animation', {"mechanic"})
        QBCore.Functions.Progressbar("process",'Making Strawberry Juice...', Config["ProgressBarTime"]["Processing"], false, true, {
            disableMovement = false,
            disableCarMovement = false,
		    disableMouse = false,
		    disableCombat = true,
        }, {}, {}, {}, function()
            
            exports['ps-ui']:Circle(function(success)
                TriggerEvent('dpemote:custom:animation', {"c"})
                if success then
                    TriggerServerEvent("erp-farming:server:GetStrawberryJuice")
                else
                    QBCore.Functions.Notify("Failed!", "error")
                end
            end, Config.ps_ui.NumberOfCircles, Config.ps_ui.MS)
        end, function()
            TriggerEvent('dpemote:custom:animation', {"c"})    
        end)
    else
        QBCore.Functions.Notify("You dont have enough / required items", 'error')
    end
end)




