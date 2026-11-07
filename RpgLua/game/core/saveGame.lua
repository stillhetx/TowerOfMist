local binser = require("game.lib.binser")

local SaveGame = {}
local SAVE_DATA_FILE = "saveData"

function SaveGame.saveActiveParty()
    local data = binser.serialize(ActiveParty)
    return love.filesystem.write(SAVE_DATA_FILE, data)
end

function SaveGame.loadActiveParty()
    local data, err = love.filesystem.read(SAVE_DATA_FILE)
    if not data then
        return nil, err
    end

    local values, count = binser.deserialize(data)
    if count ~= 1 or type(values[1]) ~= "table" then
        return nil, "Invalid active party save data"
    end

    ActiveParty = values[1]
    return ActiveParty
end

function SaveGame.hasSaveData()
    return love.filesystem.getInfo(SAVE_DATA_FILE) ~= nil
end

return SaveGame