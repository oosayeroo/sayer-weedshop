local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = true



-- target

Citizen.CreateThread(function()
    if Config.MLO == 'legion' then
	    exports['qb-target']:AddBoxZone("WeedShopDuty", vector3(375.65, -824.95, 29.3), 0.30, 1.2, {name = "WeedShopDuty",heading = 177.88,debugPoly = Config.DebugWeedPoly,minZ=29.6,maxZ=30.5,}, {
	    	options = {{  event = "sayer-weedshop:DutyB",icon = "far fa-clipboard",label = "Clock On/Off",job = Config.JobName,},},
	    	distance = 1.5
	    })
	    exports['qb-target']:AddBoxZone("weed_tray_1", vector3(377.26, -827.42, 29.38), 0.3, 0.5, {name = "weed_tray_1",heading = 180,debugPoly = Config.DebugWeedPoly,minZ=29.3,maxZ=29.7,}, {
	    	options = {{event = "sayer-weedshop:Tray1",icon = "fas fa-cannabis",label = "Tray 1",},},
	    	distance = 1.5
	    })
	    exports['qb-target']:AddBoxZone("weedshopplant1", vector3(380.5, -812.59, 28.43), 2.8, 4.5, {name="weedshopplant1",heading=180,debugPoly=Config.DebugWeedPoly,minZ=28.0,maxZ=30.0,}, {
	    	options = {{event = "qb-menu:DryWeed",icon = "fas fa-cannabis",label = "Weed Drying Station",job = Config.JobName,},},
	    	distance = 1.5
	    })
	    exports['qb-target']:AddBoxZone("weedshopGrind", vector3(382.49, -817.43, 28.3), 1.0, 1.8, {name="weedshopgrind",heading=0,debugPoly= Config.DebugWeedPoly,minZ=28.0,maxZ=30.0,}, {
	        options = {{event = "qb-menu:GrindWeed",icon = "fas fa-cannabis",label = "Grind Weed",job = Config.JobName,},},
	        distance = 1.5
	    })
        exports['qb-target']:AddBoxZone("orderweed", vector3(375.55, -827.33, 29.29), 0.4, 0.3, {name="orderweed",heading=180,debugPoly=Config.DebugWeedPoly,minZ=29.3,maxZ=29.7,}, {
            options = {{event = "qb-menu:WeedMenu",icon = "fas fa-cannabis",label = "Access Register!",job = Config.JobName,},},
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedshopdisplay", vector3(383.71, -819.8, 29.29), 0.5, 2.0, {name="weedshopdisplay",heading=90,debugPoly=Config.DebugWeedPoly,minZ=28.0,maxZ=30.0,}, {
            options = {{event = "sayer-weedshop:Storage",icon = "fas fa-cannabis",label = "Storage",job = Config.JobName,},},
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedcraft", vector3(374.23, -816.06, 29.35), 1.0, 1.0, {name="weedcraft",heading=1,debugPoly=Config.DebugWeedPoly,minZ=28.0,maxZ=29.5,}, {
            options = {{event = "qb-menu:Weed",icon = "fas fa-cannabis",label = "Weed Craft Station",job = Config.JobName,},},
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedshop_register_1", vector3(380.24, -827.33, 29.29), 0.4, 0.3, {name="WeedShop_register_1",debugPoly=Config.DebugWeedPoly,heading=180,minZ=29.3,maxZ=29.7,}, {
            options = {{event = "sayer-weedshop:bill",parms = "1",icon = "fas fa-credit-card",label = "Charge Customer",job = Config.JobName,},},
            distance = 1.5
        })
    elseif Config.MLO == 'blazeit' then
	    exports['qb-target']:AddBoxZone("weed_tray_1", vector3(368.13, -1268.03, 32.59), 2.4, 0.6, {name = "weed_tray_1",heading = 50,debugPoly = Config.DebugWeedPoly,minZ=32.19,maxZ=32.59,}, {
	    	options = {{event = "sayer-weedshop:Tray1",icon = "fas fa-cannabis",label = "Tray 1",},}, 
	    	distance = 1.5
	    })
	    exports['qb-target']:AddBoxZone("weedshopplant1", vector3(366.29, -1252.52, 32.59), 1.0, 1.0, {name="weedshopplant1",heading=324,debugPoly=Config.DebugWeedPoly,minZ=32.79,maxZ=34.19,}, {
	    	options = {{event = "qb-menu:DryWeed",icon = "fas fa-cannabis",label = "Weed Drying Station",job = Config.JobName,},}, 
	    	distance = 1.5
	    })
	    exports['qb-target']:AddBoxZone("weedshopGrind", vector3(364.42, -1255.05, 32.59), 1.0, 1.0, {name="weedshopgrind",heading=50,debugPoly= Config.DebugWeedPoly,minZ=32.19,maxZ=32.79,}, {
	        options = {{event = "qb-menu:GrindWeed",icon = "fas fa-cannabis",label = "Grind Weed",job = Config.JobName,},},
	        distance = 1.5
	    })
        exports['qb-target']:AddBoxZone("orderweed", vector3(362.19, -1258.49, 32.59), 2.6, 0.4, {name="orderweed",heading=320,debugPoly=Config.DebugWeedPoly,minZ=32.39,maxZ=33.19,}, {
            options = {{event = "qb-menu:WeedMenu",icon = "fas fa-laptop",label = "Managers PC!",job = Config.JobName,},},
            distance = 1.8
        })
        exports['qb-target']:AddBoxZone("weedshopstorage1", vector3(356.51, -1245.48, 32.59), 2.8, 1.0, {name="weedshopstorage1",heading=50,debugPoly=Config.DebugWeedPoly,minZ=31.59,maxZ=33.79,}, {
            options = {{event = "sayer-weedshop:Storage",icon = "fas fa-cannabis",label = "Storage",job = Config.JobName,},}, 
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedshopstorage2", vector3(359.94, -1254.88, 32.59), 2.8, 1.0, {name="weedshopstorage2",heading=320,debugPoly=Config.DebugWeedPoly,minZ=29.79,maxZ=33.79,}, {
            options = {{event = "sayer-weedshop:Storage3",icon = "fas fa-cannabis",label = "Storage",job = Config.JobName,},}, 
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedcraft", vector3(365.14, -1254.18, 32.59), 1.0, 1.0, {name="weedcraft",heading=50,debugPoly=Config.DebugWeedPoly,minZ=32.19,maxZ=32.99,}, {
            options = {{event = "qb-menu:Weed",icon = "fas fa-cannabis",label = "Weed Craft Station",job = Config.JobName,},},
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedshop_register_1", vector3(370.15, -1269.71, 32.59), 0.6, 0.6, {name="WeedShop_register_1",debugPoly=Config.DebugWeedPoly,heading=36,minZ=32.54,maxZ=32.94,}, {
            options = {{event = "sayer-weedshop:bill",parms = "1",icon = "fas fa-credit-card",label = "Charge Customer",job = Config.JobName,},},
            distance = 1.5
        })
    elseif Config.MLO == 'widow' then
	    exports['qb-target']:AddBoxZone("weed_tray_1", vector3(188.51, -242.25, 54.07), 1.2, 0.4, {name = "weed_tray_1",heading = 340,debugPoly = Config.DebugWeedPoly,minZ=53.87,maxZ=54.47,}, {
	    	options = {{event = "sayer-weedshop:Tray1",icon = "fas fa-cannabis",label = "Tray 1",},}, 
	    	distance = 1.5
	    })
	    exports['qb-target']:AddBoxZone("weedshopplant1", vector3(165.54, -245.82, 50.06), 9.2, 5.6, {name="weedshopplant1",heading=250,debugPoly=Config.DebugWeedPoly,minZ=49.26,maxZ=51.46,}, {
	    	options = {{event = "qb-menu:DryWeed",icon = "fas fa-cannabis",label = "Weed Drying Station",job = Config.JobName,},}, 
	    	distance = 1.5
	    })
	    exports['qb-target']:AddBoxZone("weedshopGrind", vector3(165.37, -235.74, 50.06), 0.8, 2.2, {name="weedshopgrind",heading=340,debugPoly= Config.DebugWeedPoly,minZ=49.66,maxZ=50.26,}, {
	        options = {{event = "qb-menu:GrindWeed",icon = "fas fa-cannabis",label = "Grind Weed",job = Config.JobName,},}, 
	        distance = 1.5
	    })
        exports['qb-target']:AddBoxZone("orderweed", vector3(182.92, -250.61, 54.07), 1.0, 1.8, {name="orderweed",heading=340,debugPoly=Config.DebugWeedPoly,minZ=53.67,maxZ=54.67,}, {
            options = {{event = "qb-menu:WeedMenu",icon = "fas fa-laptop",label = "Managers PC!",job = Config.JobName,},}, 
            distance = 1.8
        })
        exports['qb-target']:AddBoxZone("orderweed2", vector3(180.63, -252.74, 54.07), 0.8, 1.0, {name="orderweed",heading=340,debugPoly=Config.DebugWeedPoly,minZ=53.67,maxZ=54.47,}, {
            options = {{event = "qb-menu:WeedMenu",icon = "fas fa-laptop",label = "Managers PC!",job = Config.JobName,},}, 
            distance = 1.8
        })
        exports['qb-target']:AddBoxZone("weedshopstorage1", vector3(175.52, -239.82, 50.06), 0.8, 2.4, {name="weedshopstorage1",heading=340,debugPoly=Config.DebugWeedPoly,minZ=49.26,maxZ=51.46,}, {
            options = {{event = "sayer-weedshop:Storage",icon = "fas fa-cannabis",label = "Storage",job = Config.JobName,},}, 
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedshopstorage2", vector3(194.08, -235.12, 54.07), 5.0, 4.6, {name="weedshopstorage2",heading=340,debugPoly=Config.DebugWeedPoly,minZ=53.67,maxZ=54.87,}, {
            options = {{event = "sayer-weedshop:Storage3",icon = "fas fa-cannabis",label = "Storage",job = Config.JobName,},}, 
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedcraft", vector3(185.45, -242.21, 54.07), 0.6, 3.0, {name="weedcraft",heading=70,debugPoly=Config.DebugWeedPoly,minZ=54.07,maxZ=54.47,}, {
            options = {{event = "qb-menu:Weed",icon = "fas fa-cannabis",label = "Weed Craft Station",job = Config.JobName,},}, 
            distance = 1.5
        })
        exports['qb-target']:AddBoxZone("weedshop_register_1", vector3(189.01, -241.15, 54.07), 0.5, 0.5, {name="WeedShop_register_1",debugPoly=Config.DebugWeedPoly,heading=341,minZ=53.87,maxZ=54.47,}, {
            options = {{event = "sayer-weedshop:bill",parms = "1",icon = "fas fa-credit-card",label = "Charge Customer",job = Config.JobName,},}, 
            distance = 1.5
        })
    end
end)


-- QB-MENU --

RegisterNetEvent('qb-menu:Weed', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Available Products |",isMenuHeader = true, },
        {header = "• Weed Brownie",txt = "Brownie Mix , streetweed",params = {event = "sayer-weedshop:weedbrownie"}},
        {header = "• Stoned Energy Drink",txt = "Aluminum Can , Drink-mix , Streetweed",params = {event = "sayer-weedshop:weed-drink"}},  
        {header = "• Joint",txt = "Rolling Paper , Street Weed",params = {event = "sayer-weedshop:joint"}},
        {header = "• Dream Joint",txt = "Rolling Paper , Dream Weed",params = {event = "sayer-weedshop:CreateDream"}},
        {header = "• Hazy Joint",txt = "Rolling Paper , Hazy Weed",params = {event = "sayer-weedshop:CreateHazy"}},
        {header = "• Crush Joint",txt = "Rolling Paper , Crush Weed",params = {event = "sayer-weedshop:CreateCrush"}},
        {header = "• Bloomer Joint",txt = "Rolling Paper , Bloomer Weed",params = {event = "sayer-weedshop:CreateBloomer"}},
        {header = "• Weed Gift Set",txt = "1 of each joint ",params = {event = "sayer-weedshop:creategiftset"}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('qb-menu:GrindWeed', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Grind Weed |",isMenuHeader = true, },
        {header = "• Street Weed",txt = "Weed Bud",params = {event = "sayer-weedshop:Grind"}},
        {header = "• Dream Weed",txt = "Dream Bud",params = {event = "sayer-weedshop:GrindDream"}},
        {header = "• Hazy Weed",txt = "Hazy Bud",params = {event = "sayer-weedshop:GrindHazy"}},  
        {header = "• Crush Weed",txt = "Crush Bud",params = {event = "sayer-weedshop:GrindCrush"}},
        {header = "• Bloomer Weed",txt = "Bloomer Bud",params = {event = "sayer-weedshop:GrindBloomer"}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)


RegisterNetEvent('qb-menu:DryWeed', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Dry Weed |",isMenuHeader = true, },
        {header = "• Weed Bud",txt = "Wet Weed",params = {event = "sayer-weedshop:DryWeed"}},
        {header = "• Dream Bud",txt = "Wet Dream",params = {event = "sayer-weedshop:DryDream"}},
        {header = "• Hazy Bud",txt = "Wet Hazy",params = {event = "sayer-weedshop:DryHazy"}},  
        {header = "• Crush Bud",txt = "Wet Crush",params = {event = "sayer-weedshop:DryCrush"}},
        {header = "• Bloomer Bud",txt = "Wet Bloomer",params = {event = "sayer-weedshop:DryBloomer"}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('qb-menu:WeedMenu', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Products |",isMenuHeader = true, },
        {header = "• Duty",txt = "Clock In/Out",params = {event = "sayer-weedshop:DutyB"}},
        {header = "• Order Items",txt = "Order New Ingredients!",params = {event = "sayer-weedshop:shop"}},
        {header = "• Open Storage",txt = "See what you have in storage",params = {event = "sayer-weedshop:Storage2"}},
        {header = "• Order Wet Weed",txt = "Current Price is $"..Config.SingleWetWeedCost.." Per...",params = {event = "sayer-weedshop:deliveries:PickUpWeedMenu"}},
        {header = "• Accept Delivery",txt = "Send delivery to personal email",params = {event = "sayer-weedshop:DeliveryMenu"}},
        {header = "• File Invoice",txt = "Complete to get paid for each Receipt",params = {event = "sayer-weedshop:deliveries:ReceivePayment"}},
        {header = "• Manage Business",txt = "Access the business menu",params = {event = "qb-bossmenu:client:OpenMenu"}},
        {header = "Close (ESC)",isMenuHeader = true, },
    })
end)


-- Till Stuff --
RegisterNetEvent("sayer-weedshop:bill")
AddEventHandler("sayer-weedshop:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {text = "Server ID(#)",name = "citizenid", type = "text", isRequired = true },
            {text = "Bill Price ($)", name = "billprice", type = "number", isRequired = false}	
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("sayer-weedshop:bill:player", bill.citizenid, bill.billprice)
    end
end)
