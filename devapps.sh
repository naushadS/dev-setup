#!/usr/bin/env bash

#Installing devtools

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

####################################### VISUAL STUDIO CODE #######################################

read -p "Install Visual Studio Code? " -n 1;
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
    #Install dependencies
    sudo apt-get install -f
    echo "cleaning up .deb installer file"
    rm "${vscodedebfile}"	
    echo "Visual Studio Code Installed!"
    echo "";

fi;
