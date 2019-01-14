#!/usr/bin/env bash

#Installing essential libraries

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#installing gcc compiler:
sudo apt-get install build-essential

#for media codecs to play .mp4,.api etc:
sudo apt install -y ubuntu-restricted-extras

#for netflix:
sudo apt-get install -y libavcodec-extra

#pipreqs - Generate requirements.txt file for any project based on imports
pip install pipreqs

####################################### thefuck ###################################
read -p "Install thefuck? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### thefuck                                         ###";
    echo "#######################################################";
    echo "";

    instaling thefuck:
    pip install thefuck
    fuck
    fuck
    source ~/.bashrc
    echo "";
fi

#program for beautifying bash script:
####################################### beautysh ###################################
read -p "Install beautysh? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### beautysh                                        ###";
    echo "#######################################################";
    echo "";

    pip install beautysh
    #beautify bash scripts using:
    #beautifysh -f ./*.sh
    echo "";
fi

####################################### kaggle api ###################################
read -p "Install kaggle api? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Kaggle API                                      ###";
    echo "#######################################################";
    echo "";

    pip install kaggle
    echo "!!!!!!!!!!!!!!! READ INSTRUCTION !!!!!!!!!!!!!!!!!";
    echo "Access Kaggle account at https://www.kaggle.com."
    echo "Then go to the 'Account' tab of your user profile (https://www.kaggle.com/<username>/account) and select 'Create API Token'."
    echo "This will trigger the download of kaggle.json in ~/Downloads, a file containing your API credentials."
    read -n 1 -p "Press any key to continue";
    xdg-open https://www.kaggle.com
    read -n 1 -p "Press any key if you have downloaded kaggle.json file to ~/Downloads to configure Kaggle API";
    mv ~/Downloads/kaggle.json ~/.kaggle/
    chmod 600 ~/.kaggle/kaggle.json
    echo "";
fi

#Install dependencies
sudo apt-get install -f

