pvcreate /dev/mmcblk0p3 -ff -y
vgcreate VolGroup00 /dev/mmcblk0p3

echo "Making boot partition"
lvcreate -L 2G VolGroup00 --name boot
mkfs.ext3 /dev/VolGroup00/boot
mount /dev/VolGroup00/boot /mnt
echo "Extracting boot.tar"
tar -xf boot.tar -C /mnt
umount /mnt

echo "Making system partition"
lvcreate -L 2G VolGroup00 --name system
mkfs.ext3 /dev/VolGroup00/system
mount /dev/VolGroup00/system /mnt
echo "Extracting system.tar"
tar -xf system.tar -C /mnt
umount /mnt

echo "Making data partition"
lvcreate -L 2G VolGroup00 --name data
mkfs.ext3 /dev/VolGroup00/data

echo "Making misc partition"
lvcreate -L 2G VolGroup00 --name misc
mkfs.ext3 /dev/VolGroup00/misc

echo "Making recovery partition"
lvcreate -L 2G VolGroup00 --name recovery
mkfs.ext3 /dev/VolGroup00/recovery
mount /dev/VolGroup00/recovery /mnt
echo "Extracting recovery.tar"
tar -xf recovery.tar -C /mnt
umount /mnt

echo "Making cache partition"
lvcreate -L 2G VolGroup00 --name cache
mkfs.ext3 /dev/VolGroup00/cache

echo "Making private partition"
lvcreate -L 2G VolGroup00 --name private
mkfs.ext3 /dev/VolGroup00/private

echo "Making UDISK partition"
lvcreate -L 2G VolGroup00 --name UDISK
mkfs.vfat /dev/VolGroup00/UDISK
