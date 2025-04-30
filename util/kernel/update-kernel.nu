use ~/.config/nushell/lib/common.nu confirm

^eselect kernel list

let index = (input "Which kernel would you like to use? Default [1]: " 
  | str trim 
  | if ($in | is-empty) { "1" } else { $in })

if (confirm "Proceed") {
  ^eselect kernel set $index

  cd /usr/src/linux

  if (confirm "Configure kernel") {
    ^make nconfig
  }

  echo "Building kernel..."
  ^make $"-j(sys cpu | length)"

  echo "Installing kernel modules..."
  ^make modules_install

  echo "Installing kernel..."
  ^make install

  echo "Updating GRUB configuration..."
  ^grub-mkconfig -o /boot/grub/grub.cfg

  if (confirm "Rebuild external modules") { 
    ^emerge -a @module-rebuild 
  }

  echo "Kernel installation complete"
} else {
  echo "Operation canceled"
}
