# Environment variables

# Importing is only required on sway
if test "$XDG_SESSION_DESKTOP" = sway
    # Import /etc/profile
    bass source /etc/profile
end

# PATH
fish_add_path ~/.local/bin
fish_add_path $CARGO_HOME/bin
fish_add_path $FLUTTER_HOME/bin

# Greeting
set fish_greeting
