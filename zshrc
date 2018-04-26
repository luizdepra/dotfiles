# source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# dotfiles
alias dotcfg='/usr/bin/git --git-dir=$HOME/.dotcfg/ --work-tree=$HOME'

# go
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# source asdf
. $HOME/.asdf/asdf.sh

# source direnv
eval "$(direnv hook zsh)"

