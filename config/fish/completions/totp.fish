# https://github.com/WhyNotHugo/totp-cli
complete -c totp -x -a "(ls $HOME/.password-store/2fa | tr -d '/')"
