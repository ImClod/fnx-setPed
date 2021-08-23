RegisterNetEvent('fnx-setPed')
AddEventHandler('fnx-setPed',function(ped)
    Citizen.CreateThread(function()
  
      while not HasModelLoaded(ped) do
        RequestModel(ped)
        Citizen.Wait(0)
      end
  
      if IsModelInCdimage(ped) and IsModelValid(ped) then
        SetPlayerModel(PlayerId(), ped)
        SetPedDefaultComponentVariation(playerPed)
      end
      SetModelAsNoLongerNeeded(ped)
    end)
end)