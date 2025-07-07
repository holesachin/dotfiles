#!/usr/bin/env bash
#
#

RETRY=2

function isConnected {
  ping -q -c1 ${1} &>/dev/null && true || false
}

if [[ ${1} == "current" ]]; then 
  tailscale switch --list | grep ".*\*" | cut -d' ' -f4- | tr -d " *"
  exit
fi

if [[ ${1} == "switch" ]]; then
  LIST=$( (echo -e "Up\nDown\nRestart"; tailscale switch --list | tail -n +2) | rofi -dmenu | cut -d' ' -f1 )

  case "${LIST}" in
    Up) tailscale up  ;;
    Down) tailscale down ;;
    Restart) pkexec systemctl restart tailscaled.service ;;
    *)  [[ -n ${LIST} ]] && tailscale switch "${LIST}" ;; 
  esac
fi
