umount /boot/efi
mdadm  --create /dev/md2 -R --metadata 1.0 --raid-devices=2 --level=1 /dev/nvme[01]n1p1 
mkfs.fat -F32 /dev/md2
mount /dev/md2 /boot/efi
mdadm --detail --scan|grep -F '1.0' >> /etc/mdadm/mdadm.conf 
update-grub
grub-install --no-nvram   --target=x86_64-efi /dev/md1
update-initramfs -u
sed -i '/efi/d' /etc/fstab ; uid=$(blkid|grep vfat|awk {'print $2'}) ; echo "$uid  /boot/efi       vfat    umask=0077      0       1" >> /etc/fstab
