local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}
local isbusy = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
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

RegisterNetEvent("sayer-weedshop:DutyB")
AddEventHandler("sayer-weedshop:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("sayer-weedshop:Counter", function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job.name
        TriggerEvent("inventory:client:SetCurrentStash", "weedcounter"..PlayerJob)
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedcounter"..PlayerJob, {
        maxweight = Config.JobCounterWeight*1000,
        slots = Config.JobCounterSlots,
        })
    end)
end)

RegisterNetEvent("sayer-weedshop:Storage", function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job.name
        TriggerEvent("inventory:client:SetCurrentStash", "weedstorage"..PlayerJob)
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedstorage"..PlayerJob, {
        maxweight = Config.JobStorageWeight*1000,
        slots = Config.JobStorageSlots,
        })
    end)
end)

RegisterNetEvent("sayer-weedshop:shop")
AddEventHandler("sayer-weedshop:shop", function()
    if Config.JimShops == true then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "weedshop", Config.Items)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "weedshop", Config.Items)
    end
end)

RegisterNetEvent('sayer-weedshop:RequireCheck', function(args)
    if args.RequireItem then
        if QBCore.Functions.HasItem(args.RequireItem) then
            TriggerEvent('sayer-weedshop:UseItem', args)
            if args.RemoveRequired then
                TriggerServerEvent('sayer-weedshop:RemoveItem', args.RequireItem)
            end
        else
            local item = args.RequireItem
            local Label = QBCore.Shared.Items[item].label
            QBCore.Functions.Notify("You Need a "..Label.."!")
        end
    else
        TriggerEvent('sayer-weedshop:UseItem', args)
    end
end)

RegisterNetEvent('sayer-weedshop:UseItem', function(args)
    if not isbusy then
        isbusy = true
        local ScreenColour = ""
        local ped = PlayerPedId()
        QBCore.Functions.Progressbar("smoke_joint", "Using..", 1500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
	    	disableMouse = false,
	    	disableCombat = true,
        }, {}, {}, {}, function() -- Done
            if args.Emote then
                TriggerEvent('animations:client:EmoteCommandStart', {args.Emote})
                animplaying = true
            end
            Wait(math.random(4000,6000))
            if args.WeedSmell then
                TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
            end
            if args.RemoveItem then
                TriggerServerEvent('sayer-weedshop:RemoveItem', args.ItemName)
            end
            if args.Effect.Enable then
                local value = args.Effect
                if value.ScreenEffect then
                    if value.ScreenEffect == 'alien' then
                        ScreenColour = "DrugsMichaelAliensFightIn"
                    elseif value.ScreenEffect == 'trevor' then
                        ScreenColour = "DrugsTrevorClownsFightIn"
                    elseif value.ScreenEffect == 'mild-red' then
                        ScreenColour = "MinigameEndTrevor"
                    elseif value.ScreenEffect == 'mild-green' then
                        ScreenColour = "MinigameEndFranklin"
                    elseif value.ScreenEffect == 'mild-blue' then
                        ScreenColour = "MinigameEndMichael"
                    elseif value.ScreenEffect == 'short-green' then
                        ScreenColour = "SwitchShortFranklinIn"
                    elseif value.ScreenEffect == 'short-red' then
                        ScreenColour = "SwitchShortTrevorIn"
                    elseif value.ScreenEffect == 'noir' then
                        ScreenColour = "HeistCelebEnd"
                    elseif value.ScreenEffect == 'acid' then
                        ScreenColour = "DMT_flight"
                    end
                    AnimpostfxPlay(ScreenColour, 0, true)
                    Wait(3000)
                    if Config.DebugCode then print("ScreenColour "..ScreenColour.." ") print("Wait Done 1") end
                else
                    local time = value.EffectDuration*1000
                    Wait(time)
                    if Config.DebugCode then print("WaitDone 2") end
                end
                if value.IncreaseStamina then
                    local startStamina = 20
                    SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
                    while startStamina > 0 do
                        Wait(1000)
                        if math.random(1,100) < 50 then
                            RestorePlayerStamina(PlayerId(), 1.0)
                        end
                        startStamina = startStamina - 1
                    end
                end
                if value.CanCauseRagdoll then
                    if math.random(1, 100) < 10 and IsPedRunning(ped) then
                        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, 0, 0, 0)
                    end
                end
            else
                local time = args.Effect.EffectDuration*1000
                Wait(time)
                if Config.DebugCode then print("WaitDone 3") end
            end
            if args.StressRemove then
                TriggerServerEvent('hud:server:RelieveStress', args.StressRemove)
                if Config.DebugCode then print("Stress "..args.StressRemove.." ") end
            end
            if args.AddThirst then
                TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + args.AddThirst)
                if Config.DebugCode then print("Thirst "..args.AddThirst.." ") end
            end
            if args.AddHunger then
                TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + args.AddHunger)
                if Config.DebugCode then print("Hunger "..args.AddHunger.." ") end
            end
            if args.AddArmour then
                TriggerServerEvent('hospital:server:SetArmor', (GetPedArmour(ped) + args.AddArmour)) 
                SetPedArmour(ped, (GetPedArmour(ped) + args.AddArmour))
                if Config.DebugCode then print("Armour "..args.AddArmour.." ") end
            end
            Wait(3000)
            if Config.DebugCode then print("Wait Done 4") end
            TriggerEvent('animations:client:EmoteCommandStart', {'c'})
            animplaying = false
            if Config.DebugCode then print(animplaying) end
            AnimpostfxStop(ScreenColour)
            AnimpostfxStopAll()
            isbusy = false
            ScreenColour = ""
            if Config.DebugCode then print("Use Finished") end
        end)
    else
        QBCore.Functions.Notify('You Are Doing Something Already', 'error')
    end
end)