#!/bin/bash
mkdir /mnt/sd

mkfs.ext4 /dev/block/$1$2 <<EOF
y
EOF
echo 0

mount -t ext4 /dev/block/$1$2 /mnt/sd
echo 1

cp -a /system/* /mnt/sd
echo 2

sync
echo 3

umount /mnt/sd
echo 4

sync
echo 5

rm -rf /mnt/sd
echo 6

#fileend
