# source ~/.config/autostart/redshift-gtk.desktop
# echo "X-GNOME-Autostart-enabled", ${X\-GNOME\-Autostart\-enabled}


result=$(grep '^X-GNOME-Autostart-enabled' ~/.config/autostart/redshift-gtk.desktop | sed 's/^X-GNOME-Autostart-enabled=//');
echo $result;