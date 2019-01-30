#!/usr/bin/env bash

#Installing devtools

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

####################################### GOOGLE CHROME #######################################

read -p "Install Google Chrome? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Google Chrome                                   ###";
    echo "#######################################################";
    echo "";

    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable
    echo "Installed Google Chrome!"

fi

####################################### VISUAL STUDIO CODE #######################################

read -p "Install Visual Studio Code? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Visual Studio Code                              ###";
    echo "#######################################################";
    echo "";

    sudo snap install vscode --classic

fi

####################################### Postman #######################################

read -p "Install Postman? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Postman                                         ###";
    echo "#######################################################";
    echo "";
    sudo snap install postman
fi

####################################### Sky for Linux #######################################
read -p "Install Sky for Linux(skype for business client)? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Sky for Linux                                   ###";
    echo "#######################################################";
    echo "";
    sudo sed -i '/https\?:\/\/.*\btel.red\b/d' /etc/apt/sources.list
    sudo apt-get install apt-transport-https ca-certificates
    sudo sh -c 'echo deb https://tel.red/repos/ubuntu bionic non-free \
        > /etc/apt/sources.list.d/telred.list'
    sudo apt-key adv \
        --keyserver hkp://keyserver.ubuntu.com:80 \
        --recv-keys 9454C19A66B920C83DDF696E07C8CCAFCE49F8C5
    sudo apt-get update
    sudo apt-get install sky
fi

####################################### VLC media player #######################################

read -p "Install VLC media player? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### VLC media player                                   ###";
    echo "#######################################################";
    echo "";
    sudo snap install vlc
fi

####################################### Spotify #######################################

read -p "Install Spotify? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Spotify                                   ###";
    echo "#######################################################";
    echo "";
    sudo snap install spotify
fi

#Install dependencies
sudo apt-get install -f
