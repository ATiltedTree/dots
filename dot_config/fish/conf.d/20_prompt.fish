# Modifications to the fish prompt

status is-interactive

# If we are intreactive
if test $status -eq 0
    # Initializing Starship
    starship init fish | source
end
