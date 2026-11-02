#!/usr/bin/env bash

set -e

DOTFILES_REPO="https://github.com/yourusername/nvim-dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles-nvim"
NVIM_CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%s)"

echo "==> Installing Neovim dotfiles (no symlinks)..."

# Clone or update repo
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "==> Cloning dotfiles repo..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
    echo "==> Updating existing repo..."
    git -C "$DOTFILES_DIR" pull
fi

# Backup existing config
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "==> Backing up existing config to $BACKUP_DIR"
    mv "$NVIM_CONFIG_DIR" "$BACKUP_DIR"
fi

# Copy config instead of symlink
echo "==> Copying config..."
mkdir -p "$NVIM_CONFIG_DIR"
mv "$DOTFILES_DIR/nvim/"* "$NVIM_CONFIG_DIR/"

# Optional: install lazy.nvim (plugin manager)
LAZY_DIR="$HOME/.local/share/nvim/lazy/lazy.nvim"
if [ ! -d "$LAZY_DIR" ]; then
    echo "==> Installing lazy.nvim..."
    git clone https://github.com/folke/lazy.nvim.git "$LAZY_DIR"
fi

echo "==> Done! Launch nvim to install plugins."
