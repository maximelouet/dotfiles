# common commands
alias ls "lsd"
alias l "ls -lh"
alias lt "ls -lhrt"
alias lla "ls -lha"

# abbreviations are replaced by their full form on-the-fly
abbr c cd
abbr g git
abbr v vim
abbr k kubectl
abbr b bat

abbr diff difft

# make some commands more verbose
alias mv "mv -v"
alias rm "rm -v"
alias cp "cp -v"

# typos
abbr gti git
abbr --command systemctl sttaus status
abbr ma, man

# misc
abbr cx "chmod +x"
abbr copy "wl-copy -n <"
abbr open "xdg-open"
abbr :q "exit"

if type -q totp
  function totp --wraps totp
    if [ (count $argv) -eq 1 ]
      set --local output $(command totp $argv)
      set --local resultstatus $status
      if test $resultstatus -ne 0
        echo $output
        return $resultstatus
      end
      set --local first_part $(echo $output | cut -c 1-3)
      set --local second_part $(echo $output | cut -c 4-6)
      echo "$first_part $second_part"
    else
      command totp $argv
    end
  end
end

function essh --description "terminate all SSH ControlMaster connections"
  for sock in /tmp/ssh-control-*
    ssh -o ControlPath=$sock -O exit squalala
  end
end

function path --description "pretty-print \$PATH"
  # safeguard cause path is a builtin used in some internal fish code
  if [ -n "$argv[1]" ]
    builtin path $argv
    return $status
  end
  for p in $PATH
    echo $p
  end
end

function env --description "pretty-print environment and allow searching in it"
  if [ (count $argv) -eq 1 ]
    command env | sort | grep -i "$argv[1]"
  else if [ (count $argv) -gt 1 ]
    command env $argv
    return $status
  else
    command env | sort | bat -l sh
  end
end

# quick file edits
abbr ve "vim ~/.vim/vimrc"
abbr ze "vim ~/.zsh/zshrc"
abbr se "vim ~/.config/sway/config"
abbr we "vim ~/.config/waybar/config.jsonc"
abbr ge "vim ~/.config/git/config"
abbr he "sudo vim /etc/hosts"

# https://fishshell.com/docs/current/interactive.html#abbreviations
function multicd
  echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr -a dotdot --regex '^\.\.+$' --function multicd
abbr u cd ../

# system maintenance
if type -q yay
  # arch
  function maj --wraps "yay -Syu"
    yay -Syu --devel --sudoloop $argv
  end
  function install --wraps "yay -S"
    yay -S $argv
  end
  function remove --wraps "yay -Rns"
    yay -Rns $argv
  end
  function pkclean
    paccache -rk 2
    yay -Sc
  end
else
  # debian
  function maj
    sudo apt update ; sudo apt dist-upgrade
  end
  function install --wraps apt
    sudo apt install $argv
  end
  function remove --wraps apt
    sudo apt remove --purge $argv
  end
end

# debian
if type -q fdfind
  alias fd fdfind
end
if type -q batcat
  alias bat batcat
end

# systemctl
abbr -a -g sc systemctl
abbr -a -g scu systemctl --user
abbr -a -g jc journalctl
abbr -a -g jcu journalctl --user

# docker
alias dkps "docker ps --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}'"
alias docker-clean "docker system prune --all"
alias docker-clean-all "docker system prune --all --volumes"
function docker-stop-all; docker stop $(docker container ls -a -q); end

# kitty kittens
alias s "kitten ssh"
alias catimg "kitty +kitten icat"

# boot
alias reboot-bios "systemctl reboot --boot-loader-entry auto-reboot-to-firmware-setup"
alias reboot-to-bios reboot-bios
