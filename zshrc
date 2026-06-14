# ZSH configs
setopt HIST_IGNORE_ALL_DUPS
setopt CORRECT

bindkey -v

fpath=(~/.zfunc $fpath)

WORDCHARS=${WORDCHARS//[\/]}
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Start zimfw
source ${ZIM_HOME}/init.zsh

# alias
alias vim="nvim"
alias vimdiff='nvim -d'
alias vi="nvim"
alias ls="eza"
alias cat="bat"
alias top="btm"

alias zd="zellij attach -c dev"

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

function zellij_tab_name_update() {
    if [[ -n ${ZELLIJ} ]]; then
        local tab_name="${PWD/#$HOME/~}"
        [[ ${tab_name} != "~" ]] && tab_name="${tab_name##*/}"
        [[ ${#tab_name} -gt 32 ]] && tab_name="${tab_name:0:31}…"

        command nohup zellij action rename-tab ${tab_name} >/dev/null 2>&1
    fi
}

precmd() {
    zellij_tab_name_update
}

# Load local configuration
if [[ -f ${HOME}/.zshrc_local ]]; then
    source ${HOME}/.zshrc_local
fi
