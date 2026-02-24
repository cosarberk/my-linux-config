#!/bin/bash

ICON=$'\uf023'

if pgrep -x openvpn > /dev/null; then
    echo "{\"text\": \"$ICON\", \"class\": \"connected\"}"
else
    echo "{\"text\": \"$ICON\", \"class\": \"disconnected\"}"
fi
