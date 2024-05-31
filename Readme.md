Updated 15/5/23 - Version 5.1.0 Adds = 
- fix issue in delivery code (job)
- add ability for anybody to craft joints 
- added Config option for new rolling 


Discord - https://discord.gg/3WYz3zaqG5

# A WeedShop Job for QBCore Framework
- Player Run Weedshop Supporting multiple MLO at once. Craft and sell your own joints, bongs, 


## Please note

- Please make sure u use the latest dependencies aswell as core for this in order to work.

- This Job has been tested on the latest build as of 13/9/2022.


## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu


## Credits : 

- BerkieB for his qb-target.
- Andyauk for helping me make this as great as it is now. 
- Mexicans for his idea about collecting wet weed
- My Discord Community for some amazing suggestions that have been implemented

## Insert into @qb-core/shared/items.lua 

```lua
QBShared.Items = {
-- Weed Shop
['streetweed'] 			    	 = {['name'] = 'streetweed', 			    	['label'] = 'Street Weed', 		    	['weight'] = 500, 		['type'] = 'item', 		["image"] = "weed_baggy.png",       	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "To make into Joints."},
	['weedbud'] 			    	 = {['name'] = 'weedbud', 			        	['label'] = 'Weed Bud', 		    	['weight'] = 500, 		['type'] = 'item', 		["image"] = "weedbud.png",           	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Grind into Useable Form."},
	['empty_weed_bag'] 				 = {['name'] = 'empty_weed_bag', 			    ['label'] = 'Empty Weed Bag', 			['weight'] = 200, 		['type'] = 'item', 		['image'] = 'weed_baggy_empty.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A small empty bag'},
	['wet_weed'] 		 	 	 	 = {['name'] = 'wet_weed',           			['label'] = 'Wet Weed',	 		    	['weight'] = 200, 		['type'] = 'item', 		["image"] = "wet.png", 		        	["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Wet weed that needs to be treated!"},
    ['rolling_paper'] 			 	 = {['name'] = 'rolling_paper', 			  	['label'] = 'Rolling Paper', 			['weight'] = 500, 		['type'] = 'item', 		['image'] = 'rolling_paper.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Paper made specifically for encasing and smoking tobacco or cannabis.'},
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
	['customer-receipt'] 		 	 = {['name'] = 'customer-receipt', 		  	 	['label'] = "Customer Receipt", 	   	['weight'] = 200, 	   	['type'] = 'item',   	['image'] = 'customer-receipt.png',    	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A receipt from selling something'},
    ['weed-grinder'] 			    	 = {['name'] = 'weed-grinder', 			        	['label'] = 'Grinder', 		    	['weight'] = 500, 		['type'] = 'item', 		["image"] = "weed-grinder.png",           	["unique"] = true, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Grind weed up."},
	['infusion-kit'] 			   	 = {['name'] = 'infusion-kit', 			    	['label'] = 'Infusion Kit', 		   	['weight'] = 1000, 		['type'] = 'item', 		["image"] = "infusion-kit.png",        	["unique"] = true, 	    ["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Used with wet weed to create different strands."},
	['bong'] 						 = {['name'] = 'bong', 							['label'] = 'Bong', 					['weight'] = 1500, 		['type'] = 'item', 		['image'] = 'bong.png', 				['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'I choose green team!'},
	
}

```

## Using the default jobs with qb-core/shared/jobs.lua

- copy this into your shared/jobs.lua

```lua
bestbuds = {
	label = 'Best Buds',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = { name = 'Recruit', payment = 50 },
		['1'] = { name = 'Novice', payment = 75 },
		['2'] = { name = 'Experienced', payment = 100 },
		['3'] = { name = 'Advanced', payment = 125 },
		['4'] = { name = 'Manager', isboss = true, payment = 150 },
	},
},
blazeit = {
	label = 'Blaze It',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = { name = 'Recruit', payment = 50 },
		['1'] = { name = 'Novice', payment = 75 },
		['2'] = { name = 'Experienced', payment = 100 },
		['3'] = { name = 'Advanced', payment = 125 },
		['4'] = { name = 'Manager', isboss = true, payment = 150 },
	},
},
widow = {
	label = 'White Widow',
	defaultDuty = true,
	offDutyPay = false,
	grades = {
		['0'] = { name = 'Recruit', payment = 50 },
		['1'] = { name = 'Novice', payment = 75 },
		['2'] = { name = 'Experienced', payment = 100 },
		['3'] = { name = 'Advanced', payment = 125 },
		['4'] = { name = 'Manager', isboss = true, payment = 150 },
	},
},
```

## Insert Contents of @weedshop/Images into @qb-inventory/HTML/Images

# New Custom Effects Examples
- With the new custom effects system you can create lots of new effects for any item you have in your server
options marked with a ["!"] are important and must be included as a TRUE/FALSE(others are optional and can be put as false or not included at all)
- example of custom item
```lua

["ItemName"] = { --item code to be used
        ItemName = 'dream-joint', --item code to be used...again  ["!"]
        Emote = 'joint', --emote that is used for that item
        RemoveItem = true, --whether to remove the item when used ["!"]
        RequireItem = 'lighter', -- whether you need another item to use the base item (can be false or put the item you want to be required )
        RemoveRequired = false, -- whether or not to remove the above ["RequireItem"] from players inventory
        WeedSmell = true, -- applies the qbcore evidence event with the argument of ["WeedSmell]
        StressRemove = math.random(5,10), -- the amount of ["Stress"] to remove the player
        AddArmour = math.random(5,10), -- the amount of ["Armour"] to give to player
		AddHunger = math.random(1,5), -- the amount of ["Hunger"] to give to player
		AddThirst = math.random(4,9), -- the amount of ["Thirst"] to give to player
        Effect = { 
            Enable = true, --whether to enable the Effect or not ["!"]
            IncreaseStamina = true, --increases stamina for short period (more customisation for this option coming soon) ["!"]
            CanCauseRagdoll = false, -- gives a random chance, while effect is applied, to make player ragdoll
            ScreenEffect = 'acid', -- the effect that is placed on players screen
            EffectDuration = 10, -- in seconds how long the entire effect lasts before returning to normal state ["!"]
        },
    },
    
```

# Garage System replaced by jim-jobgarage found here - https://discord.gg/kA6rGzwtrX
- if you do not have or want to use jims script you can replace the garage section with false like shown below

- with jim-jobgarage = 
```lua

 Garage = {{ --requires jim-jobgarage
            PedModel = 'g_m_importexport_01',
            Vehicle = {
                ["burrito"] = {
                    CustomName = "Burrito", --name in menu
                    colors = { 136, 137 }, -- colours -- found here https://altv.stuyk.com/docs/articles/tables/vehicle-colors.html
                    grade = 0, --job grade
                    performance = { 2, 3, 3, 2, 4, true }, 
                    trunkItems = { --items that spawn in the trunk
                        { name = "lockpick", amount = 1, info = {}, type = "item", slot = 1, }, --test
                    },
                },
            },
            PedPosition = vector4(372.18, -827.04, 29.29, 90.12),
            SpawnVehicle = vector4(368.15, -827.12, 29.29, 182.61),
        },},

```
- without jim-jobgarage = 

```
Garage = false,

```
