# ------------------------------------------------------------------
#
#     .zshrc 
#     Author: Alex Sánchez <kniren@gmail.com>
#     Source: https://github.com/kniren/dotfiles
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
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern )

#-¬
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
alias l="ls -lah"
alias ls="ls --group-directories-first --color=always"
alias updates="pacman -Qqu"
alias ssh="export TERM='xterm-256color'; ssh"
alias whosfat="du --max-depth=1 -h | sort --ignore-case --reverse -h | head -10"
alias cam="mplayer tv://"
# If you use this you are definitely insane: fortune | cowsay | lolcat
# -¬
# ---------------------------------------------------------------------
