Updated 9/15/2022 - updated read me

Recommend doing a fresh install and have the latest versions of qb-core, inventory etc to avoid any bugs

Discord - https://discord.gg/3WYz3zaqG5

# A WeedShop Job for QBCore Framework

 -- First of all, i would like to thank DrB1ackBeard for his amazing burgershot script which helped me understand alot as im learning still and this took me a few days to finish.
 -- Thank you to Bamboozled for the MLO Gret Work There
 -- Major rework of burgershot job to work as a player run weed shop using legion weed clinic MLO
 -- Will Work fine alongside qb-burgershot. 

## Please note

- Please make sure u use the latest dependencies aswell as core for this in order to work.

- This Job has been tested on the latest build as of 13/9/2022.


## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu

qb-shops - https://github.com/qbcore-framework/qb-shops -- no longer a dependency for collecting wet weed
Legion Weed Clinic Interior MLO FREE - https://www.gta5-mods.com/maps/mlo-legion-weed-clinic -- designed to work with this MLO, it can be moved around to any MLO if needed.

## Credits : 

- BerkieB for his qb-target.
- Andyauk for helping me make this as great as it is now. 
- Mexicans for his idea about collecting wet weed

## Insert into @qb-core/shared/items.lua 

```
QBShared.Items = {
-- Weed Shop
['streetweed'] 			    	 = {['name'] = 'streetweed', 			    	['label'] = 'Street Weed', 		    	['weight'] = 500, 		['type'] = 'item', 		["image"] = "weed_baggy.png",       	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "To make into Joints."},
	['weedbud'] 			    	 = {['name'] = 'weedbud', 			        	['label'] = 'Weed Bud', 		    	['weight'] = 500, 		['type'] = 'item', 		["image"] = "weedbud.png",           	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Grind into Useable Form."},
	['empty_weed_bag'] 				 = {['name'] = 'empty_weed_bag', 			    ['label'] = 'Empty Weed Bag', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weed_baggy_empty.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A small empty bag'},
	['wet_weed'] 		 	 	 	 = {['name'] = 'wet_weed',           			['label'] = 'Wet Weed',	 		    	['weight'] = 200, 		['type'] = 'item', 		["image"] = "wet.png", 		        	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Wet weed that needs to be treated!"},
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
	['chill-pill'] 			    	 = {['name'] = 'chill-pill', 		  	    	['label'] = "Chill Pill", 			['weight'] = 200, 	    	['type'] = 'item', 		['image'] = 'chill-pill.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'THC pills to help you relax'},
	['customer-receipt'] 		 	 = {['name'] = 'customer-receipt', 		  	 	['label'] = "Customer Receipt", 	   	['weight'] = 200, 	   	['type'] = 'item',   	['image'] = 'customer-receipt.png',    	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A receipt from selling something'},
        ['weed-grinder'] 			    	 = {['name'] = 'weed-grinder', 			        	['label'] = 'Grinder', 		    	['weight'] = 500, 		['type'] = 'item', 		["image"] = "weed-grinder.png",           	["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Grind weed up."},
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
			['3'] = {
                name = "Manager",
                payment = 100
            },
			['4'] = {
                name = "Owner",
                isboss = true,
                payment = 100
            },
        },
	},
}
```

## Insert into @qb-management - Client - cl config.lua
```
['weedshop'] = {
        vector3(374.04, -823.91, 29.3),
    },
```

## delete spawn weed ped from qb-target as now does within script
