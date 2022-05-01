local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = false
PlayerJob = {}

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "weedshop" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
	onDuty = duty
end)

RegisterNetEvent("qb-weedshop:DutyB")
AddEventHandler("qb-weedshop:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-weedshop:Tray1")
AddEventHandler("qb-weedshop:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedtray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedtray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-weedshop:Tray4")
AddEventHandler("qb-weedshop:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedtray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedtray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-weedshop:Tray3")
AddEventHandler("qb-weedshop:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedtray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedtray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("qb-weedshop:Storage")
AddEventHandler("qb-weedshop:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-weedshop:Storage2")
AddEventHandler("qb-weedshop:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Weed Creations
RegisterNetEvent("qb-weedshop:giftset")
AddEventHandler("qb-weedshop:giftset", function()
		local randomGift = math.random(10,10)
		--remove box
		TriggerServerEvent('QBCore:Server:RemoveItem', "weed-gift-set", 1)
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "joint", 5)
		TriggerServerEvent('QBCore:Server:AddItem', "lighter", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "weed_white-widow_seed", 1)

		if randomGift < 4 then
					TriggerServerEvent('QBCore:Server:AddItem', "casinochips", 10)
					
		elseif randomGift == 4 then
					TriggerServerEvent('QBCore:Server:AddItem', "weed_purple-haze_seed", 1)
            		
		elseif randomGift < 10 and randomGift > 4 then
					TriggerServerEvent('QBCore:Server:AddItem', "empty_weed_bag", 1)
					
		elseif randomGift == 10 then
					TriggerServerEvent('QBCore:Server:AddItem', "joint", 1)
            		
		elseif randomGift > 10 and randomGift < 15 then
            		QBCore.Functions.Notify("No surprise in Box Looool", "error")
		elseif randomGift == 15 then
					TriggerServerEvent('QBCore:Server:AddItem', "weed_nutrition", 1)
            					
        end
end)

RegisterNetEvent("qb-weedshop:creategiftset")
AddEventHandler("qb-weedshop:creategiftset", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:get:ingredientgiftset', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making A Gift Set..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "joint", 5)
                    			TriggerServerEvent('QBCore:Server:RemoveItem', "gift-box", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "streetweed", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "weed-gift-set", 1)
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

RegisterNetEvent("qb-weedshop:joint")
AddEventHandler("qb-weedshop:joint", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:get:ingredientjoint', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Joints..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "streetweed", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "joint", 1)
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

RegisterNetEvent("qb-weedshop:weedbrownie")
AddEventHandler("qb-weedshop:weedbrownie", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:get:ingredientweedbrownie', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Making Brownie..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "brownie-mix", 3)
					TriggerServerEvent('QBCore:Server:RemoveItem', "streetweed", 6)
					TriggerServerEvent('QBCore:Server:AddItem', "weed-brownie", 10)
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

RegisterNetEvent("qb-weedshop:weed-drink")
AddEventHandler("qb-weedshop:weed-drink", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:get:ingredientweed-drink', function(HasItems)  
    		if HasItems then
				QBCore.Functions.Progressbar("pickup_sla", "Mixing up an Energy Drink..", 4000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {
					animDict = "mp_common",
					anim = "givetake1_a",
					flags = 8,
				}, {}, {}, function() -- Done
					TriggerServerEvent('QBCore:Server:RemoveItem', "aluminumcan", 5)
                	TriggerServerEvent('QBCore:Server:RemoveItem', "drink-mix", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "streetweed", 2)
					TriggerServerEvent('QBCore:Server:AddItem', "weed-drink", 5)
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

RegisterNetEvent("qb-weedshop:Grind")
AddEventHandler("qb-weedshop:Grind", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           GrindWeed()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'weedbud')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)


RegisterNetEvent("qb-weedshop:DryWeed")
AddEventHandler("qb-weedshop:DryWeed", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           DryWeed()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'wet_weed')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)


-- Functions --
function GrindWeed()
	TriggerServerEvent('QBCore:Server:RemoveItem', "weedbud", 1)
	QBCore.Functions.Progressbar("pickup", "Grinding the Bud..", 4000, false, true, {
	    disableMovement = true,
	    disableCarMovement = true,
	    disableMouse = false,
	    disableCombat = true,
	},{
	    animDict = "amb@prop_human_bbq@male@base",
	    anim = "base",
	    flags = 8,
	    }
	)
	Citizen.Wait(4000)
	TriggerServerEvent('QBCore:Server:AddItem', "streetweed", 2)
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["streetweed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end


function DryWeed()
    TriggerServerEvent('QBCore:Server:RemoveItem', "wet_weed", 1)
    QBCore.Functions.Progressbar("pickup", "Drying The Weed..", 4000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    },{
        animDict = "amb@prop_human_bbq@male@base",
        anim = "base",
        flags = 8,
    }    
)
    Citizen.Wait(4000)
    TriggerServerEvent('QBCore:Server:AddItem', "weedbud", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weedbud"], "add")
    QBCore.Functions.Notify("You dried the weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end


RegisterNetEvent("qb-weedshop:shop")
AddEventHandler("qb-weedshop:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "weedshop", Config.Items)
end)
