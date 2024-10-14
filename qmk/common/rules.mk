NKRO_ENABLE = yes
COMBO_ENABLE = yes
MAGIC_ENABLE = no
SPLIT_KEYBOARD = yes
MOUSEKEY_ENABLE = yes
CAPS_WORD_ENABLE = yes
TRI_LAYER_ENABLE = yes
BOOTMAGIC_ENABLE = yes

INTROSPECTION_KEYMAP_C = common.c
SRC += tapping.c

# Gentoo optimization enables _FOUND_SOURCE, conflict with qmk printf lib
ifneq ($(findstring Gentoo, $(shell arm-none-eabi-gcc --version)),)
	EXTRAFLAGS += -U_FORTIFY_SOURCE
endif
