#!/bin/zsh

# kubernetes
alias ks='kubectl -n kube-system'
complete -o default -F __start_kubectl k
complete -o default -F __start_kubectl ks

# kube-ps1
if [ "$(uname -s)" = "Darwin" ]; then
  source $(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh
else
  source /usr/share/kube-ps1/kube-ps1.sh
fi
export KUBE_PS1_ENABLED=false
export PROMPT='$(kube_ps1)'$PROMPT

# krew
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"

# kubectl aliases
# source ~/.kubectl_aliases
# function kubectl() {
#   echo "+ kubectl $@">&2; command kubectl $@;
# }
