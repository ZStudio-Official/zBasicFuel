local currentVersion = "1.0.0" -- Set your script version here
local resourceName = GetCurrentResourceName()

-- Function to check for updates
function CheckForUpdates()
    PerformHttpRequest("https://api.github.com/repos/ZStudio-Official/zFuel/releases/latest", function(err, response, headers)
        if err ~= 200 then
            print("^1[WARNING]^7 Unable to check for updates. HTTP Error: " .. err)
            return
        end

        local data = json.decode(response)
        if data and data.tag_name then
            local latestVersion = data.tag_name
            if latestVersion ~= currentVersion then
                print("^1[OUTDATED]^7 Your version (" .. currentVersion .. ") is outdated. Latest version is (" .. latestVersion .. ").")
                print("^2[INFO]^7 Download the latest version here: " .. data.html_url)
            else
                print("^2[UP TO DATE]^7 Your resource is up to date!")
            end
        else
            print("^1[WARNING]^7 Unable to parse version data from GitHub.")
        end
    end, "GET", "", {["User-Agent"] = "FiveM Script"})
end

-- Print a message in txAdmin console and check for updates when the script starts
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        print("^2[FUEL SCRIPT]^7 Script has started successfully!")
        CheckForUpdates()
    end
end)