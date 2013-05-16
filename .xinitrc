[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
setxkbmap es -option caps:swapescape &
xmodmap ~/.Xmodmap &
xsetroot -cursor_name left_ptr &
nitrogen --restore &
xset b off &
bind C-m previous-window &
pulseaudio --start &
compton -cCfb -D 4 -r 5 -l -5 -t -2 -o 0.2 &
sleep 10 && dropboxd &
dunst &
eval $(keychain --eval --agents ssh -Q --quiet id_rsa) &
syndaemon -k -i 1 -d -t &
synclient FingerHigh=50 &
synclient FingerLow=50 &
synclient PalmDetect=1 &
sleep 3 && stalonetray --geometry 1x1-1-1 --transparent true &
mpd &
xset +dpms
xset dpms 0 0 300
sleep 3 && conky -c ~/.conkympd &
exec dbus-launch xmonad
