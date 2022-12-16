local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-fakeplate:client:useFakePlate')
AddEventHandler('qb-fakeplate:client:useFakePlate', function()
    local requiredItem = QBCore.Functions.HasItem("screwdriverset")
    if requiredItem == false then
        QBCore.Functions.Notify(Lang:t("need_tool_kit"), 'error', 7500)
    end
    if requiredItem then
        local carPlate = {}
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local citizenid = QBCore.Functions.GetPlayerData().citizenid
        local car = GetClosestVehicle(pedCoords.x, pedCoords.y, pedCoords.z, 3.000, 0, 70)
        if car ~= 0 then
            SetEntityAsMissionEntity(car, true, true)
            carPlate = GetVehicleNumberPlateText(car)
            TriggerServerEvent('qb-fakeplate:server:checkFakePlate', carPlate, citizenid)
        else
            QBCore.Functions.Notify(Lang:t("you_are_not_near_the_vehicle"), 'error', 7500)
        end
    end
end)

RegisterNetEvent('qb-fakeplate:client:checkFakePlate')
AddEventHandler('qb-fakeplate:client:checkFakePlate', function(checkFakePlate, checkCitizenid)
    local carPlate = {}
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local citizenid = QBCore.Functions.GetPlayerData().citizenid
    local car = GetClosestVehicle(pedCoords.x, pedCoords.y, pedCoords.z, 3.000, 0, 70)
    carPlate = GetVehicleNumberPlateText(car)
    if carPlate == checkFakePlate or checkFakePlate == nil and checkCitizenid == citizenid then
        QBCore.Functions.Progressbar("installFakePlate", Lang:t("putting_fake_plate"), math.random(5000, 10000), false, false,
            {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            anim = 'machinic_loop_mechandplayer',
            flags = 1,
        }, {}, {}, function()
            StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            local fakePlate = plateGenerator()
            TriggerServerEvent('qb-fakeplate:server:fakePlate', carPlate, fakePlate)
            SetVehicleNumberPlateText(car, fakePlate)
            TriggerEvent("vehiclekeys:client:SetOwner", fakePlate, false)
            
                QBCore.Functions.Notify(Lang:t("plate_changed"), 'success', 5000)
        end, function()
            QBCore.Functions.Notify(Lang:t("ops_something_went_wrong"), 'error', 5000)
        end)
    else
        QBCore.Functions.Notify(Lang:t("ops_something_went_wrong"), 'error', 5000)
    end
end)

RegisterNetEvent('qb-fakeplate:client:remove')
AddEventHandler('qb-fakeplate:client:remove', function()
    local carPlate = {}
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local car = GetClosestVehicle(pedCoords.x, pedCoords.y, pedCoords.z, 3.000, 0, 70)
    if car ~= 0 then
        SetEntityAsMissionEntity(car, true, true)
        carPlate = GetVehicleNumberPlateText(car)
        TriggerServerEvent('qb-fakeplate:server:removeFakePlate', carPlate)
    end
end)

RegisterNetEvent('qb-fakeplate:client:checkCarPlate')
AddEventHandler('qb-fakeplate:client:checkCarPlate', function(checkCarPlate, carPlate)
    local src = source
    local carPlate = {}
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local car = GetClosestVehicle(pedCoords.x, pedCoords.y, pedCoords.z, 3.000, 0, 70)
    carPlate = GetVehicleNumberPlateText(car)
    if checkCarPlate == nil or carPlate == checkCarPlate then
        QBCore.Functions.Notify(Lang:t("plate_not_cloned"), 'error', 5000)
    else
        QBCore.Functions.Progressbar('installCarPlate', Lang:t("removing_fake_plate"), math.random(5000, 10000), false, false,
            {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            anim = 'machinic_loop_mechandplayer',
            flags = 1,
        }, {}, {}, function()
            StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
            SetVehicleNumberPlateText(car, checkCarPlate)
            if math.random(1, 100) < 20 then
                    QBCore.Functions.Notify(Lang:t("fake_plate_broker"), 'error', 5000)
            else
                    QBCore.Functions.Notify(Lang:t("plate_removed"), 'success', 5000)
                TriggerServerEvent("qb-fakeplate:server:returnFakePlate")
                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["fakeplate"], "add")
            end
        end, function()
            QBCore.Functions.Notify(Lang:t("ops_something_went_wrong"), 'error', 5000)
        end)
    end
end)

function plateGenerator()
    local lettersNumbers = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }
    local length = 8
    local fPlate = ""
    for _ = 1, length do
        fPlate = fPlate .. lettersNumbers[math.random(#lettersNumbers)]
    end
    return fPlate
end
