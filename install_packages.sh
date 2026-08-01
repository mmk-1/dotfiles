#!/bin/bash

# The following line causes the script to exit immediately
# if any command exits with a non-zero status (an error).
set -e

PACKAGES=(
  chezmoi
  fzf
  fd
  ripgrep
  neovim
  wezterm
  starship
  zellij
  kitty
  obsidian
  koofr
  nvm
  docker
  docker-compose
  zsh
)

# Hyprland packages that are commented for now:
#   hyprland
#   xdg-desktop-portal-hyprland
#   polkit-kde-agent
#   qt5-wayland
#   qt6-wayland
#   dunst
#   brightnessctl
#   pamixer
#   waybar
#   tofi
#   cliphist
#   swww
#   hyprpicker
#   hyprlock
#   hypridle
#   wlogout
#   grim
#   wlsunset
#   wl-clipboard
#   nwg-look
#   qt5ct
#   qt6ct
#   kvantum
#   kvantum-theme-catppuccin-git

# Check if pamac is installed
if ! command -v pamac &> /dev/null; then
  echo "Error: pamac is not installed. Please install pamac first."
  exit 1
fi

echo "Starting package installation..."

for pkg in "${PACKAGES[@]}"; do
  if pamac list --installed "$pkg" &> /dev/null; then
    echo "$pkg is already installed. Skipping."
  else
    echo "Installing $pkg..."
    pamac install --no-confirm "$pkg"
  fi
done

echo "All packages processed!" 