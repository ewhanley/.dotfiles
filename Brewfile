# Brewfile — declarative list of everything Homebrew installs.
# Run with:  brew bundle --file=Brewfile
# Re-run any time; it's idempotent and only installs what's missing.

# ---------------------------------------------------------------------------
# Taps
# ---------------------------------------------------------------------------
tap "nikitabobko/tap"        # aerospace
tap "FelixKratz/formulae"    # borders (JankyBorders), used by aerospace after-startup

# ---------------------------------------------------------------------------
# CLI tools (derived from your dotfiles + their dependencies)
# ---------------------------------------------------------------------------
brew "git"
brew "stow"                  # symlinks the dotfiles packages into $HOME
brew "neovim"
brew "tmux"
brew "starship"              # prompt (zshrc: starship init)
brew "btop"
brew "eza"                   # zshrc aliases: ls/ll
brew "gh"                    # GitHub CLI (zshrc alias)
brew "ripgrep"               # telescope live_grep, todo-comments
brew "fd"                    # telescope file finder
brew "fzf"

# nvim toolchain (conform formatters run from PATH; LSPs come via mason)
brew "stylua"                # lua formatter (conform.nvim)
brew "ruff"                  # python formatter + LSP (conform.nvim)

# Optional but commonly wanted — uncomment as desired
# brew "jq"
# brew "wget"
# brew "tree"
# brew "lazygit"

# ---------------------------------------------------------------------------
# GUI apps (casks)
# ---------------------------------------------------------------------------
cask "ghostty"                       # terminal
cask "nikitabobko/tap/aerospace"     # tiling window manager
brew "borders"                       # window borders (aerospace after-startup-command)

# Fonts — Ghostty config uses "MesloLGM Nerd Font Mono"
cask "font-meslo-lg-nerd-font"
# cask "font-fira-mono-nerd-font"    # the commented alt in your ghostty config

# ---------------------------------------------------------------------------
# Personal GUI apps — add your own here (examples commented out)
# ---------------------------------------------------------------------------
# cask "google-chrome"
# cask "arc"
# cask "raycast"
# cask "visual-studio-code"
# cask "rectangle"
# cask "obsidian"
# cask "1password"
# cask "slack"
# cask "docker"
