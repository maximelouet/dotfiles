# visual feedback on current command ^C
bind ctrl-c cancel-commandline

# ^Z to bring back suspended program (fg)
bind \cz 'fg 2>/dev/null; commandline -f repaint'
