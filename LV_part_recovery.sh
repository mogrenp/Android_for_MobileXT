pvcreate /dev/mmcblk0p3 -ff -y
vgcreate VolGroup00 /dev/mmcblk0p3
lvcreate -L 2G VolGroup00 --name recovery
mkfs.ext4 /dev/VolGroup00/recovery
mount /dev/VolGroup00/recovery /mnt
tar -xf recovery.tar -C /mnt
umount /mnt
