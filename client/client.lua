RegisterNetEvent('fnx-setPed')
AddEventHandler('fnx-setPed',function(ped)
    Citizen.Wait(2500)  
    local playerPed = PlayerPedId()
    local characterModel = GetHashKey(ped)
    RequestModel(characterModel)   
    Citizen.CreateThread(function()
        while not HasModelLoaded(characterModel) do
            RequestModel(characterModel)
            Citizen.Wait(0)
        end
        if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
            SetPlayerModel(PlayerId(), characterModel)
            SetPedDefaultComponentVariation(playerPed)
        end
        SetModelAsNoLongerNeeded(characterModel)
    end)
end)