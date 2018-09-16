#!/usr/bin/env bash

#Installing utils

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Variables
node_stable=8.10.0
node_latest=10.10.0

####################################### GIT #######################################

read -p "Install Git? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Git                                             ###";
    echo "#######################################################";
    echo "";

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Installing Git<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
    sudo apt update
    sudo apt install git
    echo "Installed version:" && git --version
    echo "Enter global user.name for git: "
    read username_git
    git config --global user.name $username_git
    echo "Enter global user.email for git: "
    read useremail_git
    git config --global user.email $useremail_git
    echo "Set Git Config:"
    git config --list
    echo "Git Installed and Configured!"
    echo "installing meld and setting it as default difftool";
    sudo apt install meld
    git config --global diff.tool meld
    echo "";
fi

####################################### NODE.js #######################################

read -p "Install Node.js? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Node.js                                         ###";
    echo "#######################################################";
    echo "";

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Installing node via nvm way<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    echo "";

    echo "Testing nvm installation:";
    command -v nvm

    nvm install ${node_stable}
    nvm install ${node_latest}
    nvm alias latest ${node_latest}
    nvm alias stable ${node_stable}
    nvm alias default stable
    nvm alias node default
    nvm use default
    echo "Installed node and npm!";
fi

####################################### DOCKER #######################################

read -p "Install Docker? (press y for yes)" -n 1;
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

#Install dependencies
sudo apt-get install -f