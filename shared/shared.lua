Shared = {}

Shared.currentResourceName = GetCurrentResourceName()

Shared.State = {}

Shared.State.globalInstances = ("%s_globalInstances"):format(Shared.currentResourceName)

Shared.State.globalInstancePlayers = ("%s_globalInstancePlayers"):format(Shared.currentResourceName)

Shared.State.playerInstance = ("%s_playerInstance"):format(Shared.currentResourceName)

---@alias playerSource number
---@alias instanceName string
---@alias hostSource playerSource

---@class xInstanceData
---@field playerSource number

---@class xInstances
---@field instance string
---@field players  xInstanceData[]

---@class xInstancePlayers
---@field instance string
---@field host number

function dumpTable(table, nb)
    if nb == nil then
        nb = 0
    end

    if type(table) == 'table' then
        local s = ''
        for i = 1, nb + 1, 1 do
            s = s .. "    "
        end

        s = '{\n'
        for k,v in pairs(table) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            for i = 1, nb, 1 do
                s = s .. "    "
            end
            s = s .. '['..k..'] = ' .. dumpTable(v, nb + 1) .. ',\n'
        end

        for i = 1, nb, 1 do
            s = s .. "    "
        end

        return s .. '}'
    else
        return tostring(table)
    end
end