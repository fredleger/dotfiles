#!/bin/zsh

# kubernetes
alias ks='kubectl -n kube-system'
complete -o default -F __start_kubectl k
complete -o default -F __start_kubectl ks

# kube-ps1
function zsh-load-kubeps1() {
  source /usr/local/Cellar/kube-ps1/0.7.0/share/kube-ps1.sh
  export PROMPT='$(kube_ps1)'$PROMPT
}

# krew
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"

# kubectl aliases
# source ~/.kubectl_aliases
# function kubectl() {
#   echo "+ kubectl $@">&2; command kubectl $@;
# }
