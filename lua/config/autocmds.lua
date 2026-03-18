local autocmd = vim.api.nvim_create_autocmd

-- Highlight text briefly after yanking
autocmd("TextYankPost", {
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- Allow `dd` in quickfix window to remove entry from current list
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>cclose<cr>", { buffer = true, desc = "Close quickfix" })
    vim.keymap.set("n", "dd", function()
      local qflist = vim.fn.getqflist()
      local line = vim.fn.line(".")
      table.remove(qflist, line)
      vim.fn.setqflist(qflist, "r")
      vim.cmd(string.format("%d", math.min(line, #qflist)))
    end, { buffer = true, desc = "Remove qf entry" })
  end,
})