#!/bin/bash

# Prints the IP of the interface passed as an argument
# Example usage: 
# Option 1 - With prefix to identify the network --> /home/username/ip_widget.sh tun0 🟢
# Option 2 - Just the IP --> /home/username/ip_widget.sh tun0
# It can be used to echo interface IP in xfce-genmon4 widgets (kali)

INTERFACE=$(cat /sys/class/net/$1/operstate 2>/dev/null)
if [[ "$INTERFACE" == "up" || "$INTERFACE" == "unknown" ]];then
   if [ $# -eq 1 ]; then
     ip -4 addr show $1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
   elif [ $# -eq 2 ]; then
     echo $2 $(ip -4 addr show $1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
   fi
else
   echo ""
fi
