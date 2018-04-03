#!/bin/bash

echo " Before we start, Have you backed up your pi?"
read -p " " yn;
case $yn in
	[Yy]* )echo "Have you modified the /boot/cmdline.txt or /boot/config.txt file?"; read -p " " yn;
		case $yn in
			[Yy]* )sudo cp /boot/config.txt /boot/config.old && sudo cp /boot/cmdline.txt /boot/cmdline.old; break;;
			[Nn]* )break;;
		esac
		echo " " >> /boot/config.txt;
		echo "# Uart Enable" >> /boot/config.txt;
		echo "enable_uart=1" >> /boot/config.txt;
		VAR1="console=serial0, 115200"
		VAR2=" "
		VAR3="/boot/cmdline.txt"
		sed -i -e "s/console=serial0//" /boot/cmdline.txt;
		#stty -F /dev/ttyS0 115200 || stty -F /dev/ttyAMA0 115200;
		break;;
	[Nn]* )echo "Please back up your data before running this script"; exit;;

esac