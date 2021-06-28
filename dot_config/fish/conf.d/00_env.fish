# Environment variables

# If we are a login shell import /etc/profile
if status is-login
    bass source /etc/profile
end

# Import systemd env
bass export (/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

# Deduplicate PATH
set -x PATH (echo $PATH | tr ' ' '\n' | awk '!seen[$0]++')

# If we are a login shell import PATH back into systemd
if status is-login
    systemctl --user import-environment PATH XDG_SESSION_CLASS XDG_SESSION_ID XDG_SEAT
end

# Greeting
set fish_greeting
