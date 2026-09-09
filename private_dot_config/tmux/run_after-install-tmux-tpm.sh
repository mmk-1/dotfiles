#!/usr/bin/env bash
set -eu

tpm_dir="${XDG_CONFIG_HOME:-$HOME/.config}/tmux/plugins/tpm"

if [ ! -x "$tpm_dir/tpm" ]; then
  mkdir -p "$(dirname "$tpm_dir")"
  git clone --depth=1 https://github.com/tmux-plugins/tpm "$tpm_dir"
fi
