#!/bin/bash

urls=("http://img.r7.com/images/2014/06/25/35uegnu4hd_i494wnd8_file.jpg" "http://www.culturamix.com/wp-content/uploads/2009/10/vampeta-3.jpg")
wget "${urls[$RANDOM % ${#urls[@]} ]}" -O /tmp/vampeta.jpg

### gnome2 ###
dbus-launch gconftool-2 --type str --set /desktop/gnome/background/picture_options wallpaper
dbus-launch gconftool-2 --type str --set /desktop/gnome/background/picture_filename /tmp/vampeta.jpg

### gnome3 ###
dbus-launch gsettings set org.gnome.desktop.background picture-options "wallpaper"
dbus-launch gsettings set org.gnome.desktop.background picture-uri file:///tmp/vampeta.jpg
