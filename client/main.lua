local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
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

Citizen.CreateThread(function()
    WeedShop = AddBlipForCoord(377.39, -833.21, 29.29)
    SetBlipSprite (WeedShop, 469)
    SetBlipDisplay(WeedShop, 4)
    SetBlipScale  (WeedShop, 0.7)
    SetBlipAsShortRange(WeedShop, true)
    SetBlipColour(WeedShop, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("WeedShop")
    EndTextCommandSetBlipName(WeedShop)
end) 


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

CreateThread(function()
    if Config.WSDrawText == "enabled" then 
        while true do
            sleep = 100
            local pos = GetEntityCoords(PlayerPedId())
            local PlayerData = QBCore.Functions.GetPlayerData()
  
                if PlayerJob.name == Config.JobName then
                    for k, v in pairs(Config.WeedshopLocations["weedshop-duty"]) do
                        local dist = #(pos - v)
                            if dist < 1.8 then
                              DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 16, 227, 86, 86, false, false, false, true, false, false, false)                              if dist < 1.8 then
                                    sleep = 5
                                    if not onDuty then
                                        QBCore.Functions.DrawText3D(v.x, v.y, v.z +0.2, "~g~E~w~ - Go on duty")
                                        --QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Go off duty")
                                    else
                                        QBCore.Functions.DrawText3D(v.x, v.y, v.z +0.2, "~r~E~w~ - Go off duty")
                                        --QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Go on duty")
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        onDuty = not onDuty
                                        TriggerServerEvent("QBCore:ToggleDuty")
                                    end
                                end
                            elseif #(pos - v) < 1.5 then
                                sleep = false
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Time Clock")
                            end
                        end
                    end
  
                  for k, v in pairs(Config.WeedshopLocations["weed-tray1"]) do
                  if #(pos - vector3(v.x, v.y, v.z)) < 0.9 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Access Tray")
                      if IsControlJustReleased(0, 38) then
                          TriggerEvent("qb-weedshop:Tray1")
                      end
                  elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Access Tray")
                  end
              end
  
                if PlayerJob.name == Config.JobName and QBCore.Functions.GetPlayerData().job.onduty then
                for k, v in pairs(Config.WeedshopLocations["weedshop-dryer"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 0.8 then
                      sleep = 5
                      QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Dry Weed")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-menu:DryWeed")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Dry Weed")
                    end
                  end
  
                for k, v in pairs(Config.WeedshopLocations["weedshop-grind"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 0.9 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Grind Weed")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-menu:GrindWeed")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Grind Weed")
                    end
                end
  
                for k, v in pairs(Config.WeedshopLocations["weedshop-menu"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Open Menu")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-menu:WeedMenu")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Open Menu")
                    end
                end
  
                for k, v in pairs(Config.WeedshopLocations["weedshop-storage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Access Storage")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-weedshop:Storage")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Access Storage")
                    end
                end
  
                  for k, v in pairs(Config.WeedshopLocations["weedshop-craft"]) do
                      if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                          sleep = 5
                          QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Craft Products")
                          if IsControlJustReleased(0, 38) then
                              TriggerEvent("qb-menu:Weed")
                          end
                      elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                          sleep = 5
                          QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Craft Products")
                      end
                  end
  
                  for k, v in pairs(Config.WeedshopLocations["weedshop-register"]) do
                      if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                          sleep = 5
                          QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Bill")
                          if IsControlJustReleased(0, 38) then
                              TriggerEvent("qb-weedshop:bill")
                          end
                      elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                          sleep = 5
                          QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Bill")
                      end
                  end
 
                for k, v in pairs(Config.WeedshopLocations["weedshop-garage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.0 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~[E]~w~ - Access Garage")
                        if IsControlJustReleased(0, 38) then
                          TriggerEvent("garage:WeedShopGarage")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        sleep = 5
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Access Garage")
                    end
                end
            end
        Wait(sleep)
    end
    end
  end)

--Weed Creations
RegisterNetEvent("qb-weedshop:giftset")
AddEventHandler("qb-weedshop:giftset", function()
		local randomGift = math.random(10,10)
		--remove box
		TriggerServerEvent('QBCore:Server:RemoveItem', "weed-gift-set", 1)
		--add items from box
		TriggerServerEvent('QBCore:Server:AddItem', "joint", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "dream-joint", 1)
		TriggerServerEvent('QBCore:Server:AddItem', "hazy-joint", 1)
                TriggerServerEvent('QBCore:Server:AddItem', "crush-joint", 1)
                TriggerServerEvent('QBCore:Server:AddItem', "bloomer-joint", 1)

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
					TriggerServerEvent('QBCore:Server:RemoveItem', "joint", 1)
                    			TriggerServerEvent('QBCore:Server:RemoveItem', "gift-box", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "dream-joint", 1)
                                        TriggerServerEvent('QBCore:Server:RemoveItem', "hazy-joint", 1)
                                        TriggerServerEvent('QBCore:Server:RemoveItem', "crush-joint", 1)
                                        TriggerServerEvent('QBCore:Server:RemoveItem', "bloomer-joint", 1)
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

RegisterNetEvent("qb-weedshop:CreateDream")
AddEventHandler("qb-weedshop:CreateDream", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:get:ingredientdream', function(HasItems)  
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "dream-weed", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "dream-joint", 1)
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

RegisterNetEvent("qb-weedshop:CreateHazy")
AddEventHandler("qb-weedshop:CreateHazy", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:get:ingredienthazy', function(HasItems)  
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "hazy-weed", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "hazy-joint", 1)
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

RegisterNetEvent("qb-weedshop:CreateCrush")
AddEventHandler("qb-weedshop:CreateCrush", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:get:ingredientcrush', function(HasItems)  
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "crush-weed", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "crush-joint", 1)
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

RegisterNetEvent("qb-weedshop:CreateBloomer")
AddEventHandler("qb-weedshop:CreateBloomer", function()
    if onDuty then
    	QBCore.Functions.TriggerCallback('qb-weedshop:server:get:ingredientbloomer', function(HasItems)  
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "bloomer-weed", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "rolling_paper", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "bloomer-joint", 1)
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
					TriggerServerEvent('QBCore:Server:RemoveItem', "brownie-mix", 1)
					TriggerServerEvent('QBCore:Server:RemoveItem', "streetweed", 1)
					TriggerServerEvent('QBCore:Server:AddItem', "weed-brownie", 5)
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

RegisterNetEvent("qb-weedshop:GrindDream")
AddEventHandler("qb-weedshop:GrindDream", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           GrindDream()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'dream-bud')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-weedshop:GrindHazy")
AddEventHandler("qb-weedshop:GrindHazy", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           GrindHazy()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'hazy-bud')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-weedshop:GrindCrush")
AddEventHandler("qb-weedshop:GrindCrush", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           GrindCrush()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'crush-bud')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-weedshop:GrindBloomer")
AddEventHandler("qb-weedshop:GrindBloomer", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           GrindBloomer()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'bloomer-bud')
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

RegisterNetEvent("qb-weedshop:DryDream")
AddEventHandler("qb-weedshop:DryDream", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           DryDream()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'wet_weed')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-weedshop:DryHazy")
AddEventHandler("qb-weedshop:DryHazy", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           DryHazy()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'wet_weed')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-weedshop:DryCrush")
AddEventHandler("qb-weedshop:DryCrush", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           DryCrush()
        else
            QBCore.Functions.Notify("You don't have the right stuff..", "error")
        end
      end, 'wet_weed')
    else
        QBCore.Functions.Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-weedshop:DryBloomer")
AddEventHandler("qb-weedshop:DryBloomer", function()
    if onDuty then
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
           DryBloomer()
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

function GrindDream()
	TriggerServerEvent('QBCore:Server:RemoveItem', "dream-bud", 1)
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
	TriggerServerEvent('QBCore:Server:AddItem', "dream-weed", 2)
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dream-weed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function GrindHazy()
	TriggerServerEvent('QBCore:Server:RemoveItem', "hazy-bud", 1)
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
	TriggerServerEvent('QBCore:Server:AddItem', "hazy-weed", 2)
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazy-weed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function GrindCrush()
	TriggerServerEvent('QBCore:Server:RemoveItem', "crush-bud", 1)
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
	TriggerServerEvent('QBCore:Server:AddItem', "crush-weed", 2)
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crush-weed"], "add")
	QBCore.Functions.Notify("You Grind The Weed", "success")
	StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function GrindBloomer()
	TriggerServerEvent('QBCore:Server:RemoveItem', "bloomer-bud", 1)
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
	TriggerServerEvent('QBCore:Server:AddItem', "bloomer-weed", 2)
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bloomer-weed"], "add")
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

function DryDream()
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
    TriggerServerEvent('QBCore:Server:AddItem', "dream-bud", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dream-bud"], "add")
    QBCore.Functions.Notify("You dried the weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function DryHazy()
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
    TriggerServerEvent('QBCore:Server:AddItem', "hazy-bud", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazy-bud"], "add")
    QBCore.Functions.Notify("You dried the weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function DryCrush()
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
    TriggerServerEvent('QBCore:Server:AddItem', "crush-bud", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crush-bud"], "add")
    QBCore.Functions.Notify("You dried the weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end

function DryBloomer()
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
    TriggerServerEvent('QBCore:Server:AddItem', "bloomer-bud", 1)
    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bloomer-bud"], "add")
    QBCore.Functions.Notify("You dried the weed", "success")
    StopAnimTask(PlayerPedId(), "amb@prop_human_bbq@male@base", "base", 1.0)
end


RegisterNetEvent("qb-weedshop:shop")
AddEventHandler("qb-weedshop:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "weedshop", Config.Items)
end)

function DreamJointEffect()
    local startStamina = 30
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
end

RegisterNetEvent('qb-weedshop:use-dream-joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["dream-joint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
		DreamJointEffect()
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

function HazyJointEffect()
    local startStamina = 20
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 20 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 10 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
        end
        if math.random(1, 300) < 10 then
            AlienEffect()
            Wait(math.random(3000, 6000))
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

RegisterNetEvent('qb-weedshop:use-hazy-joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["hazy-joint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
		HazyJointEffect()
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

function CrushJointEffect()
    local startStamina = 8
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(1, 100) < 60 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 2000), math.random(1000, 2000), 3, 0, 0, 0)
        end
        if math.random(1, 100) < 51 then
            AlienEffect()
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
    end

    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

RegisterNetEvent('qb-weedshop:use-crush-joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crush-joint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
		CrushJointEffect()
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

function BloomerJointEffect()
    local startStamina = 8
    TrevorEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 100) < 51 then
            TrevorEffect()
        end
    end
    startStamina = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

RegisterNetEvent('qb-weedshop:use-bloomer-joint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["bloomer-joint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"joint"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
		BloomerJointEffect()
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('qb-weedshop:Egobar', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeBrownie[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
		TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
    end)
end)

ConsumeBrownie = {
		["weed-brownie"] = math.random(35, 45),
}

RegisterNetEvent('qb-weedshop:Can', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"soda"})
    QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeDrink[itemName])
    end)
end)

ConsumeDrink = {
	    ["weed-drink"] = math.random(35, 45),
}

function TrevorEffect()
    StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
    Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
    Wait(3000)
	StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
	StopScreenEffect("DrugsTrevorClownsFight")
	StopScreenEffect("DrugsTrevorClownsFightIn")
	StopScreenEffect("DrugsTrevorClownsFightOut")
end

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end
