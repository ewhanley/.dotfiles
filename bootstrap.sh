#!/usr/bin/env bash
#
# bootstrap.sh — set up a fresh macOS machine from this dotfiles repo.
#
#   git clone https://github.com/ewhanley/.dotfiles "$HOME/.dotfiles"
#   cd "$HOME/.dotfiles"
#   ./bootstrap.sh
#
# Idempotent: safe to run repeatedly. Skips what's already done.
# Flags:
#   --no-defaults   skip applying macOS system defaults
#   --no-brew       skip `brew bundle`
#   --no-stow       skip symlinking dotfiles
#   --no-node       skip nvm + node install

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DO_DEFAULTS=1; DO_BREW=1; DO_STOW=1; DO_NODE=1
NVM_VERSION="v0.40.1"   # https://github.com/nvm-sh/nvm/releases

for arg in "$@"; do
  case "$arg" in
    --no-defaults) DO_DEFAULTS=0 ;;
    --no-brew)     DO_BREW=0 ;;
    --no-stow)     DO_STOW=0 ;;
    --no-node)     DO_NODE=0 ;;
    *) echo "unknown flag: $arg" >&2; exit 1 ;;
  esac
done

log()  { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m[warn]\033[0m %s\n' "$*"; }

# Stow packages = every top-level dir that holds config (one dir per tool).
STOW_PACKAGES=(aerospace btop ghostty nvim starship tmux zsh)

# ---------------------------------------------------------------------------
# 1. Xcode Command Line Tools (gives us git, cc, etc.)
# ---------------------------------------------------------------------------
if ! xcode-select -p >/dev/null 2>&1; then
  log "Installing Xcode Command Line Tools…"
  xcode-select --install || true
  echo "Finish the CLT GUI installer, then re-run ./bootstrap.sh"
  exit 0
else
  log "Xcode Command Line Tools present."
fi

# ---------------------------------------------------------------------------
# 2. Homebrew
# ---------------------------------------------------------------------------
if ! command -v brew >/dev/null 2>&1; then
  log "Installing Homebrew…"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Put brew on PATH for this run (Apple Silicon = /opt/homebrew, Intel = /usr/local).
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi
log "Homebrew: $(brew --version | head -1)"

# ---------------------------------------------------------------------------
# 3. Install everything in the Brewfile
# ---------------------------------------------------------------------------
if [ "$DO_BREW" -eq 1 ]; then
  log "Running brew bundle…"
  brew bundle --file="$DOTFILES_DIR/Brewfile"
else
  warn "Skipping brew bundle (--no-brew)."
fi

# ---------------------------------------------------------------------------
# 4. Symlink dotfiles with GNU Stow
# ---------------------------------------------------------------------------
if [ "$DO_STOW" -eq 1 ]; then
  if ! command -v stow >/dev/null 2>&1; then
    warn "stow not found — install it (brew install stow) or run without --no-brew."
  else
    log "Stowing dotfiles into \$HOME…"
    cd "$DOTFILES_DIR"
    for pkg in "${STOW_PACKAGES[@]}"; do
      [ -d "$pkg" ] || { warn "package '$pkg' not found, skipping"; continue; }
      # Back up any real file that would block the symlink (fresh machines rarely hit this).
      while IFS= read -r target; do
        rel="${target#"$pkg"/}"
        dest="$HOME/$rel"
        if [ -e "$dest" ] && [ ! -L "$dest" ]; then
          warn "backing up existing $dest -> $dest.pre-stow.bak"
          mv "$dest" "$dest.pre-stow.bak"
        fi
      done < <(find "$pkg" -type f -o -type l | sed "s|^\./||")
      stow --restow --target="$HOME" "$pkg"
      echo "   stowed $pkg"
    done
  fi
else
  warn "Skipping stow (--no-stow)."
fi

# ---------------------------------------------------------------------------
# 5. nvm + node (your .zshrc sources ~/.nvm; nvim LSPs via mason want node)
# ---------------------------------------------------------------------------
if [ "$DO_NODE" -eq 1 ]; then
  export NVM_DIR="$HOME/.nvm"
  if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    log "Installing nvm $NVM_VERSION…"
    curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_VERSION/install.sh" | bash
  else
    log "nvm already present."
  fi
  # Load nvm into this shell and install the latest LTS node.
  # shellcheck disable=SC1091
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  if command -v nvm >/dev/null 2>&1; then
    log "Installing node LTS via nvm…"
    nvm install --lts
    nvm alias default 'lts/*'
  else
    warn "nvm didn't load; install node manually later."
  fi
else
  warn "Skipping nvm/node (--no-node)."
fi

# ---------------------------------------------------------------------------
# 6. macOS system defaults
# ---------------------------------------------------------------------------
if [ "$DO_DEFAULTS" -eq 1 ]; then
  if [ -f "$DOTFILES_DIR/macos-defaults.sh" ]; then
    log "Applying macOS defaults…"
    bash "$DOTFILES_DIR/macos-defaults.sh"
  fi
else
  warn "Skipping macOS defaults (--no-defaults)."
fi

log "Done. Open a new terminal so the shell picks up the new config."
echo "Notes:"
echo "  • First nvim launch will bootstrap lazy.nvim and install plugins."
echo "  • Grant Accessibility permission to AeroSpace on first launch."
echo "  • Sign into the App Store / 1Password etc. manually."
