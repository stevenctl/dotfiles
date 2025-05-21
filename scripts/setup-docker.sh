#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh


case "$(uname -s)" in
  Darwin)
    # macOS
    if ! command -v docker &>/dev/null; then
      brew install --cask docker           # installs current 4.41.x cask :contentReference[oaicite:0]{index=0}
    fi
    ;;

  Linux)
    if [[ -f /etc/arch-release ]]; then
      # Arch-based
      if command -v yay &>/dev/null; then
        yay -S --noconfirm --needed docker-desktop
      else
        echo "⚠️  Need an AUR helper (e.g. yay) to install docker-desktop-bin" >&2
        exit 1
      fi

      # first-run “permission denied /var/run/docker.sock” guard
      if ! groups "$USER" | grep -qw docker; then
        echo "Adding $USER to the docker group (needs sudo)…"
        sudo groupadd -f docker
        sudo usermod -aG docker "$USER"
        echo "👉  Log out/in or run 'newgrp docker' for it to take effect"
      fi
    else
      echo "Linux detected, but only Arch package flow provided" >&2
      exit 1
    fi
    ;;


  *)
    echo "Unsupported OS for automatic Docker Desktop install" >&2
    exit 1
    ;;
esac
