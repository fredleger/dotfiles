#!/bin/zsh

# ls
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# editors
alias vi='vim'
alias vim='nvim'
alias code="open -a 'Visual Studio Code'"

# ssh
alias sshq='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias scpq='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# misc
alias subl="open -a '/Applications/Sublime Text.app/Contents/MacOS/sublime_text'"

# portainer
function portainer-up() {
  docker run -d -p 9000:9000  -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/.portainer:/data portainer/portainer
}

# loads plugins on demand
function zsh-load-plugin() {
  source $ZSH/plugins/"$1"/"$1".plugin.zsh
}

# thefuck
eval $(thefuck --alias)

alias j='z'
alias zz='z'

alias less='bat'
alias more='bat'

alias intel="$env /usr/bin/arch -x86_64 /bin/zsh --login"
alias arm="$env /usr/bin/arch -arm64 /bin/zsh --login"
