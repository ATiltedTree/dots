function mkcd --wraps mkdir
    mkdir -p -- $argv[1] && cd -- $argv[1]
end
