#!/usr/bin/bash

packer_dir="$HOME/.local/share/nvim/site/pack/packer/opt"
mkdir -p "$packer_dir"
git clone --single-branch https://github.com/wbthomason/packer.nvim "$packer_dir/packer.nvim"
nvim +PackerSync +qall
