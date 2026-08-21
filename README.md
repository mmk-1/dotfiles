# Dotfiles

Personal Arch/Hyprland dotfiles (chezmoi).

## Index

- [Packages](#packages)
- [Terminal & shell setup](#terminal--shell-setup)
- [Waybar setup](#waybar-setup)

---

## Packages

### Core / CLI

- `fzf`, `fd`, `ripgrep`
- `neovim`
- `zsh` (+ [Zap](https://github.com/zap-zsh/zap))
- `starship`
- `zellij`
- `kitty`, `wezterm`
- `nvm`
- `Obsidian`, `Koofr`

### Hyprland

- `hyprland`, `xdg-desktop-portal-hyprland`
- `hyprpolkitagent`, `hyprlock`, `hypridle`, `hyprpicker`
- `waybar`, `swaybg` / `swww`, `dunst`, `wlogout`
- `tofi`, `cliphist`, `wl-clipboard`
- `brightnessctl`, `grim`
- `qt5-wayland`, `qt6-wayland`
- theming (later): `nwg-look`, `qt5ct`, `qt6ct`, `kvantum`



### Fonts

- `ttf-jetbrains-mono-nerd`



### Electron flags

- `chrome-flags.conf`, `chromium-flags.conf`, `electron-flags.conf`, `vivaldi-stable.conf`
- Slack auth flags still TBD

---



## Terminal & shell setup

Order matters: font → packages → shell → configs → terminal → mux.

```bash
# 1. Font (needed for starship / kitty icons)
yay -S ttf-jetbrains-mono-nerd

# 2. Packages
yay -S zsh
yay -S kitty
yay -S starship
yay -S zellij
yay -S fzf
yay -S direnv

# 3. Default shell
chsh -s /bin/zsh

# 4. Apply configs (chezmoi — only this stack)
chezmoi apply ~/.zshenv ~/.config/zsh
chezmoi apply ~/.config/starship.toml
chezmoi apply ~/.config/kitty
chezmoi apply ~/.config/zellij

# 5. Smoke-test shell (TTY or: zsh -l)
#    Zap clones itself on first run from ~/.config/zsh/.zshrc

# 6. Open Kitty — check Nerd glyphs + prompt

# 7. Optional: zellij
```

---



## Waybar setup

Order: font → packages → config → run (Hyprland autostarts it).

```bash
# 1. Font (icons)
yay -S ttf-jetbrains-mono-nerd

# 2. Packages (audio via PipeWire/wpctl — already from wireplumber)
yay -S waybar
yay -S brightnessctl

# 3. Apply config
chezmoi apply ~/.config/waybar

# 4. Run / reload
waybar
# or: killall waybar; waybar
```

