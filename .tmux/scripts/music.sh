nowplaying-cli get title artist playbackRate | awk '
NR % 3 == 1 {title = $0}
NR % 3 == 2 {artist = $0}
NR % 3 == 0 {
    if ($0 == "0") {
        print "🎧 Paused"
    } else {
        if (title == "null" && artist == "null") {
            print "🎧 Paused"
        } else {
            printf "🎧 %s | %s\n", title, artist
        }
    }
}'
