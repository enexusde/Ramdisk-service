#!/bin/bash
export old='`pwd`'
export RDIR='/usr/share/ramdisk'
echo -n "Where to install [`echo $RDIR`]: "
read dir
if [ "$dir" != "" ] ;then
    export RDIR="$dir"
fi

if [ -d "$RDIR" ]; then
  echo "Directory already exists. Cancel!"
  exit 1
fi

echo -n "How many gigabyte you like the ramdisk to be?: "
read sizegb

mkdir $RDIR
cp -rf * $RDIR
cd $RDIR
sudo chmod +x createramdisk.sh openramdisk.sh closeramdisk.sh deleteramdisk.sh
sudo ./createramdisk
sudo systemctl enable ramdisk.service
sudo systemctl start ramdisk.service
