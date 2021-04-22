stty -ixon

zmodload zsh/zprof
# Options section
setopt correct
# Auto correct mistakes
setopt extendedglob
# Extended globbing. Allows using regular expressions with *
setopt nocaseglob
# Case insensitive globbing
setopt rcexpandparam
# Array expension with parameters
setopt nocheckjobs
# Don't warn about running processes when exiting
setopt numericglobsort
# Sort filenames numerically when it makes sense
setopt nobeep
# No beep
setopt appendhistory
# Immediately append history instead of overwriting
setopt histignorealldups
# If a new command is a duplicate, remove the older one
setopt autocd
# if only directory path is entered, cd there.

export KEYTIMEOUT=1

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true
# automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
WORDCHARS=${WORDCHARS//\/[&.;]}
# Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line
# Home key
bindkey '^[[H' beginning-of-line
# Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line
  # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line
# End key
bindkey '^[[F' end-of-line
# End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line
  # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode
# Insert key
bindkey '^[[3~' delete-char
# Delete key
bindkey '^[[C'  forward-char
# Right key
bindkey '^[[D'  backward-char
# Left key
bindkey '^[[5~' history-beginning-search-backward
# Page up key
bindkey '^[[6~' history-beginning-search-forward
# Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
#
bindkey '^[Od' backward-word
#
bindkey '^[[1;5D' backward-word
#
bindkey '^[[1;5C' forward-word
#
bindkey '^H' backward-kill-word
# delete previous word with ctrl+backspace
bindkey '^[[Z' undo
# Shift+tab undo last action
bindkey -v '^?' backward-delete-char

alias df='df -h'
# Human-readable sizes
alias free='free -m'
# Show sizes in MB

# Theming section
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

## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
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

#TE=$(ps -p $(ps -p $$ -o ppid=) o args=)

# case $TE in
    # vim|nvim) ;;
    # *) bindkey -v
# esac

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export FZF_DEFAULT_OPTS='--layout=reverse --height=50%'
export NNN_TRASH=1

#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
bindkey -v

nu ()
{
    unset STARSHIP_SHELL
    /usr/bin/nu
}


alias ls='exa -F --icons --group-directories-first'
alias la='exa -Fa --icons --group-directories-first'
alias ll='exa -Fl --icons --group-directories-first'
alias lla='exa -Fla --icons --group-directories-first'
alias lal='exa -Fla --icons --group-directories-first'
alias lt='exa -FT --icons --group-directories-first'
alias lta='exa -FTa --icons --group-directories-first'
alias nf='neofetch'
alias count='wc -l'
alias trm='trash-put -iv'
alias rm='rm -iv --preserve-root'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -iv'
alias md='mkdir -pv'
alias woman='man'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color=auto'
alias sudo='sudo '
alias emc='emacsclient -n'

alias cls='clear'
alias cl='clear'
alias q='exit'

alias yeet='exec'

alias termbin='nc termbin.com 9999'
weather()
{
    # change Paris to your default location
    local request="wttr.in/$@"
    [ "$(tput cols)" -lt 125 ] && request+='?n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
alias unicode-test='curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt | bat'
alias emoji-test='curl https://unicode.org/Public/emoji/13.0/emoji-test.txt | bat'

alias dotfiles="git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME"
alias dots=dotfiles

alias doom="$HOME/.emacs.doom/bin/doom"
#projects () {
#    cd ~/Projects
#    cd $(\ls | fzf)
#}

#[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
eval "$(fasd --init auto)"

e v () {
    [ "$#" -eq 0 ] && $VISUAL || f -e vim $@
}

unalias sd sf s zz

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
sv se () {
    FILE="$(sf $@)"
    $EDITOR "$FILE"
}

#alias e="f -e vim"
#alias v="f -e vim"

source /home/stepan/.config/broot/launcher/bash/br
eval "$(starship init zsh)"
eval  $(thefuck --alias)

