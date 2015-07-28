#$HOME/bin/run-synergy
xbindkeys
xsetroot -cursor_name left_ptr
xset -b
daemonize /usr/bin/synapse -s
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec xmonad
#exec startfluxbox
