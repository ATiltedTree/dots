# Start Sway

# If we are a login shell AND we are on tty1 start sway
if status is-login && test (tty) = /dev/tty1
    exec systemctl start --wait --user sway.service
end
