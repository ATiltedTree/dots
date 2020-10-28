#!/usr/bin/bash

git clone https://github.com/hlissner/doom-emacs ~/.config/emacs | true

ln -s ~/.config/emacs/bin/doom ~/.local/bin/ | true

doom sync
