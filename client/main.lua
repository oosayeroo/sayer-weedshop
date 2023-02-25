local QBCore = exports['qb-core']:GetCoreObject()
isLoggedIn = false
local onDuty = true
PlayerJob = {}
local blipcord = nil

Citizen.CreateThread(function()
    if Config.MLO == 'legion' then
        blipcord = 377.39, -833.21, 29.29
    elseif Config.MLO == 'blazeit' then
        blipcord = 378.61, -1267.71, 32.47
    elseif Config.MLO == 'widow' then
        blipcord = 208.04, -237.88, 53.85
    end
    WeedShop = AddBlipForCoord(blipcord)
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
            if PlayerData.job.name == Config.JobName then
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

RegisterNetEvent("sayer-weedshop:DutyB")
AddEventHandler("sayer-weedshop:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("sayer-weedshop:Tray1")
AddEventHandler("sayer-weedshop:Tray1", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedtray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedtray1", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("sayer-weedshop:Tray4")
AddEventHandler("sayer-weedshop:Tray4", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedtray4")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedtray4", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("sayer-weedshop:Tray3")
AddEventHandler("sayer-weedshop:Tray3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedtray3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedtray3", {
        maxweight = 10000,
        slots = 6,
    })
end)

RegisterNetEvent("sayer-weedshop:Storage")
AddEventHandler("sayer-weedshop:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("sayer-weedshop:Storage2")
AddEventHandler("sayer-weedshop:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("sayer-weedshop:Storage3")
AddEventHandler("sayer-weedshop:Storage3", function()
    TriggerEvent("inventory:client:SetCurrentStash", "weedstorage3")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "weedstorage3", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("sayer-weedshop:shop")
AddEventHandler("sayer-weedshop:shop", function()
    if Config.JimShops == true then
        TriggerServerEvent("jim-shops:ShopOpen", "shop", "weedshop", Config.Items)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "shop", "weedshop", Config.Items)
    end
end)

function DreamJointEffect()
    local startStamina = 30
    Wait(3000)
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

RegisterNetEvent('sayer-weedshop:use-dream-joint', function()
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

RegisterNetEvent('sayer-weedshop:use-hazy-joint', function()
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

RegisterNetEvent('sayer-weedshop:use-crush-joint', function()
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

RegisterNetEvent('sayer-weedshop:use-bloomer-joint', function()
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

RegisterNetEvent('sayer-weedshop:Egobar', function(itemName)
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

RegisterNetEvent('sayer-weedshop:Can', function(itemName)
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

-- local smoking = false
-- RegisterNetEvent('sayer-weedshop:UseJoint', function(itemName)
