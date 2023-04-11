local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
PlayerJob = {}
local isbusy = false

RegisterNetEvent("sayer-weedshop:creategiftset")
AddEventHandler("sayer-weedshop:creategiftset", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredientgiftset', function(HasItems)
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Making A Gift Set..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:creategiftbox')
    			TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed-gift-set"], "add")
    			QBCore.Functions.Notify("You made a A Gift Set", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the items to make this", "error")
		end
	end)  
end)

RegisterNetEvent("sayer-weedshop:joint")
AddEventHandler("sayer-weedshop:joint", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredientjoint', function(HasItems)  
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Making Joints..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:makingjoint')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint"], "add")
                QBCore.Functions.Notify("You made a Joint", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
		end
	end)
end)

RegisterNetEvent("sayer-weedshop:bong")
AddEventHandler("sayer-weedshop:bong", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredientbong', function(HasItems)  
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Crafting Bong..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:makingbong')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bong"], "add")
                QBCore.Functions.Notify("You made a Bong", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
		end
	end)
end)

RegisterNetEvent("sayer-weedshop:CreateDream")
AddEventHandler("sayer-weedshop:CreateDream", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredientdream', function(HasItems)  
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Making Joints..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:makingdreamjoint')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dream-joint"], "add")
                QBCore.Functions.Notify("You made a Dream Joint", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
		end
	end)
end)

RegisterNetEvent("sayer-weedshop:CreateHazy")
AddEventHandler("sayer-weedshop:CreateHazy", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredienthazy', function(HasItems)  
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Making Joints..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:makinghazyjoint')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazy-joint"], "add")
                QBCore.Functions.Notify("You made a Hazy Joint", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
		end
	end)
end)

RegisterNetEvent("sayer-weedshop:CreateCrush")
AddEventHandler("sayer-weedshop:CreateCrush", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredientcrush', function(HasItems)
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Making Joints..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:makingcrushjoint')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crush-joint"], "add")
                QBCore.Functions.Notify("You made a Crush Joint", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
		end
	end)
end)

RegisterNetEvent("sayer-weedshop:CreateBloomer")
AddEventHandler("sayer-weedshop:CreateBloomer", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredientbloomer', function(HasItems)
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Making Joints..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:makingbloomerjoint')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bloomer-joint"], "add")
                QBCore.Functions.Notify("You made a Bloomer Joint", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the right stuff to make this", "error")
		end
	end)
end)

RegisterNetEvent("sayer-weedshop:weedbrownie")
AddEventHandler("sayer-weedshop:weedbrownie", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredientweedbrownie', function(HasItems)  
    	if (HasItems) then
			QBCore.Functions.Progressbar("pickup_sla", "Making Brownie..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:makingbrownie')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed-brownie"], "add")
                QBCore.Functions.Notify("You made a Weed Brownie", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
		end
	end)
end)

RegisterNetEvent("sayer-weedshop:weed-drink")
AddEventHandler("sayer-weedshop:weed-drink", function()
    QBCore.Functions.TriggerCallback('sayer-weedshop:server:get:ingredientweed-drink', function(HasItems)  
    	if HasItems then
			QBCore.Functions.Progressbar("pickup_sla", "Mixing up an Energy Drink..", Config.CraftingTime * 1000, false, true, 
			{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,}, 
			{animDict = "mp_common",anim = "givetake1_a",flags = 8,}, {}, {}, function() -- Done
				TriggerServerEvent('sayer-weedshop:server:makingweeddrink')
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weed-drink"], "add")
               	QBCore.Functions.Notify("You made an Energy Drink", "success")
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
   			QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
		end
	end)
end)

RegisterNetEvent("sayer-weedshop:DryWeed", function(itemtype)
	if QBCore.Functions.HasItem('infusion-kit') then
    	if QBCore.Functions.HasItem("wet_weed") then
    	   DryWeed(itemtype)
		   if Config.DebugCode then print("ItemType = "..itemtype.." ") end
    	else
    	    QBCore.Functions.Notify("You don't have any weed..", "error")
    	end
	else
        QBCore.Functions.Notify('You Need an Infusion Kit', 'error')
    end
end)

RegisterNetEvent("sayer-weedshop:GrindWeed", function(args)
	if QBCore.Functions.HasItem("weed-grinder") then
    	if QBCore.Functions.HasItem(args.taken) then
    	   GrindWeed(args.taken, args.given)
		   if Config.DebugCode then print(" Grind: Taken = "..args.taken..", Given = "..args.given.." ") end
    	else
    	    QBCore.Functions.Notify("You don't have the right stuff..", "error")
    	end
	else
        QBCore.Functions.Notify('You Need a Grinder', 'error')
    end
end)

-- Functions --
function GrindWeed(taken, given)
	if not isbusy then
		isbusy = true
		QBCore.Functions.Progressbar("pickup", "Grinding the Bud..", Config.CraftingTime * 1000, false, true, 
		{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
		{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
		Citizen.Wait(4000)
		TriggerServerEvent('sayer-weedshop:server:GrindWeed', taken, given)
		QBCore.Functions.Notify("You Grind The Weed", "success")
		StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
		isbusy = false
    	if Config.GrinderCanBreak then
    	    local chance = math.random(0, 100)
    	    if chance < Config.GrinderBreakChance then
    	        TriggerServerEvent('sayer-weedshop:RemoveItem', "weed-grinder")
    	        QBCore.Functions.Notify('Your Grinder Broke', 'error')
    	    end
    	end
	else
        QBCore.Functions.Notify('You Are Busy', 'error')
    end
end

function DryWeed(itemtype)
	if not isbusy then
		isbusy = true
    	QBCore.Functions.Progressbar("pickup", "Drying The Weed..", Config.CraftingTime * 1000, false, true, 
		{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
		{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
    	Citizen.Wait(4000)
    	TriggerServerEvent('sayer-weedshop:server:DryWeed', itemtype)
    	QBCore.Functions.Notify("You dried the weed", "success")
    	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
		isbusy = false
		if Config.InfusionCanBreak then
    	    local chance = math.random(0, 100)
    	    if chance < Config.InfusionBreakChance then
    	        TriggerServerEvent('sayer-weedshop:RemoveItem', "infusion-kit")
    	        QBCore.Functions.Notify('Your Kit Broke', 'error')
    	    end
    	end
	else
        QBCore.Functions.Notify('You Are Busy', 'error')
    end
end