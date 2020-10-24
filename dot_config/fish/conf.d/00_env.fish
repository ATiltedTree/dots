# Environment variables

# GPG SSH agent
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh

# The editor to use
set -gx EDITOR nvim

# No lesshst
set -gx LESSHISTFILE -

# Cache

# Config

## Docker
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker

## NPM
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

# Data

## Cargo
set -gx CARGO_HOME $XDG_DATA_HOME/cargo

## GPG
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg

## Wine
set -gx WINEPREFIX $XDG_DATA_HOME/wine/prefixes/default

# PATH
set -U fish_user_paths $HOME/.local/bin $CARGO_HOME/bin

# Greeting
set fish_greeting

# Import into systemd
systemctl --user import-environment SSH_AUTH_SOCK GNUPGHOME
