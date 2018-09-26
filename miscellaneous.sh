#!/usr/bin/env bash

#Installing essential libraries

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#ubuntu 18.04 rotation bug solution:
gsettings set org.gnome.settings-daemon.plugins.orientation active false

#gnome tweaks tool:
sudo apt install gnome-tweaks

#Add "New Document.txt" in templates folder to unlock ability create new doc with right clock on file explorer.
cat > ~/Templates/New\ Document << EOF
EOF

#replace meld light theme with a dark one
read -p "replace meld light theme with a dark one? (press y for yes)" -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then

    cat > /usr/share/meld/meld.css << EOF
@define-color insert-bg #002200;
@define-color insert-outline shade(@insert-bg, 1.8);
@define-color insert-text #008800;
@define-color delete-bg #111111;
@define-color delete-outline shade(@delete-bg, 1.8);
@define-color delete-text #880000;
@define-color replace-bg #000033;
@define-color replace-outline shade(@replace-bg, 1.8);
@define-color replace-text #0044dd;
@define-color conflict-bg Pink;
@define-color conflict-outline shade(@conflict-bg, 1.8);
@define-color conflict-text #ff0000;
@define-color error-bg #fce94f;
@define-color error-outline shade(@error-bg, 1.8);
@define-color error-text #faad3d;
@define-color inline-bg #333366;
@define-color inline-fg Red;
@define-color unknown-text #888888;
@define-color current-line-highlight #111100;
@define-color syncpoint-outline #555555;
@define-color current-chunk-highlight #800080;

.meld-notebook-toolbar.toolbar {
    background-image: none;
    background-color: @theme_base_color;
    border-width: 0 0 1px 0;
    border-style: solid;
    border-color: @borders;

    -GtkToolbar-button-relief: none;
    padding: 3px 2px 2px 2px;
}

LinkMap {
    border-width: 0 0 1px 0;
    border-style: solid;
    border-color: @borders;
}

.meld-vc-console-pane {
    border-width: 1px 0 0px 0;
    border-style: solid;
    border-color: @borders;
}
EOF
fi

#Install dependencies
sudo apt-get install -f