ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)





---------------------------------------------------------------------------------------------------------------

--------PARTIE SQL DONT TOUCH ;)




local joueurenregistres = {}


RegisterNetEvent("coins2")

AddEventHandler("coins2", function()
    local _src = source
    MySQL.Async.fetchAll("SELECT * FROM evboutique WHERE name = @a", {['a'] = GetPlayerName(_src) }, function(result)
        if result[1] then
            print("le joueur "..GetPlayerName(_src).." vient de consulter la boutique")
        else
            print("^1le joueur n'est pas encore enregistré dans la ^2bdd^0")
            MySQL.Async.fetchAll("SELECT * FROM evboutique WHERE id = @c", {['c'] = 1 }, function(result)
                if result[1] then
                    print("le joueur "..GetPlayerName(_src).." vient de consulter la boutique")
                else
                    print("Enregistrement du joueur dans la ^1[BDD]^0 en cours...")
                    local random = math.random(1,2000)
                    MySQL.Async.execute("INSERT INTO evboutique (name,id) VALUES (@a,@c)", {['a'] = GetPlayerName(_src), ['c'] = random }, function() end)
                end
            end)
        end
    end)



    MySQL.Async.fetchAll("SELECT * FROM evboutique", {}, function(result)
        for index,data in pairs(result) do
            print("Entrée détéctée de "..data.name.." avec "..data.coins.." coins")
        end
    
    
    end)
end)












RegisterCommand("evPoint", function(source, args, rawcommand)
    local source = source
    local id    = args[1]
    local coins2 = args[2]
    if source == 0 then 

        MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE id=@c', {['@c'] = id}, function(data)
            local point = data[1].coins
            local fcoins = point + coins2
            
     
        MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE id=@c', {['@c'] = id, ['@coins'] = fcoins }, function(rowsChange)
            print("L'ID boutique ^4"..id.."^0 a maintenant : ^3"..fcoins.."^0 coins !")
             end)
         end)
     else
        TriggerClientEvent('esx:showNotification', source, 'Tu dois faire cette commande via ton panel')
     end

end, false)



RegisterServerEvent("getpoints")
AddEventHandler("getpoints", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
		pointsJ = data[1].coins
        print(data[1].coins)
		TriggerClientEvent('retupoints', source, pointsJ)
	end)

end)








RegisterServerEvent("getid")
AddEventHandler("getid", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
		idJ = data[1].id
        print(data[1].id)
		TriggerClientEvent('retuid', source, idJ)
	end)

end)


RegisterServerEvent("getname")
AddEventHandler("getname", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
		nameJ = data[1].name
        print(data[1].name)
		TriggerClientEvent('retuname', source, nameJ)
	end)

end)



------------------------------------------------------------------------------------------------------------------------------

-----------ARMES mgl

RegisterServerEvent("remoovecoins")
AddEventHandler("remoovecoins", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.Pistolprice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)

end)


RegisterServerEvent("remoovecoins2")
AddEventHandler("remoovecoins2", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.CombatPistolprice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)

end)

RegisterServerEvent("remoovecoins3")
AddEventHandler("remoovecoins3", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.M4price
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)

end)

RegisterServerEvent("remoovecoins4")
AddEventHandler("remoovecoins4", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.SMGprice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)

end)

RegisterServerEvent("remoovecoins5")
AddEventHandler("remoovecoins5", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.PMPprice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)

end)





-----------------Argent



RegisterServerEvent("remoovecoinsargent1")
AddEventHandler("remoovecoinsargent1", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.Argent1price
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)

end)

RegisterNetEvent('addargent1')
AddEventHandler('addargent1', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney('50000')
end)





RegisterServerEvent("remoovecoinsargent2")
AddEventHandler("remoovecoinsargent2", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.Argent2price
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)

end)



RegisterNetEvent('addargent2')
AddEventHandler('addargent1', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney('200000')
end)




RegisterServerEvent("remoovecoinsargent3")
AddEventHandler("remoovecoinsargent3", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.Argent3price
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)

end)

RegisterNetEvent('addargent1')
AddEventHandler('addargent1', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney('500000')
end)





-----------------------------------Vente Véhicules

ESX.RegisterServerCallback('enos_concess:verifierplaquedispo', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)

RegisterServerEvent('ev:vendrevoiture')
AddEventHandler('ev:vendrevoiture', function (playerId, vehicleProps, name, veh)


    local source = source
    local EVPlayer = GetPlayerPed(source)
    local vehi = GetVehiclePedIsIn(EVPlayer, false)
    local phpveh = "Vehicule Boutique"
    local pl = GetVehicleNumberPlateText(vehi)
    print(pl)
    local xPlayer = ESX.GetPlayerFromId(playerId) 
	local levendeur = ESX.GetPlayerFromId(source)
    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
    {
        ['@owner']   = levendeur.identifier,
        ['@plate']   = pl,
        ['@vehicle'] = phpveh
    }, function (rowsChanged)
    TriggerClientEvent('esx:showNotification', levendeur.source, "Tu as reçu ta voiture")
    end)
end)



RegisterServerEvent('teset')
AddEventHandler('teset', function (playerId)
    local source = source
    local EVPlayer = GetPlayerPed(source)
    local vehi = GetVehiclePedIsIn(EVPlayer, false)
    local pl = GetVehicleNumberPlateText(vehi)
    print(pl)
 
end)

RegisterServerEvent("remoovecoinsveh1")
AddEventHandler("remoovecoinsveh1", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.SultanPrice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.SultanPrice.."~s~ coins !")

end)



RegisterServerEvent("remoovecoinsveh1F")
AddEventHandler("remoovecoinsveh1F", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.SultanPriceF
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.SultanPriceF.."~s~ coins !")

end)


RegisterServerEvent("remoovecoinsveh2")
AddEventHandler("remoovecoinsveh2", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.BMPrice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.BMPrice.."~s~ coins !")

end)



RegisterServerEvent("remoovecoinsveh2F")
AddEventHandler("remoovecoinsveh2F", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.BMPriceF
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.BMPriceF.."~s~ coins !")

end)




RegisterServerEvent("remoovecoinsveh3")
AddEventHandler("remoovecoinsveh3", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.FEFEPrice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.FEFEPrice.."~s~ coins !")

end)



RegisterServerEvent("remoovecoinsveh3F")
AddEventHandler("remoovecoinsveh3F", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.FEFEPriceF
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.FEFEPriceF.."~s~ coins !")

end)



RegisterServerEvent("remoovecoinsveh4")
AddEventHandler("remoovecoinsveh4", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.MERCOPrice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.MERCOPrice.."~s~ coins !")

end)



RegisterServerEvent("remoovecoinsveh4F")
AddEventHandler("remoovecoinsveh4F", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.MERCOPriceF
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.MERCOPriceF.."~s~ coins !")

end)


RegisterServerEvent("remoovecoinsveh5")
AddEventHandler("remoovecoinsveh5", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.POPrice
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.POPrice.."~s~ coins !")

end)



RegisterServerEvent("remoovecoinsveh5F")
AddEventHandler("remoovecoinsveh5F", function()
    local source = source
    local playerD = GetPlayerName(source)

	MySQL.Async.fetchAll('SELECT * FROM evboutique WHERE name=@a', {['@a'] = playerD}, function(data)
        pointsD = data[1].coins
        pointsS = pointsD - Config.POPriceF
        print(pointsS)
        
    
    MySQL.Async.execute('UPDATE `evboutique` SET `coins`=@coins  WHERE name=@a', {['@a'] = playerD, ['@coins'] = pointsS}, function(rowsChange)
    end)
    end)
    TriggerClientEvent('esx:showNotification', source, "Vous venez de dépensez ~b~"..Config.POPriceF.."~s~ coins !")

end)

































