# very_notify
very_notify is a modern, free notification script with sounds for FiveM servers

# 🚀 Custom Notification System (FiveM/NUI)

This script provides a custom and stylized notification system, primarily designed for use in a FiveM environment via the NUI (New User Interface). It allows you to display dynamic messages with different types (info, success, error, warning) and associated sound effects.

# ✨ Features 
- Stylized Notifications: Modern and responsive design with gradients and shadows.
- Notification Types: Supports info, success, error, and warning types, each with distinct visual styling and sounds.
- Smooth Animations: Uses CSS transitions for smooth appearance and disappearance.
- NUI Integration: Easy to call from FiveM client-side Lua code.
- Export Function: A Lua export function (exports("Notify", ...)) is provided for easy use by other resources.

# 🛠️ Project Structure

```
very_notify/
├── client.lua
└── html/
    ├── index.html
    ├── style.css
    ├── script.js
    └── sounds/
        ├── success.ogg
        ├── error.ogg
        ├── info.ogg
        └── warning.ogg
```

Note: The sounds/ folder must contain the audio files (success.ogg, error.ogg, info.ogg, warning.ogg) for sound effects to work properly.

# ⚙️ Installation and Usage

## 1. Client-Side (Lua)

The client-side Lua script (client.lua) handles communication with the NUI interface.

## Network Event

You can trigger a notification using the registered network event:

```lua
-- Syntax: TriggerEvent("custom_notify:send", "Your message here", "type")

-- Info example
TriggerEvent("custom_notify:send", "Welcome to the server!", "info") 

-- Error example
TriggerEvent("custom_notify:send", "Action impossible.", "error")

-- Success example
TriggerEvent("custom_notify:send", "Purchase completed successfully!", "success")
```

## Export Function 

An export function is available so other resources can call notifications directly:

```lua
-- Syntax: exports('very_notify', 'Notify', message, type)

-- Warning example
exports("very_notify", "Notify", "Warning: Low fuel level.", "warning")
```

## Accepted Notification Types:

| Type                | Description                        | Icon Displayed |
|---------------------|-----------------------------------|----------------|
| info (default)      | Standard informational message    | ℹ️             |
| error               | Failure or error message          | ❌             |
| warning             | Warning message                   | ⚠️             |
| success             | Success message                   | ✅             |

# 2. ✏️ Customizing the Brand Text

By default, all notifications display the tag VERY:DEV info: before the message.

To change this text (for example, to display your server name), you need to modify the script.js file.

1. Open script.js

Locate the following lines in your script.js file:

```javascript
        if (event.data.type === "error") {
            box.classList.add("error");
            text.innerHTML = `❌ <strong>VERY:DEV info :</strong> ${event.data.message}`; // LINE TO MODIFY
            sound = "notif-error";
        } else if (event.data.type === "warning") {
            box.classList.add("warning");
            text.innerHTML = `⚠️ <strong>VERY:DEV info :</strong> ${event.data.message}`; // LINE TO MODIFY
            sound = "notif-warning";
        } else if (event.data.type === "success") {
            box.classList.add("success");
            text.innerHTML = `✅ <strong>VERY:DEV info :</strong> ${event.data.message}`; // LINE TO MODIFY
            sound = "notif-success";
        } else {
            text.innerHTML = `ℹ️ <strong>VERY:DEV info :</strong> ${event.data.message}`; // LINE TO MODIFY
        }
```

# 2. Make the Changes
Modify the text VERY:DEV info: on each of the four lines where it appears.

Example Modification
If you want to change the text to My RP Server, replace:

```javascript
// Before
text.innerHTML = `❌ <strong>VERY:DEV info :</strong> ${event.data.message}`;

// After (for all four occurrences)
text.innerHTML = `❌ <strong>My RP Server:</strong> ${event.data.message}`;
```

Result
After this modification, your error notification will display:

❌ My RP Server: Action impossible.

Don't forget to restart the resource on your FiveM server to apply the changes after modifying script.js.

# 3. HTML/CSS/JS Side (NUI)

The script.js file listens for messages sent from Lua (via SendNUIMessage) using the window.addEventListener('message', ...) event and displays/animates the notification accordingly.

The style.css defines the appearance, animation, and specific styles for each notification type.

# 🎁 Credits

**Developed with ❤️ by VeryFlow - Very Development**

Version: 1.0.0  
Last update: 29/11/2025

# 📝 License 
This project is under the MIT License.
