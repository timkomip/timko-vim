-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
--

local ruby_indent_fix = vim.api.nvim_create_augroup("Ruby Indent Keys Fix", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.cmd("setlocal indentkeys-=.")
  end,
  group = ruby_indent_fix,
})
