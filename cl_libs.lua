MBLFunctions = {}
-- things that are not in the default lua libraries
local vorpDedected = GetResourceState('vorp_core') == 'started'
print(vorpDedected)
print("Vorp: " .. tostring(vorpDedected))
if vorpDedected then
    VorpCore = exports.vorp_core:GetCore()
    MBLFunctions["notify"] = function(text, duration)
        return VorpCore.NotifyTip(text, duration)
    end
end
local rsgDedected = GetResourceState('rsg-core') == 'started'
if rsgDedected then
    print("RSG: " .. tostring(rsgDedected))
    RSGCore = exports['rsg-core']:GetCoreObject()
    MBLFunctions["notify"] = function(text,duration)
        return lib.notify({ title = "Notification", description = text, type = 'inform' })
    end
end

exports("MBLFunctions", function()
    return MBLFunctions
end)
