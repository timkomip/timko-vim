return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
    { "<leader>gg", "<cmd>Neotree git_status<cr>", desc = "Git changed files" },
  },
  init = function()
    -- load neo-tree at startup when nvim is opened on a directory (e.g. `nvim .`)
    -- so it can hijack netrw; otherwise it stays lazy-loaded via keys/cmd
    if vim.fn.argc(-1) == 1 then
      local stat = vim.uv.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  opts = {
    filesystem = {
      -- open a directory in the current window like netrw (use "open_default" for sidebar)
      hijack_netrw_behavior = "open_current",
      follow_current_file = { enabled = true },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      width = 35,
    },
  },
}