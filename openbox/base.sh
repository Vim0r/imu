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
sudo apt-get install wicd tint2 fcitx-rime xcompmgr leafpad xfce4-notifyd xfce4-screenshooter synaptic xfce4-terminal xcompmgr numlockx -y
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

# set autostart
sudo echo 'eval `cat $HOME/.fehbg` &' > /etc/xdg/openbox/autostart
sudo echo 'tint2 &' >> /etc/xdg/openbox/autostart
sudo echo 'xcompmgr -cCfF -r5 -o.30 -l-5 -t-1 -D5 &' >> /etc/xdg/openbox/autostart
sudo echo 'volumeicon &' >> /etc/xdg/openbox/autostart
sudo echo '' >> /etc/xdg/openbox/autostart
