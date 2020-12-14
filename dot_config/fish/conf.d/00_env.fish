# Environment variables

# Import /etc/profile
bass source /etc/profile

# The editor to use
set -gx EDITOR nvim

# No lesshst
set -gx LESSHISTFILE -

# PATH
set -U fish_user_paths $HOME/.local/bin $CARGO_HOME/bin

# Greeting
set fish_greeting
