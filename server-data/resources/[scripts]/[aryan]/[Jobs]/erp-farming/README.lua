-- **qb-core/shared/items.lua**

---// Farming
['coffee_beans'] 				= {['name'] = 'coffee_beans', 			    ['label'] = 'Coffee Beans', 	        ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'coffee_beans.png',        ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''}, 
['coffee_packaged'] 			= {['name'] = 'coffee_packaged', 			['label'] = 'Packaged Coffee', 	        ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'coffee_packaged.png',     ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''}, 
['potato_raw'] 			        = {['name'] = 'potato_raw', 		        ['label'] = 'Raw Potato', 	            ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'potato_raw.png',          ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['potato_packaged'] 			= {['name'] = 'potato_packaged', 		    ['label'] = 'Packaged Potatoes', 		['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'potato_packaged.png',     ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['tomato'] 				        = {['name'] = 'tomato', 		            ['label'] = 'Tomato', 	                ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'tomato.png',              ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['tomato_packaged'] 		    = {['name'] = 'tomato_packaged', 		    ['label'] = 'Packaged Tomatoes', 		['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'tomato_packaged.png',     ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['apple'] 						= {['name'] = 'apple', 					    ['label'] = 'Apples', 				    ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'apple.png',               ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['apples_packaged'] 		    = {['name'] = 'apples_packaged', 		    ['label'] = 'Packaged Apples', 		    ['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'apples_packaged.png',     ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['milk_raw'] 				    = {['name'] = 'milk_raw', 					['label'] = 'Raw Milk', 				['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'milk_raw.png',            ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['milk_packaged'] 				= {['name'] = 'milk_packaged', 			    ['label'] = 'Packaged Milk', 		    ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'milk_packaged.png',       ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['orange'] 					    = {['name'] = 'orange', 				    ['label'] = 'Orange', 			        ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'orange.png',              ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['orange_packaged'] 			= {['name'] = 'orange_packaged', 		    ['label'] = 'Packaged Oranges', 	    ['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'orange_packaged.png',     ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['strawberry'] 					= {['name'] = 'strawberry', 				['label'] = 'Strawberry', 			    ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'strawberry.png',          ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['strawberry_packaged'] 	    = {['name'] = 'strawberry_packaged', 		['label'] = 'Packaged Strawberries', 	['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'strawberry_packaged.png', ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['banana'] 				        = {['name'] = 'banana', 		            ['label'] = 'Banana', 	                ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'banana.png',              ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['banana_packaged'] 		    = {['name'] = 'banana_packaged', 		    ['label'] = 'Packaged Banana', 		    ['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'banana_packaged.png',     ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['maize'] 				        = {['name'] = 'maize', 		                ['label'] = 'Maize', 	                ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'maize.png',               ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['maize_packaged'] 		        = {['name'] = 'maize_packaged', 		    ['label'] = 'Packaged Maize', 		    ['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'maize_packaged.png',      ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['raw_pumpkin'] 				= {['name'] = 'raw_pumpkin', 		        ['label'] = 'Raw Pumpkin', 	            ['weight'] = 1000,     ['type'] = 'item',      ['image'] = 'raw_pumpkin.png',         ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['pumpkinpiebox'] 		        = {['name'] = 'pumpkinpiebox', 		        ['label'] = 'Pumpkin Pie Box', 		    ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'pumpkinpiebox.png',       ['unique'] = false,    ['useable'] = false,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},

['juice_apple'] 				= {['name'] = 'juice_apple', 			    ['label'] = 'Apple Juice', 		        ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'juice_apple.png',         ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['juice_strawberry'] 			= {['name'] = 'juice_strawberry', 			['label'] = 'Strawberry Juice', 		['weight'] = 100,      ['type'] = 'item',      ['image'] = 'juice_strawberry.png',    ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['juice_orange'] 				= {['name'] = 'juice_orange', 			    ['label'] = 'Orange Juice', 		    ['weight'] = 100,      ['type'] = 'item',      ['image'] = 'juice_orange.png',        ['unique'] = false,    ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},

['smallbox'] 					= {['name'] = 'smallbox', 	                ['label'] = 'Small Box',                ['weight'] = 2000,     ['type'] = 'item',      ['image'] = 'smallbox.png',           ['unique'] = true,      ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = 'A box which can hold upto 15kg of weight'},
['medbox'] 						= {['name'] = 'medbox', 	                ['label'] = 'Medium Box',               ['weight'] = 3000,     ['type'] = 'item',      ['image'] = 'medbox.png',             ['unique'] = true,      ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = 'A box which can hold upto 30kg of weight'},
['bigbox'] 						= {['name'] = 'bigbox', 	                ['label'] = 'Big Box',                  ['weight'] = 6000,     ['type'] = 'item',      ['image'] = 'bigbox.png',             ['unique'] = true,      ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = 'A box which can hold upto 60kg of weight'},

['fruit_picker'] 				= {['name'] = 'fruit_picker', 			    ['label'] = 'Fruit Picker', 		     ['weight'] = 500,      ['type'] = 'item',     ['image'] = 'fruit_picker.png',       ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = 'A fruit picker to pick apples, oranges, bananas etc'},
['milk_container'] 				= {['name'] = 'milk_container', 			['label'] = 'Milk Container', 		     ['weight'] = 1000,     ['type'] = 'item',     ['image'] = 'milk_container.png',     ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},
['trowel'] 				        = {['name'] = 'trowel', 			        ['label'] = 'Trowel', 		             ['weight'] = 500,      ['type'] = 'item',     ['image'] = 'trowel.png',             ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,     ['description'] = ''},


	-- **qb-inventory/html/js/app.js**

	-- - Search this: } else if (itemData.name
	-- - After that item that is there you will put:
	
			} else if (itemData.name == "smallbox") {
				$(".item-info-title").html('<p>' + itemData.label + ' ' + itemData.info.smallboxid + '</p>')
				$(".item-info-description").html('<p><strong>Owner: </strong><span>' + itemData.info.smallboxOwner + '</span></p> Box which can hold upto 15kg of weight...');
			} else if (itemData.name == "medbox") {
				$(".item-info-title").html('<p>' + itemData.label + ' ' + itemData.info.medboxid + '</p>')
				$(".item-info-description").html('<p><strong>Owner: </strong><span>' + itemData.info.medboxOwner + '</span></p> Box which can hold upto 30kg of weight...');
			} else if (itemData.name == "bigbox") {
				$(".item-info-title").html('<p>' + itemData.label + ' ' + itemData.info.bigboxid + '</p>')
				$(".item-info-description").html('<p><strong>Owner: </strong><span>' + itemData.info.bigboxOwner + '</span></p> Box which can hold upto 60kg of weight...');
	
	-- **qb-inventory/server/main.lua**
	
	-- - Search this: elseif QBCore.Shared.SplitStr(fromInventory, "-")[1] == "itemshop" then
	-- - After finishing the code of the first IF you put this:
	
elseif itemData.name == 'smallbox' then
	if Player.Functions.RemoveMoney("cash", 4000, "smallbox") then
		local info = {
			smallboxid = math.random(111,999),
			smallboxOwner = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
		}
		Player.Functions.AddItem('smallbox', 1, nil, info, {["quality"] = 100})
	else
		TriggerClientEvent('QBCore:Notify', source, "You don't have sufficient cash balance!", "error")
	end
elseif itemData.name == 'medbox' then
	if Player.Functions.RemoveMoney("cash", 7000, "medbox") then
		local info = {
			medboxid = math.random(111,999),
			medboxOwner = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
		}
		Player.Functions.AddItem('medbox', 1, nil, info, {["quality"] = 100})
	else
		TriggerClientEvent('QBCore:Notify', source, "You don't have sufficient cash balance!", "error")
	end
elseif itemData.name == 'bigbox' then
	if Player.Functions.RemoveMoney("cash", 15000, "bigbox") then
		local info = {
			bigboxid = math.random(111,999),
			bigboxOwner = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
		}    
		Player.Functions.AddItem('bigbox', 1, nil, info, {["quality"] = 100})
	else
		TriggerClientEvent('QBCore:Notify', source, "You don't have sufficient cash balance!", "error")
	end