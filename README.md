# timko.nvim

Custom Neovim config (0.12+) built from scratch with [Claude](https://claude.com/claude-code). Uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Requirements

- Neovim 0.12.0+
- `tree-sitter-cli` — required by nvim-treesitter (the `main` branch / rewrite shells out to `tree-sitter` to generate/build parsers). Upstream repo was archived April 2026; the `main` branch was tagged feature-complete/stable before archival, so it still works on nvim 0.12+ but won't get new fixes — revisit if a community fork emerges.
- `tar`, `curl`, a C compiler

```bash
# macOS
brew install tree-sitter-cli

# Linux (Debian/Ubuntu)
cargo install tree-sitter-cli   # or via distro pkg if new enough (0.26.1+)
```

Do NOT install the CLI via npm — nvim-treesitter's upstream explicitly rejects the npm build.

## Setup

```bash
git clone <repo-url> ~/.config/nvim
nvim   # lazy.nvim bootstraps on first launch; parsers install automatically
```

## Structure

```
init.lua                  # Entry point — loads config, bootstraps lazy.nvim
lua/
├── config/
│   ├── options.lua       # Editor settings (spaces, folds, clipboard, etc.)
│   ├── keymaps.lua       # Core keybindings
│   ├── autocmds.lua      # Autocommands
│   └── lazy.lua          # lazy.nvim bootstrap + plugin loader
└── plugins/
    ├── blink-cmp.lua     # Completion
    ├── colorscheme.lua   # Theme
    ├── formatting.lua    # Auto-formatting
    ├── gitsigns.lua      # Git signs in gutter
    ├── linting.lua       # Linters
    ├── lsp.lua           # Language servers
    ├── lualine.lua       # Statusline
    ├── markview.lua      # Markdown preview
    ├── neo-tree.lua      # File explorer
    ├── telescope.lua     # Fuzzy finder
    ├── treesitter.lua    # Syntax highlighting + folds
    └── which-key.lua     # Keymap hints
legacy/                   # Old LazyVim config (reference only, not loaded)
```

## Key Bindings

Leader: `Space`

| Namespace | Prefix | Purpose |
|-----------|--------|---------|
| Find | `<leader>f` | Telescope searches |
| UI | `<leader>u` | UI toggles (wrap, etc.) |
| Explorer | `<leader>e` | Neo-tree |
