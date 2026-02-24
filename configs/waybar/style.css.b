* {
    font-family: "Font Awesome 6 Free", "DejaVu Sans", sans-serif;
    font-size: 14px;
    border: none;
}

window#waybar {
    background: rgba(30, 30, 46, 0.7);
    color: #cdd6f4;
    border-radius: 15px;
}

#workspaces {
    margin-left: 10px;
}

#workspaces button {
    padding: 5px 12px;
    color: #cdd6f4;
    background: transparent;
    border-radius: 10px;
    margin: 3px;
}

#workspaces button.focused {
    background: rgba(137, 180, 250, 0.3);
    color: #89b4fa;
}

#workspaces button:hover {
    background: rgba(137, 180, 250, 0.2);
}

#clock, #battery, #network, #pulseaudio, #backlight, #bluetooth {
    padding: 5px 15px;
    margin: 3px 5px;
    border-radius: 10px;
    background: rgba(255, 255, 255, 0.05);
}

#battery.charging {
    color: #a6e3a1;
}

#battery.warning:not(.charging) {
    color: #f9e2af;
}

#battery.critical:not(.charging) {
    color: #f38ba8;
}

#network.disconnected {
    color: #f38ba8;
}

#bluetooth.disabled {
    color: #6c7086;
}

#pulseaudio.muted {
    color: #6c7086;
}
