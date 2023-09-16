function nvrepl-nvr() {
  nvr "$@"
}

function nvrepl-line() {
  if [[ ! "$BUFFER" =~ ^: ]]; then
    return 1
  fi

  local RES="$( nvrepl-nvr --remote-expr "execute(\"${BUFFER//\"/\\\"}\")" )"
  printf "$RES"
  print -s "$BUFFER"
  zle send-break
  return 0
}

zle -N nvrepl-line

function nvrepl-or-accept-line() {
  if which "${NVREPL_FALLBACK_ACCEPT_LINE:-}" >/dev/null 2>/dev/null; then
    nvrepl-line || zle ${NVREPL_FALLBACK_ACCEPT_LINE}
  else
    nvrepl-line || zle accept-line
  fi
}

zle -N nvrepl-or-accept-line

NVREPL_LOADED=1
