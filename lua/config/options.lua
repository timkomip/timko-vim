local opt = vim.opt

-- Leader key (set early so plugin mappings pick it up)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-----------------------------------------------------------
-- UI
-----------------------------------------------------------
opt.number = true         -- line numbers
opt.relativenumber = true -- relative line numbers
opt.cursorline = true     -- highlight current line
opt.signcolumn = "yes"    -- always show sign column
opt.termguicolors = true  -- 24-bit color
opt.showmode = false      -- mode is shown in statusline
opt.fillchars = { eob = " " } -- hide ~ on empty lines
opt.scrolloff = 8         -- lines above/below cursor
opt.sidescrolloff = 8     -- columns left/right of cursor
opt.foldmethod = "expr"   -- Treesitter-based folding
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99        -- keep folds open by default
opt.foldlevelstart = 99
opt.foldenable = true

-----------------------------------------------------------
-- Editing
-----------------------------------------------------------
opt.expandtab = true      -- spaces instead of tabs
opt.shiftwidth = 2        -- indent size
opt.tabstop = 2           -- tab display width
opt.smartindent = true    -- auto-indent new lines
opt.wrap = false          -- no line wrapping

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.ignorecase = true     -- case-insensitive search
opt.smartcase = true      -- ...unless uppercase is used
opt.hlsearch = false      -- don't persist search highlight
opt.incsearch = true      -- show matches as you type

-----------------------------------------------------------
-- System
-----------------------------------------------------------
opt.undofile = true       -- persistent undo
opt.swapfile = false      -- no swap files
opt.updatetime = 250      -- faster CursorHold
opt.timeoutlen = 300      -- faster key sequence completion
opt.splitbelow = true     -- horizontal splits go below
opt.splitright = true     -- vertical splits go right
opt.clipboard = "unnamedplus" -- use system clipboard

-----------------------------------------------------------
-- Floats
-----------------------------------------------------------
vim.o.winborder = "rounded"  -- border on all floating windows
