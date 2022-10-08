#!/bin/zsh

# should do it only in iterm2 app
if [ "$TERM_PROGRAM" = "iTerm.app" ]; then

  function iterm2_print_user_vars() {
    iterm2_set_user_var kubecontext $(kubectl config current-context)
  }

  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi