#!/bin/bash

ARC=$(uname -a)
pCPU=$(nproc --all)
vCPU=$(cat /proc/cpuinfo | grep processor | wc -l)
MEM=$(free -m | awk 'NR=2{printf("%.0f/%.0fMB (%.4s%%)", $3, $2, $3/$2 * 100)}')
DISK=$(df -h | awk 'NR==4{printf("%.0f/%.0fGB (%s)", $3, $2, $5)}')
LOAD=$(mpstat | awk 'NR==4{printf("%.1f%%", 100 $13)}')
BOOT=$(uptime -s)
HOLD=$(lsblk | grep lvm | wc -l)
LVM=$(if [$HOLD -gt 0]; then echo yes; else echo no; fi)
TCP=$(netstat | grep ESTABLISHED | wc -l)
USERS=$(who | wc -l)
IP=$(hostname -I)
MAC=$(awk 'NR==1' /sys/class/net/*/address)
SUDO=$(cat /var/log/auth.log | wc -l)

wall "
		#Architecture:			$ARC
		#CPU Physical:			$pCPU
		#vCPU:					$vCPU
		#Memory Usage:			$MEM
		#Disk Usage:			$DISK
		#CPU Load:				$LOAD
		#Last Boot:				$BOOT
		#LVM Use:				$LVM
		#Connections TCP:		$TCP ESTABLISHED
		#User Log:				$USERS
		#Network:				IP $IP ($MAC)
		#SUDO:					$SUDO cmd
"
