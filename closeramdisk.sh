#!/bin/bash
xfs_freeze -f /tmp/ramdisk
rsync -a /tmp/ramdisk.xfs /var/lib/ramdisk/ramdisk.xfs
xfs_freeze -u /tmp/ramdisk
umount -ld /tmp/ramdisk
# /tmp/ramdisk.xfs and /tmp/ramdisk are not deleted
# deleting them might cause problems with open connections and unfinished transactions.
