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
    exports['qb-target']:SpawnPed({
        model = Config.WeedGaragePedModel,
        coords = Config.WeedGaragePedLocation, 
        minusOne = true, --may have to change this if your ped is in the ground
        freeze = true, 
        invincible = true, 
        blockevents = true,
        scenario = 'WORLD_HUMAN_DRUG_DEALER',
        target = { 
            options = {
                {
                    type="client",
                    event = "garage:WeedShopGarage",
                    icon = "fas fa-car",
                    label = "Tox"
                }
            },
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

RegisterNetEvent('qb-weedshop:garage')
AddEventHandler('qb-weedshop:garage', function(ws)
    local vehicle = ws.vehicle
    local coords = Config.SpawnWeedVehicle
        if PlayerData.job.name == 'weedshop' then
            if vehicle == Config.WeedVehicleModel then		
                QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                    SetVehicleNumberPlateText(veh, "WEED69"..tostring(math.random(1000, 9999)))
                    exports['LegacyFuel']:SetFuel(veh, 100.0)
                    SetEntityHeading(veh, coords.w)
                    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                    SetVehicleEngineOn(veh, true, true)
                end, coords, true)
            end
        else
            QBCore.Functions.Notify('You are not an employee of Weed Shop.', 'error')
        end
end)

RegisterNetEvent('qb-weedshop:storecar')
AddEventHandler('qb-weedshop:storecar', function()
    QBCore.Functions.Notify('Weed Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)

RegisterNetEvent('garage:WeedShopGarage', function()
    exports['qb-menu']:openMenu({
        {
            header = "| WeedShop Garage |",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = Config.WeedVehicleModel,
            txt = "Weed Shop Delivery Van",
            params = {
                event = "qb-weedshop:garage",
                args = {
                    vehicle = Config.WeedVehicleModel,
                }
            }
        },
        {
            header = "• Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "qb-weedshop:storecar",
                args = {
                    
                }
            }
        },	
        {
            header = "Close (ESC)",
            isMenuHeader = true,
        },	
    })
end)
