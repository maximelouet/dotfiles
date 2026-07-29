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

# misc
abbr cx "chmod +x"
abbr copy "wl-copy -n <"
abbr open "xdg-open"

if type -q totp
  function totp --wraps totp
    if [ (count $argv) -eq 1 ]
      command totp $argv | LC_ALL=fr_FR.UTF-8 xargs printf "%'d\n"
    else
      command totp $argv
    end
  end
end

# quick file edits
abbr ve "vim ~/.vim/vimrc"
abbr ze "vim ~/.zsh/zshrc"
abbr ie "vim ~/.config/i3/config"
abbr se "vim ~/.config/sway/config"
abbr we "vim ~/.config/waybar/config.jsonc"
abbr ge "vim ~/.config/git/config"

# https://fishshell.com/docs/current/interactive.html#abbreviations
function multicd
  echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr -a dotdot --regex '^\.\.+$' --function multicd
abbr u cd ../

# system maintenance
if type -q yay
  # arch
  function maj --wraps yay
    yay -Syu --devel --sudoloop $argv
  end
  function install --wraps yay
    yay -S $argv
  end
  function remove --wraps yay
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

# boot
alias reboot-bios "systemctl reboot --boot-loader-entry auto-reboot-to-firmware-setup"
alias reboot-to-bios reboot-bios
