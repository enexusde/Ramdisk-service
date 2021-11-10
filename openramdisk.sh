#!/bin/bash
rsync -a /var/lib/ramdisk/ramdisk.xfs /tmp/ramdisk.xfs
mkdir -p /tmp/ramdisk
mount -o loop /tmp/ramdisk.xfs /tmp/ramdisk
chmod 0777 /tmp/ramdisk
