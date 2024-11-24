#!/bin/zsh

# kubernetes
alias ks='kubectl -n kube-system'
complete -o default -F __start_kubectl k
complete -o default -F __start_kubectl ks

# kube-ps1
if [ "$(uname -s)" = "Darwin" ]; then
  KUBE_PS1_FILE="$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh"
else
  KUBE_PS1_FILE="/usr/share/kube-ps1/kube-ps1.sh"
fi

case "${TERM_PROGRAM}" in
  OpenLens)
    ;;
  *)
    source $KUBE_PS1_FILE
    export PROMPT='$(kube_ps1)'$PROMPT
    export KUBE_PS1_ENABLED=false
    ;;
esac

function kubeps1 {
  case $1 in
    on)
      KUBE_PS1_ENABLED=on
      OLDPROMPT=$PROMPT
      PROMPT="$(kube_ps1) $PROMPT"
      export KUBE_PS1_ENABLED PROMPT OLDPROMPT
      ;;
    off)
      KUBE_PS1_ENABLED=off
      PS1=$OLDPROMPT
      export KUBE_PS1_ENABLED PS1
      unset RPROMPT OLDPROMPT
      ;;
    *)
      echo "usage: kubeps1 (on|off)"
      exit 0
      ;;
  esac
}

# krew
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"

# kubectl aliases
# source ~/.kubectl_aliases
# function kubectl() {
#   echo "+ kubectl $@">&2; command kubectl $@;
# }
