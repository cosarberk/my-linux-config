#!/bin/bash
grim -g "$(slurp)" ~/Screenshots/$(date +%Y%m%d_%H%M%S).png
notify-send "Screenshot" "Saved to ~/Screenshots"
