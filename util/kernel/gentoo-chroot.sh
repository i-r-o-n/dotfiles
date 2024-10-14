#!/bin/bash

# Function to display error messages and exit
error_exit() {
  echo "Error: $1" >&2
  exit 1
}

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
  error_exit "This script must be run as root"
fi

# Display available drives
echo "Available drives:"
lsblk -o NAME,FSTYPE,SIZE,FSAVAIL,FSUSE%,MOUNTPOINTS

# Prompt user to select a drive
read -p "Enter the drive name to mount (e.g., nvme0n1p2): " selected_drive

# Mount the selected drive
mount_point="/mnt/gentoo"
mkdir -p "$mount_point"
mount "/dev/$selected_drive" "$mount_point" || error_exit "Failed to mount $selected_drive"

# Mount necessary filesystems
mount --types proc /proc "$mount_point/proc" || error_exit "Failed to mount proc"
mount --rbind /sys "$mount_point/sys" || error_exit "Failed to mount sys"
mount --make-rslave "$mount_point/sys" || error_exit "Failed to make sys rslave"
mount --rbind /dev "$mount_point/dev" || error_exit "Failed to mount dev"
mount --make-rslave "$mount_point/dev" || error_exit "Failed to make dev rslave"
mount --bind /run "$mount_point/run" || error_exit "Failed to mount run"
mount --make-slave "$mount_point/run" || error_exit "Failed to make run slave"

# Chroot into the Gentoo environment
echo "Chrooting into Gentoo environment..."
echo "Remember to run 'source /etc/profile' after chrooting."
chroot "$mount_point" /bin/bash

# Cleanup (this part will run after exiting the chroot environment)
echo "Exiting chroot environment and cleaning up..."
umount -R "$mount_point"
echo "Cleanup complete."
