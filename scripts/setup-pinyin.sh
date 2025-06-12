#!/usr/bin/env zsh
source ~/dotfiles/scripts/common.sh

# meta pulls gtk/qt front-ends & configtool
ARCH_PKGS=(fcitx5-im fcitx5-chinese-addons)
DEB_PKGS=(fcitx5 fcitx5-chinese-addons \
          fcitx5-frontend-gtk3 fcitx5-frontend-qt5 \
          fcitx5-config-qt fcitx5-configtool)

case "$(uname -s)" in
  Linux)
    if [[ -f /etc/arch-release ]]; then
      do_install "${ARCH_PKGS[@]}"
    elif [[ -f /etc/debian_version ]]; then
      do_install "${DEB_PKGS[@]}"
    else
      echo "Unsupported Linux distro for auto-fcitx5 setup" >&2
      exit 1
    fi
    ;;
  Darwin|*) echo "fcitx5 not relevant on this OS" >&2; exit 0 ;;
esac

# wayland + x11 friendly envs
mkdir -p ~/.config/environment.d
cat > ~/.config/environment.d/99-fcitx5.conf <<'EOF'
INPUT_METHOD=fcitx
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
SDL_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
GLFW_IM_MODULE=ibus
EOF
# fallback for sessions that ignore environment.d
grep -q 'fcitx' ~/.xprofile 2>/dev/null || cat >> ~/.xprofile <<'EOF'
export INPUT_METHOD=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus
EOF

# autostart desktop file + systemctl
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/fcitx5.desktop <<'EOF'
[Desktop Entry]
Type=Application
Exec=fcitx5 -d
Hidden=false
X-GNOME-Autostart-enabled=true
Name=Fcitx5
EOF
