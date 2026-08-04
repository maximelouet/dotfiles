#
# Fish environment
#

# locale etc
set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"
# currency in Euros
set -gx LC_MONETARY "fr_FR.UTF-8"
set -gx TZ "Europe/Paris"

set -gx EDITOR "vim"
set -gx VISUAL "vim"
set -gx PAGER "less"
set -gx MANPAGER "bat -plman --paging always"

# used by i3-sensible-terminal
set -gx TERMINAL "kitty"

set -gx USER "saumon"

set -gx CLICOLOR 1

# default XDG values, explicit them
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"

# sensible storage locations
set -gx PSQL_HISTORY "$XDG_DATA_HOME/psql_history"
set -gx LESSHISTFILE "$XDG_DATA_HOME/less_history"
set -gx IPYTHONDIR "$XDG_DATA_HOME/ipython"
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"

set -gx WATCH all

set -gx NVM_DIR "$HOME/.config/nvm"

# no fun allowed
set -gx ANSIBLE_NOCOWS 1

# use gnome-keyring-daemon as ssh agent (needs gcr-4 package)
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gcr/ssh"

# https://github.com/electron/electron/issues/39789#issuecomment-3433810585
set -gx GNOME_DESKTOP_SESSION_ID "this-is-deprecated"

# wayland
set -gx QT_QPA_PLATFORM wayland
set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -gx CLUTTER_BACKEND wayland
set -gx ELECTRON_OZONE_PLATFORM_HINT wayland

set -gx QT_AUTO_SCREEN_SCALE_FACTOR 0
set -gx QT_QPA_PLATFORMTHEME gtk2

set -gx RIPGREP_CONFIG_PATH "$XDG_CONFIG_HOME/ripgrep/ripgreprc"

# l'espoir fait vivre
set -gx DO_NOT_TRACK 1

# LESS settings
set -gx LESS "--buffers=128 --use-color --color=Hr --RAW-CONTROL-CHARS --HILITE-UNREAD --incsearch"

# path configuration
fish_add_path -mP "/usr/bin/site_perl"
fish_add_path -mP "/usr/bin/vendor_perl"
fish_add_path -mP "/usr/bin/core_perl"
fish_add_path -mP "/usr/lib/rustup/bin"
fish_add_path -mP "/usr/lib/jvm/default/bin"
fish_add_path -mP "$HOME/.cargo/bin"
fish_add_path -mP "$HOME/go/bin"
fish_add_path -mP "$HOME/.local/bin"
fish_add_path -mP --append "/usr/local/bin"
fish_add_path -mP --append "/usr/bin"
fish_add_path -mP --append "/usr/local/sbin/"
fish_add_path -mP --append "/usr/sbin/"
