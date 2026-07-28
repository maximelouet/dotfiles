# auto-login on tty1
if status is-login; and type -q sway
    if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = 1
        exec ~/scripts/sway-user-service.sh
    end
end
