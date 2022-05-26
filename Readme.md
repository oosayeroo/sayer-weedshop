Updated 01/05/22 - Major update, added different strains, localised parts of the script, joints now give effect apart from basic street weed. 
IF UPDATING = better to do a fresh install so as not to cause overlaps and issues

Discord - https://discord.gg/3WYz3zaqG5

# A WeedShop Job for QBCore Framework

 -- First of all, i would like to thank DrB1ackBeard for his amazing burgershot script which helped me understand alot as im learning still and this took me a few days to finish.
-- Thank you to Bamboozled for the MLO Gret Work There
 -- Major rework of burgershot job to work as a player run weed shop using legion weed clinic MLO
 -- Will Work fine alongside qb-burgershot. 

## Please note

- Please make sure u use the latest dependencies aswell as core for this in order to work.

- This Job has been tested on the latest build as of 01/05/2022.


## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-shops - https://github.com/qbcore-framework/qb-shops (not a dependecy but i use that to get the wet weed, you could use any other method you like)

Legion Weed Clinic Interior MLO FREE - https://www.gta5-mods.com/maps/mlo-legion-weed-clinic -- designed to work with this MLO but guess you could move it wherever you want if you know how.

## Credits : 

- BerkieB for his qb-target.
- Andyauk for helping me make this as great as it is now. 


## If you had my old version you can delete this out of small resources as not needed anymore. 
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



## delete this out of small resources too if your updating from old version.
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
['streetweed'] 			    	 = {['name'] = 'streetweed', 			    	['label'] = 'Street Weed', 		    	['weight'] = 500, 		['type'] = 'item', 		["image"] = "weed_baggy.png",       	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "To make into Joints."},
	['weedbud'] 			    	 = {['name'] = 'weedbud', 			        	['label'] = 'Weed Bud', 		    	['weight'] = 500, 		['type'] = 'item', 		["image"] = "weedbud.png",           	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Grind into Useable Form."},
	['empty_weed_bag'] 				 = {['name'] = 'empty_weed_bag', 			    ['label'] = 'Empty Weed Bag', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weed_baggy_empty.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A small empty bag'},
	['wet_weed'] 		 	 	 	 = {['name'] = 'wet_weed',           			['label'] = 'Wet Weed',	 		    	['weight'] = 2000, 		['type'] = 'item', 		["image"] = "wet.png", 		        	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Wet weed that needs to be treated!"},
    ['rolling_paper'] 			 	 = {['name'] = 'rolling_paper', 			  	['label'] = 'Rolling Paper', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'rolling_paper.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Paper made specifically for encasing and smoking tobacco or cannabis.'},
	['weed-gift-set'] 		 	     = {['name'] = 'weed-gift-set', 		    	['label'] = 'Gift Set', 		    	['weight'] = 1500, 		['type'] = 'item', 		["image"] = "weed-gift-set.png", 	    ["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,   ["combinable"] = nil,   ["description"] = "An Amazing Gift Set For 420 Lovers. Now with a random surprise"},
	['gift-box'] 			     	 = {['name'] = 'gift-box', 			        	['label'] = 'Empty Gift Box', 		   	['weight'] = 1000, 		['type'] = 'item', 		["image"] = "gift-box.png",          	["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Empty Box to Add Items to."},
	['brownie-mix'] 		 	 	 = {['name'] = 'brownie-mix',           		['label'] = 'Brownie Mix',	 		   	['weight'] = 1000, 		['type'] = 'item', 		["image"] = "brownie-mix.png", 	    	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Make into Weed Brownies!"},
    ["weed-brownie"] 		 	 	 = {['name'] = "weed-brownie",           		['label'] = "Weed Brownie",	 		   	['weight'] = 1000, 		['type'] = 'item', 		["image"] = 'weed-brownie.png', 	   	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Weed Brownie!"},
    ['aluminumcan'] 				 = {['name'] = 'aluminumcan', 			  	  	['label'] = 'Aluminum Can', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'aluminumcan.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = "Aluminum Cans"},
	['drink-mix'] 		 	    	 = {['name'] = 'drink-mix',              		['label'] = 'Drink Mix',	 	     	['weight'] = 1000, 		['type'] = 'item', 		["image"] = "drink-mix.png", 	    	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Make into Energy Drinks!"},
    ["weed-drink"] 		 	    	 = {['name'] = "weed-drink",           	    	['label'] = "Stoned Energy Drink",	   	['weight'] = 1000, 		['type'] = 'item', 		["image"] = "weed-drink.png", 	    	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Energy Drink Infused with Lovely THC&CBD!"},
    ['dream-joint'] 				 = {['name'] = 'dream-joint', 			  	  	['label'] = "Dream Joint", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'dream-joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'joint made from dream weed'},
	['hazy-joint'] 					 = {['name'] = 'hazy-joint', 			  	  	['label'] = "Hazy Joint", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'hazy-joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'joint made from hazy weed'},
	['crush-joint'] 				 = {['name'] = 'crush-joint', 			  	  	['label'] = "Crush Joint", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'crush-joint.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'joint made from crush weed'},
	['bloomer-joint'] 				 = {['name'] = 'bloomer-joint', 		  		['label'] = "Bloomer Joint", 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bloomer-joint.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'joint made from bloomer weed'},
	['dream-bud'] 				     = {['name'] = 'dream-bud', 			  	  	['label'] = "Dream Bud", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'dream-bud.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Dream Weed Bud'},
	['hazy-bud'] 					 = {['name'] = 'hazy-bud', 			  	     	['label'] = "Hazy Bud", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'hazy-bud.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Hazy Weed Bud'},
	['crush-bud'] 				     = {['name'] = 'crush-bud', 			  	  	['label'] = "Crush Bud", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'crush-bud.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Crush Weed Bud'},
	['bloomer-bud'] 				 = {['name'] = 'bloomer-bud', 		  	    	['label'] = "Bloomer Bud", 			    ['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bloomer-bud.png', 	    	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Bloomer Weed Bud'},
	['dream-weed'] 				     = {['name'] = 'dream-weed', 			  	  	['label'] = "Dream Weed", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'dream-weed.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Ground Dream Weed'},
	['hazy-weed'] 					 = {['name'] = 'hazy-weed', 			  	  	['label'] = "Hazy Weed", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'hazy-weed.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Ground Hazy Weed'},
	['crush-weed'] 				     = {['name'] = 'crush-weed', 			  	  	['label'] = "Crush Weed", 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'crush-weed.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Ground Crush Weed'},
	['bloomer-weed'] 				 = {['name'] = 'bloomer-weed', 		  	    	['label'] = "Bloomer Weed", 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bloomer-weed.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'Ground Bloomer Weed'},
	
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
        ["scenario"] = "WORLD_HUMAN_AA_SMOKE",
        ["radius"] = 1.5,
        ["targetIcon"] = "fas fa-cannabis",
        ["targetLabel"] = "Open Wet Weed Shop",
        ["products"] = Config.Products["wetbud"],
        ["showblip"] = false,
        ["blipsprite"] = 617,
        ["blipcolor"] = 2
    },
}
```
## Insert into @qb-management - Client - cl config.lua
```
['weedshop'] = {
        vector3(374.04, -823.91, 29.3),
    },
```

## Insert into @qb-target - init.lua - config.targetmodels
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
