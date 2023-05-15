local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}
local Target = {}
local onDuty = true



-- target

CreateThread(function()
    for k,v in pairs(Config.MLOLocations) do
        if v.Enabled then
            if v.Blip then
                for d,j in pairs(v.Blip) do
                    if j.ShowBlip then
                        blip = AddBlipForCoord(j.Location)
                        SetBlipAsShortRange(blip, true)
                        SetBlipSprite(blip, j.Sprite)
                        SetBlipColour(blip, j.Colour)
                        SetBlipScale(blip, 0.5)
                        SetBlipDisplay(blip, 6)
                        BeginTextCommandSetBlipName('STRING')
                        if j.Label then AddTextComponentString(j.Label)
                        else AddTextComponentString("WeedShop") end
                        EndTextCommandSetBlipName(blip)
                    end
                end
            end
            if v.Duty then
                for d,j in pairs(v.Duty) do
                    Target["weedshopDuty"..k..d] =
	                exports['qb-target']:AddBoxZone("weedshopDuty"..k..d, j.coords, j.L, j.W, {name = "weedshopDuty"..k..d,heading = j.H,debugPoly = Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
	                	options = {{  event = "sayer-weedshop:DutyB",icon = "far fa-clipboard",label = "Clock On/Off",job = v.Job,},},
	                	distance = j.D
	                })
                end
            end
            if v.Counter then
                for d,j in pairs(v.Counter) do
                    Target["weedshopCounter"..k..d] =
	                exports['qb-target']:AddBoxZone("weedshopCounter"..k..d, j.coords, j.L, j.W, {name = "weedshopCounter"..k..d,heading = j.H,debugPoly = Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
	                	options = {{action = function() OpenWeedshopCounter(j.ID) end,icon = "fas fa-cannabis",label = "Access Counter",},},
	                	distance = j.D
	                })
                end
            end
            if v.DryPlot then
                for d,j in pairs(v.DryPlot) do
                    Target["weedshopDryPlot"..k..d] =
	                exports['qb-target']:AddBoxZone("weedshopDryPlot"..k..d, j.coords, j.L, j.W, {name="weedshopDryPlot"..k..d,heading=j.H,debugPoly=Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
	                	options = {{event = "qb-menu:DryWeed",icon = "fas fa-cannabis",label = "Weed Drying Station",job = v.Job,},},
	                	distance = j.D
	                })
                end
            end
            if v.GrindPlot then
                for d,j in pairs(v.GrindPlot) do
                    Target["weedshopGrindPlot"..k..d] =
	                exports['qb-target']:AddBoxZone("weedshopGrindPlot"..k..d, j.coords, j.L, j.W, {name="weedshopGrindPlot"..k..d,heading=j.H,debugPoly= Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
	                    options = {{event = "qb-menu:GrindWeed",icon = "fas fa-cannabis",label = "Grind Weed",job = v.Job,},},
	                    distance = j.D
	                })
                end
            end
            if v.Crafting then
                for d,j in pairs(v.Crafting) do
                    Target["weedshopCrafting"..k..d] =
                    exports['qb-target']:AddBoxZone("weedshopCrafting"..k..d, j.coords, j.L, j.W, {name="weedshopCrafting"..k..d,heading=j.H,debugPoly=Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
                        options = {{event = "qb-menu:Weed",icon = "fas fa-cannabis",label = "Weed Craft Station",job = v.Job,},},
                        distance = j.D
                    })
                end
            end
            if v.Register then
                for d,j in pairs(v.Register) do
                    Target["weedshopRegister"..k..d] =
                    exports['qb-target']:AddBoxZone("weedshopRegister"..k..d, j.coords, j.L, j.W, {name="weedshopRegister"..k..d,debugPoly=Config.DebugWeedPoly,heading=j.H,minZ=j.Minz,maxZ=j.Maxz,}, {
                        options = {{event = "sayer-weedshop:bill",parms = "1",icon = "fas fa-credit-card",label = "Charge Customer",job = v.Job,},},
                        distance = j.D
                    })
                end
            end
            if v.ShopMenu then
                for d,j in pairs(v.ShopMenu) do
                    Target["weedshopShopMenu"..k..d] =
                    exports['qb-target']:AddBoxZone("weedshopShopMenu"..k..d, j.coords, j.L, j.W, {name="weedshopShopMenu"..k..d,heading=j.H,debugPoly=Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
                        options = {{event = "qb-menu:WeedMenu",icon = "fas fa-cannabis",label = "Access Business!",job = v.Job,},},
                        distance = j.D
                    })
                end
            end
            if v.Storage then
                for d,j in pairs(v.Storage) do
                    Target["weedshopStorage "..k..d] =
                    exports['qb-target']:AddBoxZone("weedshopStorage "..k..d, j.coords.xyz, j.L, j.W, {name="weedshopStorage "..k..d,heading=j.H,debugPoly=Config.DebugWeedPoly,minZ=j.Minz,maxZ=j.Maxz,}, {
                        options = {{action = function() OpenWeedshopStorage(j.ID) end,icon = "fas fa-cannabis",label = "Storage",job = v.Job,},},
                        distance = j.D
                    })
                end
            end
            if v.Garage then
                for d,j in pairs(v.Garage) do
                    TriggerServerEvent("jim-jobgarage:server:syncAddLocations", {
                    job = v.Job,
                    garage = {
                            spawn = j.SpawnVehicle,
                            out = j.PedPosition,
                            ped = {
                                model = j.PedModel,
                                scenario = "WORLD_HUMAN_CLIPBOARD"
                            },
                            list = j.Vehicle
                        },
                    })
                end
            end
        end
    end
end)


-- QB-MENU --

RegisterNetEvent('qb-menu:Weed', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Available Products |",isMenuHeader = true, },
        {header = "• Weed Brownie",txt = "Brownie Mix , streetweed",params = {event = "sayer-weedshop:weedbrownie"}},
        {header = "• Stoned Energy Drink",txt = "Aluminum Can , Drink-mix , Streetweed",params = {event = "sayer-weedshop:weed-drink"}},  
        {header = "• Joint",txt = "Rolling Paper , Street Weed",params = {event = "sayer-weedshop:joint"}},
        {header = "• Bong",txt = "Glass , Plastic",params = {event = "sayer-weedshop:bong"}},
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
        {header = "• Street Weed",  txt = "Weed Bud",   params = {event = "sayer-weedshop:GrindWeed", args = {taken = "weedbud",     given = "streetweed"}}},
        {header = "• Dream Weed",   txt = "Dream Bud",  params = {event = "sayer-weedshop:GrindWeed", args = {taken = "dream-bud",   given = "dream-weed"}}},
        {header = "• Hazy Weed",    txt = "Hazy Bud",   params = {event = "sayer-weedshop:GrindWeed", args = {taken = "hazy-bud",    given = "hazy-weed"}}},
        {header = "• Crush Weed",   txt = "Crush Bud",  params = {event = "sayer-weedshop:GrindWeed", args = {taken = "crush-bud",   given = "crush-weed"}}},
        {header = "• Bloomer Weed", txt = "Bloomer Bud",params = {event = "sayer-weedshop:GrindWeed", args = {taken = "bloomer-bud", given = "bloomer-weed"}}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('sayer-weedshop:RollJointsMenu', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Roll Joints |",isMenuHeader = true, },
        {header = "• Street Joint",  txt = "Requires Street Weed",  params = {event = "sayer-weedshop:RollJoint", args = {taken = "streetweed",     given = "joint"}}},
        {header = "• Dream Joint",   txt = "Requires Dream Weed",  params = {event = "sayer-weedshop:RollJoint", args = {taken = "dream-weed",   given = "dream-joint"}}},
        {header = "• Hazy Joint",    txt = "Requires Hazy Weed",  params = {event = "sayer-weedshop:RollJoint", args = {taken = "hazy-weed",    given = "hazy-joint"}}},
        {header = "• Crush Joint",   txt = "Requires Crush Weed",  params = {event = "sayer-weedshop:RollJoint", args = {taken = "crush-weed",   given = "crush-joint"}}},
        {header = "• Bloomer Joint", txt = "Requires Bloomer Weed",  params = {event = "sayer-weedshop:RollJoint", args = {taken = "bloomer-weed", given = "bloomer-joint"}}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('qb-menu:DryWeed', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Dry Weed |",isMenuHeader = true, },
        {header = "• Street Bud",   txt = "Wet Weed",   params = {event = "sayer-weedshop:DryWeed", args = "weedbud"}},
        {header = "• Dream Bud",    txt = "Wet Dream",  params = {event = "sayer-weedshop:DryWeed", args = "dream-bud"}},
        {header = "• Hazy Bud",     txt = "Wet Hazy",   params = {event = "sayer-weedshop:DryWeed", args = "hazy-bud"}},  
        {header = "• Crush Bud",    txt = "Wet Crush",  params = {event = "sayer-weedshop:DryWeed", args = "crush-bud"}},
        {header = "• Bloomer Bud",  txt = "Wet Bloomer",params = {event = "sayer-weedshop:DryWeed", args = "bloomer-bud"}},
        {id = 7,header = "Close (ESC)",isMenuHeader = true, },
    })
end)

RegisterNetEvent('qb-menu:WeedMenu', function(data)
    exports['qb-menu']:openMenu({
        {header = "| Products |",isMenuHeader = true, },
        {header = "• Duty",             txt = "Clock In/Out",params = {event = "sayer-weedshop:DutyB"}},
        {header = "• Order Items",      txt = "Order New Ingredients!",params = {event = "sayer-weedshop:shop"}},
        {header = "• Order Wet Weed",   txt = "Current Price is $"..Config.SingleWetWeedCost.." Per...",params = {event = "sayer-weedshop:deliveries:PickUpWeedMenu"}},
        {header = "• Accept Delivery",  txt = "Send delivery to personal email",params = {event = "sayer-weedshop:DeliveryMenu"}},
        {header = "• Cancel Delivery",  txt = "Cancel Your Current Deliveries",params = {event = "sayer-weedshop:DeliveryCancel"}},
        {header = "• File Invoice",     txt = "Complete to get paid for each Receipt",params = {event = "sayer-weedshop:deliveries:ReceivePayment"}},
        {header = "• Manage Business",  txt = "Access the business menu",params = {event = "qb-bossmenu:client:OpenMenu"}},
        {header = "Close (ESC)",isMenuHeader = true, },
    })
end)


-- Till Stuff --
RegisterNetEvent("sayer-weedshop:bill")
AddEventHandler("sayer-weedshop:bill", function()
    if Config.JimPayments then
        TriggerEvent('jim-payments:client:Charge', source, false)
    else
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
    end
end)