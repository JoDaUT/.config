#!/usr/bin/env bash
set -euo pipefail

SRC="$HOME/.config.source"
DST="$HOME/.config"

for dir in "$SRC"/*/; do
  name=$(basename "$dir")
  target="$DST/$name"

  if [ -L "$target" ]; then
    echo "skip (symlink exists): $name"
  elif [ -e "$target" ]; then
    echo "skip (real dir/file exists): $name"
  else
    ln -s "$dir" "$target"
    echo "linked: $name"
  fi
done

# tmux config
ln -s "$SRC/.tmux.conf" "$HOME"

ln -s "$SRC/.bashrc" "$HOME"
