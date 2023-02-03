function nvrepel() {
  if [[ ! "$BUFFER" =~ ^: ]]; then
    return 1
  fi

  local RES="$( nvr --remote-expr "execute(\"${BUFFER//\"/\\\"}\")" )"
  printf "$RES"
  print -s "$BUFFER"
  zle send-break
  return 0
}

zle -N nvrepel

function nvrepel-or-accept-line() {
  nvrepel || zle accept-line
}

zle -N nvrepel-or-accept-line
