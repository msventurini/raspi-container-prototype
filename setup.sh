#!/bin/sh

sudo apt-get install -y qemu-system-aarch64

cd ..

# mkdir -p raspi-container
# cd raspi-container

mkdir -p images
cd images

# if [[ ! -f 2023-05-03-raspios-bullseye-arm64.img.xz ]]; then
wget -nc https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64.img.xz
# fi

# fdisk -l ./2023-05-03-raspios-bullseye-arm64.img

# sudo mkdir /mnt/image

# sudo mount -o loop,offset=4194304 ./2023-05-03-raspios-bullseye-arm64.img /mnt/image/

# ls -ls /mnt/image/

# cp /mnt/image/bcm2710-rpi-3-b-plus.dtb ~
# cp /mnt/image/kernel8.img ~

# openssl passwd -6

# senha gerada
# $6$DLJ421NCDPLOdSpN$6o797./rv6UVfR3PmAxbkElkVILTSlBn4JINIJbfF4W.oNM4XvTLOZA7KVw1MHH0p3icTixDq0xNeZRHKHyjJ.

# echo 'pi:$6$DLJ421NCDPLOdSpN$6o797./rv6UVfR3PmAxbkElkVILTSlBn4JINIJbfF4W.oNM4XvTLOZA7KVw1MHH0p3icTixDq0xNeZRHKHyjJ.' | sudo tee /mnt/image/userconf

# sudo touch /mnt/image/ssh

# qemu-img resize ./2023-05-03-raspios-bullseye-arm64.img 8G