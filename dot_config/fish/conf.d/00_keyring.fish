# GNOME Keyring - starts the keyring with the keyring and ssh components. This also starts a SSH agent

if test -n "$DESKTOP_SESSION"
  set -gx (gnome-keyring-daemon --start --components=pkcs11,secrets,ssh | string split "=")
end
