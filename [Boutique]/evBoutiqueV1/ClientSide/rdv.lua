ESX = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer 
end)

Citizen.CreateThread(function()
	TriggerServerEvent('boutique:getpoints')
	if pointjoueur == nil then pointjoueur = 0 end
	while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(100)
	end
end)


Citizen.CreateThread(function()
	TriggerServerEvent('getid')
	if idj == nil then idj = 0 end
	while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(100)
	end
end)


Citizen.CreateThread(function()
	TriggerServerEvent('getname')
	if namej == nil then namej = 0 end
	while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        Citizen.Wait(100)
	end
end)




RegisterCommand('boutiqueV1', function()
    BoutiqueMenu()
    TriggerServerEvent("coins2")
    TriggerServerEvent("getpoints")
end, false)



Keys.Register("F9", 'boutiqueV1', 'Ouvrir la boutique', function()
    BoutiqueMenu()
    TriggerServerEvent("coins2")
    TriggerServerEvent("getpoints")
end)




RegisterNetEvent('retupoints')
AddEventHandler('retupoints', function(points)
    pointjoueur = points
end)

RegisterNetEvent('retuid')
AddEventHandler('retuid', function(id2)
    idj = id2
end)

RegisterNetEvent('retuname')
AddEventHandler('retuname', function(nameD)
    namej = nameD
end)












Citizen.CreateThread(function()
    function BoutiqueMenu()
        local menuTest = RageUI.CreateMenu("", "Made by ~p~evann™")
        local SubArgent = RageUI.CreateSubMenu(menuTest, "~r~Argent", "boutique")
    
        RageUI.Visible(menuTest, not RageUI.Visible(menuTest))
    
        while menuTest do
            
            Citizen.Wait(0)
    
            RageUI.IsVisible(menuTest,true,true,true,function()
            

                RageUI.Separator("Votre ~y~Nom ~s~→→ ~y~"..namej)
                RageUI.Separator("Votre ~g~Id~s~ boutique ~s~→→ ~g~"..idj)
                RageUI.Separator("Vos ~b~Coins ~s~→→ ~b~"..pointjoueur)
    
                RageUI.ButtonWithStyle("Actualiser vos coins", "il faudra re ouvrir la boutique après :)", {RightLabel = "→"}, true,function(h,a,s)
                    if s then
                        RageUI.CloseAll()
                        ESX.ShowNotification("~p~Coins~g~ actualisés~s~ vous pouvez re ouvrir la boutique !")
    
                    end
                
                end)

                RageUI.Separator("↓       ~r~Boutique~s~       ↓")




                RageUI.ButtonWithStyle("Argent", nil, {RightLabel = "~g~→→"}, true,function(h,a,s)
                    if s then
                        RageUI.CloseAll()
                        ArgentMenu()
    
                    end
                
                end)
                        


                RageUI.ButtonWithStyle("Armes", nil, {RightLabel = "~p~→→"}, true,function(h,a,s)
                    if s then
                        RageUI.CloseAll()
                        ArmeMenu()
    
                    end
                
                end)

                        




                RageUI.ButtonWithStyle("Véhicules", nil, {RightLabel = "~b~→→"}, true,function(h,a,s)
                    if s then
                        RageUI.CloseAll()
                        PrincVeh()
    
                    end
                
                end)
    
                
    
    
    
            
            end, function()
            end)
    
            if not RageUI.Visible(menuTest) and not RageUI.Visible(SubArgent)  then
                menuTest=RMenu:DeleteType("MenuTest", true)
            end
    
        end
    
    end
	
end)







------------ Fonctions mon gars 


--Armes

function Pistol()
    if pointjoueur >= Config.Pistolprice then


        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.Pistolprice.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu un~g~ Pistolet")
        TriggerServerEvent("remoovecoins")
        local ped = GetPlayerPed(-1)
        local id = PlayerPedId()
        local weapon = "weapon_pistol"
        local weaponHash = GetHashKey(weapon)
        GiveWeaponToPed(ped , weaponHash, 250, true, true)
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end




function CombatPistol()
    if pointjoueur >= Config.CombatPistolprice then


        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.CombatPistolprice.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu un~g~ Pistolet de Combat")
        TriggerServerEvent("remoovecoins2")
        local ped = GetPlayerPed(-1)
        local id = PlayerPedId()
        local weapon = "weapon_combatpistol"
        local weaponHash = GetHashKey(weapon)
        GiveWeaponToPed(ped , weaponHash, 250, true, true)
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end

function M4()
    if pointjoueur >= Config.M4price then


        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.M4price.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu une~g~ M4")
        TriggerServerEvent("remoovecoins3")
        local ped = GetPlayerPed(-1)
        local id = PlayerPedId()
        local weapon = "weapon_carbinerifle"
        local weaponHash = GetHashKey(weapon)
        GiveWeaponToPed(ped , weaponHash, 250, true, true)
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end

function SMG()
    if pointjoueur >= Config.SMGprice then


        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.SMGprice.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu une~g~ micro Smg")
        TriggerServerEvent("remoovecoins4")
        local ped = GetPlayerPed(-1)
        local id = PlayerPedId()
        local weapon = "weapon_microsmg"
        local weaponHash = GetHashKey(weapon)
        GiveWeaponToPed(ped , weaponHash, 250, true, true)
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end

function PMP()
    if pointjoueur >= Config.PMPprice then


        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.PMPprice.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu un~g~ Fusil à Pompe")
        TriggerServerEvent("remoovecoins5")
        local ped = GetPlayerPed(-1)
        local id = PlayerPedId()
        local weapon = "weapon_pumpshotgun"
        local weaponHash = GetHashKey(weapon)
        GiveWeaponToPed(ped , weaponHash, 250, true, true)
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end

--Argent

function Argent()
    if pointjoueur >= Config.Argent1price then

        TriggerServerEvent("remoovecoinsargent1")
        TriggerServerEvent("addargent1")
        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.Argent1price.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu~g~ 50k ~s~dollars")
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end

function Argentt()
    if pointjoueur >= Config.Argent2price then

        TriggerServerEvent("remoovecoinsargent2")
        TriggerServerEvent("addargent2")
        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.Argent2price.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu~g~ 200k ~s~dollars")
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end


function Argenttt()
    if pointjoueur >= Config.Argent3price then

        TriggerServerEvent("remoovecoinsargent3")
        TriggerServerEvent("addargent3")
        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.Argent3price.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu~g~ 500k ~s~dollars")
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end


--Véhicules


function Vehicule1()
    if pointjoueur >= Config.veh1price then

        TriggerServerEvent("test")
        TriggerServerEvent("test")
        ESX.ShowNotification("Vous venez de dépenser ~p~"..Config.veh1price.."~s~ coins !")
        ESX.ShowNotification("Vous avez recu~g~"..voiture)
    else
        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
        
    end
    
end







function FullVehicleBoost()
        SetVehicleModKit(veh, 0)
        SetVehicleMod(veh, 14, 0, true)
        SetVehicleNumberPlateTextIndex(veh, 5)
        ToggleVehicleMod(veh, 18, true)
        SetVehicleColours(veh, 0, 0)
        SetVehicleCustomPrimaryColour(veh, 0, 0, 0)
        SetVehicleModColor_2(veh, 5, 0)
        SetVehicleExtraColours(veh, 111, 111)
        SetVehicleWindowTint(veh, 3)
        ToggleVehicleMod(veh, 22, true)
        SetVehicleMod(veh, 23, 11, false)
        SetVehicleMod(veh, 24, 11, false)
        SetVehicleWheelType(veh, 120)
        SetVehicleWindowTint(veh, 3)
        ToggleVehicleMod(veh, 20, true)
        SetVehicleTyreSmokeColor(veh, 0, 0, 0)
        LowerConvertibleRoof(veh, true)
        SetVehicleIsStolen(veh, false)
        SetVehicleIsWanted(veh, false)
        SetVehicleHasBeenOwnedByPlayer(veh, true)
        SetVehicleNeedsToBeHotwired(veh, false)
        SetCanResprayVehicle(veh, true)
        SetPlayersLastVehicle(veh)
        SetVehicleFixed(veh)
        SetVehicleDeformationFixed(veh)
        SetVehicleTyresCanBurst(veh, false)
        SetVehicleWheelsCanBreak(veh, false)
        SetVehicleCanBeTargetted(veh, false)
        SetVehicleExplodesOnHighExplosionDamage(veh, false)
        SetVehicleHasStrongAxles(veh, true)
        SetVehicleDirtLevel(veh, 0)
        SetVehicleCanBeVisiblyDamaged(veh, false)
        IsVehicleDriveable(veh, true)
        SetVehicleEngineOn(veh, true, true)
        SetVehicleStrong(veh, true)
        RollDownWindow(veh, 0)
        RollDownWindow(veh, 1)
        SetPedCanBeDraggedOut(PlayerPedId(), false)
        SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
        SetPedRagdollOnCollision(PlayerPedId(), false)
        ResetPedVisibleDamage(PlayerPedId())
        ClearPedDecorations(PlayerPedId())
        SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)

end





---------------------------------------------------------------------------------------------------------------





function ArgentMenu()
    local arg = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(arg, not RageUI.Visible(arg))

    while arg do
        
        Citizen.Wait(0)

        RageUI.IsVisible(arg,true,true,true,function()


            RageUI.Separator("Vos ~b~Coins ~s~→→ ~b~"..pointjoueur)
            RageUI.Separator("↓     ~g~Argent~s~     ↓")

    


            RageUI.ButtonWithStyle("Acheter 50k dollars", nil, {RightLabel = "~p~35~s~ Coins"}, true,function(h,a,s)
                if s then
                    Argent()

                end
            
            end)

            RageUI.ButtonWithStyle("Acheter 200k dollars", nil, {RightLabel = "~p~55~s~ Coins"}, true,function(h,a,s)
                if s then
                    Argentt()

                end
            
            end)

            RageUI.ButtonWithStyle("Acheter 500k dollars", nil, {RightLabel = "~p~65~s~ Coins"}, true,function(h,a,s)
                if s then
                    Argenttt()

                end
            
            end)
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(arg) then
            arg=RMenu:DeleteType("arg", true)
            BoutiqueMenu()
        end

    end

end




function ArmeMenu()
    local arm = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(arm, not RageUI.Visible(arm))

    while arm do
        
        Citizen.Wait(0)

        RageUI.IsVisible(arm,true,true,true,function()


            RageUI.Separator("Vos ~b~Coins ~s~→→ ~b~"..pointjoueur)
            RageUI.Separator("↓     ~p~Armes~s~     ↓")

        


            RageUI.ButtonWithStyle("Pistolet", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    ArmeMenu2()

                end
            
            end)

            RageUI.ButtonWithStyle("Pistolet de Combat", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    ArmeMenu3()

                end
            
            end)

            RageUI.ButtonWithStyle("M4", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    ArmeMenu4()

                end
            
            end)

            RageUI.ButtonWithStyle("Micro SMG", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    ArmeMenu5()

                end
            
            end)

            RageUI.ButtonWithStyle("Fusil à Pompe", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    ArmeMenu6()

                end
            
            end)
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(arm) then
            arm=RMenu:DeleteType("arm", true)
            BoutiqueMenu()
        end

    end

end




function ArmeMenu2()
    local arm2 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(arm2, not RageUI.Visible(arm2))

    while arm2 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(arm2,true,true,true,function()


            RageUI.Separator("Vos ~b~Coins ~s~→→ ~b~"..pointjoueur)
            RageUI.Separator("↓     ~y~Pistolet~s~     ↓")

        


            RageUI.ButtonWithStyle("Essayer l'arme", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    local interval = 10000
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = GetPlayerPed(-1)
                    local pos = GetEntityCoords(PlayerPedId())
                    local point = vector3(13.420, -1097.410, 28.834)
                    SetEntityCoords(PlayerPedId(), point)
                    FreezeEntityPosition(ped, true)
                    local weapon = "weapon_pistol"
                    local weaponHash = GetHashKey(weapon)
                    GiveWeaponToPed(ped , weaponHash, 250, true, true)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Wait(interval)
                    ESX.ShowNotification("Le test est terminé")
                    RemoveWeaponFromPed(ped, weaponHash)
                    SetEntityCoords(PlayerPedId(), plyCoords)
                    FreezeEntityPosition(ped, false)

                end
            
            end)

            RageUI.ButtonWithStyle("Acheter", nil, {RightLabel = "~p~"..Config.Pistolprice.."~s~ Coins"}, true,function(h,a,s)
                if s then
                    Pistol()

                end
            
            end)
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(arm2) then
            arm2=RMenu:DeleteType("arm2", true)
            ArmeMenu()
        end

    end

end


function ArmeMenu3()
    local arm3 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(arm3, not RageUI.Visible(arm3))

    while arm3 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(arm3,true,true,true,function()


            RageUI.Separator("Vos ~b~Coins ~s~→→ ~b~"..pointjoueur)
            RageUI.Separator("↓     ~y~Pistolet~s~     ↓")

        


            RageUI.ButtonWithStyle("Essayer l'arme", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    local interval = 10000
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = GetPlayerPed(-1)
                    local pos = GetEntityCoords(PlayerPedId())
                    local point = vector3(13.420, -1097.410, 28.834)
                    SetEntityCoords(PlayerPedId(), point)
                    FreezeEntityPosition(ped, true)
                    local weapon = "weapon_combatpistol"
                    local weaponHash = GetHashKey(weapon)
                    GiveWeaponToPed(ped , weaponHash, 250, true, true)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Wait(interval)
                    ESX.ShowNotification("Le test est terminé")
                    RemoveWeaponFromPed(ped, weaponHash)
                    SetEntityCoords(PlayerPedId(), plyCoords)
                    FreezeEntityPosition(ped, false)

                end
            
            end)

            RageUI.ButtonWithStyle("Acheter", nil, {RightLabel = "~p~"..Config.CombatPistolprice.." ~s~Coins"}, true,function(h,a,s)
                if s then
                    CombatPistol()

                end
            
            end)
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(arm3) then
            arm3=RMenu:DeleteType("arm3", true)
            ArmeMenu()
        end

    end

end



function ArmeMenu4()
    local arm4 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(arm4, not RageUI.Visible(arm4))

    while arm4 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(arm4,true,true,true,function()


            RageUI.Separator("Vos ~b~Coins ~s~→→ ~b~"..pointjoueur)
            RageUI.Separator("↓     ~y~M4~s~     ↓")

        


            RageUI.ButtonWithStyle("Essayer l'arme", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    local interval = 10000
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = GetPlayerPed(-1)
                    local pos = GetEntityCoords(PlayerPedId())
                    local point = vector3(13.420, -1097.410, 28.834)
                    SetEntityCoords(PlayerPedId(), point)
                    FreezeEntityPosition(ped, true)
                    local weapon = "weapon_carbinerifle"
                    local weaponHash = GetHashKey(weapon)
                    GiveWeaponToPed(ped , weaponHash, 250, true, true)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Wait(interval)
                    ESX.ShowNotification("Le test est terminé")
                    RemoveWeaponFromPed(ped, weaponHash)
                    SetEntityCoords(PlayerPedId(), plyCoords)
                    FreezeEntityPosition(ped, false)

                end
            
            end)

            RageUI.ButtonWithStyle("Acheter", nil, {RightLabel = "~p~"..Config.M4price.." ~s~Coins"}, true,function(h,a,s)
                if s then
                    M4()

                end
            
            end)
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(arm4) then
            arm4=RMenu:DeleteType("arm4", true)
            ArmeMenu()
        end

    end

end


function ArmeMenu5()
    local arm5 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(arm5, not RageUI.Visible(arm5))

    while arm5 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(arm5,true,true,true,function()


            RageUI.Separator("Vos ~b~Coins ~s~→→ ~b~"..pointjoueur)
            RageUI.Separator("↓     ~y~Micro SMG~s~     ↓")

        


            RageUI.ButtonWithStyle("Essayer l'arme", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    local interval = 10000
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = GetPlayerPed(-1)
                    local pos = GetEntityCoords(PlayerPedId())
                    local point = vector3(13.420, -1097.410, 28.834)
                    SetEntityCoords(PlayerPedId(), point)
                    FreezeEntityPosition(ped, true)
                    local weapon = "weapon_microsmg"
                    local weaponHash = GetHashKey(weapon)
                    GiveWeaponToPed(ped , weaponHash, 250, true, true)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Wait(interval)
                    ESX.ShowNotification("Le test est terminé")
                    RemoveWeaponFromPed(ped, weaponHash)
                    SetEntityCoords(PlayerPedId(), plyCoords)
                    FreezeEntityPosition(ped, false)

                end
            
            end)

            RageUI.ButtonWithStyle("Acheter", nil, {RightLabel = "~p~"..Config.M4price.." ~s~Coins"}, true,function(h,a,s)
                if s then
                    SMG()

                end
            
            end)
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(arm5) then
            arm5=RMenu:DeleteType("arm5", true)
            ArmeMenu()
        end

    end

end


function ArmeMenu6()
    local arm6 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(arm6, not RageUI.Visible(arm6))

    while arm6 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(arm6,true,true,true,function()


            RageUI.Separator("Vos ~b~Coins ~s~→→ ~b~"..pointjoueur)
            RageUI.Separator("↓     ~y~Fusil à Pompe~s~     ↓")

        


            RageUI.ButtonWithStyle("Essayer l'arme", nil, {RightLabel = "→"}, true,function(h,a,s)
                if s then
                    local interval = 10000
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = GetPlayerPed(-1)
                    local pos = GetEntityCoords(PlayerPedId())
                    local point = vector3(13.420, -1097.410, 28.834)
                    SetEntityCoords(PlayerPedId(), point)
                    FreezeEntityPosition(ped, true)
                    local weapon = "weapon_pumpshotgun"
                    local weaponHash = GetHashKey(weapon)
                    GiveWeaponToPed(ped , weaponHash, 250, true, true)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Wait(interval)
                    ESX.ShowNotification("Le test est terminé")
                    RemoveWeaponFromPed(ped, weaponHash)
                    SetEntityCoords(PlayerPedId(), plyCoords)
                    FreezeEntityPosition(ped, false)

                end
            
            end)

            RageUI.ButtonWithStyle("Acheter", nil, {RightLabel = "~p~"..Config.M4price.." ~s~Coins"}, true,function(h,a,s)
                if s then
                    PMP()

                end
            
            end)
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(arm6) then
            arm6=RMenu:DeleteType("arm6", true)
            ArmeMenu()
        end

    end

end


------------------------VEHIUCLE MENU
function PrincVeh()
    local vehP = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(vehP, not RageUI.Visible(vehP))

    while vehP do
        
        Citizen.Wait(0)

        RageUI.IsVisible(vehP,true,true,true,function()

            RageUI.Separator("↓      Véhicules      ↓")

        


            RageUI.ButtonWithStyle("Sulta Rs", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    GarageMenu()

                end
            
            end)

            RageUI.ButtonWithStyle("Bmw cs4", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    GarageMenu2()

                end
            
            end)

            RageUI.ButtonWithStyle("Ferrari TDF", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    GarageMenu3()

                end
            
            end)

            RageUI.ButtonWithStyle("Mercedes 20s", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    GarageMenu4()

                end
            
            end)

            RageUI.ButtonWithStyle("Porshe IKX", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    GarageMenu5()

                end
            
            end)
 

            

        


        
        end, function()
        end)

        if not RageUI.Visible(vehP) then
            vehP=RMenu:DeleteType("vehP", true)
            BoutiqueMenu()
        end

    end

end


function GarageMenu()
    local test = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(test, not RageUI.Visible(test))

    while test do
        
        Citizen.Wait(0)

        RageUI.IsVisible(test,true,true,true,function()

            RageUI.Separator("↓     ~y~Sultan Rs~s~     ↓")
            RageUI.Separator("Price  =  ~b~"..Config.SultanPrice.."~s~ coins")


            RageUI.ButtonWithStyle("preview", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local model = GetHashKey("sultanrs")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, 21.998, 544.994, 176.027, 236.316, true, false)
                    FreezeEntityPosition(vehicle, true)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("La preview est terminée ")
                    ESX.Game.DeleteVehicle(vehicle)
                    SetEntityCoords(PlayerPedId(), plyCoords)


                end
            
            end)

            RageUI.ButtonWithStyle("Essayer", nil, {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
                if s then
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local model = GetHashKey("sultanrs")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, -906.166, -3292.529, 13.944, 60.915, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    Citizen.Wait(5000)
                    ESX.ShowNotification("Il vous reste ~r~20~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Il vous reste ~r~10~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Votre session d'essaie est terminée")
                    SetEntityCoords(PlayerPedId(), plyCoords)

                end
        
            end)

            



            RageUI.ButtonWithStyle("Acheter Normal", nil, {RightLabel = "~p~65~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >= Config.SultanPrice then
                        print("non full")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local name = "sultan rs"
                        local model = GetHashKey("sultanrs")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh1")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end


                end
            
            end)


 

            RageUI.ButtonWithStyle("Acheter Full Perf", nil, {RightLabel = "~p~75~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >= Config.SultanPriceF then
                        print("full perf")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local name = "sultan rs F"
                        local model = GetHashKey("sultanrs")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        FullVehicleBoost()
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh1F")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end


                end
            
            end)


            
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(test) then
            test=RMenu:DeleteType("test", true)
            PrincVeh()
        end

    end

end





function GarageMenu2()
    local test235 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(test235, not RageUI.Visible(test235))

    while test235 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(test235,true,true,true,function()

            RageUI.Separator("↓     ~y~BMW 4cs~s~     ↓")
            RageUI.Separator("Price  =  ~b~"..Config.BMPrice.."~s~ coins")


            RageUI.ButtonWithStyle("preview", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local name = "bmw 4cs"
                    local model = GetHashKey("bmwm4cs")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, 21.998, 544.994, 176.027, 236.316, true, false)
                    FreezeEntityPosition(vehicle, true)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("La preview est terminée ")
                    ESX.Game.DeleteVehicle(vehicle)
                    SetEntityCoords(PlayerPedId(), plyCoords)


                end
            
            end)

            RageUI.ButtonWithStyle("Essayer", nil, {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
                if s then
                    
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local name = "bmw 4csF"
                    local model = GetHashKey("bmwm4cs")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, -906.166, -3292.529, 13.944, 60.915, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    Citizen.Wait(5000)
                    ESX.ShowNotification("Il vous reste ~r~20~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Il vous reste ~r~10~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Votre session d'essaie est terminée")
                    SetEntityCoords(PlayerPedId(), plyCoords)

                end
        
            end)

            



            RageUI.ButtonWithStyle("Acheter Normal", nil, {RightLabel = "~p~120~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >= Config.BMPrice then
                        print("non full")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local model = GetHashKey("bmwm4cs")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh2")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end
                    

                end
            
            end)


 

            RageUI.ButtonWithStyle("Acheter Full Perf", nil, {RightLabel = "~p~130~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >= Config.BMPriceF then
                        print("full perf")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local model = GetHashKey("bmwm4cs")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        FullVehicleBoost()
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh2F")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end


                end
            
            end)


            
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(test235) then
            test235=RMenu:DeleteType("test235", true)
            PrincVeh()
        end

    end

end



function GarageMenu3()
    local test2351 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(test2351, not RageUI.Visible(test2351))

    while test2351 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(test2351,true,true,true,function()

            RageUI.Separator("↓     ~y~Ferrari TDF~s~     ↓")
            RageUI.Separator("Price  =  ~b~"..Config.FEFEPrice.."~s~ coins")


            RageUI.ButtonWithStyle("preview", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local name = "Ferrari TDF"
                    local model = GetHashKey("tdf")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, 21.998, 544.994, 176.027, 236.316, true, false)
                    FreezeEntityPosition(vehicle, true)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("La preview est terminée ")
                    ESX.Game.DeleteVehicle(vehicle)
                    SetEntityCoords(PlayerPedId(), plyCoords)


                end
            
            end)

            RageUI.ButtonWithStyle("Essayer", nil, {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
                if s then
                    
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local name = "Ferrari TDF"
                    local model = GetHashKey("tdf")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, -906.166, -3292.529, 13.944, 60.915, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    Citizen.Wait(5000)
                    ESX.ShowNotification("Il vous reste ~r~20~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Il vous reste ~r~10~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Votre session d'essaie est terminée")
                    SetEntityCoords(PlayerPedId(), plyCoords)

                end
        
            end)

            



            RageUI.ButtonWithStyle("Acheter Normal", nil, {RightLabel = "~p~"..Config.FEFEPrice.."~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >= Config.FEFEPrice then
                        print("non full")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local name = "Ferrari TDF"
                        local model = GetHashKey("tdf")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh3")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end
                    

                end
            
            end)


 

            RageUI.ButtonWithStyle("Acheter Full Perf", nil, {RightLabel = "~p~"..Config.FEFEPriceF.."~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >= Config.FEFEPriceF then
                        print("full perf")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local name = "Ferrari TDF"
                        local model = GetHashKey("tdf")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        FullVehicleBoost()
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh3F")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end


                end
            
            end)


            
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(test2351) then
            test2351=RMenu:DeleteType("test2351", true)
            PrincVeh()
        end

    end

end





function GarageMenu4()
    local test23512 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(test23512, not RageUI.Visible(test23512))

    while test23512 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(test23512,true,true,true,function()

            RageUI.Separator("↓     ~y~Mercedes 20s~s~     ↓")
            RageUI.Separator("Price  =  ~b~"..Config.MERCOPrice.."~s~ coins")


            RageUI.ButtonWithStyle("preview", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local name = "Mercedes 20s"
                    local model = GetHashKey("20s63c")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, 21.998, 544.994, 176.027, 236.316, true, false)
                    FreezeEntityPosition(vehicle, true)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("La preview est terminée ")
                    ESX.Game.DeleteVehicle(vehicle)
                    SetEntityCoords(PlayerPedId(), plyCoords)


                end
            
            end)

            RageUI.ButtonWithStyle("Essayer", nil, {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
                if s then
                    
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local name = "Mercedes 20s"
                    local model = GetHashKey("20s63c")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, -906.166, -3292.529, 13.944, 60.915, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    Citizen.Wait(5000)
                    ESX.ShowNotification("Il vous reste ~r~20~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Il vous reste ~r~10~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Votre session d'essaie est terminée")
                    SetEntityCoords(PlayerPedId(), plyCoords)

                end
        
            end)

            



            RageUI.ButtonWithStyle("Acheter Normal", nil, {RightLabel = "~p~"..Config.MERCOPrice.."~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >= Config.MERCOPrice then
                        print("non full")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local name = "Mercedes 20s"
                        local model = GetHashKey("20s63c")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh4")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end
                    

                end
            
            end)


 

            RageUI.ButtonWithStyle("Acheter Full Perf", nil, {RightLabel = "~p~"..Config.MERCOPriceF.."~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >=Config.MERCOPriceF then
                        print("full perf")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local name = "Mercedes 20s"
                        local model = GetHashKey("20s63c")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        FullVehicleBoost()
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh4F")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end


                end
            
            end)


            
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(test23512) then
            test23512=RMenu:DeleteType("test23512", true)
            PrincVeh()
        end

    end

end





function GarageMenu5()
    local test235123 = RageUI.CreateMenu("", "Made by ~p~evann™")
    RageUI.Visible(test235123, not RageUI.Visible(test235123))

    while test235123 do
        
        Citizen.Wait(0)

        RageUI.IsVisible(test235123,true,true,true,function()

            RageUI.Separator("↓     ~y~Porshe IKX~s~     ↓")
            RageUI.Separator("Price  =  ~b~"..Config.POPrice.."~s~ coins")


            RageUI.ButtonWithStyle("preview", nil, {RightLabel = "→→"}, true,function(h,a,s)
                if s then
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local name = "Porshe IKX"
                    local model = GetHashKey("ikx3duke911")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, 21.998, 544.994, 176.027, 236.316, true, false)
                    FreezeEntityPosition(vehicle, true)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    ESX.ShowNotification("Vous avez 10 secondes max")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("La preview est terminée ")
                    ESX.Game.DeleteVehicle(vehicle)
                    SetEntityCoords(PlayerPedId(), plyCoords)


                end
            
            end)

            RageUI.ButtonWithStyle("Essayer", nil, {RightBadge = RageUI.BadgeStyle.Car}, true,function(h,a,s)
                if s then
                    
                    local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                    local ped = PlayerPedId()
                    local name = "Porshe IKX"
                    local model = GetHashKey("ikx3duke911")
                    RequestModel(model)
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local pos = GetEntityCoords(PlayerPedId())
                    vehicle = CreateVehicle(model, -906.166, -3292.529, 13.944, 60.915, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    Citizen.Wait(5000)
                    ESX.ShowNotification("Il vous reste ~r~20~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Il vous reste ~r~10~s~ secondes")
                    Citizen.Wait(10000)
                    ESX.ShowNotification("Votre session d'essaie est terminée")
                    SetEntityCoords(PlayerPedId(), plyCoords)

                end
        
            end)

            



            RageUI.ButtonWithStyle("Acheter Normal", nil, {RightLabel = "~p~"..Config.POPrice.."~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >= Config.POPrice then
                        print("non full")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local name = "Porshe IKX"
                        local model = GetHashKey("ikx3duke911")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh5")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end
                    

                end
            
            end)


 

            RageUI.ButtonWithStyle("Acheter Full Perf", nil, {RightLabel = "~p~"..Config.POPriceF.."~s~ coins"}, true,function(h,a,s)
                if s then
                    if pointjoueur >=Config.POPriceF then
                        print("full perf")
                        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                        local ped = PlayerPedId()
                        local name = "Porshe IKX"
                        local model = GetHashKey("ikx3duke911")
                        RequestModel(model)
                        while not HasModelLoaded(model) do Citizen.Wait(10) end
                        local pos = GetEntityCoords(PlayerPedId())
                        veh = CreateVehicle(model, plyCoords.x, plyCoords.y, plyCoords.z, 60.915, true, false)
                        FullVehicleBoost()
                        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                        local plate = GeneratePlate()
                        print(plate)
                        local vehicleProps = ESX.Game.GetVehicleProperties(veh)
                        vehicleProps.plate = plate
                        SetVehicleNumberPlateText(veh, plate)
                        Citizen.Wait(500)
                        TriggerServerEvent('ev:vendrevoiture', vehicleProps, name, veh)
                        TriggerServerEvent("remoovecoinsveh5F")

                    else
                        ESX.ShowNotification("Vous n'avez ~r~pas assez~s~ de coins !")
                        
                    end


                end
            
            end)


            
 

            

            

            



        
        end, function()
        end)

        if not RageUI.Visible(test235123) then
            test235123=RMenu:DeleteType("test235123", true)
            PrincVeh()
        end

    end

end







