# Environment variables

# Cache
set -Ux CCACHE_DIR $XDG_CACHE_HOME/ccache
set -Ux CUDA_CACHE_PATH $XDG_CACHE_HOME/cuda

# Config
set -Ux CCACHE_CONFIGPATH $XDG_CONFIG_HOME/ccache/config
set -Ux DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -Ux GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -Ux KDEHOME $XDG_CONFIG_HOME/kde
set -Ux NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

# Data
set -Ux CARGO_HOME $XDG_DATA_HOME/cargo
set -Ux GNUPGHOME $XDG_DATA_HOME/gnupg
set -Ux GOPATH $XDG_DATA_HOME/go
set -Ux WINEPREFIX $XDG_DATA_HOME/wine/prefixes/default
set -Ux GRADLE_USER_HOME $XDG_DATA_HOME/gradle

# Normal
set -Ux EDITOR nvim
set -Ux VISUAL code
set -Ux NINJA_STATUS "[%s/%t %p :: %e] "
set -Ux GTK_USE_PORTAL 1

# Fish-specific
set -U fish_greeting ""
set -U fish_user_paths $HOME/.local/bin $HOME/.local/share/npm/bin $HOME/.local/share/cargo/bin

# Aliases
alias cls clear
alias ls lsd

alias open "xdg-open $argv 2>/dev/null"
alias gen-mirrors "sudo reflector --country Germany --age 12 --ipv6 --protocol rsync --sort rate --save /etc/pacman.d/mirrorlist"

# Initializing Starship
starship init fish | source

# Gnome-Keyring
if test -n "$DESKTOP_SESSION"
  set -gx (gnome-keyring-daemon --start --components=pkcs11,secrets,ssh | string split "=")
end
