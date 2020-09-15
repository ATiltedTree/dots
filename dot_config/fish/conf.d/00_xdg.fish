# The modifications needed for some application to be xdg friendly
# The XDG_CACHE_HOME, XDG_CONFIG_HOME and XDG_DATA_HOME variables are set in /etc/security/pam_env.conf:
# # XDG_*
# XDG_CONFIG_HOME DEFAULT="@{HOME}/.config"
# XDG_CACHE_HOME DEFAULT="@{HOME}/.cache"
# XDG_DATA_HOME DEFAULT="@{HOME}/.local/share"

# Cache

## CCache
set -gx CCACHE_DIR $XDG_CACHE_HOME/ccache

# Config

## Docker
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker

## NPM
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

## CCache
set -gx CCACHE_CONFIGPATH $XDG_CONFIG_HOME/ccache.config

# Data

## Cargo
set -gx CARGO_HOME $XDG_DATA_HOME/cargo

## GPG
set -gx GNUPGHOME $XDG_DATA_HOME/gnupg

## Wine
set -gx WINEPREFIX $XDG_DATA_HOME/wine/prefixes/default
