#!/bin/sh

if bspc query -T -d | grep -q '"layout":"monocle"'; then
	echo " "
else
	echo ""
fi
