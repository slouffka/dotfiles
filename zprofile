# ---------------------------------------------------------------------
# Paths --¬
# ---------------------------------------------------------------------
export PATH=$PATH:~/Scripts
export PATH=$PATH:~/Scripts/peat
export PATH=$PATH:~/.config/bspwm
export PATH=$PATH:~/.cabal/bin
# -¬
# ---------------------------------------------------------------------
# Linux terminal colors --¬
# ---------------------------------------------------------------------
if [[ "$TERM" = "linux" ]]; then

    echo -en "\e]P0050505"
    echo -en "\e]P8121212"
    echo -en "\e]P1c90c25"
    echo -en "\e]P9F21835"
    echo -en "\e]P22a5b6a"
    echo -en "\e]PA2f4c6a"
    echo -en "\e]P354777d"
    echo -en "\e]PB415D62"
    echo -en "\e]P45c5dad"
    echo -en "\e]PC5063ab"
    echo -en "\e]P56f4484"
    echo -en "\e]PD915eaa"
    echo -en "\e]P62B7694"
    echo -en "\e]PE47959E"
    echo -en "\e]P7D6D6D6"
    echo -en "\e]PFA3A3A3"
    clear 

fi
eval $( dircolors -b $HOME/.dircolors )
# -¬
# ---------------------------------------------------------------------
# Exports --¬
# ---------------------------------------------------------------------
export EDITOR=vim
export NOTEDIR=~/.notes/
# -¬
# ---------------------------------------------------------------------
# Auto startx --¬
# ---------------------------------------------------------------------
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
# -¬
# ---------------------------------------------------------------------
