: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}

export BROWSER=firefox
export EDITOR=nvim
export TERM=alacritty

export PATH="$HOME/.cargo/bin:$HOME/bin:$PATH"

export GPG_TTY=$(tty)

export WINIT_HIDPI_FACTOR=1.0

# rust
[[ -f ${HOME}/.cargo/env ]] && source ${HOME}/.cargo/env

# go
if [[ -x $(which go) ]]; then
  export GOPATH=${HOME}/.go
  export PATH=${PATH}:/usr/local/go/bin:${GOPATH}/bin
fi

# rtx
[[ -x $(which rtx) ]] && eval "$(rtx activate zsh)"

# direnv
[[ -x $(which direnv) ]] && eval "$(direnv hook zsh)"

# zoxide
[[ -x $(which zoxide) ]] && eval "$(zoxide init zsh)"

# Load local configuration
[[ -f ${HOME}/.zshenv_local ]] && source ${HOME}/.zshenv_local
. "$HOME/.cargo/env"
