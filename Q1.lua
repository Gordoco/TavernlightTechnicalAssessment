--Question 1: Fix or improve the implementation of the below methods

local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end
    
function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player)
    end
    return true
end

--Solution
--  1)  Passing a player parameter in addEvent is dangerous and has
--      been swapped for a playerId parameter instead
--
--  2)  I've also changed the storage value to be passed through to
--      improve maintainability

local function releaseStorage(playerId, storageValue)
    local player = Player(playerId)
    player:setStorageValue(storageValue, -1)
end
    
function onLogout(player)
    local storageValue = 1000
    if player:getStorageValue(storageValue) == 1 then
        addEvent(releaseStorage, 1000, player:getId(), storageValue)
    end
    return true
end
