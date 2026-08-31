# Dotfiles

Personal Arch/Hyprland dotfiles (chezmoi).

## Index

- [Packages](#packages)
- [Terminal & shell setup](#terminal--shell-setup)
- [Waybar setup](#waybar-setup)
- [Noctalia Greeter setup](#noctalia-greeter-setup)

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

---

## Noctalia Greeter setup

Graphical login via [greetd](https://github.com/kennylevinsen/greetd) + [Noctalia Greeter](https://docs.noctalia.dev/greeter/) — replaces the TTY login and `niri-session` hand-off.

Order: packages → greetd → PAM → dotfiles → sync appearance.

```bash
# 1. Packages (greetd is pulled in by noctalia-greeter)
yay -S noctalia-greeter gnome-keyring

# 2. Greetd — prints a setup block; paste the whole thing into the terminal and run it
sudo noctalia-greeter-print-greetd-config

# 3. Keyring unlock at greeter login (same idea as /etc/pam.d/login)
sudo nano /etc/pam.d/greetd
```

Add these two lines to `/etc/pam.d/greetd` (keep the rest of the file as-is):

```
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
```

Put the `auth` line after `auth include system-local-login`, and the `session` lines after `session include system-local-login` (before `session required pam_systemd.so`).

```bash
# 4. Apply dotfiles
chezmoi apply ~/.config/niri
chezmoi apply ~/.config/noctalia

# 5. Reboot, or log out — greeter should be on VT1 instead of the text login

# 6. Match greeter wallpaper / theme to the desktop (after logging in)
#    Noctalia Settings → Security → Noctalia Greeter → Sync Now
#    Optional: enable Auto-Sync Greeter in the same panel
```

To preview greeter changes without a full reboot, log out from the session (or `sudo systemctl restart greetd` from another TTY).

Optional: `accountsservice` for user avatars on the login screen.

Greeter appearance (`/var/lib/noctalia-greeter/`) is not in chezmoi — it is written by Sync Now from Noctalia. See the [Noctalia Greeter docs](https://docs.noctalia.dev/greeter/) for configuration, troubleshooting, and keyboard shortcuts (e.g. F3 session picker, F7 color scheme).

