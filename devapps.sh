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

    echo "!!!!!!!!!!!!!!! READ INSTRUCTION !!!!!!!!!!!!!!!!!";
    read -n 1 -p "VSCODE's download webpage will open now. Download vscode installer .deb file to ~/Downloads manually. Press any key to continue";
    xdg-open https://code.visualstudio.com/Download
    read -n 1 -p "Press any key if you have downloaded .deb file to ~/Downloads to start vscode installation";
    vscodedebfile="$(ls ~/Downloads/code_*.deb)"
    sudo dpkg -i "${vscodedebfile}"
    echo "cleaning up .deb installer file"
    rm "${vscodedebfile}"	
    echo "Visual Studio Code Installed!"
    echo "";

fi

#Install dependencies
sudo apt-get install -f
