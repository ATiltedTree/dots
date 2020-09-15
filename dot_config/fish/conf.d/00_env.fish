# Environment variables

# GPG SSH agent
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh

# The editor to use
set -gx EDITOR nvim

# No lesshst
set -gx LESSHISTFILE -

# Wayland specific settings
switch $XDG_SESSION_TYPE
  case wayland
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx SDL_VIDEODRIVER wayland
    set -gx QT_QPA_PLATFORMTHEME gnome
    set -gx QT_STYLE_OVERRIDE kvantum
  case x11

  case tty

end
