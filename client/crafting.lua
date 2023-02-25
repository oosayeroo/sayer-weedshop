local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}

RegisterNetEvent("sayer-weedshop:creategiftset")
AddEventHandler("sayer-weedshop:creategiftset", function()
    if onDuty then
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
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("sayer-weedshop:joint")
AddEventHandler("sayer-weedshop:joint", function()
    if onDuty then
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
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("sayer-weedshop:CreateDream")
AddEventHandler("sayer-weedshop:CreateDream", function()
    if onDuty then
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
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("sayer-weedshop:CreateHazy")
AddEventHandler("sayer-weedshop:CreateHazy", function()
    if onDuty then
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
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("sayer-weedshop:CreateCrush")
AddEventHandler("sayer-weedshop:CreateCrush", function()
    if onDuty then
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
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("sayer-weedshop:CreateBloomer")
AddEventHandler("sayer-weedshop:CreateBloomer", function()
    if onDuty then
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
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("sayer-weedshop:weedbrownie")
AddEventHandler("sayer-weedshop:weedbrownie", function()
    if onDuty then
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
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end
end)

RegisterNetEvent("sayer-weedshop:weed-drink")
AddEventHandler("sayer-weedshop:weed-drink", function()
    if onDuty then
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
	else 
		QBCore.Functions.Notify("You must be Clocked into work", "error")
	end  
end)

RegisterNetEvent("sayer-weedshop:Grind")
AddEventHandler("sayer-weedshop:Grind", function()
    if onDuty then
        if QBCore.Functions.HasItem("weedbud") and ("weed-grinder") then
           GrindWeed()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("sayer-weedshop:GrindDream")
AddEventHandler("sayer-weedshop:GrindDream", function()
    if onDuty then
        if QBCore.Functions.HasItem("dream-bud") and ("weed-grinder") then
           GrindDream()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("sayer-weedshop:GrindHazy")
AddEventHandler("sayer-weedshop:GrindHazy", function()
    if onDuty then
        if QBCore.Functions.HasItem("hazy-bud") and ("weed-grinder") then
           GrindHazy()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("sayer-weedshop:GrindCrush")
AddEventHandler("sayer-weedshop:GrindCrush", function()
    if onDuty then
        if QBCore.Functions.HasItem("crush-bud") and ("weed-grinder") then
           GrindCrush()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("sayer-weedshop:GrindBloomer")
AddEventHandler("sayer-weedshop:GrindBloomer", function()   
    if onDuty then
        if QBCore.Functions.HasItem("bloomer-bud") and ("weed-grinder") then
           GrindBloomer()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)


RegisterNetEvent("sayer-weedshop:DryWeed")
AddEventHandler("sayer-weedshop:DryWeed", function()
    if onDuty then
        if QBCore.Functions.HasItem("wet_weed") then
           DryWeed()
        else
            QBCore.Functions.Notify("You don't have any weed..", "error")
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("sayer-weedshop:DryDream")
AddEventHandler("sayer-weedshop:DryDream", function()
    if onDuty then
        if QBCore.Functions.HasItem('infusion-kit') then
            if QBCore.Functions.HasItem("wet_weed") then
                DryDream()
            else
                QBCore.Functions.Notify("You don't have any weed..", "error")
            end
        else
            QBCore.Functions.Notify('You Need an Infusion Kit', 'error')
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("sayer-weedshop:DryHazy")
AddEventHandler("sayer-weedshop:DryHazy", function()
    if onDuty then
        if QBCore.Functions.HasItem('infusion-kit') then
            if QBCore.Functions.HasItem("wet_weed") then
                DryHazy()
            else
                QBCore.Functions.Notify("You don't have any weed..", "error")
            end
        else
            QBCore.Functions.Notify('You Need an Infusion Kit', 'error')
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("sayer-weedshop:DryCrush")
AddEventHandler("sayer-weedshop:DryCrush", function()
    if onDuty then
        if QBCore.Functions.HasItem('infusion-kit') then
            if QBCore.Functions.HasItem("wet_weed") then
                DryCrush()
            else
                QBCore.Functions.Notify("You don't have any weed..", "error")
            end
        else
            QBCore.Functions.Notify('You Need an Infusion Kit', 'error')
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("sayer-weedshop:DryBloomer")
AddEventHandler("sayer-weedshop:DryBloomer", function()
    if onDuty then
        if QBCore.Functions.HasItem('infusion-kit') then
            if QBCore.Functions.HasItem("wet_weed") then
                DryBloomer()
            else
                QBCore.Functions.Notify("You don't have any weed..", "error")
            end
        else
            QBCore.Functions.Notify('You Need an Infusion Kit', 'error')
        end
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

-- Functions --
function GrindWeed()
	QBCore.Functions.Progressbar("pickup", "Grinding the Bud..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
	Citizen.Wait(4000)
	TriggerServerEvent('sayer-weedshop:server:grindstreet')
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["streetweed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.GrinderCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.GrinderBreakChance then
            TriggerServerEvent('sayer-weedshop:GrinderBroke')
            QBCore.Functions.Notify('Your Grinder Broke', 'error')
        end
    end
end

function GrindDream()
	QBCore.Functions.Progressbar("pickup", "Grinding the Bud..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
	Citizen.Wait(4000)
	TriggerServerEvent('sayer-weedshop:server:grinddream')
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dream-weed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.GrinderCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.GrinderBreakChance then
            TriggerServerEvent('sayer-weedshop:GrinderBroke')
            QBCore.Functions.Notify('Your Grinder Broke', 'error')
        end
    end
end

function GrindHazy()
	QBCore.Functions.Progressbar("pickup", "Grinding the Bud..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
	Citizen.Wait(4000)
	TriggerServerEvent('sayer-weedshop:server:grindhazy')
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazy-weed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.GrinderCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.GrinderBreakChance then
            TriggerServerEvent('sayer-weedshop:GrinderBroke')
            QBCore.Functions.Notify('Your Grinder Broke', 'error')
        end
    end
end

function GrindCrush()
	QBCore.Functions.Progressbar("pickup", "Grinding the Bud..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
	Citizen.Wait(4000)
	TriggerServerEvent('sayer-weedshop:server:grindcrush')
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crush-weed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.GrinderCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.GrinderBreakChance then
            TriggerServerEvent('sayer-weedshop:GrinderBroke')
            QBCore.Functions.Notify('Your Grinder Broke', 'error')
        end
    end
end

function GrindBloomer()
	QBCore.Functions.Progressbar("pickup", "Grinding the Bud..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
	Citizen.Wait(4000)
	TriggerServerEvent('sayer-weedshop:server:grindbloomer')
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bloomer-weed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.GrinderCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.GrinderBreakChance then
            TriggerServerEvent('sayer-weedshop:GrinderBroke')
            QBCore.Functions.Notify('Your Grinder Broke', 'error')
        end
    end
end


function DryWeed()
    QBCore.Functions.Progressbar("pickup", "Drying The Weed..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
    Citizen.Wait(4000)
    TriggerServerEvent('sayer-weedshop:server:drystreet')
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weedbud"], "add")
    QBCore.Functions.Notify("You dried the weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function DryDream()
    QBCore.Functions.Progressbar("pickup", "Drying The Weed..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
    Citizen.Wait(4000)
    TriggerServerEvent('sayer-weedshop:server:drydream')
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dream-bud"], "add")
    QBCore.Functions.Notify("You Infused Some Dream Weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.InfusionCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.InfusionBreakChance then
            TriggerServerEvent('sayer-weedshop:InfusionBroke')
            QBCore.Functions.Notify('Your Kit Broke', 'error')
        end
    end
end

function DryHazy()
    QBCore.Functions.Progressbar("pickup", "Drying The Weed..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
    Citizen.Wait(4000)
    TriggerServerEvent('sayer-weedshop:server:dryhazy')
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazy-bud"], "add")
    QBCore.Functions.Notify("You Infused Some Hazy Weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.InfusionCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.InfusionBreakChance then
            TriggerServerEvent('sayer-weedshop:InfusionBroke')
            QBCore.Functions.Notify('Your Kit Broke', 'error')
        end
    end
end

function DryCrush()
    QBCore.Functions.Progressbar("pickup", "Drying The Weed..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
    Citizen.Wait(4000)
    TriggerServerEvent('sayer-weedshop:server:drycrush')
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crush-bud"], "add")
    QBCore.Functions.Notify("You Infused Some Crush Weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.InfusionCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.InfusionBreakChance then
            TriggerServerEvent('sayer-weedshop:InfusionBroke')
            QBCore.Functions.Notify('Your Kit Broke', 'error')
        end
    end
end

function DryBloomer()
    QBCore.Functions.Progressbar("pickup", "Drying The Weed..", Config.CraftingTime * 1000, false, true, 
	{disableMovement = true,disableCarMovement = true,disableMouse = false,disableCombat = true,},
	{animDict = "amb@prop_human_bbq@male@base",anim = "base",flags = 8,})
    Citizen.Wait(4000)
    TriggerServerEvent('sayer-weedshop:server:drybloomer')
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bloomer-bud"], "add")
    QBCore.Functions.Notify("You Infused Some Bloomer Weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
    if Config.InfusionCanBreak then
        local chance = math.random(0, 100)
        if chance < Config.InfusionBreakChance then
            TriggerServerEvent('sayer-weedshop:InfusionBroke')
            QBCore.Functions.Notify('Your Kit Broke', 'error')
        end
    end
end