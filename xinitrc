#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap us -option caps:swapescape &
xset -b &
xset +fp /usr/share/fonts/local
xset fp rehash
xset +dpms
xset dpms 0 0 300
xsetroot -cursor_name left_ptr &
nitrogen --restore &
pulseaudio --start &
compton -cCfb -D 1 -r 12 -l -18 -t -12 -o 0.4 -e 0.4 &        
sleep 10 && dropboxd &
dunst &
trayer --edge bottom --align right --SetDockType true --SetPartialStrut false --expand true --width 18 --height 22 --transparent true --alpha 255 & 
sxhkd &
exec bspwm
