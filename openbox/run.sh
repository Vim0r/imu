#!/bin/sh

# set sources.list
sudo sed -i '/cdrom/d' /etc/apt/sources.list

# install program
sudo apt-get install python-software-properties software-properties-common -y
sudo add-apt-repository ppa:satyajit-happy/themes -y
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install bcmwl-kernel-source broadcom-sta-common -y
sudo apt-get install xorg openbox slim thunar -y
sudo apt-get install feh lxappearance obmenu qt4-qtconfig gtk-chtheme menu build-essential fonts-droid gksu hal-info upower gnome-icon-theme -y
sudo apt-get install wicd tint2 fcitx-rime xcompmgr xfce4-notifyd xfce4-screenshooter synaptic xfce4-terminal xcompmgr numlockx -y
sudo apt-get install numix-gtk-theme -y
sudo apt-get install xarchiver p7zip-full rar unrar unzip thunar-archive-plugin -y
sudo apt-get install firefox firefox-locale-zh-hans -y

# set ramdisk
sudo cp /etc/fstab /etc/fstab.bak
cd /etc
sudo echo '' >> fstab
sudo echo 'tmpfs /tmp tmpfs noatime,size=256M 0 0' >> fstab
sudo echo 'tmpfs /var/tmp tmpfs noatime,size=256M 0 0' >> fstab
sudo echo 'tmpfs /var/log tmpfs noatime,size=256M 0 0' >> fstab
sudo echo 1 > /proc/sys/vm/swappiness

# set audio
sudo apt-get install alsa-base alsa-utils volumeicon-alsa -y
sudo alsactl init

# set font
cd ~
mkdir /usr/share/fonts/custom
wget http://2dx.pc6.com/qd2/pc6-consolaztxz.zip
unzip pc6-consolaztxz.zip
sudo cp consola.ttf /usr/share/fonts/custom/
cd /usr/share/fonts/custom
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
