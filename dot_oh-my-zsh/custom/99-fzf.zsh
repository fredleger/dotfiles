export FZF_COMPLETION_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"

#-----------------------------------------------------
# use fasd_cd and fzf together
#-----------------------------------------------------
function z() {
  [ $# -gt 0 ] && fasd_cd -i -d "$*" && return
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
