[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap es -option caps:swapescape &
xmodmap ~/.Xmodmap &
xsetroot -cursor_name left_ptr &
nitrogen --restore &
xset b off &
bind C-m previous-window &
pulseaudio --start &
compton -cCfb -D 1 -r 12 -l -18 -t -12 -o 0.4 -e 0.4 &        
sleep 10 && dropboxd &
dunst &
eval $(keychain --eval --agents ssh -Q --quiet id_rsa) &
syndaemon -k -i 1 -d -t &
synclient FingerHigh=50 &
synclient FingerLow=50 &
synclient PalmDetect=1 &
trayer --edge bottom --align right --SetDockType true --SetPartialStrut false --expand true --width 18 --height 22 --transparent true --alpha 255 & 
mpd &
sleep 3 && conky -c ~/.conkympd &
xset -dpms &
xset dpms 0 0 0 &
xset s off &
exec dbus-launch xmonad
