function bd --description "base64 decode"
    echo -n "$argv" | base64 -d -w 0
    echo -n "$argv" | base64 -d -w 0 | wl-copy -n
end
