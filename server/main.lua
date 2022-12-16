local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('fakeplate' , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.GetItemByName(item.name) then return end
    TriggerClientEvent('qb-fakeplate:client:useFakePlate', -1, source)
end)

RegisterNetEvent('qb-fakeplate:server:checkFakePlate', function (carPlate, citizenid)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local check = MySQL.query.await('SELECT * FROM player_vehicles WHERE plate = ?', {carPlate})
    local checkCitizenid
    local checkFakePlate
    for k, v in ipairs(check) do
        checkFakePlate = v['fakeplate']
        checkCitizenid = v['citizenid']
    end
    TriggerClientEvent('qb-fakeplate:client:checkFakePlate', -1, checkFakePlate, checkCitizenid)
end)

RegisterNetEvent('qb-fakeplate:server:fakePlate', function(carPlate, fakePlate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('fakeplate', 1)
    MySQL.Async.execute('UPDATE player_vehicles SET fakeplate = ? WHERE plate = ?', { fakePlate, carPlate })
end)

QBCore.Functions.CreateUseableItem('screwdriverset', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.GetItemByName(item.name) then return end
    TriggerClientEvent('qb-fakeplate:client:remove', -1, source)
end)

RegisterNetEvent('qb-fakeplate:server:removeFakePlate')
AddEventHandler('qb-fakeplate:server:removeFakePlate', function(carPlate, source)
    local src = source
    local check = MySQL.query.await('SELECT * FROM player_vehicles WHERE fakeplate = ? OR plate = ?', { carPlate, carPlate })
    local checkCarPlate
    for k, v in ipairs(check) do
        checkCarPlate = v['plate']
    end
    TriggerClientEvent('qb-fakeplate:client:checkCarPlate', -1, checkCarPlate, carPlate)
    MySQL.Async.execute('UPDATE player_vehicles SET fakeplate = ? WHERE plate = ?', { nil , checkCarPlate })
end)

RegisterNetEvent('qb-fakeplate:server:returnFakePlate', function()
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    TriggerClientEvent('inventory:client:ItemBox', Player, QBCore.Shared.Items["fakeplate"], 'add')
    Player.Functions.AddItem("fakeplate", 1)
end)
