local QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
local pedspawned = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
function QBCore.Functions.GetPlayerData(cb)
    if cb then
        cb(QBCore.PlayerData)
    else
        return QBCore.PlayerData
    end
end

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
     	PlayerData.job = job
end)

RegisterNetEvent('QBCore:Player:SetPlayerData')
AddEventHandler('QBCore:Player:SetPlayerData', function(val)
	PlayerData = val
end)

Citizen.CreateThread(function()
    local pedloc = nil
    if Config.MLO == 'legion' then
        pedloc = vector4(372.18, -827.04, 29.29, 90.12)
    elseif Config.MLO == 'blazeit' then
        pedloc = vector4(345.26, -1252.31, 32.51, 54.83)
    elseif Config.MLO == 'widow' then
        pedloc = vector4(195.14, -271.96, 49.47, 232.06)
    end
    exports['qb-target']:SpawnPed({model = Config.WeedGaragePedModel,coords = pedloc, minusOne = true, freeze = true, invincible = true, blockevents = true,scenario = 'WORLD_HUMAN_DRUG_DEALER',
        target = { options = {{type="client",event = "garage:WeedShopGarage",icon = "fas fa-car",label = "Tox"}},
            distance = 2.5,
        },
    })
end)


function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(5)
    end
end

RegisterNetEvent('sayer-weedshop:garage')
AddEventHandler('sayer-weedshop:garage', function(ws, livery)
    local vehicle = ws.vehicle
    local coords = nil
    if Config.MLO == 'legion' then
        coords = vector4(368.15, -827.12, 29.29, 182.61)
    elseif Config.MLO == 'blazeit' then
        coords = vector4(341.84, -1245.21, 32.51, 351.92)
    elseif Config.MLO == 'widow' then
        coords = vector4(198.95, -269.02, 50.07, 244.27)
    end
    if PlayerData.job.name == 'weedshop' then		
        QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            SetVehicleNumberPlateText(veh, "WEED69"..tostring(math.random(1000, 9999)))
            SetVehicleLivery(veh, livery)
            exports['LegacyFuel']:SetFuel(veh, 100.0)
            SetEntityHeading(veh, coords.w)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
        end, coords, true)
    else
        QBCore.Functions.Notify('You are not an employee of Weed Shop.', 'error')
    end
end)

RegisterNetEvent('sayer-weedshop:storecar')
AddEventHandler('sayer-weedshop:storecar', function()
    QBCore.Functions.Notify('Weed Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)

RegisterNetEvent('garage:WeedShopGarage', function()
    local columns = {
        {header = "| WeedShop Garage |",isMenuHeader = true, },
        {header = "• Store Vehicle",txt = "Store Vehicle Inside Garage",params = {event = "sayer-weedshop:storecar",args = {}}},}
        for k,v in pairs(Config.WeedVehicles) do
            local vehicle = {}
            local txt = "Take out this vehicle"
            
            vehicle.header = v.Label
            vehicle.params = {event = "sayer-weedshop:garage",args = {vehicle = v.Model,livery = v.Livery}}
            table.insert(columns, vehicle)
        end
    exports['qb-menu']:openMenu(columns)
end)
