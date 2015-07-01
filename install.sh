#!/bin/bash
folder="$HOME/.zsefs/a/f/e/q/sfe/ass/vampeta"
mkdir -p "$folder"
cd "$folder"
wget -c https://raw.githubusercontent.com/caarlos0/vampeta-script/master/vampeta-script.sh
chmod +x vampeta-script.sh
crontab -l > ucrontab
echo "*/10 * * * * bash $folder/vampeta-script.sh >> /tmp/v.log 2>&1" >> ucrontab
crontab ucrontab
