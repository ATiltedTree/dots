# Environment variables

# Importing is only required on sway
if test "$XDG_SESSION_DESKTOP" = sway
    # Import /etc/profile
    bass source /etc/profile
end

# Import systemd env
bass export (/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

# Deduplicate PATH
set -x PATH (echo $PATH | tr ' ' '\n' | awk '!seen[$0]++')

# Greeting
set fish_greeting
