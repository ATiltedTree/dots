# Start Sway

status is-login

# If we are a login shell AND we are on tty1 start sway
if test $status -eq 0 -a (tty) = /dev/tty1
    exec sway
end
