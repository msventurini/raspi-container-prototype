#!/bin/sh

sudo apt-get install -y qemu-system-aarch64

# cd ..

# mkdir -p raspi-container
# cd raspi-container

mkdir -p images
cd images

# if [[ ! -f 2023-05-03-raspios-bullseye-arm64.img.xz ]]; then
wget -nc https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2023-05-03/2023-05-03-raspios-bullseye-arm64.img.xz
# fi

if [ ! -f 2023-05-03-raspios-bullseye-arm64.img ]; then
xz -dk 2023-05-03-raspios-bullseye-arm64.img.xz
fi


fdisk -l ./2023-05-03-raspios-bullseye-arm64.img
echo "a"

qemu-img resize ./2023-05-03-raspios-bullseye-arm64.img 8G
echo "aa"

sudo mkdir -p /mnt/image
echo "b"

sudo mount -o loop,offset=4194304 ./2023-05-03-raspios-bullseye-arm64.img /mnt/image/
echo "c"

ls -ls /mnt/image/
echo "d"

cd ..

cp /mnt/image/bcm2710-rpi-3-b-plus.dtb .
echo "e"

cp /mnt/image/kernel8.img .
echo "f"

#  fullname


#!/bin/bash
echo "Enter your desired login: "
read login
# if [ "$login" == "" ]; then
#     $login = "pi"
# fi
echo "$login"
echo "$login"
echo "$login"
echo "$login"

result=$(openssl passwd -6)
echo $result
echo $result
echo $result
echo $result

# senha gerada
# $6$DLJ421NCDPLOdSpN$6o797./rv6UVfR3PmAxbkElkVILTSlBn4JINIJbfF4W.oNM4XvTLOZA7KVw1MHH0p3icTixDq0xNeZRHKHyjJ.

# echo 'pi:$6$DLJ421NCDPLOdSpN$6o797./rv6UVfR3PmAxbkElkVILTSlBn4JINIJbfF4W.oNM4XvTLOZA7KVw1MHH0p3icTixDq0xNeZRHKHyjJ.' | sudo tee /mnt/image/userconf

# sudo touch /mnt/image/ssh

# qemu-img resize ./2023-05-03-raspios-bullseye-arm64.img 8G

# qemu-system-aarch64 -machine raspi3b -cpu cortex-a72 -nographic -dtb ./bcm2710-rpi-3-b-plus.dtb -m 1G -smp 4 -kernel ./kernel8.img -sd ./images/2023-05-03-raspios-bullseye-arm64.img -append "rw earlyprintk loglevel=8 console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootdelay=1" -device usb-net,netdev=net0 -netdev user,id=net0,hostfwd=tcp::2222-:22