#!/bin/bash

ln -s ~/.config/qmk/keymaps/charybdis $QMK_HOME/keyboards/bastardkb/charybdis/3x5/keymaps/iron

qmk compile -kb bastardkb/charybdis/3x5/v2/splinky_3 -km iron
