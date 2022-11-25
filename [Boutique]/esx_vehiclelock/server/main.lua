ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_vehiclelock:requestPlayerCars', function(source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = xPlayer.identifier,
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('esx_vehiclelock:notifclose', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)


	TriggerClientEvent('esx:showNotification', source, "~w~Vous avez ~r~vérouillé ~w~votre véhicule !")
	cb(true)
end)

ESX.RegisterServerCallback('esx_vehiclelock:notifopen', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)


	TriggerClientEvent('esx:showNotification', source, "~w~Vous avez ~g~déverouillé ~w~votre véhicule !")
	cb(true)
end)

ESX.RegisterServerCallback('esx_vehiclelock:notyour', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)


	TriggerClientEvent('esx:showNotification', source, "~r~Vous n\'avez pas les clés de ce véhicule !")
	cb(true)
end)