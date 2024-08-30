#!/usr/bin/env sh

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

GITHUB_REPO="https://github.com/SHTRAMPANTUNC/dotfiles"
CONFIG_DIR="$HOME/.config"

PACKAGES=(
  # My Dear Editor
  "app-editors/neovim"
  # Shell
  "app-shells/fish"
  "app-shells/starship"
  # GUI Env
  "gui-wm/sway"
  "gui-wm/swaylock"
  "gui-wm/swayidle"
  "gui-apps/foot"
  "gui-apps/rofi-wayland"
  "gui-apps/waybar"
  "gui-apps/wl-clipboard"
  "x11-misc/dunst"
  # Dev Tools
  "dev-lang/go"
  # CLI\TUI Stuff
  "app-misc/tmux"
  "app-shells/zoxide"
  "sys-apps/eza"
  "sys-block/dust"
  "sys-fs/duf"
  # System
  "sys-apps/flatpak"
  "sys-apps/xdg-desktop-portal"
  "sys-auth/polkit"
  "media-video/pipewire"
  # Portage
  "app-portage/eix"
  "app-eselect/eselect-repository"
)

set -e

echo -e "${GREEN}[ STEP 1 ]:$1${NC} Clonig Repo"

echo -e "${GREEN}[ STEP 2 ]:$1${NC} Connect to GURU..."

if emerge --sync guru; then
  echo -e "${GREEN}[ INFO ]:$1${NC} Emerge successfully synced"
  if emaint sync --repo guru; then
    echo -e "${GREEN}[ INFO ]:$1${NC} Repository successfully connected"
  else
    echo -e "${RED}[ ERROR ]:$1${NC} Error when connected to GURU!"
    exit 1
  fi
else
  echo -e "${RED}[ ERROR ]:$1${NC} Error when emerge sync!"
  exit 1
fi

if git clone ${GITHUB_REPO} temp_repo; then
  echo -e "${GREEN}[ INFO ]:$1${NC} Repository successfully cloned"
else
  echo -e "${RED}[ ERROR ]:$1${NC} Error when cloning a repository!"
  exit 1
fi

echo -e "${GREEN}[ STEP 3 ]:$1${NC} Move a config files to $CONFIG_DIR..."

if cp -r temp_repo/* $CONFIG_DIR/; then
  echo -e "${GREEN}[ INFO ]:$1${NC} Config files successfully moving"
else
  echo -e "${GREEN}[ ERROR ]:$1${NC} Error during move config files"
  exit 1
fi

rm -rf temp_repo

echo -e "${GREEN}[ STEP 4 ]:$1${NC} Installing the necessary packages..."
for package in "${PACKAGES[@]}"; do
  if emerge $package; then
    echo -e "${GREEN}[ INFO ]:$1${NC} $package successfully installed."
  else
    echo -e "${RED}[ ERROR ]:$1${NC} Error during $package installation"
  fi
done

echo -e "${GREEN}[ FINISH ]:$1${NC} Deploy has been complited :D"
