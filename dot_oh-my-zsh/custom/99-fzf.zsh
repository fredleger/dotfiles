export FZF_COMPLETION_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"

_fzf_complete_pass() {
  ARGS="$@"
  _fzf_complete '' "$@" < <(
      PASSWORD_STORE_DIR="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
      cd "$PASSWORD_STORE_DIR" || return
      command find . -type f -name "*.gpg" | sed -r 's,\./(.*)\.gpg,\1,'
  )
}

_fzf_complete_ssh() {
  _fzf_complete +m -- "$@" < <(
    setopt localoptions nonomatch
    command cat <(cat ~/.ssh/config ~/.ssh/config.d/* /etc/ssh/ssh_config 2> /dev/null | command grep -i '^\s*host\(name\)\? ' | awk '{for (i = 2; i <= NF; i++) print $1 " " $i}' | command grep -v '[*?]') \
        <(command grep -oE '^[[a-z0-9.,:-]+' ~/.ssh/known_hosts | tr ',' '\n' | tr -d '[' | awk '{ print $1 " " $1 }') \
        <(command grep -v '^\s*\(#\|$\)' /etc/hosts | command grep -Fv '0.0.0.0') |
        awk '{if (length($2) > 0) {print $2}}' | sort -u
    command avahi-browse -atlr | grep -o '\<\S\+\.local' | sort -u
  )
}

# NOTE: z / autojump / fasd / fcd have been replaced by zoxide
