RegisterNetEvent('fnx-setPed')
AddEventHandler('fnx-setPed',function(ped)
    RequestModel(ped)
    while (not HasModelLoaded(ped)) do
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), ped)
    SetModelAsNoLongerNeeded(ped)
end)