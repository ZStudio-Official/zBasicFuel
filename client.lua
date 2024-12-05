local Framework = nil

-- Framework detection
if Config.Framework == "esx" then
    Framework = exports['es_extended']:getSharedObject()
elseif Config.Framework == "qbcore" then
    Framework = exports['qb-core']:GetCoreObject()
end

-- Check for vehicle
local function GetPlayerVehicle()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        return GetVehiclePedIsIn(ped, false)
    end
    return nil
end

-- Refuel command
RegisterCommand(Config.Commands.Refuel, function()
    local vehicle = GetPlayerVehicle()
    if vehicle then
        if Config.FuelScript == "x-fuel" then
            exports['x-fuel']:SetFuel(vehicle, 100.0)
        elseif Config.FuelScript == "legacyfuel" then
            SetVehicleFuelLevel(vehicle, 100.0)
        end
        Framework.ShowNotification(Config.Notifications.RefuelSuccess)
    else
        Framework.ShowNotification(Config.Notifications.NoVehicle)
    end
end)

-- Drain command
RegisterCommand(Config.Commands.Drain, function()
    local vehicle = GetPlayerVehicle()
    if vehicle then
        if Config.FuelScript == "x-fuel" then
            exports['x-fuel']:SetFuel(vehicle, 0.0)
        elseif Config.FuelScript == "legacyfuel" then
            SetVehicleFuelLevel(vehicle, 0.0)
        end
        Framework.ShowNotification(Config.Notifications.DrainSuccess)
    else
        Framework.ShowNotification(Config.Notifications.NoVehicle)
    end
end)