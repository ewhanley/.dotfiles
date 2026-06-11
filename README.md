# dotfiles

Personal macOS setup. Configs are managed with [GNU Stow](https://www.gnu.org/software/stow/);
everything else (apps, tools, system defaults) is one bootstrap script.

## Fresh machine

```sh
git clone https://github.com/ewhanley/.dotfiles "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
./bootstrap.sh
```

That's it. The script:

1. Installs Xcode Command Line Tools (if missing — finish the GUI prompt, then re-run).
2. Installs Homebrew (Apple Silicon path, `/opt/homebrew`).
3. Runs `brew bundle` against the [`Brewfile`](./Brewfile) — all CLI tools, casks, and fonts.
4. Symlinks every config package into `$HOME` with `stow`.
5. Installs `nvm` + the latest LTS node (your `.zshrc` sources `~/.nvm`; nvim LSPs want node).
6. Applies macOS system tweaks via [`macos-defaults.sh`](./macos-defaults.sh).

Re-running is safe — each step is idempotent.

### Flags

```sh
./bootstrap.sh --no-defaults   # skip macOS system tweaks
./bootstrap.sh --no-brew       # skip Homebrew install/bundle
./bootstrap.sh --no-stow       # skip dotfile symlinks
./bootstrap.sh --no-node       # skip nvm + node install
```

## How the dotfiles are organized (Stow)

Each top-level folder is a **stow package** mirroring its layout under `$HOME`:

```
nvim/.config/nvim/...     ->  ~/.config/nvim/...
ghostty/.config/ghostty/  ->  ~/.config/ghostty/
aerospace/.config/aerospace/aerospace.toml -> ~/.config/aerospace/aerospace.toml
zsh/.zshrc                ->  ~/.zshrc
tmux/.tmux.conf           ->  ~/.tmux.conf
```

To re-link after editing, or add a new tool:

```sh
cd ~/.dotfiles
stow --restow --target="$HOME" nvim     # one package
```

Add a new app by creating `newapp/.config/newapp/…`, then add `newapp` to
`STOW_PACKAGES` in `bootstrap.sh`.

## Post-install, done manually

- **AeroSpace**: grant Accessibility permission on first launch (System Settings → Privacy & Security → Accessibility).
- **nvim**: first launch bootstraps `lazy.nvim` and installs plugins + LSPs (mason).
- App Store apps, 1Password, and anything needing a login.

## What's installed

See [`Brewfile`](./Brewfile). Derived from the configs in this repo:
ghostty, aerospace + borders, neovim, tmux, starship, btop, eza, gh, ripgrep, fd, fzf,
stylua, ruff, and the MesloLG Nerd Font.

## starship config

The `starship/.config/starship.toml` here is a freshly written Rose Pine prompt
(matches your ghostty theme + Nerd Font) — it replaces the broken self-referential
symlink that was in the repo. Copy this `starship/` folder over the old one before
committing, so the real file (not a symlink) lands in the repo.
