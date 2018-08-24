#!/usr/bin/env bash

#Installing utils

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

####################################### DOCKER #######################################

read -p "Install Docker? " -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Docker                                          ###";
    echo "#######################################################";
    echo "";
    
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Installing Docker<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
    echo "add the GPG key for the official Docker repository to the system:";
    echo "";
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    
    echo "Add the Docker repository to APT sources:";
    echo "";
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
    
    echo "update the package database with the Docker packages from the newly added repo:";
    echo "";
    sudo apt-get update
    
    echo "Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo:";
    echo "";
    apt-cache policy docker-ce
    
    echo "install Docker:";
    echo "";
    sudo apt-get install -y docker-ce
    
    echo "Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:";
    echo "";
    sudo systemctl status docker
    
    echo "Executing the Docker Command Without Sudo (Optional)";
    echo "";
    #refer https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
    
    echo "If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:";
    echo "";
    sudo usermod -aG docker ${USER}
    
    echo "To apply the new group membership, you can log out of the server and back in, or you can type the following:";
    echo "";
    su - ${USER}
    
    echo "You will be prompted to enter your user's password to continue. Afterwards, you can confirm that your user is now added to the docker group by typing:";
    echo "";
    id -nG

    echo "check docker version:";
    echo "";
    docker version

    echo "";
    echo "";
fi