#  _________  _   _    ____ ___  _   _ _____ ___ ____
# |__  / ___|| | | |  / ___/ _ \| \ | |  ___|_ _/ ___|
#   / /\___ \| |_| | | |  | | | |  \| | |_   | | |  _
#  / /_ ___) |  _  | | |__| |_| | |\  |  _|  | | |_| |
# /____|____/|_| |_|  \____\___/|_| \_|_|   |___\____|
#

### ZSH OPTIONS

# nvim pls
alias vim=nvim

# no weird keybinds inherited from old terminals
stty -ixon

# set -m

# Zsh profiling
zmodload zsh/zprof

# Auto correct mistakes
setopt correct
# Extended globbing. Allows using regular expressions with *
setopt extendedglob
# Case insensitive globbing
setopt nocaseglob
# Array expension with parameters
setopt rcexpandparam
# Don't warn about running processes when exiting
setopt nocheckjobs
# Sort filenames numerically when it makes sense
setopt numericglobsort
# No beep
setopt nobeep
# Immediately append history instead of overwriting
setopt appendhistory
# If a new command is a duplicate, remove the older one
setopt histignorealldups
# if only directory path is entered, cd there.
setopt autocd

setopt incappendhistory

# No wierd esc shenanigans
export KEYTIMEOUT=1

# Case insensitive tab completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' menu select=5
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Automatically find new executables in path
zstyle ':completion:*' rehash true
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/cache


HISTFILE=~/.local/share/zsh/history
HISTSIZE=100000
SAVEHIST=100000
WORDCHARS=${WORDCHARS//\/[&.;]}
# Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line
bindkey '^[[H' beginning-of-line
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line
fi
bindkey '^[[8~' end-of-line
bindkey '^[[F' end-of-line
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line
fi
bindkey '^[[2~' overwrite-mode
bindkey '^[[3~' delete-char
bindkey '^[[C'  forward-char
bindkey '^[[D'  backward-char
bindkey '^[[5~' history-beginning-search-backward
bindkey '^[[6~' history-beginning-search-forward

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
# delete previous word with ctrl+backspace
bindkey '^[[Z' undo
# Shift+tab undo last action
bindkey -v '^?' backward-delete-char


# Theming section
fpath+=~/.local/share/zsh/comp
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

### ZSH RICE
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# Fzf keybinds
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Apply different settigns for different terminals
case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
        alias x='startx ~/.xinitrc'
        # Type name of desired desktop after x, xinitrc is configured for it
    ;;
  *)
		# Use autosuggestion
		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ;;
esac


### VI KEYBINDINGS
bindkey -v

### ALIASES
# Use exa instead of ls (and soma aliases)
alias ls='exa -F --icons --group-directories-first'
alias la='exa -Fa --icons --group-directories-first'
alias ll='exa -Fl --icons --group-directories-first'
alias lla='exa -Fla --icons --group-directories-first'
alias lal='exa -Fla --icons --group-directories-first'
alias lt='exa -FT --icons --group-directories-first'
alias lta='exa -FTa --icons --group-directories-first'
alias lr='exa -FR --icons --group-directories-first'
alias lra='exa -FRa --icons --group-directories-first'
# Some sane defaults
alias count='wc -l'
alias trm='trash-put -iv'
alias rm='rm -iv --preserve-root'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias mkdir='mkdir -pv'
alias df='df -h'
alias free='free -m'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'
# Please expend aliases after these
alias sudo='sudo '
alias exec='exec '
# Genral aliases
alias yeet='pkill '
alias woman='man'
alias md='mkdir -pv'
alias cls='clear'
alias cl='clear'
alias q='exit'
alias lf='lfrun'
alias gdbt='gdb -tui'
alias nf='neofetch'
alias gf='guifetch'
alias ňuf='neofetch'
alias make='make -j$(nproc)'
alias pejsek='pisek'
alias ip='ip -color'

mcd() {
    mkdir -p $*
    cd $*
}

# Terminal emulator tests
alias unicode-test='curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt | bat'
alias emoji-test='curl https://unicode.org/Public/emoji/13.0/emoji-test.txt | bat'

# Dotfile git aliases
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
alias dots="/usr/bin/git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"

# git() {
#     [ "$(pwd)" = "$HOME" ] && dots $@ || /usr/bin/git $@
# }

# A terminal pastebin
alias termbin='nc termbin.com 9999'

wttr()
{
    # change Paris to your default location
    local request="wttr.in/$@"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
alias weather=wttr

wttr2()
{
    # change Paris to your default location
    local request="v2.wttr.in/$@"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
wttr2d()
{
    # change Paris to your default location
    local request="v2d.wttr.in/$@"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
wttr2n()
{
    # change Paris to your default location
    local request="v2n.wttr.in/$@"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
wttr3()
{
    # change Paris to your default location
    local request="v3.wttr.in/$@.sxl"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
alias inxiall='inxi -aAbBCdDEfFGiIjJlLmMnNopPrRsSuwzZ'

### MISC

# Some options and settings for stuff
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="bat"
export MANROFFOPT="-P -c"
export FZF_DEFAULT_OPTS='--layout=reverse --height=50%'
export NNN_TRASH=1
source ~/.config/lf/lficons

## Emacs
export EMACSCLIENT='emacsclient -n -c -a ""'
export EMACSTAB='emacsclient -n -a ""'
export EMACSNW='emacsclient -nw -a ""'

alias doom="$HOME/.emacs.d/bin/doom"
alias emc="$EMACSCLIENT"
alias emt="$EMACSTAB"
alias enw="$EMACSNW"

# Go to the project root if started in emacs
cd "${PROOT:-$PWD}"

## TMUX

alias tmx='tmux'
alias tmn='tmux new-session -s'
alias tma='tmux attach -t'
alias tmls='tmux ls'

## FASD
eval "$(fasd --init auto)"

# Quick fuzzy editing
v () {
    [ "$#" -eq 0 ] && vim || f -e 'vim' $@
}

e () {
    [ "$#" -eq 0 ] && emc && return || true
    file="$(f $@)"
    emc "$file"
}

unalias sd sf s zz
# Replace default fasd selections with fzf
# Also sv, se for editing
s () {
    FILE="$(fasd -lr $@ | fzf --query="$@" -0 -1 --tac --cycle)"
    fasd -A "$FILE"
    echo $FILE
}
sd () {
    FILE="$(fasd -ldr $@ | fzf --query="$@" -0 -1 --tac --cycle)"
    fasd -A "$FILE"
    echo $FILE
}
sf () {
    FILE="$(fasd -lfr $@ | fzf --query="$@" -0 -1 --tac --cycle)"
    fasd -A "$FILE"
    echo $FILE
}
zz () {
    FILE="$(sd $@)"
    cd "$FILE"
}
sv () {
    file="$(sf $@)"
    vim "$file"
}
se () {
    file="$(sf $@)"
    emc "$file"
}

## Broot (kinda meh)
#source /home/stepan/.config/broot/launcher/bash/br

## Fuck
#eval  $(thefuck --alias)

## THE PROMPT
eval "$(starship init zsh)"

# Opam
[[ ! -r /home/stepan/.opam/opam-init/init.zsh ]] || source /home/stepan/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

alias awe="sx awesome"
alias qti="qtile start -b wayland"
alias xqti="sx qtile start -b x11"
alias H="Hyprland"

scr () {
    slurp | grim -g -
}


TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M MB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

watts()
{
    echo - | awk "{printf \"%.1f\", \
    $(( \
      $(cat /sys/class/power_supply/BAT0/current_now) * \
      $(cat /sys/class/power_supply/BAT0/voltage_now) \
    )) / 1000000000000 }" ; echo " W "
}
