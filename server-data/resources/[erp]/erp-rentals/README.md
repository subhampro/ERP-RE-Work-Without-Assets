--// Installation

1) Paste the following in your QBCore > Shared > Items.Lua 

``` 
	['rentcertificate'] = {['name'] = 'rentcertificate', 			  	  	['label'] = 'Rental Certificate', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'certificate.png', 			['unique'] = true, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A Certificate that proves you own a rental vehicle'},
```

2) Paste the following in your Inventory (Or Similar) > HTML > JS > App.JS > Line 420 

``` 
} else if (itemData.name == "rentcertificate") {
                $(".item-info-title").html("<p>" + itemData.label + "</p>");
                $(".item-info-description").html(
                    "<p><strong>Rentees First Name: </strong><span>" +
                    itemData.info.firstname +
                    "</span></p><p><strong>Rentees Last Name: </strong><span>" +
                    itemData.info.lastname +
                    "</span></p><p><strong>Vehicle Model: </strong><span>" +
                    itemData.info.vehicle +
                    "</span></p><p><strong>Vehicle License Plate: </strong><span>" +
                    itemData.info.vehicleplate +
                    "</span></p>"
                );
```

