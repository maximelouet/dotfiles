function be --description "base64 encode"
    set to_encode $argv[1]
    if test -z "$to_encode"
        read to_encode
    end
    set encoded (echo -n "$to_encode" | base64 -w 0)
    set encode_status $status
    if test $encode_status -ne 0
        return $encode_status
    end
    echo -n "$encoded" | wl-copy -n
    if test (string length "$encoded") -gt 500
        echo "Copied encoded data to clipboard."
    else
        echo -n "$encoded"
    end
end
