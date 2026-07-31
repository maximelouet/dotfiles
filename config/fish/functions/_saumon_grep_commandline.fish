function _saumon_grep_commandline --description 'Pipe the current command\'s output into grep'
    set -l cmd "grep -i "
    or return 1

    set -l pipe " &| $cmd"
    if string match -rq -- ' \n\.$' "$(commandline -j; echo .)"
        set pipe "&| $cmd"
    end

    fish_commandline_append $pipe
    commandline -f end-of-line
end
