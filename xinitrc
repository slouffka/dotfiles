[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap us -option caps:swapescape &
xsetroot -cursor_name left_ptr &
nitrogen --restore &
pulseaudio --start &
compton -cCfb -D 1 -r 12 -l -18 -t -12 -o 0.4 -e 0.4 &        
sleep 10 && dropboxd &
dunst &
trayer --edge bottom --align right --SetDockType true --SetPartialStrut false --expand true --width 18 --height 22 --transparent true --alpha 255 & 
sxhkd &
exec dbus-launch bspwm
