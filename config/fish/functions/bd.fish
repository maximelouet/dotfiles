function bd --description "base64 decode"
    set to_decode $argv[1]
    if test -z "$to_decode"
        read to_decode
    end
    set decoded (echo -n "$to_decode" | base64 -d -w 0)
    set decode_status $status
    if test $decode_status -ne 0
        return $decode_status
    end
    echo -n "$decoded" | wl-copy -n
    if test (string length "$decoded") -gt 500
        echo "Copied decoded data to clipboard."
    else
        echo -n "$decoded"
    end
end
