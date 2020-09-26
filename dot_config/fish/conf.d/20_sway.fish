# Start Sway

## If running from tty1 start sway
if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
  # Tell apps that we are wayland
  set -x XDG_SESSION_TYPE wayland
  set -x XDG_SESSION_DESKTOP sway

  # Tell specific apps that they should use wayland
  set -gx MOZ_ENABLE_WAYLAND 1
  set -gx SDL_VIDEODRIVER wayland
  set -gx QT_QPA_PLATFORMTHEME qt5ct
  set -gx QT_QPA_PLATFORM wayland
  set -gx _JAVA_AWT_WM_NONREPARENTING 1

  # Run sway
  exec systemd-cat -t sway sway
end
