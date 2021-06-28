function gpg-edit
    set file $argv[1]
    set tmp (mktemp)
    gpg -o $tmp -q --yes -d $file
    nvim $tmp
    gpg -o $file --default-recipient-self --yes -e $tmp
    rm $tmp
end
