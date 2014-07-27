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

setterm -bfreq 0
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit
autoload insert-unicode-char
zle -N insert-unicode-char

# Select completion style
zstyle ':completion:*' menu select
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==02=01}:${(s.:.)LS_COLORS}")'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

bindkey '^[[Z' reverse-menu-complete
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^U' insert-unicode-char
export KEYTIMEOUT=1
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="$HOME/.zsh_history"

# ZSH sourcing
source ~/.zsh/prompto.theme

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
# General purpose
# ---------------------------------------------------------------------
alias tmux="TERM=xterm-256color tmux"
alias z="zathura"
alias clc="clear"
alias copy="rsync -aP"
alias :q="exit"
alias :Q="exit"
alias :e="vim"
alias :E="vim"
alias -g ..='cd ..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias l="ls -lah"
alias ls="ls --group-directories-first --color=always"
alias updates="pacman -Qqu"
alias ssh="export TERM='xterm-256color'; ssh"
alias whosfat="du --max-depth=1 -h | sort --ignore-case --reverse -h | head -10"
alias cam="mplayer tv://"
# ---------------------------------------------------------------------
# Archlinux
# ---------------------------------------------------------------------
alias pacupg='sudo pacman -Syu'    # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'       # Install specific package(s) from the repositories
alias pacinstall='sudo pacman -U'  # Install specific package not from the repositories but from a file
alias pacrem='sudo pacman -R'      # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacremove='sudo pacman -Rns' # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacsearch='pacman -Ss'       # Search for package(s) in the repositories
alias ain='sudo aura -A'           # Install package from AUR
alias aupg='sudo aura -Ayu'        # Upgrade AUR and system packages
# ---------------------------------------------------------------------
# Git
# ---------------------------------------------------------------------
alias g='git'
compdef g=git
alias gb='git branch'
compdef _git gb=git-branch
alias gst='git status'
compdef _git gst=git-status
alias gdiff='git diff'
gdv() { git diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gmer='git merge'
compdef _git gm=git-merge
alias gco='git checkout'
compdef _git gco=git-checkout
alias gc='git commit -a -m'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")' # Return to root of rep.
# -¬
# ---------------------------------------------------------------------
