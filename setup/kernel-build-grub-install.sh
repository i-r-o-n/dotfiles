#!/bin/bash
#sudo make -j$(nproc)
sudo make modules_install
sudo make install

#grub
sudo grub-mkconfig -o /boot/grub/grub.cfg