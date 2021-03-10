function nightcore -d "Nightcore stuff"
    argparse 's/speed=' -- $argv
    or return

    set -l input $argv[-2]
    set -l out $argv[-1]
    set audio_speed 1.2

    if test -n "$_flag_speed"
        set audio_speed $_flag_speed
    end

    set video_speed (math 1 / $audio_speed)

    set sample_rate (ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate -of default=noprint_wrappers=1:nokey=1 "$input")

    ffmpeg -i "$input" -filter:v "setpts=$video_speed*PTS" -filter:a "asetrate=$sample_rate*$audio_speed" -ar $sample_rate "$out"
end
