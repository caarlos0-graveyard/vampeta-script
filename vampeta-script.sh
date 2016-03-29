#!/bin/bash

musicurl="http://balanceo1.elrellano.net/descargasMP3/NgAyCzYDY1A/quebradura-de-voz-elRellano.mp3"
urls=("http://img.r7.com/images/2014/06/25/35uegnu4hd_i494wnd8_file.jpg" "http://www.culturamix.com/wp-content/uploads/2009/10/vampeta-3.jpg")
curl -s "${urls[$RANDOM % ${#urls[@]} ]}" > /tmp/vampeta.jpg
curl -s $musicurl > /tmp/voz.mp3

### OSX ###
if [ "$(uname)" == "Darwin" ]; then
  keys=(107 113)
  osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/tmp/vampeta.jpg"'
  key=$RANDOM%2
  for i in {1..5}; do
    echo osascript -e \'tell application \"System Events\"\' -e \'key code ${keys[$key]}\' -e \'end tell\' | bash
  done
  afplay /tmp/voz.mp3
### Linux ###
else
  ### gnome2 ###
  dbus-launch gconftool-2 --type str --set /desktop/gnome/background/picture_options wallpaper
  dbus-launch gconftool-2 --type str --set /desktop/gnome/background/picture_filename /tmp/vampeta.jpg
  
  ### gnome3 ###
  dbus-launch gsettings set org.gnome.desktop.background picture-options "wallpaper"
  dbus-launch gsettings set org.gnome.desktop.background picture-uri file:///tmp/vampeta.jpg
  
  monitors=$(xrandr -q | grep " connected" | awk '{print $1}')
  for word in $monitors
  do
      arrpos=$[ $RANDOM % 1]
      value[0]=$[ $RANDOM%9 ]
      value[1]=$[ $RANDOM%10 ]
      xrandr --output $word --brightness 0.$value[$arrpos]
  done
  rhythmbox-client --play-uri=/tmp/voz.mp3
fi
