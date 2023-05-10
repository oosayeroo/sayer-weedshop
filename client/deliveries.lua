local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}
local onPickup = false
local finishedPickup = true
local DropOffDone = 0
local amount = 0
local number = 0
local delitem = ''
local wwamount = 0


RegisterNetEvent('sayer-weedshop:deliveries:DeliverWeed', function(amount)
    number = tonumber(amount)
    delitem = Config.DeliveryItems[math.random(1,#Config.DeliveryItems)]
    delitemamount = math.random(1,3)
    if not onPickup then
        if number < Config.MaxDeliveries then
            TriggerEvent('animations:client:EmoteCommandStart', {"type"})
                QBCore.Functions.Progressbar('del_start', 'Getting Delivery...', 5000, false, true, 
                {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify('You Started a delivery! It should appear in your emails soon!', 'primary', 7500)
                Wait(Config.DeliveryWait * 1000)
                if Config.Phone == 'qb' then
                    TriggerServerEvent('qb-phone:server:sendNewMail', {sender = 'Delivery',subject = 'Delivery of  '..delitem..'...',message = 'Delivery has been accepted by company. please deliver the x'..delitemamount..' '..delitem..' to the customer.',})
                elseif Config.Phone == 'qs' then
                    TriggerServerEvent('qs-smartphone:server:sendNewMail', {sender = 'Delivery',subject = 'Delivery of '..delitem..'...',message = 'Delivery has been accepted by company. please deliver the x'..delitemamount..' '..delitem..' to the customer.',button = {}})
                elseif Config.Phone == 'gk' then
                    TriggerServerEvent('gksphone:NewMail', {sender = 'Delivery',subject = 'Delivery of '..delitem..'...',message = 'Delivery has been accepted by company. please deliver the x'..delitemamount..' '..delitem..' to the customer.',})
                end
                startdropoff(number, delitem, delitemamount)
                onPickup = true
                if Config.DebugCode then print("onPickup = "..onPickup.." ") end
            end)
        else
            QBCore.Functions.Notify('You Cannot Do That Many Deliveries', 'error')
        end
    else
        QBCore.Functions.Notify('You are already busy', 'error')
    end
end)

RegisterNetEvent("sayer-weedshop:DeliveryMenu")
AddEventHandler("sayer-weedshop:DeliveryMenu", function()
    local delmenu = exports['qb-input']:ShowInput({
        header = "How Many Deliveries to do?",
		submitText = "Start Delivery",
        inputs = {
            {text = "Amount(#)",name = "amount", type = "number", isRequired = true },
        }
    })
    if delmenu ~= nil then
        if delmenu.amount == nil then return end
        TriggerEvent("sayer-weedshop:deliveries:DeliverWeed", delmenu.amount)
        if config.DebugCode then print(delmenu.amount) end
    end
end)

function KnockDoor(amount, delitem, delitemamount)
    if QBCore.Functions.HasItem(delitem, delitemamount) then
        TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
        QBCore.Functions.Progressbar('falar_empregada', 'Knocking Door...', 5000, false, true, 
            {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, {}, {}, {}, function()
            QBCore.Functions.Notify('Delivery Successful', 'primary', 7500)
            TriggerServerEvent('sayer-weedshop:server:KnockDoor', delitem, delitemamount)
            DropOffDone = DropOffDone+1
            delitem = Config.DeliveryItems[math.random(1,#Config.DeliveryItems)]
            delitemamount = math.random(1,3)
        startdropoff(amount, delitem, delitemamount)
        end)
    else
        QBCore.Functions.Notify('You Dont have the right items', 'error', 5000)
    end
end

function startdropoff(number,delitem, delitemamount)
    if DropOffDone < number then
        local prob = Config.DropOffPoints[math.random(1, #Config.DropOffPoints)]
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {sender = 'Delivery',subject = 'Delivery of '..delitemamount..' '..delitem..'...',message = 'Delivery has been accepted by company. please deliver x'..delitemamount..' '..delitem..' to the customer.',})
        elseif Config.Phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {sender = 'Delivery',subject = 'Delivery of '..delitemamount..' '..delitem..'...',message = 'Delivery has been accepted by company. please deliver x'..delitemamount..' '..delitem..' to the customer.',button = {}})
        elseif Config.Phone == 'gk' then
            TriggerServerEvent('gksphone:NewMail', {sender = 'Delivery',subject = 'Delivery of '..delitemamount..' '..delitem..'...',message = 'Delivery has been accepted by company. please deliver x'..delitemamount..' '..delitem..' to the customer.',})
        end
        exports['qb-target']:AddBoxZone("delivery_zone", prob, 2, 2, {name="delivery_zone",heading=0,debugpoly = false,}, {
            options = {{action = function() KnockDoor(number, delitem, delitemamount) end,icon = "far fa-box",label = "Knock Door",item = delitem,},},
            distance = 2.5
        })
        SetNewWaypoint(prob)
        QBCore.Functions.Notify('Customer House GPS Set!', 'success')
    else
        QBCore.Functions.Notify('You Have Done All Deliveries, Return to shop', 'error')
        DropOffDone = 0
        onPickup = false
    end
end

RegisterNetEvent("sayer-weedshop:deliveries:PickUpWeedMenu")
AddEventHandler("sayer-weedshop:deliveries:PickUpWeedMenu", function()
    local wwmenu = exports['qb-input']:ShowInput({
        header = "How Much Wet Weed You Need?",
		submitText = "Order Weed!",
        inputs = {
            {text = "Amount(#)",name = "amount", type = "number", isRequired = true },
        }
    })
    if wwmenu ~= nil then
        if wwmenu.amount == nil then return end
        TriggerEvent("sayer-weedshop:deliveries:PickUpWeed", wwmenu.amount)
    end
end)

RegisterNetEvent('sayer-weedshop:deliveries:PickUpWeed', function(wwamount)
    if not onPickup then
        TriggerEvent('animations:client:EmoteCommandStart', {"type"})
        QBCore.Functions.Progressbar('falar_empregada', 'Getting Weed Order...', 5000, false, true, 
        {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('sayer-weedshop:server:pickupordered', wwamount)
        QBCore.Functions.Notify('You need to go to pick up some Wet Weed!', 'primary', 7500)
        Wait(Config.DeliveryWait * 1000)
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {sender = 'Mr Mexicans',subject = 'Pick up Wet Weed...',message = 'Yo man, i got your order of '..wwamount..'x Wet Weed, freshly grown. Come pick it up',})
        elseif Config.Phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {sender = 'Mr Mexicans',subject = 'Pick up Wet Weed...',message = 'Yo man, i got your order'..wwamount..'x Wet Weed, freshly grown. Come pick it up',})
        elseif Config.Phone == 'gk' then
            TriggerServerEvent('gksphone:NewMail', {sender = 'Mr Mexicans',subject = 'Pick up Wet Weed...',message = 'Yo man, i got your order'..wwamount..'x Wet Weed, freshly grown. Come pick it up',})
        end
        startwetweedpickup(wwamount)
        onPickup = true
        finishedPickup = false
        end)
    end
end)

RegisterNetEvent('sayer-weedshop:DeliveryCancel', function()
    if onPickup then
        finishedPickup = true
        onPickup = false
        DropOffDone = 0
        amount = 0
        number = 0
        delitem = ''
        wwamount = 0
        exports['qb-target']:RemoveZone("wet-pickup")
        exports['qb-target']:RemoveZone("delivery_zone")
        QBCore.Functions.Notify('Deliveries Successfully Cancelled', 'success', 5000)
    else
        QBCore.Functions.Notify('You Are Not On Delivery', 'error', 5000)
    end
end)

function startwetweedpickup(wwamount)
    if Config.DebugCode then print(wwamount.."startwetweedpickup function") end
    local prob = Config.WetWeedLocation[math.random(1, #Config.WetWeedLocation)]
    exports['qb-target']:AddBoxZone("wet-pickup", prob, 3, 3, {name="wet-pickup",heading=0,debugpoly = false,}, {
        options = {{action = function() PickUpWetWeed2(wwamount) end,icon = "far fa-cannabis",label = "Pick Up Wet Weed",},},
        distance = 2.5
    })
    SetNewWaypoint(prob)
end

function PickUpWetWeed2(wwamount)
    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
    QBCore.Functions.Progressbar('falar_empregada', 'Picking Up Some Wet Bud...', 5000, false, true, {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        if Config.DebugCode then print(wwamount.."pickupweed2") end
        TriggerServerEvent('sayer-weedshop:server:PickupFinished', wwamount)
        QBCore.Functions.Notify('You got some wet bud!', 'primary', 7500)
        Wait(200)
        if Config.Phone == 'qb' then
            TriggerServerEvent('qb-phone:server:sendNewMail', {sender = 'Mr Mexicans',subject = 'Enjoy it man...',message = 'Always a pleasure doing business with you. come back anytime man',})
        elseif Config.Phone == 'qs' then
            TriggerServerEvent('qs-smartphone:server:sendNewMail', {sender = 'Mr Mexicans',subject = 'Enjoy it man...',message = 'Always a pleasure doing business with you. come back anytime man',})
        elseif Config.Phone == 'gk' then
            TriggerServerEvent('gksphone:NewMail', {sender = 'Mr Mexicans',subject = 'Enjoy it man...',message = 'Always a pleasure doing business with you. come back anytime man',})
        end
        DestroyWetZone()
        onPickup = false
        finishedPickup = true
    end, function()
        QBCore.Functions.Notify('Cancelled', 'error', 7500)
        onPickup = false
        finishedPickup = true
    end)
end

function DestroyWetZone()
    exports['qb-target']:RemoveZone("wet-pickup")
end

RegisterNetEvent("sayer-weedshop:deliveries:ReceivePayment")
AddEventHandler("sayer-weedshop:deliveries:ReceivePayment", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ReceiptChecker', function(HasItems)
    		if HasItems then
                local job = QBCore.Functions.GetPlayerData().job.name
				QBCore.Functions.Progressbar("pickup_sla", "Filing Receipts..", 4000, false, true,
                {disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
                {animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function()
					TriggerServerEvent('sayer-weedshop:server:ReceivePayment', job)
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
   				QBCore.Functions.Notify("You dont have any receipts", "error")
			end
		end)
	else
		QBCore.Functions.Notify("You must be Clocked into file receipts", "error")
	end
end)