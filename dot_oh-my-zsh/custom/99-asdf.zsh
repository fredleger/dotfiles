#!/bin/zsh

if [ "$(uname)" = "Darwin" ]; then
  export ASDF_DIR="$(brew --prefix asdf)/libexec"
else
  export ASDF_DIR="${HOME}/.asdf"
fi

source $ASDF_DIR/asdf.sh
