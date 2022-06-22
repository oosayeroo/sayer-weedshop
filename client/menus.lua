local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = true

-- target

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("WeedShopDuty", vector3(375.65, -824.95, 29.3), 0.30, 1.2, {
		name = "WeedShopDuty",
		heading = 177.88,
		debugPoly = false,
		minZ=29.6,
		maxZ=30.5,
	}, {
		options = {
		    {  
			event = "qb-weedshop:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "weedshop",
		    },
		},
		distance = 1.5
	})

		exports['qb-target']:AddBoxZone("weed_tray_1", vector3(377.0, -827.34, 29.3), 1.05, 1.0, {
			name = "weed_tray_1",
			heading = 35.0,
			debugPoly = false,
			minZ=28.0,
			maxZ=30.0,
		}, {
			options = {
			    {
				event = "qb-weedshop:Tray1",
				icon = "fas fa-cannabis",
				label = "Tray 1",
			    },
			},
			distance = 1.5
		})


	exports['qb-target']:AddBoxZone("weedshopdryer", vector3(380.44, -813.94, 29.3), 1.8, 1.0, {
		name="weedshopdryer",
		heading=34,
		debugPoly=false,
		minZ=28.0,
		maxZ=30.0,
	}, {
		options = {
			{
				event = "qb-menu:DryWeed",
				icon = "fas fa-cannabis",
				label = "Weed Drying Station",
				job = "weedshop",
			},
		},
		distance = 1.5
	})


		exports['qb-target']:AddBoxZone("weedshopGrind", vector3(382.31, -816.57, 29.3), 2.5, 1.5, {
		name="weedshopgrind",
		heading=35,
		debugPoly=false,
		minZ=28.0,
		maxZ=30.0,
		}, {
		    options = {
			{
			    event = "qb-menu:GrindWeed",
			    icon = "fas fa-cannabis",
			    label = "Grind Weed",
			    job = "weedshop",
			},
		    },
		    distance = 1.5
		})


         exports['qb-target']:AddBoxZone("orderweed", vector3(375.9, -827.25, 30.44), 1.6, 1, {
            name="orderweed",
            heading=35,
            debugPoly=false,
            minZ=29.0,
            maxZ=31.0,
        }, {
                options = {
                    {
                        event = "qb-menu:WeedMenu",
                        icon = "fas fa-cannabis",
                        label = "Access Register!",
                        job = "weedshop",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("weedshopdisplay", vector3(382.54, -819.79, 29.3), 4.6, 1.2, {
            name="weedshopdisplay",
            heading=34,
            debugPoly=false,
            minZ=28.0,
            maxZ=30.0,
        }, {
                options = {
                    {
                        event = "qb-weedshop:Storage",
                        icon = "fas fa-cannabis",
                        label = "Storage",
                        job = "weedshop",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("weedcraft", vector3(374.54, -816.8, 29.3), 1.8, 0.7, {
            name="weedcraft",
            heading=1,
            debugPoly=false,
            minZ=28.0,
            maxZ=30.0,
        }, {
                options = {
                    {
                        event = "qb-menu:Weed",
                        icon = "fas fa-cannabis",
                        label = "Weed Craft Station",
                        job = "weedshop",
                    },
                },
                distance = 1.5
            })


        exports['qb-target']:AddBoxZone("weedshop_register_1", vector3(380.16, -827.43, 30.64), 0.5, 0.4, {
            name="WeedShop_register_1",
            debugPoly=false,
            heading=125,
            minZ=29.0,
            maxZ=31.0,
        }, {
                options = {
                    {
                        event = "qb-weedshop:bill",
                        parms = "1",
                        icon = "fas fa-credit-card",
                        label = "Charge Customer",
                        job = "weedshop",
                    },
                },
                distance = 1.5
            })

end)


-- QB-MENU --

RegisterNetEvent('qb-menu:Weed', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Available Products |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Weed Brownie",
            txt = "Brownie Mix , streetweed",
            params = {
                event = "qb-weedshop:weedbrownie"
            }
        },
        {
            
            header = "• Stoned Energy Drink",
            txt = "Aluminum Can , Drink-mix , Streetweed",
            params = {
                event = "qb-weedshop:weed-drink"
            }
        },  
        {
            
            header = "• Joint",
            txt = "Rolling Paper , Street Weed",
            params = {
                event = "qb-weedshop:joint"
            }
        },
        {
            
            header = "• Dream Joint",
            txt = "Rolling Paper , Dream Weed",
            params = {
                event = "qb-weedshop:CreateDream"
            }
        },
        {
            
            header = "• Hazy Joint",
            txt = "Rolling Paper , Hazy Weed",
            params = {
                event = "qb-weedshop:CreateHazy"
            }
        },
        {
            
            header = "• Crush Joint",
            txt = "Rolling Paper , Crush Weed",
            params = {
                event = "qb-weedshop:CreateCrush"
            }
        },
        {
            
            header = "• Bloomer Joint",
            txt = "Rolling Paper , Bloomer Weed",
            params = {
                event = "qb-weedshop:CreateBloomer"
            }
        },
        {
            
            header = "• Weed Gift Set",
            txt = "1 of each joint ",
            params = {
                event = "qb-weedshop:creategiftset"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('qb-menu:GrindWeed', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Grind Weed |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Street Weed",
            txt = "Weed Bud",
            params = {
                event = "qb-weedshop:Grind"
            }
        },
        {
            
            header = "• Dream Weed",
            txt = "Dream Bud",
            params = {
                event = "qb-weedshop:GrindDream"
            }
        },
        {
            
            header = "• Hazy Weed",
            txt = "Hazy Bud",
            params = {
                event = "qb-weedshop:GrindHazy"
            }
        },  
        {
            
            header = "• Crush Weed",
            txt = "Crush Bud",
            params = {
                event = "qb-weedshop:GrindCrush"
            }
        },
        {
            
            header = "• Bloomer Weed",
            txt = "Bloomer Bud",
            params = {
                event = "qb-weedshop:GrindBloomer"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


RegisterNetEvent('qb-menu:DryWeed', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Dry Weed |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Weed Bud",
            txt = "Wet Weed",
            params = {
                event = "qb-weedshop:DryWeed"
            }
        },
        {
            
            header = "• Dream Bud",
            txt = "Wet Dream",
            params = {
                event = "qb-weedshop:DryDream"
            }
        },
        {
            
            header = "• Hazy Bud",
            txt = "Wet Hazy",
            params = {
                event = "qb-weedshop:DryHazy"
            }
        },  
        {
            
            header = "• Crush Bud",
            txt = "Wet Crush",
            params = {
                event = "qb-weedshop:DryCrush"
            }
        },
        {
            
            header = "• Bloomer Bud",
            txt = "Wet Bloomer",
            params = {
                event = "qb-weedshop:DryBloomer"
            }
        },
        {
            id = 7,
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)

RegisterNetEvent('qb-menu:WeedMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            
            header = "| Products |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-weedshop:shop"
            }
        },
        {
           
            header = "• Open Storage",
            txt = "See what you have in storage",
            params = {
                event = "qb-weedshop:Storage2"
            }
        },
        {
           
            header = "• Accept Delivery",
            txt = "Send delivery to personal email",
            params = {
                event = "qb-weedshop:deliveries:DeliverWeed"
            }
        },
        {
           
            header = "• File Invoice",
            txt = "Complete to get paid for each Receipt",
            params = {
                event = "qb-weedshop:deliveries:ReceivePayment"
            }
        },
        {
           
            header = "• Order Wet Weed",
            txt = "Order some wet weed to pick up",
            params = {
                event = "qb-weedshop:deliveries:PickUpWeed"
            }
        },
        {
            
            header = "Close (ESC)",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-weedshop:bill")
AddEventHandler("qb-weedshop:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-weedshop:bill:player", bill.citizenid, bill.billprice)
    end
end)
