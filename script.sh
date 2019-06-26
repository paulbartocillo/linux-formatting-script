#!/bin/bash

#Login as root user
sudo su

#List available disk or devices.
fdisk -l

#Unmount the disk you want to work with.
unmount /dev/sde

#Wipe-out all the data with the disk (Optional)
shred -vf -n 1 /dev/sde

#Partition the disk
parted /dev/sde

#Make a partition table
mktable msdos
mkpart primary 0% 100%
quit

#Format the disk to your desired filesystem
mkfs.msdos -f 32 /dev/sde
