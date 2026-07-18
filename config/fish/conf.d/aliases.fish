# Common commands
alias ls "lsd"
alias l  "ls -lh"
alias lt "ls -lhrt"
function c; cd $argv && ls; end
alias rg "rg -uu"

# Abbreviations are replaced by their full form on-the-fly
abbr g git
abbr v vim
abbr k kubectl

abbr diff difft

# Make some commands more verbose
alias mv "mv -v"
alias rm "rm -v"
alias cp "cp -v"

# Typos
abbr gti git

# Shortcuts
abbr cx "chmod +x"
abbr copy "wl-copy -n <"
abbr open "xdg-open"

alias maj "yay -Syu --devel --sudoloop"
alias pkclean "paccache -rk 2; yay -Sc"

# https://fishshell.com/docs/current/interactive.html#abbreviations
function multicd
  echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr -a dotdot --regex '^\.\.+$' --function multicd
function u; cd .. && ls; end

# systemctl shortcuts
abbr -a -g sc systemctl
abbr -a -g scu systemctl --user
abbr -a -g jr journalctl
abbr -a -g jru journalctl --user
