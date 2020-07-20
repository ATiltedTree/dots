# The modifications needed for some application to be xdg friendly
# The XDG_CACHE_HOME, XDG_CONFIG_HOME and XDG_DATA_HOME variables are set in /etc/security/pam_env.conf:
# # XAuthority
# XAUTHORITY DEFAULT="${XDG_RUNTIME_DIR}/XAuthority"
#
# # XDG_*
# XDG_CONFIG_HOME DEFAULT="@{HOME}/.config"
# XDG_CACHE_HOME DEFAULT="@{HOME}/.cache"
# XDG_DATA_HOME DEFAULT="@{HOME}/.local/share"


# Cache

## CUDA
set -Ux CUDA_CACHE_PATH $XDG_CACHE_HOME/cuda

# Config

## Docker
set -Ux DOCKER_CONFIG $XDG_CONFIG_HOME/docker

## GTK2
set -Ux GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc

## should be used anymore by KDE but it still does...
set -Ux KDEHOME $XDG_CONFIG_HOME/kde

## NPM
set -Ux NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

# Data

## Cargo
set -Ux CARGO_HOME $XDG_DATA_HOME/cargo

## GPG
set -Ux GNUPGHOME $XDG_DATA_HOME/gnupg

## Go
set -Ux GOPATH $XDG_DATA_HOME/go

## Wine
set -Ux WINEPREFIX $XDG_DATA_HOME/wine/prefixes/default
