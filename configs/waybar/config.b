{
    "layer": "top",
    "position": "top",
    "height": 35,
    "margin-top": 5,
    "margin-left": 10,
    "margin-right": 10,
    "modules-left": ["sway/workspaces"],
    "modules-center": ["clock"],
    "modules-right": ["backlight", "pulseaudio", "bluetooth", "network", "battery"],

    "sway/workspaces": {
        "format": "{name}"
    },

    "clock": {
        "format": "🕐 {:%H:%M}",
        "format-alt": "📅 {:%d.%m.%Y}"
    },

    "battery": {
        "format": "🔋 {capacity}%",
        "format-charging": "⚡ {capacity}%",
        "format-plugged": "🔌 {capacity}%"
    },

    "network": {
        "format-wifi": "📶 {essid} {ipaddr}",
        "format-ethernet": "🌐 {ipaddr}",
        "format-disconnected": "❌",
        "on-click": "nm-connection-editor"
    },

    "bluetooth": {
        "format": "🔵",
        "format-connected": "🎧 {device_alias}",
        "format-disabled": "⭕",
        "on-click": "blueman-manager"
    },

    "pulseaudio": {
        "format": "🔊 {volume}%",
        "format-muted": "🔇",
        "on-click": "pamixer -t"
    },

    "backlight": {
        "format": "☀️ {percent}%"
    }
}
