# ------------------------------------------------------------------
#
#     .zshrc 
#     Author: Alex Sánchez <kniren@gmail.com>
#     Source: https://github.com/kniren/dotfiles/blob/master/.zshrc
#
# ------------------------------------------------------------------
# ---------------------------------------------------------------------
# Basic options --¬
# ---------------------------------------------------------------------
DISABLE_AUTO_UPDATE="true"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="prompto"
setterm -bfreq 0
plugins=(git archlinux zsh-syntax-highlighting vi-mode)
source $ZSH/oh-my-zsh.sh
bindkey '^R' history-incremental-pattern-search-backward
export KEYTIMEOUT=1
#-¬
# ---------------------------------------------------------------------
# Exports --¬
# ---------------------------------------------------------------------
export EDITOR=vim
export NOTEDIR=~/.notes/
export NETHACKOPTIONS="autoquiver,!autopickup,name:Alex,DECgraphics,color,race:human,showexp,hilite_pet"
export JAVA_FONTS=/usr/share/fonts/TTF
# -¬
# ---------------------------------------------------------------------
# Paths --¬
# ---------------------------------------------------------------------
export PATH=~/.cabal/bin:$PATH
export PATH=$PATH:~/Scripts
export PATH=$PATH:~/Scripts/peat
export PATH=$PATH:~/Scripts/mail
export PATH=$PATH:~/Scripts/tmux
export PATH=$PATH:~/Scripts/pms
export PATH=$PATH:~/.gem/ruby/2.0.0/bin
export PATH=$PATH:~/Data/Programs/ADT/sdk/platform-tools
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
# Functions --¬
# ---------------------------------------------------------------------
# Search in wikipedia from the command line
wiki() { dig +short txt $1.wp.dg.cx; }

# Note taking
n() { $EDITOR $NOTEDIR/$@; }
compctl -/ -W $NOTEDIR -f n

nls () { 
    tree ~/.notes -CR --noreport |
    sed -e 's/└── /-/' \
        -e 's/    /-/' \
        -e 's/├── /-/' \
        -e 's/│   /-/' |
    awk 'FS="-" {
        if (NF==1) print "\033[35mNotes";
        if (NF>1) {
            gsub(/-/,"  ");
            gsub(/.md/,"");
            print;
        }
    }'
;}

# Color man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;0m' \
    LESS_TERMCAP_md=$'\E[01;38;5;6m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;9m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;2m' \
    man "$@"
}

# Use Google's text to speech synthesis to play phrases from the cmd line
say() { 
        # limit to 100 character or less
        # language code: http://developers.google.com/translate/v2/using_rest#language-params
        # useage: say <language code> <phase>
        # example: say es come with me
        # Original file:
        # https://github.com/gotbletu/shownotes/blob/master/google_text_to_speech.txt
        mplayer -user-agent Mozilla \
        "http://translate.google.com/translate_tts?ie=UTF-8&tl="$1"&q=$(echo "$@" \
        | cut -d ' ' -f2- | sed 's/ /\+/g')" > /dev/null 2>&1 ;}

# -¬
# ---------------------------------------------------------------------
# Aliases --¬
# ---------------------------------------------------------------------
alias tmux="TERM=xterm-256color tmux"
alias z="zathura"
alias clc="clear"
alias copy="rsync -aP"
alias :q="exit"
alias :Q="exit"
alias :e="vim"
alias :E="vim"
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias fp="~/Scripts/pass/findpass"
alias ep="~/Scripts/pass/editpass"
alias l="ls++"
alias ls="ls --group-directories-first --color=always"
alias zsnes="optirun zsnes"
alias ftl="cd ~/Data/Games/SteamApps/common/FTL\ Faster\ Than\ Light/ && ./FTL && cd -"
alias dwarves="cd ~/Dropbox/Programs/dwarves && ./dfhack && cd -"
alias updates="pacman -Qqu"
alias netrestart="sudo netctl-auto stop wlp4s0 && sudo netctl-auto start wlp4s0"
alias ssh="export TERM='xterm-256color'; ssh"
# If you use this you are definitely insane: fortune | cowsay | lolcat
# -¬
# ---------------------------------------------------------------------
