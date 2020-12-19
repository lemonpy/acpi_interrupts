#!/usr/bin/env bash

# Hook templates to mantain packages updated
# This script will place the hooks for pacman/yay
# and this hooks will be triggered after installing/removing
# packages, updating the pacman/yay-packages files within .config/pacman

# Why not pacman.conf
# After trying to set HookDir in /etc/pacman.conf
# I realized that such solution should need a system
# restart (not sure tho), so with these templates
# I can cp them to /usr/share/libalpm/hooks and the
# Exec commands should follow the .config/pacman links
# straight to my dotfiles :)

PACMANPKG="pacman-packages"
YAYPKG="yay-packages"

cat << EOF > ${PACMANPKG}.hook
[Trigger]
Operation = Install
Operation = Remove
Type = Package
Target = *

[Action]
When = PostTransaction
Exec = /bin/sh -c '/usr/bin/pacman -Qqen > ${HOME}/.config/pacman/${PACMANPKG}'
EOF

cat << EOF > ${YAYPKG}.hook
[Trigger]
Operation = Install
Operation = Remove
Type = Package
Target = *

[Action]
When = PostTransaction
Exec = /bin/sh -c '/usr/bin/pacman -Qqem > ${HOME}/.config/pacman/${YAYPKG}'
EOF

sudo mv -b pacman-packages.hook yay-packages.hook /usr/share/libalpm/hooks/
