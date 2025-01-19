#!/bin/bash

# Created by ags131

cd /sys/kernel/config/usb_gadget
mkdir g1
cd g1
echo "0x1430" > idVendor
echo "0x0150" > idProduct
echo "0x0200" > bcdUSB
echo "0x0100" > bcdDevice
echo "0x40" > bMaxPacketSize0

mkdir strings/0x409
echo "Activision" > strings/0x409/manufacturer
echo "Spyro Porta" > strings/0x409/product

mkdir functions/hid.g0
echo 64 > functions/hid.g0/report_length
echo -ne "\x06\x00\xFF\x09\x01\xA1\x01\x19\x01\x29\x40\x15\x00\x26\xFF\x00\x75\x08\x95\x20\x81\x00\x19\x01\x29\xff\x91\x00\xC0" > functions/hid.g0/report_desc
#mkdir functions/acm.g1
#mkdir functions/ecm.g2

mkdir configs/c.1
mkdir configs/c.1/strings/0x409
echo "Spyro Porta" > configs/c.1/strings/0x409/configuration 
echo 250 > configs/c.1/MaxPower
ln -s functions/hid.g0/ configs/c.1/
#ln -s functions/acm.g1/ configs/c.1/
#ln -s functions/ecm.g2/ configs/c.1/
UDC=$(ls /sys/class/udc)
#rmmod libcomposite g_ether u_ether usb_f_rndis
sleep 3;
