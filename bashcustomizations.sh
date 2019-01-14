#!/usr/bin/env bash

#Installing utils

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

####################################### Bash Prompt String Customization #######################################

read -p "Do Bash Prompt String Customization? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Bash Prompt String Customization                ###";
    echo "#######################################################";
    echo "";

    cat >> ~/.bashrc << EOF

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[37m\][\[\033[31m\]\u\[\033[37m\]@\[\033[37m\]\h\[\033[37m\]] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

EOF

source ~/.bashrc
echo "bash prompt string updated!";

fi

####################################### Bash Aliases #######################################

read -p "Setup Bash Aliases? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Bash Aliases                                    ###";
    echo "#######################################################";
    echo "";

cat >> ~/.bashrc << EOF

#Git
alias gs='git status'
alias gf='git fetch'
alias gb='git branch -v'
alias gr='git remote -v'
alias gp='git pull'
alias gsl='git stash list'

alias redistart='sudo systemctl start redis-server'
alias redisstop='sudo systemctl stop redis-server'
alias mongostart='sudo systemctl start mongodb'
alias mongostop='sudo systemctl stop mongodb'

alias nmdp='cd ~/code/javascript/work/mdp-nodejs-api'
EOF
source ~/.bashrc
echo "aliases added!"
fi
