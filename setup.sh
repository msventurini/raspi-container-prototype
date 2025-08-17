#!/bin/sh

apt-get install -y qemu-system-aarch64

cd ..

mkdir raspi-container

apt-get install -y qemu-system-aarch64

wget https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64.img.xz

fdisk -l ./2023-05-03-raspios-bullseye-arm64.img

sudo mkdir /mnt/image

sudo mount -o loop,offset=4194304 ./2023-05-03-raspios-bullseye-arm64.img /mnt/image/

ls -ls /mnt/image/

cp /mnt/image/bcm2710-rpi-3-b-plus.dtb ~
cp /mnt/image/kernel8.img ~

# openssl passwd -6

# senha gerada
# $6$DLJ421NCDPLOdSpN$6o797./rv6UVfR3PmAxbkElkVILTSlBn4JINIJbfF4W.oNM4XvTLOZA7KVw1MHH0p3icTixDq0xNeZRHKHyjJ.

# echo 'pi:$6$DLJ421NCDPLOdSpN$6o797./rv6UVfR3PmAxbkElkVILTSlBn4JINIJbfF4W.oNM4XvTLOZA7KVw1MHH0p3icTixDq0xNeZRHKHyjJ.' | sudo tee /mnt/image/userconf

# sudo touch /mnt/image/ssh

# qemu-img resize ./2023-05-03-raspios-bullseye-arm64.img 8G

# qemu-system-aarch64 -machine raspi3b -cpu cortex-a72 -nographic -dtb  ~/bcm2710-rpi-3-b-plus.dtb -m 1G -smp 4 -kernel  ~/kernel8.img -sd 2023-05-03-raspios-bullseye-arm64.img -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" -device usb-net,netdev=net0 -netdev user,id=net0,hostfwd=tcp::2222-:22 