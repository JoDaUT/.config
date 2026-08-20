#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Copy config directory contents into ~/.config/
for dir in "$DOTFILES"/*/; do
  name=$(basename "$dir")
  [ "$name" = ".git" ] && continue

  target="$HOME/.config/$name"

  mkdir -p "$target"
  echo "syncing: $name -> $target"
  cp -R "$dir"/. "$target"/
done

# Copy dotfiles to $HOME
for file in "$DOTFILES"/.*; do
  [ -f "$file" ] || continue
  basename=$(basename "$file")
  [ "$basename" = "." ] && continue
  [ "$basename" = ".." ] && continue
  [ "$basename" = ".git" ] && continue
  [ "$basename" = ".gitignore" ] && continue

  target="$HOME/$basename"
  echo "copying: $basename -> $target"
  cp "$file" "$target"
done

echo "Done."
