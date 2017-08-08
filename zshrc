# source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

# source asdf
. $HOME/.asdf/asdf.sh

# source direnv
eval "$(direnv hook zsh)"

