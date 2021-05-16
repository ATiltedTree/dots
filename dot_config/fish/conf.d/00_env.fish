# Environment variables

status is-login

# If we are a login shell import /etc/profile
if test $status -eq 0
    bass source /etc/profile
end

# Import systemd env
bass export (/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

# Deduplicate PATH
set -x PATH (echo $PATH | tr ' ' '\n' | awk '!seen[$0]++')

# Greeting
set fish_greeting
