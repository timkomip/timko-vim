local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command

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

-- Close help with `q`
autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true, desc = "Close help" })
  end,
})

command("NeoTreeGitProfile", function()
  require("config.neotree_profile").run()
end, { desc = "Profile Neo-tree git_status open" })
