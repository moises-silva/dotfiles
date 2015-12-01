#$HOME/bin/run-synergy
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

xbindkeys
xsetroot -cursor_name left_ptr
xset -b
setxkbmap -layout us -variant altgr-intl
daemonize /usr/bin/synapse -s
daemonize /usr/bin/lxpolkit
urxvtd -q -o -f

exec xmonad
#exec startfluxbox
