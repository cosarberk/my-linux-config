#!/bin/bash
swaymsg -t get_inputs | grep -m1 "xkb_active_layout_name" | cut -d'"' -f4 | cut -c1-2 | tr 'a-z' 'A-Z'
