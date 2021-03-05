function ytdl -d "Download stuff"

    argparse 'p/playlist' -- $argv
    or return

    set -l url $argv[-1]

    set config ~/.config/youtube-dl/config

    if test -n "$_flag_playlist"
        set config "$config"-playlist
    end

    youtube-dl --config-location "$config" "$url"
end
