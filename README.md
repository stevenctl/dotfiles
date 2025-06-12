# Steven's Dotfiles

This repository contains my personal development environment configuration for
Linux (Manjaro/Arch) and macOS. It automates the setup of a consistent
development environment across different machines.

**Note:** This configuration is tailored to my personal preferences and
workflow. You may want to review and modify it before using.

## Components

* **Shell**: ZSH with Oh-My-Zsh
* **Terminal**: Kitty
* **Editor**: Neovim with custom plugins and configurations
* **Window Management**: 
  * Linux: i3, Sway, Hyprland
  * macOS: Yabai
* **Development Tools**:
  * Languages: Go, Rust, Node.js, C/C++
  * Containers: Docker, Kubernetes
  * Utilities: ripgrep, fzf, jq, yq, and more

## Repository Structure

```
dotfiles/
├─ config/              # Application configurations
│  ├─ kitty/            # Terminal emulator config
│  ├─ vim/              # Vim/Neovim configuration
│  │  └─ nvim/          # Neovim-specific config
│  ├─ wm/               # Window manager configs
│  │  ├─ i3.conf        # i3 config
│  │  ├─ hyprland.conf  # Hyprland config
│  │  ├─ sway.user.conf # Sway config
│  │  └─ ...            # Other WM, bar, dmenu, themes and configs
│  └─ jetbrains/        # JetBrains IDE configs and themes
├─ dotbot/              # Dotbot submodule for installation
├─ scripts/             # Setup scripts for various tools (run by dotbot)
│  ├─ setup-go.sh       # Go setup
│  ├─ setup-neovim.sh   # Neovim setup
│  ├─ setup-zsh.sh      # ZSH setup
│  └─ ...               # Other setup scripts
├─ zsh/                 # ZSH configuration
│  ├─ .zshrc            # Main ZSH config
│  └─ custom/           # Custom ZSH scripts (loaded at .zshrc time)
├─ install              # Main installation script
└─ install.conf.yaml    # Dotbot configuration
```

## Installation

```shell
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install
```


## Notes

* The first time, you might have to run this multiple times, remove (and
  backup) existing config files that would be overwritten, do general tweaking.
* You may need to restart your shell after the initial installation to ensure
  all paths are correctly set.
* Some Neovim plugins (via :mason) may need manual installation for LSPs, DAPs, linters.

## Dotbot

Credit to [Dotbot](https://github.com/anishathalye/dotbot) for the installation framework.

[dotbot]: https://github.com/anishathalye/dotbot
[fork]: https://github.com/anishathalye/dotfiles_template/fork
[template]: https://github.com/anishathalye/dotfiles_template/generate

