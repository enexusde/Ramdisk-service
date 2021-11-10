#!/bin/bash
if [ -d "/etc/systemd/system" ]; then
  echo "Systemd available ... OK"
else
  echo "Missing systemd. Cancel!"
  exit 1
fi
export old='`pwd`'
export RDIR='/usr/share/ramdisk'
echo -n "Where to install [`echo $RDIR`]: "
read dir
if [ "$dir" != "" ] ;then
    export RDIR="$dir"
fi

if [ -d "$RDIR" ]; then
  echo "Directory already exists. Do you like to uninstall the Ramdisk-Service [y/n]?: "
  read deleterds
  if [ "$deleterds" != "y" ] ;then
    rm -rf $RDIR
    rm /etc/systemd/system/ramdisk.service
  fi  
  exit 1
fi

echo -n "How many gigabyte you like the ramdisk to be?: "
read sizegb
echo "export RDSIZEGB=$sizegb" >> setenv.sh
mkdir $RDIR
cp -rf * $RDIR
cd $RDIR
cp ramdisk.service /etc/systemd/system
sudo chmod +x createramdisk.sh openramdisk.sh closeramdisk.sh deleteramdisk.sh
sudo ./createramdisk
sudo systemctl enable ramdisk.service
sudo systemctl start ramdisk.service
