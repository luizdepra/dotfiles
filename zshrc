# source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

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

# Load local configuration
if [[ -f ${HOME}/.zshrc_local ]]; then
    source ${HOME}/.zshrc_local
fi
