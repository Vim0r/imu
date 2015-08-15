#!/bin/sh

# install program
sudo apt-get install build-essential xorg openbox thunar -y
sudo apt-get install bcmwl-kernel-source broadcom-sta-common -y
sudo apt-get install gksu hal-info upower pm-utils python-software-properties software-properties-common -y
sudo apt-get install feh tint2 lxappearance obmenu qt4-qtconfig menu gnome-icon-theme ubuntu-mono pixmap gtk2-engines-murrine gtk2-engines-pixbuf gtk3-engines-unico dmz-cursor-theme -y
sudo apt-get install fcitx-rime wicd compton fonts-droid xscreensaver numlockx -y
sudo apt-get install xarchiver unzip p7zip-full rar unrar firefox firefox-locale-zh-hans -y

# set audio
sudo apt-get install alsa-base alsa-utils alsa-tools-gui -y
sudo alsactl init
sudo apt-get install volumeicon-alsa -y

# set path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin/:/sbin:/bin:/usr/game:$PATH
rm -rf ~/.cache
ln -sT /tmp ~/.cache

# set autostart
mkdir ~/.config
mkdir ~/.config/openbox
cd ~/.config/openbox
echo 'xscreensaver -no-splash &' > autostart
echo 'eval `cat $HOME/.fehbg` &' >> autostart
echo 'compton -cC -f -i 1.0 -e 1.0 -o 1.0 -r 6 -l -4 -t -4 -I 0.30 -O 0.05 -D 2 -G -b &' >> autostart
echo 'numlockx &' >> autostart
echo '(sleep 2s && tint2) &' >> autostart
echo '(sleep 3s && volumeicon) &' >> autostart

# set network
mkdir ~/bak
cp /etc/network/interfaces ~/bak
sudo sed -i '/usb/d' /etc/network/interfaces

# startx openbox-session
cd ~

cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo 'exec openbox-session' >> .xinitrc

cp /etc/profile ~/.profile
echo '
if [ -z "$DISPLAY" ] && [ $(tty) == /dev/tty1 ]; then
	startx
fi
' >> .profile