#!/usr/bin/env sh

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

GITHUB_REPO="https://github.com/SHTRAMPANTUNC/dotfiles"
CONFIG_DIR="$HOME/.config"

if git clone ${GITHUB_REPO} temp_repo; then
  echo -e "${GREEN}[ INFO ]:$1${NC} Repository successfully cloned"
else
  echo -e "${RED}[ ERROR ]:$1${NC} Error when cloning a repository!"
  exit 1
fi

if cp -r temp_repo/.config $CONFIG_DIR/ && cp .* $HOME/; then
  echo -e "${GREEN}[ INFO ]:$1${NC} Dotfiles successfully moving"
else
  echo -e "${GREEN}[ ERROR ]:$1${NC} Error during move dotfiles"
  exit 1
fi

rm -rf temp_repo

echo -e "${GREEN}[ FINISH ]:$1${NC} Deploy has been completed :D"
