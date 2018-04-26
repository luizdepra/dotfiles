# zim speedup script
(
  zcompare() {
    if [[ -s ${1} && ( ! -s ${1}.zwc || ${1} -nt ${1}.zwc) ]]; then
      zcompile ${1}
    fi
  }

  zim_mods=${ZDOTDIR:-${HOME}}/.zim/modules
  setopt EXTENDED_GLOB

  # zcompile the completion cache; siginificant speedup.
  for file in ${ZDOTDIR:-${HOME}}/.zcomp^(*.zwc)(.); do
    zcompare ${file}
  done

  # zcompile .zshrc
  zcompare ${ZDOTDIR:-${HOME}}/.zshrc

  # zcompile some light module init scripts
  zcompare ${zim_mods}/git/init.zsh
  zcompare ${zim_mods}/utility/init.zsh
  zcompare ${zim_mods}/pacman/init.zsh
  zcompare ${zim_mods}/spectrum/init.zsh
  zcompare ${zim_mods}/completion/init.zsh
  zcompare ${zim_mods}/fasd/init.zsh

  # zcompile all .zsh files in the custom module
  for file in ${zim_mods}/custom/**/^(README.md|*.zwc)(.); do
    zcompare ${file}
  done

  # zcompile all autoloaded functions
  for file in ${zim_mods}/**/functions/^(*.zwc)(.); do
    zcompare ${file}
  done

  # syntax-highlighting
  for file in ${zim_mods}/syntax-highlighting/external/highlighters/**/*.zsh; do
    zcompare ${file}
  done
  zcompare ${zim_mods}/syntax-highlighting/external/zsh-syntax-highlighting.zsh

  # zsh-histery-substring-search
  zcompare ${zim_mods}/history-substring-search/external/zsh-history-substring-search.zsh
) &!
