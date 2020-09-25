# Environment variables

# GPG SSH agent
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh

# The editor to use
set -gx EDITOR nvim

# No lesshst
set -gx LESSHISTFILE -

# Setup sway
set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  set -x XDG_SESSION_TYPE wayland
  set -x XDG_SESSION_DESKTOP sway
end

# Wayland specific settings
switch $XDG_SESSION_TYPE
  case wayland
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx SDL_VIDEODRIVER wayland
    set -gx QT_QPA_PLATFORMTHEME qt5ct
    set -gx QT_QPA_PLATFORM wayland
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
  case x11

  case tty

end

# Import into systemd
systemctl --user import-environment SSH_AUTH_SOCK
