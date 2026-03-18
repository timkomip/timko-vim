# timko.nvim

Custom Neovim config (0.11.6) built from scratch with [Claude](https://claude.com/claude-code). Uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Setup

```bash
# Clone to config directory
git clone <repo-url> ~/.config/nvim

# Run with custom appname (if you have an existing config)
NVIM_APPNAME=timko.nvim nvim
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
