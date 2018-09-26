#!/usr/bin/env bash

#Installing datastores

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#repo's root path
repoWorkingDirectory=$(pwd)

####################################### REDIS #######################################

read -p "Install Redis? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Redis                                           ###";
    echo "#######################################################";
    echo "";

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Installing Redis<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";

    #install redis client
    sudo apt install redis-tools

    #install redis server
    sudo apt install redis

    echo "";
fi

####################################### Mongodb #######################################

read -p "Install Mongodb? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Mongodb                                         ###";
    echo "#######################################################";
    echo "";
    sudo apt update
    sudo apt install -y mongodb
    sudo systemctl status mongodb
    mongo --eval 'db.runCommand({ connectionStatus: 1 })'
    #disable automatic start on startup
    sudo systemctl disable mongodb
fi


###########################################FINISHING STEPS####################################

#restore current working directory to repo's root path
cd ${repoWorkingDirectory}

#Install dependencies
sudo apt-get install -f