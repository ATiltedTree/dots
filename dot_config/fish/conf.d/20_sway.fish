# Start Sway

if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
  systemctl --user import-environment
  exec systemctl --wait --user start sway.service
end
