#!/bin/bash
mkdir /var/lib/ramdisk
dd if=/dev/zero of=/var/lib/ramdisk/ramdisk.xfs bs=1M count=1024 status=none
mkfs.xfs -q /var/lib/ramdisk/ramdisk.xfs
