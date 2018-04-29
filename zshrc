# source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# go
export GOPATH=${HOME}/.go
export PATH=${PATH}:/usr/local/go/bin:${GOPATH}/bin

# source asdf
. ${HOME}/.asdf/asdf.sh

# source direnv
eval "$(direnv hook zsh)"

# Load local configuration
if [[ -f ${HOME}/.zshrc_local ]]; then
    source ${HOME}/.zshrc_local
fi
