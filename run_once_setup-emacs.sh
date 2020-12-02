#!/usr/bin/bash

# Download doom-emacs
git clone https://github.com/hlissner/doom-emacs ~/.config/emacs | true

# Create doom symlink
ln -s ~/.config/emacs/bin/doom ~/.local/bin/ | true
