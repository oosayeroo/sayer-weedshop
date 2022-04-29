Updated 29/4/22 - Fixed error in ordering items when using both burgershot job and wedshop at same time


# A WeedShop Job for QBCore Framework

 -- First of all, i would like to thank DrB1ackBeard for his amazing burgershot script which helped me understand alot as im learning still and this took me a few days to finish.
-- Thank you to Bamboozled for the MLO Gret Work There
 -- Major rework of burgershot job to work as a player run weed shop using legion weed clinic MLO
 -- Will Work fine alongside qb-burgershot. 

## Please note

- Please make sure u use the latest dependencies aswell as core for this in order to work.

- This Job has been tested on the latest build as of 28/4/2022.


## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target (Only needed if not using draw text)

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-shops - https://github.com/qbcore-framework/qb-shops (not a dependecy but i use that to get the wet weed, you could use any other method you like)

Legion Weed Clinic Interior MLO FREE - https://www.gta5-mods.com/maps/mlo-legion-weed-clinic -- designed to work with this MLO but guess you could move it wherever you want if you know how.



## Credits : 

- BerkieB for his qb-target.


## Insert into @qb-smallresources --> server --> consumables.lua
```
--weedshop

QBCore.Functions.CreateUseableItem("weed-brownie", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Eat", src)
    end
end)

QBCore.Functions.CreateUseableItem("weed-drink", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Drink", src, item.name)
    end
end)

```



## Insert into @qb-smallresources --> config.lua
```
Consumeables = {
--drink
    ["weed-drink"] = math.random(35, 54),

--food
    ["weed-brownie"] = math.random(35, 54),
  

```

## Insert into @qb-core/shared/items.lua 

```
QBShared.Items = {
-- Weed Shop
["streetweed"] 			    	 = {["name"] = "streetweed", 			    	["label"] = "Street Weed", 		    	["weight"] = 500, 		["type"] = "item", 		["image"] = "weed_baggy.png",       	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "To make into Joints."},
	["weedbud"] 			    	 = {["name"] = "weedbud", 			        	["label"] = "Weed Bud", 		    	["weight"] = 500, 		["type"] = "item", 		["image"] = "weedbud.png",           	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Grind into Useable Form."},
	['empty_weed_bag'] 				 = {['name'] = 'empty_weed_bag', 			    ['label'] = 'Empty Weed Bag', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weed_baggy_empty.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A small empty bag'},
	["wet_weed"] 		 	 	 	 = {["name"] = "wet_weed",           			["label"] = "Wet Weed",	 		    	["weight"] = 3000, 		["type"] = "item", 		["image"] = "wet.png", 		        	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Wet weed that needs to be treated!"},
    ['rolling-paper'] 			 	 = {['name'] = 'rolling-paper', 			  	['label'] = 'Rolling Paper', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'rolling-paper.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Paper made specifically for encasing and smoking tobacco or cannabis.'},
	["weed-gift-set"] 		 	     = {["name"] = "weed-gift-set", 		    	["label"] = "Gift Set", 		    	["weight"] = 1500, 		["type"] = "item", 		["image"] = "weed-gift-set.png", 	    ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An Amazing Gift Set For 420 Lovers. Now with a random surprise"},
	["gift-box"] 			     	 = {["name"] = "gift-box", 			        	["label"] = "Empty Gift Box", 		   	["weight"] = 1000, 		["type"] = "item", 		["image"] = "gift-box.png",          	["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Empty Box to Add Items to."},
	["brownie-mix"] 		 	 	 = {["name"] = "brownie-mix",           		["label"] = "Brownie Mix",	 		   	["weight"] = 1000, 		["type"] = "item", 		["image"] = "brownie-mix.png", 	    	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Make into Weed Brownies!"},
    ["weed-brownie"] 		 	 	 = {["name"] = "weed-brownie",           		["label"] = "Weed Brownie",	 		   	["weight"] = 1000, 		["type"] = "item", 		["image"] = "weed-brownie.png", 	   	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Weed Brownie!"},
    ['aluminumcan'] 				 = {['name'] = 'aluminumcan', 			  	  	['label'] = 'Aluminum Can', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'aluminumcan.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,	['combinable'] = nil,   ['description'] = 'Aluminum Cans'},
	["drink-mix"] 		 	    	 = {["name"] = "drink-mix",              		["label"] = "Energy Drink Mix",	 	   	["weight"] = 1000, 		["type"] = "item", 		["image"] = "drink-mix.png", 	    	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Make into Energy Drinks!"},
    ["weed-drink"] 		 	    	 = {["name"] = "weed-drink",           	    	["label"] = "Stoned Energy Drink",	   	["weight"] = 1000, 		["type"] = "item", 		["image"] = "weed-drink.png", 	    	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Energy Drink Infused with Lovely THC&CBD!"},
    
}

```

## Insert Contents of @weedshop/Images into @qb-inventory/HTML/Images


## Insert into @qb-core/shared/jobs.lua 
```
QBShared.Jobs = {
    ["weedshop"] = {
		label = "WeedShop Employee",
		defaultDuty = true,
		grades = {
            ['0'] = {
                name = "Trainee",
                payment = 50
            },
			['1'] = {
                name = "Employee",
                payment = 75
            },
			['2'] = {
                name = "Owner",
                isboss = true,
                payment = 100
            },
        },
	},
}		
```

## Insert into @qb-shops - config.lua
```
Config.Products = {
    ["wetbud"] = {
        [1] = {
            name = 'wet_weed',
            price = 5,
            amount = 100,
            info = {},
            type = 'item',
            slot = 1,
        }
    },
}

Config.Locations = {
["wetbud"] = {
        ["label"] = "Wet Weed Dealer",
        ["coords"] = vector4(3688.22, 4562.83, 25.18, 274.53),
        ["ped"] = 'g_m_m_chigoon_01',
        ["radius"] = 1.5,
        ["products"] = Config.Products["wetbud"],
        ["showblip"] = false,
        ["blipsprite"] = 617
    },
}
```
## Insert into @qb-bossmenu - config.lua
```
['weedshop'] = {
        vector3(374.04, -823.91, 29.3),
    },
```

## Insert into @qb-target - config.lua - config.targetmodels
``` 
["weedshopgarage"] = {
		models = {
			"g_m_importexport_01"
		},
		options = {
			{
				type = "client",
				event = "garage:WeedShopGarage",
				icon = "fas fa-cannabis",
				label = "WeedShop Garage",
				job = "weedshop",
			}
		},
		distance = 2.5,
	},

```
