function nvrepel-nvr() {
  nvr "$@"
}

function nvrepel-line() {
  if [[ ! "$BUFFER" =~ ^: ]]; then
    return 1
  fi

  local RES="$( nvrepel-nvr --remote-expr "execute(\"${BUFFER//\"/\\\"}\")" )"
  printf "$RES"
  print -s "$BUFFER"
  zle send-break
  return 0
}

zle -N nvrepel-line

function nvrepel-or-accept-line() {
  nvrepel-line || zle accept-line
}

zle -N nvrepel-or-accept-line

NVREPL_LOADED=1
