Config = {}

-- Set framework: "esx" or "qbcore"
Config.Framework = "esx" -- Change to "qbcore" if using QBCore

-- Set fuel script: "x-fuel" or "legacyfuel"
Config.FuelScript = "x-fuel" -- Change to "legacyfuel" if using Legacy Fuel

-- Commands
Config.Commands = {
    Refuel = "getfuel", -- Command to refill fuel
    Drain = "drainfuel" -- Command to drain fuel
}

-- Notifications
Config.Notifications = {
    RefuelSuccess = "You have refueled the vehicle!",
    DrainSuccess = "You have drained the vehicle's fuel!",
    NoVehicle = "You are not in a vehicle!"
}