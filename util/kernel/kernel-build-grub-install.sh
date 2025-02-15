#!/bin/bash

make -j$(nproc)
make modules_install
make install

grub-mkconfig -o /boot/grub/grub.cfg

emerge -a @module-rebuild
# or
dracut --force
