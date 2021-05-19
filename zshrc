# ZSH configs
setopt HIST_IGNORE_ALL_DUPS
setopt CORRECT

bindkey -v

WORDCHARS=${WORDCHARS//[\/]}
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Start zim
if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# go
if [[ -x $(which go) ]]; then
  export GOPATH=${HOME}/.go
  export PATH=${PATH}:/usr/local/go/bin:${GOPATH}/bin
fi

# asdf
if [[ -s ${HOME}/.asdf/asdf.sh ]]; then
  . ${HOME}/.asdf/asdf.sh
fi

# direnv
if [[ -x $(which direnv) ]]; then
  eval "$(direnv hook zsh)"
fi

# pyenv
if [[ -s ${HOME}/.pyenv ]]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# alias
alias vim="nvim"
alias vimdiff='nvim -d'
alias vi="nvim"

# binds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Start gnome ssh keyring daemon
if [ -n "$DESKTOP_SESSION" ];then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi

# Load local configuration
if [[ -f ${HOME}/.zshrc_local ]]; then
    source ${HOME}/.zshrc_local
fi
