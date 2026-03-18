#! /usr/bin/env zsh

echo "Clearing ~/.local/share/nvim"
rm -rf ~/.local/share/nvim
echo "Clearing ~/.local/state/nvim"
rm -rf ~/.local/state/nvim
echo "Clearing ~/.cache/nvim"
rm -rf ~/.cache/nvim
echo "Neovim cache and state cleared."
