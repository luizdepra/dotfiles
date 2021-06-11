: ${ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim}

export BROWSER=firefox
export EDITOR=nvim
export TERM=alacritty

export PATH="$HOME/.cargo/bin:$HOME/bin:$PATH"

export WINIT_HIDPI_FACTOR=1.0

# Load local configuration
if [[ -f ${HOME}/.zshenv_local ]]; then
    source ${HOME}/.zshenv_local
fi
. "$HOME/.cargo/env"
