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
            echo "Syncing the dev-setup repo to your local machine.";
            echo "------------------------------";
            echo "";
            #cd ~ && curl -#L https://github.com/naushads/dev-setup/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE}
        fi
        
        if [ $ARG == "update" ] || [ $ARG == "all" ]; then
            # Run the utils.sh Script
            echo "------------------------------";
            echo "Update packages and repositories";
            echo "------------------------------";
            echo "";
            sudo apt-get update;
            echo "";
        fi
        
        if [ $ARG == "devtools" ] || [ $ARG == "all" ]; then
            # Run the utils.sh Script
            echo "------------------------------";
            echo "Setting up devtools";
            echo "? Docker";
            echo "------------------------------";
            echo "";
            bash ./devtools.sh
        fi

        if [ $ARG == "utils" ] || [ $ARG == "all" ]; then
            # Run the utils.sh Script
            echo "------------------------------";
            echo "Setting up Utils";
            echo "? XPAD/ Redshift";
            echo "------------------------------";
            echo "";
            bash ./utils.sh
        fi
        
        if [ $ARG == "test" ] || [ $ARG == "all" ]; then
            # Run the utils.sh Script
            echo "------------------------------";
            echo "Test";
            echo "------------------------------";
            echo "";
            bash ./temp.sh
        fi
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
