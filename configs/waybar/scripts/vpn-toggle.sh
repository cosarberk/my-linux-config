#!/bin/bash

OVPN_FILE="$HOME/.config/vpn/bcosar-sslvpn.ovpn"
AUTH_FILE="$HOME/.config/vpn/auth.txt"

if pgrep -x openvpn > /dev/null; then
    sudo pkill openvpn
    notify-send "VPN" "Bağlantı kesildi" -i network-offline
else
    sudo openvpn --config "$OVPN_FILE" --auth-user-pass "$AUTH_FILE" \
        --script-security 2 \
        --up /usr/share/openvpn/contrib/pull-resolv-conf/client.up \
        --down /usr/share/openvpn/contrib/pull-resolv-conf/client.down \
        --daemon --log /dev/null --verb 0 >/dev/null 2>&1
    notify-send "VPN" "Bağlanıyor..." -i network-vpn
fi
