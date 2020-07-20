function yay --wraps yay --description 'Updates'
    if test -z "$argv"
        command topgrade
    else
        command yay $argv
    end
end
