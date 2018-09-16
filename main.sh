#!/usr/bin/env bash

function main(){
    # Ask for the administrator password upfront
    sudo -v

    # Keep-alive: update existing `sudo` time stamp until the script has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    for ARG in "$@"
    do
        if [ $ARG == "bootstrap" ] || [ $ARG == "all" ]; then
            echo "";
            echo "------------------------------";
            echo "Syncing the dev-setup repo to your local machine at ~/.";
            echo "------------------------------";
            echo "";
            cd ~ && mkdir dev-setup && cd dev-setup && curl -#L https://github.com/naushads/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
        fi

        if [ $ARG == "update" ] || [ $ARG == "all" ]; then
            echo "------------------------------";
            echo "Update packages and repositories";
            echo "------------------------------";
            echo "";
            sudo apt-get update;
            echo "";
        fi

        if [ $ARG == "devtools" ] || [ $ARG == "all" ]; then
            # Run the devtools.sh Script
            echo "------------------------------";
            echo "Setting up devtools";
            echo "Currently Supported Options: Git, Node.js, Docker";
            echo "------------------------------";
            echo "";
            bash ./devtools.sh
        fi

        if [ $ARG == "devapps" ] || [ $ARG == "all" ]; then
            # Run the devapps.sh Script
            echo "------------------------------";
            echo "Setting up devapps";
            echo "Currently Supported Options: Google Chrome, Visual Studio Code, Postman, Slack, Sky for linux, VLC, Spotify";
            echo "------------------------------";
            echo "";
            bash ./devapps.sh
        fi

        if [ $ARG == "datasciencetools" ] || [ $ARG == "all" ]; then
            # Run the datasciencetools.sh Script
            echo "------------------------------";
            echo "Setting up datasciencetools";
            echo "Currently Supported Options: Anaconda Distribution";
            echo "------------------------------";
            echo "";
            bash ./datasciencetools.sh
        fi

        if [ $ARG == "datastores" ] || [ $ARG == "all" ]; then
            # Run the datastores.sh Script
            echo "------------------------------";
            echo "Setting up datastores";
            echo "Currently Supported Options: Redis, Mongodb";
            echo "------------------------------";
            echo "";
            bash ./datastores.sh
        fi

        if [ $ARG == "utils" ] || [ $ARG == "all" ]; then
            # Run the utils.sh Script
            echo "------------------------------";
            echo "Setting up Utils";
            echo "Currently Supported Options: XPAD,  Redshift, Terminator, Vim Editor, Safe Eyes";
            echo "------------------------------";
            echo "";
            bash ./utils.sh
        fi

        if [ $ARG == "libraries" ] || [ $ARG == "all" ]; then
            # Run the libraries.sh Script
            echo "------------------------------";
            echo "Setting up libraries";
            echo "Currently Supported Options: thefuck, beautysh";
            echo "------------------------------";
            echo "";
            bash ./libraries.sh
        fi

        if [ $ARG == "miscellaneous" ] || [ $ARG == "all" ]; then
            # Run the miscellaneous.sh Script
            echo "------------------------------";
            echo "Setting up miscellaneous";
            echo "------------------------------";
            echo "";
            bash ./miscellaneous.sh
        fi

        if [ $ARG == "bashcustomization" ] || [ $ARG == "all" ]; then
            # Run the bashcustomization.sh Script
            echo "------------------------------";
            echo "Setting up bashcustomization";
            echo "Currently Supported Options: Bash Prompt String Customiation, Genreraal Bash Aliases";
            echo "------------------------------";
            echo "";
            bash ./bashcustomization.sh
        fi

        if [ $ARG == "test" ] || [ $ARG == "all" ]; then
            # Run the utils.sh Script
            echo "------------------------------";
            echo "Test Script";
            echo "------------------------------";
            echo "";
            bash ./test.sh
        fi

        #Install dependencies
        sudo apt-get install -f

        echo "------------------------------"
        echo "Completed running main.sh, restart your computer to ensure all updates take effect"
        echo "------------------------------"
    done
}

read -p "This script may overwrite existing files. Are you sure you want to proceed? (y/n) " -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    main $@
fi;

unset main;
