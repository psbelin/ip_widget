#!/bin/bash

# Prints the IP of the interface passed as an argument
# Example usage: ./ip_widget.sh tun0
# It can be used to echo interface IP in xfce-genmon4 widgets (kali)

INTERFACE=$(cat /sys/class/net/$1/operstate 2>/dev/null)
if [[ "$INTERFACE" == "up" || "$INTERFACE" == "unknown" ]];then
   ip -4 addr show $1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
else
   echo ""
fi
