#!/usr/bin/env bash

set -e

if [ -z "$PRJ_ROOT" ]; then
  PRJ_ROOT="${HOME}/.superme"
fi

shell="$1"
if [ -z "$shell" ]; then
  shell="$(ps c -p "$PPID" -o 'ucomm=' 2>/dev/null || true)"
  shell="${shell##-}"
  shell="${shell%% *}"
  shell="$(basename "${shell:-$SHELL}")"
fi

colorize() {
  if [ -t 1 ]; then printf "\e[%sm%s\e[m" "$1" "$2"
  else echo -n "$2"
  fi
}

checkout() {
  [ -d "$2" ] || git clone --depth 1 "$1" "$2"
}

checkout_prj() {
  if [ -n "${USE_GIT_URI}" ]; then
    GITHUB="git://github.com"
  else
    GITHUB="https://github.com"
  fi

  checkout "${GITHUB}/morya/supervisor-installer.git"            "${PRJ_ROOT}"
}

main() {
  if ! command -v git 1>/dev/null 2>&1; then
    echo "project: Git is not installed, can't continue." >&2
    exit 1
  fi

  checkout_prj

  cd $HOME
  mkdir -p etc tmp var/run log
  

}

main
