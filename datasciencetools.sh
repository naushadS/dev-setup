#!/usr/bin/env bash

#Installing devtools

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

####################################### ANACONDA DISTRIBUTION #######################################

read -p "Install Anaconda Distribution? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Anaconda Distribution                           ###";
    echo "#######################################################";
    echo "";

    echo "!!!!!!!!!!!!!!! READ INSTRUCTION !!!!!!!!!!!!!!!!!";
    read -n 1 -p "Anaconda's download webpage will open now. Download anaconda installer .sh file to ~/Downloads manually. Press any key to continue";
    xdg-open https://www.anaconda.com/download/\#linux
    read -n 1 -p "Press any key if you have downloaded .sh file to ~/Downloads to start anaconda installation";
    anacondainstallerfile="$(ls ~/Downloads/Anaconda*.sh)"
    bash "${anacondainstallerfile}"
    echo "cleaning up .sh installer file"
    rm "${anacondainstallerfile}"
    source ~/.bashrc
    echo "upgrading pip";
    pip install --upgrade pip
    echo "Anaconda Distribution Installed!"
    echo "";

fi

#Install dependencies
sudo apt-get install -f