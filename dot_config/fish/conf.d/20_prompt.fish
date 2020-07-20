# Modifications to the fish prompt

# Initializing Starship
function fish_prompt
    set -l last_status $status

    # Run TheFuck if the last command was unknown
    if test 127 -eq $last_status
      fuck
    end

    switch "$fish_key_bindings"
        case fish_hybrid_key_bindings fish_vi_key_bindings
            set keymap "$fish_bind_mode"
        case '*'
            set keymap insert
    end

    starship prompt --status=$last_status --keymap=$keymap --cmd-duration=$CMD_DURATION --jobs=(count (jobs -p))
end

function fish_mode_prompt; end
export STARSHIP_SHELL="fish"
