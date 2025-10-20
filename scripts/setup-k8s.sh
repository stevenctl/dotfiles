#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

case "$(uname -s)" in
  Darwin) pkg="kubectl" ;;                       # Homebrew
  Linux)
    if [[ -f /etc/arch-release ]]; then
      pkg="kubectl"                              # pacman
    elif [[ -f /etc/debian_version ]]; then
      pkg="kubectl"                              # apt
    else
      echo "Unsupported Linux distro" >&2
      exit 1
    fi
    ;;
  *) echo "Unsupported OS" >&2; exit 1 ;;
esac

do_install "$pkg"

go install sigs.k8s.io/kind@latest
go install sigs.k8s.io/cloud-provider-kind@latest
