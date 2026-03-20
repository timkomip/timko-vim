# timko.nvim

Custom NeoVim config (0.11.6) built from scratch. Separate from `~/.config/nvim`.

## Test: `NVIM_APPNAME=timko.nvim nvim`

## Structure

- `init.lua` — entry point, loads config + bootstraps lazy.nvim
- `lua/config/` — options, keymaps, autocmds, lazy bootstrap
- `lua/plugins/` — one file per plugin/group, auto-loaded by lazy

## Conventions

- Plugin manager: lazy.nvim
- Leader: `<Space>`
- Keymap namespaces: `f` = find (telescope), `u` = UI toggles, `e` = explorer
- Plugins on master/main branches (0.1.x telescope branch is broken on 0.11.6)
- `vim` global warnings from lua-ls are expected — nvim injects it at runtime

## Legacy Directory

`legacy/` contains an old LazyVim-based config. **Do not** reference, read, or use it as a source of truth. Only access it when the user explicitly asks.

## TODO

See `TODO.md` for planned LSP/completion/formatting/linting work.
