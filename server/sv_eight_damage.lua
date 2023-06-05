local SetVehicle
local DamageHealt = 0

RegisterServerEvent('eight_damage:invia')
AddEventHandler('eight_damage:invia', function(car, health, diffe)
    SetVehicle = car
    DamageHealt = health - diffe
    if DamageHealt > 80 then
        TriggerClientEvent('eight_damage:ricevi', -1, SetVehicle, DamageHealt)
        if Config.debug_server then
            print('-----------------------------------------')
            print('Event crash - SERVER SIDE')             
            print('Vehicle: '..SetVehicle)
            print('Old Damage: '..health)
            print('New Damage: '..DamageHealt)
            print('-----------------------------------------')
        end
    elseif DamageHealt <=80 then
        TriggerClientEvent('eight_damage:stop', -1, SetVehicle)
    end
end)