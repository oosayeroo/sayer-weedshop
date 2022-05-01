local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = false

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
				event = "qb-weedshop:DryWeed",
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
			    event = "qb-weedshop:Grind",
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
                        label = "Order Ingredients!",
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
            txt = "Brownie Mix x3 , streetweed x6",
            params = {
                event = "qb-weedshop:weedbrownie"
            }
        },
        {
            
            header = "• Stoned Energy Drink",
            txt = "Aluminum Can x5 , Drink-mix x1 , Streetweed x2",
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
            
            header = "• Weed Gift Set",
            txt = "Joint x5, Gift Box x1 , streetweed x1 ",
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
