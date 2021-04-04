# Environment variables

# Importing is only required on sway
if test $XDG_SESSION_DESKTOP = "sway"
    # Import /etc/profile
    bass source /etc/profile
end

# PATH
set -U fish_user_paths $HOME/.local/bin $CARGO_HOME/bin

# Greeting
set fish_greeting
