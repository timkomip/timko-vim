#! /usr/bin/env zsh

# Check if .config/nvim directory exists
if [ -d "$HOME/.config/nvim" ]; then
  echo "The directory $HOME/.config/nvim already exists. Please remove/move it before running this script."
  exit 1
fi

# Link repo to config location
echo "Linking the repository to $HOME/.config/nvim"
ln -s "$(pwd)" "$HOME/.config/nvim"

# ask if you want to clear cache
echo "Do you want to clear Neovim cache and state? (y/n)"
read -r reply

if [[ "$reply" =~ ^[Yy]$ ]]; then
  source scripts/clean_cache.sh
fi

echo "Done!!"
