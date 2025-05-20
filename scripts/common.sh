source ~/.zshrc

if [ -n "${SKIP_SETUP_SCRIPTS}" ]; then
  exit 0
fi


do_install() {
  local pm
  if command -v pacman &>/dev/null; then
    pm=(sudo pacman -S --noconfirm --needed)
  elif command -v brew &>/dev/null; then
    pm=(brew install)
  elif command -v apt-get &>/dev/null; then
    pm=(sudo apt-get install -y)
  else
    echo "No supported package manager found" >&2
    return 1
  fi
  "${pm[@]}" "$@"
}
