#!/bin/bash
echo "dtparam=uart0=on" >> /boot/config.txt
echo "enable_uart = 1" >> /boot/config.txt
sed -i "s/console=tty1//g" /boot/cmdline.txt
sed -i "s/console=serial0/console=tty1/g" /boot/cmdline.txt
