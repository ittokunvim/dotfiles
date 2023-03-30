# download wav from youtube.com
function yt-dl-wav
    if ! string length -q $argv
        echo "usage: yt-dl-wav [URL]"
        return 1
    end

    youtube-dlc --ignore-errors -x --audio-format wav -o '%(title)s.%(ext)s' $argv
end
