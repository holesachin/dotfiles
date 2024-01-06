#!/bin/bash

# exit on first error
set -e

# get filesystem type
fstype=$(df -T / | tail -1 | cut -d' ' -f2)

# get root partition
root_partition=$(df --output=source / | tail -n 1)

# set swapFile size ( = ram ) xG
sfsize=8
sfsize=$((sfsize * 1024))


#---------------------------------------------------------------------------------------------------------------

# create swapFile for btrfs filesystem
btrfs() {

# mount btrfs root filesystem to create a subvolume
sudo mount "${root_partition}" /mnt

# create a dedicated btrfs subvolume for swapFile to exclude swapFile from snapshots
sudo btrfs subvolume create /mnt/swap

# set correct permission to swap subvolume, for only root user can access
sudo chmod 700 /mnt/swap

# create directory to mount swap subvolume 
sudo makdir /swap

# create backup of '/etc/fstab' file
sudo cp /etc/fstab /etc/fstab.backup

# add subvolume entry to '/etc/fstab' file
echo ""${root_partition}" /swap btrfs defaults,noatime,subvol=swap 0 0" | sudo tee -a /etc/fstab

# mount swap subvolume 
mount -o defaults,noatime,subvol=swap "${root_partition}" /swap

# create swapFile in swap subvolume
sudo truncate -s 0 /swap/swapfile

# disable copy_on_write swapfile
sudo chattr +C /swap/swapfile

# allocate size for swapFile 
fallocate -l "${sfsize}" swap/swapfile

# only access permission to root user
sudo chmod 600 /swap/swapfile

# initialize swapFile
sudo mkswap /swap/swapfile

# enanable swapFile
sudo swapon /swap/swapfile

# add swapFIle entry to '/etc/fstab'
echo "/swap/swapfile none swap defaults 0 0" | sudo tee -a /etc/fstab

# veryfy everything ok in '/etc/fstab'
sudo findmnt --verify --verbose || sudo cp -f /etc/fstab.backup /etc/fstab

# set swappines to improve performance
echo vm.swappiness=10 | sudo tee /etc/sysctl.d/99-swappiness.conf

}

# create swapfile for ext4 filesystem 
ext4 () {

# cheak if swap already exists 
[[ $(swapon -s) ]] && swapoff -a 

# create swapfile 
dd if=/dev/zero of=/swapfile bs=1M count="${sfsize}" 

# set safer permissions on swapfile 
chmod 600 /swapfile 

# make swap 
mkswap /swapfile

# on swapfile 
swapon /swapfile && swapon --show

# backup '/etc/fstab'
cp /etc/fstab /etc/fstab.bak

# make swapfile persistent
echo '/swapfile none    swap    defaults 0 0' | tee -a /etc/fstab 

# veryfy everything ok in '/etc/fstab'
findmnt --verify --verbose || sudo cp -f /etc/fstab.bak /etc/fstab

 # set swappines to improve performance
 echo vm.swappiness=30 | tee /etc/sysctl.d/99-swappiness.conf

}

# choose filesystem type and method accordingly
[[ "${fstype}" == btrfs ]] && btrfs || [[ "${fstype}" == ext4  ]] && ext4 || exit 1

#---------------------------------------------------------------------------------------------------------------
