function be --description "base64 encode"
    echo -n "$argv" | base64 -w 0
    echo -n "$argv" | base64 -w 0 | wl-copy -n
end
