: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}

export BROWSER=firefox
export EDITOR=nvim

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH"

export GPG_TTY=$(tty)

export WINIT_HIDPI_FACTOR=1.0

export RTX_USE_TOML=1

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

# zellij
[[ -x $(which zellij) ]] && eval "$(zellij setup --generate-completion zsh | grep '^function')"

# Load local configuration
[[ -f ${HOME}/.zshenv_local ]] && source ${HOME}/.zshenv_local
. "$HOME/.cargo/env"
