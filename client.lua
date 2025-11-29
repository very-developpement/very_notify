RegisterNetEvent("custom_notify:send")
AddEventHandler("custom_notify:send", function(message, notifType)
    SendNUIMessage({
        action = "notify",
        message = message,
        type = notifType or "info"
    })
end)

local function stripColors(text)
    return text:gsub("~.-~", "")
end
exports("Notify", function(message, notifType)
    SendNUIMessage({
        action = "notify",
        message = message,
        type = notifType or "info"
    })
end)

RegisterCommand("annonce", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "open_announcement_menu" })
end, false)

RegisterNUICallback("send_announcement", function(data, cb)
    local message = data.message or "Annonce"
    local type = data.type or "info"
    TriggerServerEvent("very_notify:sendAnnouncement", message, type)
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("close_announcement", function(_, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)