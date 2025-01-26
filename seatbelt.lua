Config = Config or {}
QBCore = exports['qb-core']:GetCoreObject()
local seatbeltOn = true
local seatbeltOff = true
local lib = exports.ox_lib


----------------------------------    Made By StarFallTeam 
----------------------------------    Pixel Made The Code
----------------------------------    Kayden Did The Config And Notifications




CreateThread(function()
    while true do
        Wait(100)

        local ped = PlayerPedId()
        vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
            if not seatbeltOn then
                local currentTime = GetGameTimer()
                if currentTime - lastNotification >= notifyInterval then
                    --QBCore.Functions.Notify("Your seatbelt is off! 🚫", "error", 2500)
                    lastNotification = currentTime
                end
            end
        else
            seatbeltOn = false
        end
    end
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        vehicle = GetVehiclePedIsIn(ped, false)
            Wait(0)
            if IsControlJustPressed(0, 29) then -- Just so you know kayden 29 is the input for B as seatbelt
                if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
                seatbeltOn = not seatbeltOn
                if seatbeltOn == true then
                    if Config.Notify == 'qb' then
                        QBCore.Functions.Notify("Seatbelt fastened! ✅", "success", 2500)
                    elseif Config.Notify == 'ox' then
                        exports.ox_lib:notify({
                            title = 'Seatbelt',
                            description = 'Seatbelt Fastened ✅',
                            type = 'success'
                        })
                    end
                elseif seatbeltOn == false then
                    if Config.Notify == 'qb' then
                        QBCore.Functions.Notify("Seatbelt removed! 🚫", "error", 2500)
                    elseif Config.Notify == 'ox' then
                       exports.ox_lib:notify({
                            title = 'Seatbelt',
                            description = 'Seatbelt Removed 🚫',
                            type = 'error',
                        }) 
                    end  
                end 
            end
        end
    end
end)