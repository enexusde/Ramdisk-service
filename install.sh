#!/bin/bash
export old='`pwd`'
export RDIR='/usr/share/ramdisk'
echo -n "Where to install [`echo $RDIR`]: "
read dir
if [ "$dir" != "" ] ;then
    export RDIR="$dir"
fi

if [ -d "$RDIR" ]; then
  echo "Directory already exists! Cancel"
  exit 1
fi
mkdir $RDIR
cp * $RDIR
cd $RDIR
sudo chmod +x createramdisk openramdisk closeramdisk deleteramdisk
sudo ./createramdisk
sudo systemctl enable ramdisk.service
sudo systemctl start ramdisk.service
