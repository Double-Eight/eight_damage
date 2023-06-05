local oldBodyDamage = 0.0
local currentBodyDamage = 0.0
local vehicle
local vehicleClass
local diff = 0.0
local currentHealth = 0.0

function get_class()
    vehicleClass = GetVehicleClass(vehicle)
end

Citizen.CreateThread(function()
    time = 1000
	while true do
        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then
            get_class()
            time = 100
            currentHealth = GetVehicleEngineHealth(vehicle)
            if DoesEntityExist(vehicle) then
                oldBodyDamage = currentBodyDamage
                currentBodyDamage = GetVehicleBodyHealth(vehicle)
                diff = (oldBodyDamage - currentBodyDamage) * Config.molt_systemEng * Config.demageEng[vehicleClass]
                currentVehicle = GetVehiclePedIsIn(PlayerPedId(-1), false)
                if currentBodyDamage ~= oldBodyDamage and oldBodyDamage ~= 0 and currentBodyDamage ~= 0 and (oldBodyDamage - currentBodyDamage) > 10 then
                    if Config.debug_client then
                        print('-----------------------------------------')                        
                        print('Event crash - Send to server')                        
                        print('Damage reducing factor: '..Config.demageEng[vehicleClass])  
                        print('Send extent of the collision: '..diff)
                        print('Send Eng. Old: '..oldBodyDamage)
                        print('Send Eng. Current: '..currentBodyDamage)
                        print('Send Current Vehicle: '..vehicle)
                        print('Send Current Vehicle Class: '..vehicleClass)
                        print('-----------------------------------------')                          
                    end
                    TriggerServerEvent('eight_damage:invia', vehicle, currentHealth, diff)
                end

            end
        else
            time = 1000
        end
    Citizen.Wait(time)	
    end
end)

Citizen.CreateThread(function()
    time = 1000
	while true do
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            time = 500
            vehicle = GetVehiclePedIsIn(PlayerPedId(-1), false)
        else
            timoe = 1000
        end
    Citizen.Wait(time)	
    end
end)

RegisterNetEvent('eight_damage:ricevi')
AddEventHandler('eight_damage:ricevi', function(_car, _damage)
    currentHealth = GetVehicleEngineHealth(_car)
    if Config.debug_client then  
        print('-----------------------------------------')                        
        print('Event crash - Receives from the server')   
        print('Receives Vehicle: '.._car)
        print('Receives Damage: '.._damage)
        print('-----------------------------------------')           
    end
    SetVehicleEngineHealth(_car, _damage)
    SetVehicleDamage(_car, 1.0, 0.0, 0.0, 7.0  * Config.demageBody, 2000.0, true)
    SetVehicleDamage(_car, 0.0, 0.5, 0.0, 7.0 * Config.demageBody, 3000.0, true)
    SetVehicleDamage(_car, 0.0, -0.5, 0.0, 7.0 * Config.demageBody, 3000.0, true)
    SetVehicleDamage(_car, -1.0, 0.0, 0.0, 7.0 * Config.demageBody, 2000.0, true)
    SetVehicleDamage(_car, 0.0, 0.0, 1.0, 7.0 * Config.demageBody, 2000.0, true)
end)

RegisterNetEvent('eight_damage:stop')
AddEventHandler('eight_damage:stop', function(_car)
    SetVehicleUndriveable(_car, true)
    if Config.debug_client then 
        print('-----------------------------------------')         
        print('STOP VEHICLE')
        print('-----------------------------------------')          
    end
end)  