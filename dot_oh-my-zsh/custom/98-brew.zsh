#!/bin/zsh

# TODO: we should probably just detect if brew is installed and use that
if [ "$(uname)" = "Darwin" ]; then
  export HOMEBREW_NO_INSTALL_CLEANUP="true"

  function zsh-load-brew() {
    zsh-load-plugin osx
    zsh-load-plugin brew
    zsh-load-plugin cask
  }

fi
