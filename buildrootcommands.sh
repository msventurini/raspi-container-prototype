

sudo apt update
# sudo apt upgrade

#install build tools
sudo apt install -y which sed make binutils build-essential diffutils gcc  g++  bash patch gzip bzip2 perl  tar cpio unzip rsync file  bc findutils gawk git

#fetching tool
sudo apt install -y wget


#visualizing the menus
sudo apt install -y libncurses6 libncurses-dev

#optionals
sudo apt install -y python3

git clone https://github.com/buildroot/buildroot.git

cd buildroot/

make menuconfig


# # linux kernel tools gpio tb
# #  1. Select Kernel > Linux Kernel Tools > gpio
# #  1. Select Target Packages > Libraries > Hardware Handling > libgiod a
# picosdk tb
# #  1. Select Target Packages > Libraries > Hardware Handling > libgiod install tools

# # .config-menuconfig


# make linux-menuconfig