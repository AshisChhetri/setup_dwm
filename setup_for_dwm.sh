#!/bin/bash
echo "Welcome to Ashis Dwm setup script!"
echo "Enter username"
read varuser
id -u $varuser > /dev/null
if [ $? -ne 0 ]; then
        echo "The user is not valid"
        exit -1
fi

apt -y install build-essential libx11-dev libxinerama-dev libxft-dev \
               wget xinit xserver-xorg zsh x11-xserver-utils \
               fonts-font-awesome firefox-esr curl compton nitrogen \
	       mpv imagemagick
		

git clone https://github.com/AshisChhetri/suckless.git

# part 2 dwm install 

cd suckless/dwm/
make clean install
make clean
cd ../st
make clean install
make clean
cd ../dmenu
make clean install
make clean
#cd ../slstatus
#make clean install
#make clean
cd ../

echo "exec dwm" >> ~/.xinitrc



# chsh -s /bin/zsh $varuser
# cp .zshrc /home/$varuser/.zshrc
# chown $varuser.$varuser /home/$varuser/.zshrc
# cp .xinitrc /home/$varuser/.xinitrc
# chown $varuser.$varuser /home/$varuser/.xinitrc
# cp ./dircolors-solarized/dircolors.256dark /home/$varuser/.dir_colors
