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
set -Ux CUDA_CACHE_PATH $XDG_CACHE_HOME/cuda

# Config
set -Ux DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -Ux GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -Ux KDEHOME $XDG_CONFIG_HOME/kde
set -Ux NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

# Data
set -Ux CARGO_HOME $XDG_DATA_HOME/cargo
set -Ux GNUPGHOME $XDG_DATA_HOME/gnupg
set -Ux GOPATH $XDG_DATA_HOME/go
set -Ux WINEPREFIX $XDG_DATA_HOME/wine/prefixes/default
